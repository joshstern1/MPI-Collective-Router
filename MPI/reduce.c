/*
 *  (C) 2001 by Argonne National Laboratory.
 *      See COPYRIGHT in top-level directory.
 */

#include "mpiimpl.h"
#include "collutil.h"

#define MPIR_CVAR_REDUCE_SHORT_MSG_SIZE 2048


/*
   For short messages, user-defined ops, and count < pof2, we use a binomial tree algorithm for both short and long messages. 

   Cost = lgp.alpha + n.lgp.beta + n.lgp.gamma

    Starting from the right (lsb), if the bit is 1, send to the node with that bit zero and exit; if the bit is 0, receive 
    from the node with that bit set and combine (as long as that node is within the group)
       
    Note that by receiving with source selection, we guarentee that we get the same bits with the same input.  If we allowed the parent to receive 
    the children in any order, then timing differences could cause different results (roundoff error, over/underflows in some cases, etc).
       
    Because of the way these are ordered, if root is 0, then this is correct for both commutative and non-commutitive operations.  If root is not
    0, then for non-commutitive, we use a root of zero and then send the result to the root. 

    mask = 1: (ab)(cd)(ef)(gh)            (odds send to evens)
    mask = 2: ((ab)(cd))((ef)(gh))        (3,6 send to 0,4)
    mask = 4: (((ab)(cd))((ef)(gh)))      (4 sends to 0)
       
    Comments on buffering.  
    If the datatype is not contiguous, we still need to pass contiguous data to the user routine.  
    In this case, we should make a copy of the data in some format, and send/operate on that.
       
    In general, we can't use MPI_PACK, because the alignment of that is rather vague, and the data may not be re-usable.  
    What we actually need is a "squeeze" operation that removes the skips.
   */

static int MPIR_Reduce_binomial ( const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, int root, MPID_Comm *comm_ptr, MPIR_Errflag_t *errflag ){

    int mpi_errno = MPI_SUCCESS;
    int mpi_errno_ret = MPI_SUCCESS;
    MPI_Status status;
    int comm_size, rank, is_commutative, type_size ATTRIBUTE((unused));
    int mask, relrank, source, lroot;
    MPI_Aint true_lb, true_extent, extent; 
    void *tmp_buf;

    comm_size = comm_ptr->local_size;
    rank = comm_ptr->rank;
    

    mask = 0x1;
    if (is_commutative) 
        lroot = root;
    else
        lroot = 0;

    relrank = (rank - lroot + comm_size) % comm_size;
    
    while (/*(mask & relrank) == 0 && */mask < comm_size) {     /* Receive */
        if ((mask & relrank) == 0) {
            source = (relrank | mask);
            if (source < comm_size) {
                source = (source + lroot) % comm_size;
                mpi_errno = MPIC_Recv(tmp_buf, count, datatype, source, MPIR_REDUCE_TAG, comm_ptr, &status, errflag);
                mpi_errno = MPIR_Reduce_local_impl(tmp_buf, recvbuf, count, datatype, op);
            }
        }
        else {  /* I've received all that I'm going to.  Send my result to my parent */
            source = ((relrank & (~ mask)) + lroot) % comm_size;
            mpi_errno = MPIC_Send(recvbuf, count, datatype, source, MPIR_REDUCE_TAG, comm_ptr, errflag);

            break;
        }
        mask <<= 1;
    }
}


/* 
   For long messages and for builtin ops and if count >= pof2 (where pof2 is the nearest power-of-two less than or equal to the number
   of processes), we use Rabenseifner's algorithm (see http://www.hlrs.de/organization/par/services/models/mpi/myreduce.html ).

	An implementation of Rabenseifner's reduce algorithm (see http://www.hlrs.de/mpi/myreduce.html).

   This algorithm implements the reduce in two steps: first a reduce-scatter, followed by a gather to the root. A recursive-halving algorithm (beginning with processes that are
   distance 1 apart) is used for the reduce-scatter, and a binomial tree algorithm is used for the gather. The non-power-of-two case is handled by dropping to the nearest 
   lower power-of-two: the first few odd-numbered processes send their data to their left neighbors (rank-1), and the reduce-scatter happens among the remaining
   power-of-two processes. If the root is one of the excluded processes, then after the reduce-scatter, rank 0 sends its result to the root and exits; the root now acts as 
   rank 0 in the binomial tree algorithm for gather.

   For the power-of-two case, the cost for the reduce-scatter is lgp.alpha + n.((p-1)/p).beta + n.((p-1)/p).gamma. The cost for the gather to root is lgp.alpha + n.((p-1)/p).beta. 
   Therefore, the total cost is:

    Cost = 2.lgp.alpha + 2.n.((p-1)/p).beta + n.((p-1)/p).gamma

   For the non-power-of-two case, assuming the root is not one of the odd-numbered processes that get excluded in the reduce-scatter,

    Cost = (2.floor(lgp)+1).alpha + (2.((p-1)/p) + 1).n.beta + n.(1+(p-1)/p).gamma
*/


