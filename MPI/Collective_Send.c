int MPI_Reduce(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, int root, MPI_Comm comm){

    MPID_Comm *comm_ptr = NULL;	
    MPIR_Errflag_t errflag = MPIR_ERR_NONE;

    /* Convert MPI object handles to object pointers 
    While a pointer contains the address of the item to which it refers, a handle is an abstraction of a reference which is managed externally
    */
    MPID_Comm_get_ptr( comm, comm_ptr );

    comm_size = comm_ptr->local_size;
    rank = comm_ptr->rank;
    
    mpi_errno = MPIR_Reduce_impl(sendbuf, recvbuf, count, datatype, op, root, comm_ptr, &errflag);
}

MPIC_Send(recvbuf, count, datatype, source, MPIR_REDUCE_TAG, comm_ptr, errflag);	//Tag = MPIR_REDUCE_TAG

/* These functions are used in the implementation of collective
   operations. They are wrappers around MPID send/recv functions. They do
   sends/receives by setting the context offset to
   MPID_CONTEXT_INTRA_COLL or MPID_CONTEXT_INTER_COLL. */

int MPIC_Send(const void *buf, MPI_Aint count, MPI_Datatype datatype, int dest, int tag,
                 MPID_Comm *comm_ptr, MPIR_Errflag_t *errflag)
{

	//#define MPID_CONTEXT_INTRA_COLL  (1)
	//#define MPID_CONTEXT_INTER_COLL  (1)
    context_id = (comm_ptr->comm_kind == MPID_INTRACOMM) ?  MPID_CONTEXT_INTRA_COLL : MPID_CONTEXT_INTER_COLL;

    mpi_errno = MPID_Send(buf, count, datatype, dest, tag, comm_ptr,
                          context_id, &request_ptr);

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int MPID_Send(const void * buf, MPI_Aint count, MPI_Datatype datatype, int rank, int tag, MPID_Comm * comm, int context_offset, MPID_Request ** request)
{
    MPIDI_msg_sz_t data_sz;
    int dt_contig;
    MPI_Aint dt_true_lb;
    MPID_Datatype * dt_ptr;
    MPID_Request * sreq = NULL;
    MPIDI_VC_t * vc;
    MPID_Seqnum_t seqnum;  
    int eager_threshold = -1;

    MPIDI_Comm_get_vc_set_active(comm, rank, &vc);
    MPIDI_Datatype_get_info(count, datatype, dt_contig, data_sz, dt_ptr, dt_true_lb);


    if (dt_contig && data_sz <= (MPIDI_EAGER_SHORT_SIZE)) {
		mpi_errno = MPIDI_CH3_EagerContigShortSend( &sreq, MPIDI_CH3_PKT_EAGERSHORT_SEND, (char *)buf + dt_true_lb, count, data_sz, rank, tag, comm, context_offset );
    }
    else{
	    if (data_sz + sizeof(MPIDI_CH3_Pkt_eager_send_t) <= eager_threshold){
			if (dt_contig){
		 	    mpi_errno = MPIDI_CH3_EagerContigSend( &sreq, MPIDI_CH3_PKT_EAGER_SEND, (char *)buf + dt_true_lb, data_sz, rank, tag, comm, context_offset );
			}
	    }
	    else {
			MPIDI_Request_create_sreq(sreq, mpi_errno, goto fn_exit);
			MPIDI_Request_set_type(sreq, MPIDI_REQUEST_TYPE_SEND);
			mpi_errno = vc->rndvSend_fn( &sreq, buf, count, datatype, dt_contig, data_sz, dt_true_lb, rank, tag, comm, context_offset );
			/* Note that we don't increase the ref count on the datatype
			   because this is a blocking call, and the calling routine 
			   must wait until sreq completes */
	    }
	}

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int MPIDI_CH3_EagerContigSend( MPID_Request **sreq_p, MPIDI_CH3_Pkt_type_t reqtype, const void * buf, MPIDI_msg_sz_t data_sz, int rank, int tag, MPID_Comm * comm, int context_offset )
{
    int mpi_errno = MPI_SUCCESS;
    MPIDI_VC_t * vc;
    MPIDI_CH3_Pkt_t upkt;
    MPIDI_CH3_Pkt_eager_send_t * const eager_pkt = &upkt.eager_send;
    MPID_Request *sreq = *sreq_p;
    MPL_IOV iov[2];
    
    MPIDI_Pkt_init(eager_pkt, reqtype);
    eager_pkt->match.parts.rank	= comm->rank;
    eager_pkt->match.parts.tag = tag;
    eager_pkt->match.parts.context_id = comm->context_id + context_offset;
    eager_pkt->sender_req_id = MPI_REQUEST_NULL;
    eager_pkt->data_sz = data_sz;
    
    iov[0].MPL_IOV_BUF = (MPL_IOV_BUF_CAST)eager_pkt;
    iov[0].MPL_IOV_LEN = sizeof(*eager_pkt);
	    
    iov[1].MPL_IOV_BUF = (MPL_IOV_BUF_CAST) buf;
    iov[1].MPL_IOV_LEN = data_sz;
    
    MPIDI_Comm_get_vc_set_active(comm, rank, &vc);
    MPIDI_VC_FAI_send_seqnum(vc, seqnum);
    MPIDI_Pkt_set_seqnum(eager_pkt, seqnum);
    
    mpi_errno = MPIDI_CH3_iStartMsgv(vc, iov, 2, sreq_p);

    sreq = *sreq_p;
    if (sreq != NULL) {
	MPIDI_Request_set_seqnum(sreq, seqnum);
	MPIDI_Request_set_type(sreq, MPIDI_REQUEST_TYPE_SEND);
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int MPIDI_CH3_iStartMsg (MPIDI_VC_t *vc, void *hdr, MPIDI_msg_sz_t hdr_sz, MPID_Request **sreq_ptr)
{
    if (vc->ch.iStartContigMsg){
        mpi_errno = vc->ch.iStartContigMsg(vc, hdr, hdr_sz, NULL, 0, sreq_ptr);
    }
}