static int MPIR_Reduce_redscat_gather ( const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, int root, MPID_Comm *comm_ptr, MPIR_Errflag_t *errflag ){

    int comm_size, rank, pof2, rem, newrank;
    int mask, *cnts, *disps, i, j, send_idx=0;
    int recv_idx, last_idx=0, newdst;
    int dst, send_cnt, recv_cnt, newroot, newdst_tree_root, newroot_tree_root; 
    void *tmp_buf;

    comm_size = comm_ptr->local_size;
    rank = comm_ptr->rank;

    /* find nearest power-of-two less than or equal to comm_size */
    pof2 = 1;
    while (pof2 <= comm_size) pof2 <<= 1;
    pof2 >>=1;

    rem = comm_size - pof2;    

    newrank = rank - rem;	//for pof2 == commsize, rem = 0
    
    /* for the reduce-scatter, calculate the count that each process receives and the displacement within the buffer */

    MPIU_CHKLMEM_MALLOC(cnts, int *, pof2*sizeof(int), mpi_errno, "counts");
    MPIU_CHKLMEM_MALLOC(disps, int *, pof2*sizeof(int), mpi_errno, "displacements");
    
    if (newrank != -1) {
        for (i=0; i<(pof2-1); i++) 
            cnts[i] = count/pof2;
        cnts[pof2-1] = count - (count/pof2)*(pof2-1);
        
        disps[0] = 0;
        for (i=1; i<pof2; i++)
            disps[i] = disps[i-1] + cnts[i-1];
        
        mask = 0x1;
        send_idx = recv_idx = 0;
        last_idx = pof2;
        while (mask < pof2) {
            newdst = newrank ^ mask;
            /* find real rank of dest */
            dst = (newdst < rem) ? newdst*2 : newdst + rem;
            
            send_cnt = recv_cnt = 0;
            if (newrank < newdst) {
                send_idx = recv_idx + pof2/(mask*2);
                for (i=send_idx; i<last_idx; i++)
                    send_cnt += cnts[i];
                for (i=recv_idx; i<send_idx; i++)
                    recv_cnt += cnts[i];
            }
            else {
                recv_idx = send_idx + pof2/(mask*2);
                for (i=send_idx; i<recv_idx; i++)
                    send_cnt += cnts[i];
                for (i=recv_idx; i<last_idx; i++)
                    recv_cnt += cnts[i];
            }
            
            /* Send data from recvbuf. Recv into tmp_buf */ 
            mpi_errno = MPIC_Sendrecv((char *) recvbuf + disps[send_idx]*extent, send_cnt, datatype, dst, MPIR_REDUCE_TAG, (char *) tmp_buf + disps[recv_idx]*extent,
                                         recv_cnt, datatype, dst, MPIR_REDUCE_TAG, comm_ptr, MPI_STATUS_IGNORE, errflag);
            
            /* tmp_buf contains data received in this step.
               recvbuf contains data accumulated so far */
            
            /* This algorithm is used only for predefined ops and predefined ops are always commutative. */
	    mpi_errno = MPIR_Reduce_local_impl( (char *) tmp_buf + disps[recv_idx]*extent, (char *) recvbuf + disps[recv_idx]*extent, recv_cnt, datatype, op );
            /* update send_idx for next iteration */
            send_idx = recv_idx;
            mask <<= 1;

            /* update last_idx, but not in last iteration because the value is needed in the gather step below. */
            if (mask < pof2)
                last_idx = recv_idx + pof2/mask;
        }
    }

    /* now do the gather to root */


    newroot = root - rem;

    if (newrank != -1) {
        j = 0;
        mask = 0x1;
        while (mask < pof2) {
            mask <<= 1;
            j++;
        }
        mask >>= 1;
        j--;
        while (mask > 0) {
            newdst = newrank ^ mask;

            /* find real rank of dest */
            dst = (newdst < rem) ? newdst*2 : newdst + rem;
            /* if root is playing the role of newdst=0, adjust for
               it */
            if ((newdst == 0) && (root < 2*rem) && (root % 2 != 0))
                dst = root;
            
            /* if the root of newdst's half of the tree is the same as the root of newroot's half of the tree, send to newdst and exit, else receive from newdst. */

            newdst_tree_root = newdst >> j;
            newdst_tree_root <<= j;
            
            newroot_tree_root = newroot >> j;
            newroot_tree_root <<= j;

            send_cnt = recv_cnt = 0;
            if (newrank < newdst) {
                /* update last_idx except on first iteration */
                if (mask != pof2/2)
                    last_idx = last_idx + pof2/(mask*2);
                
                recv_idx = send_idx + pof2/(mask*2);
                for (i=send_idx; i<recv_idx; i++)
                    send_cnt += cnts[i];
                for (i=recv_idx; i<last_idx; i++)
                    recv_cnt += cnts[i];
            }
            else {
                recv_idx = send_idx - pof2/(mask*2);
                for (i=send_idx; i<last_idx; i++)
                    send_cnt += cnts[i];
                for (i=recv_idx; i<send_idx; i++)
                    recv_cnt += cnts[i];
            }
            
            if (newdst_tree_root == newroot_tree_root) {
                /* send and exit */
                /* Send data from recvbuf. Recv into tmp_buf */ 
                mpi_errno = MPIC_Send((char *) recvbuf + disps[send_idx]*extent, send_cnt, datatype, dst, MPIR_REDUCE_TAG, comm_ptr, errflag);

                break;
            }
            else {
                /* recv and continue */
                mpi_errno = MPIC_Recv((char *) recvbuf + disps[recv_idx]*extent, recv_cnt, datatype, dst, MPIR_REDUCE_TAG, comm_ptr, MPI_STATUS_IGNORE, errflag);
            }
            
            if (newrank > newdst) send_idx = recv_idx;
            
            mask >>= 1;
            j--;
        }
    }
}


int MPIR_Reduce_intra (const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, int root, MPID_Comm *comm_ptr, MPIR_Errflag_t *errflag ){

    int comm_size, is_commutative, type_size, pof2;
    int nbytes = 0;
    MPID_Op *op_ptr;

    comm_size = comm_ptr->local_size;

    /* find nearest power-of-two less than or equal to comm_size */
    pof2 = 1;
    while (pof2 <= comm_size) pof2 <<= 1;
    pof2 >>=1;

	//MPIR_CVAR_REDUCE_SHORT_MSG_SIZE = 2048
    if ((count*type_size > MPIR_CVAR_REDUCE_SHORT_MSG_SIZE) && (HANDLE_GET_KIND(op) == HANDLE_KIND_BUILTIN) && (count >= pof2)) {
        mpi_errno = MPIR_Reduce_redscat_gather(sendbuf, recvbuf, count, datatype, op, root, comm_ptr, errflag);
    }
    else {
        mpi_errno = MPIR_Reduce_binomial(sendbuf, recvbuf, count, datatype, op, root, comm_ptr, errflag);
    }
}


int MPIR_Reduce_impl(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, int root, MPID_Comm *comm_ptr, MPIR_Errflag_t *errflag){ 
    mpi_errno = MPIR_Reduce_intra(sendbuf, recvbuf, count, datatype, op, root, comm_ptr, errflag);
}

/*Input Parameters:
+ sendbuf - address of send buffer (choice) 
. count - number of elements in send buffer (integer) 
. datatype - data type of elements of send buffer (handle) 
. op - reduce operation (handle) 
. root - rank of root process (integer) 
- comm - communicator (handle) 

Output Parameters:
. recvbuf - address of receive buffer (choice, significant only at 'root') 
*/

int MPI_Reduce(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, int root, MPI_Comm comm){

    MPID_Comm *comm_ptr = NULL;	
    MPIR_Errflag_t errflag = MPIR_ERR_NONE;

    /* Convert MPI object handles to object pointers */
    MPID_Comm_get_ptr( comm, comm_ptr );

    mpi_errno = MPIR_Reduce_impl(sendbuf, recvbuf, count, datatype, op, root, comm_ptr, &errflag);
}


