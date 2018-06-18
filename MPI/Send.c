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



MPIC_Send(recvbuf, count, datatype, source, MPIR_REDUCE_TAG, comm_ptr, errflag);    //Tag = MPIR_REDUCE_TAG

/* These functions are used in the implementation of collective
   operations. They are wrappers around MPID send/recv functions. They do
   sends/receives by setting the context offset to
   MPID_CONTEXT_INTRA_COLL or MPID_CONTEXT_INTER_COLL. */

int MPIC_Send(const void *buf, MPI_Aint count, MPI_Datatype datatype, int dest, int tag,
                 MPID_Comm *comm_ptr, MPIR_Errflag_t *errflag)
{
    //#define MPID_CONTEXT_INTRA_PT2PT (0)
    //#define MPID_CONTEXT_INTRA_COLL  (1)
    context_id = (comm_ptr->comm_kind == MPID_INTRACOMM) ?  MPID_CONTEXT_INTRA_COLL : MPID_CONTEXT_INTER_COLL;

    mpi_errno = MPID_Send(buf, count, datatype, dest, tag, comm_ptr, context_id, &request_ptr);

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
            /* Note that we don't increase the ref count on the datatype because this is a blocking call, and the calling routine must wait until sreq completes */
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
    eager_pkt->match.parts.rank = comm->rank;
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

#define MPIDI_Comm_get_vc(comm_, rank_, vcp_) *(vcp_) = (comm_)->dev.vcrt->vcr_table[(rank_)]

#define MPIDI_Comm_get_vc_set_active(comm_, rank_, vcp_) do {           
    *(vcp_) = (comm_)->dev.vcrt->vcr_table[(rank_)];                
    if ((*(vcp_))->state == MPIDI_VC_STATE_INACTIVE){    
        MPIDI_CHANGE_VC_STATE((*(vcp_)), ACTIVE);                  
    }                                                               
}while(0)


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //mpid/ch3/channels/nemesis/src/ch3_istartmsg
int MPIDI_CH3_iStartMsg (MPIDI_VC_t *vc, void *hdr, MPIDI_msg_sz_t hdr_sz, MPID_Request **sreq_ptr)
{
    if (vc->ch.iStartContigMsg){
        mpi_errno = vc->ch.iStartContigMsg(vc, hdr, hdr_sz, NULL, 0, sreq_ptr);
    }
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*
 * MPIDI_CH3_iStartMsgv() attempts to send the message immediately.  If the entire message is successfully sent, then NULL is
 * returned.  Otherwise a request is allocated, the iovec and the first buffer pointed to by the iovec (which is assumed to be a
 * MPIDI_CH3_Pkt_t) are copied into the request, and a pointer to the request is returned.  An error condition also results in a
 * request be allocated and the errror being returned in the status field of the request.
 */

/* XXX - What do we do if MPID_Request_create() returns NULL???  
   If MPIDI_CH3_iStartMsgv() returns NULL, the calling code assumes the request completely successfully, but the reality is that we 
   couldn't allocate the memory for a request.  This seems like a flaw in the CH3 API. */

/* NOTE - The completion action associated with a request created by CH3_iStartMsgv() is alway MPIDI_CH3_CA_COMPLETE.  This
   implies that CH3_iStartMsgv() can only be used when the entire message can be described by a single iovec of size MPL_IOV_LIMIT. */
    
int MPIDI_CH3_iStartMsgv(MPIDI_VC_t * vc, MPL_IOV * iov, int n_iov, MPID_Request ** sreq_ptr)
{
    MPID_Request * sreq = NULL;
    MPIDI_CH3I_VC *vcch = &vc->ch;
    int mpi_errno = MPI_SUCCESS;

    MPIU_Assert( n_iov <= MPL_IOV_LIMIT);

    /* The SOCK channel uses a fixed length header, the size of which is the maximum of all possible packet headers */
    iov[0].MPL_IOV_LEN = sizeof(MPIDI_CH3_Pkt_t);
    
    if (vcch->state == MPIDI_CH3I_VC_STATE_CONNECTED) /* MT */
    {
    /* Connection already formed.  If send queue is empty attempt to send data, queuing any unsent data. */
        if (MPIDI_CH3I_SendQ_empty(vcch)) /* MT */
        {
            int rc;
            MPIU_Size_t nb;

            //send queue empty, attempting to write
            
            /* MT - need some signalling to lock down our right to use the channel, thus insuring that the progress engine does also try to write */
            rc = MPIDU_Sock_writev(vcch->sock, iov, n_iov, &nb);

            if (rc == MPI_SUCCESS){

                int offset = 0;
                //wrote nb bytes
            
                while (offset < n_iov)
                {
                    if (nb >= (int)iov[offset].MPL_IOV_LEN){
                        nb -= iov[offset].MPL_IOV_LEN;
                        offset++;
                    }
                    else{
                        sreq = create_request(iov, n_iov, offset, nb);
                        MPIDI_CH3I_SendQ_enqueue_head(vcch, sreq);
                        vcch->conn->send_active = sreq;
                        mpi_errno = MPIDU_Sock_post_writev(vcch->conn->sock, sreq->dev.iov + offset, sreq->dev.iov_count - offset, NULL);
                        break;
                    }
                }

                if (offset == n_iov){
                    //entire write complete
                }
            }
        }
        else{
            sreq = create_request(iov, n_iov, 0, 0);
            MPIDI_CH3I_SendQ_enqueue(vcch, sreq);
        }
    }

    else if (vcch->state == MPIDI_CH3I_VC_STATE_CONNECTING){
    
        /* queue the data so it can be sent after the connection is formed */
        sreq = create_request(iov, n_iov, 0, 0);
        MPIDI_CH3I_SendQ_enqueue(vcch, sreq);
    }
    else if (vcch->state == MPIDI_CH3I_VC_STATE_UNCONNECTED){
    
        /* queue the data so it can be sent after the connection is formed */
        sreq = create_request(iov, n_iov, 0, 0);
        MPIDI_CH3I_SendQ_enqueue(vcch, sreq);
        
        /* Form a new connection */
        MPIDI_CH3I_VC_post_connect(vc);
    }
    else if (vcch->state != MPIDI_CH3I_VC_STATE_FAILED){
        sreq = create_request(iov, n_iov, 0, 0);
        MPIDI_CH3I_SendQ_enqueue(vcch, sreq);
    }


    *sreq_ptr = sreq;
    return mpi_errno;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//in mpid/ch3/channels/sock/src/ch3_progress.c
int MPIDI_CH3I_VC_post_connect(MPIDI_VC_t * vc)
{
    return MPIDI_CH3I_VC_post_sockconnect( vc );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//in mpid/ch3/util/sock/ch3u_connect_sock.c
int MPIDI_CH3I_VC_post_sockconnect(MPIDI_VC_t * vc)
{
    int mpi_errno = MPI_SUCCESS;
    char val[MPIDI_MAX_KVS_VALUE_LEN];
    MPIDI_CH3I_VC *vcch = &vc->ch;

    /* MPIDI_PG_GetConnString() can block & release the lock for the current thread. Prevent other threads from trying to obtain ConnString by setting the VC to *CONNECTING.  */
    if(vcch->state == MPIDI_CH3I_VC_STATE_UNCONNECTED){ 
        vcch->state = MPIDI_CH3I_VC_STATE_CONNECTING;
    }

    mpi_errno = MPIDI_PG_GetConnString( vc->pg, vc->pg_rank, val, sizeof(val));

    mpi_errno = MPIDI_CH3I_Sock_connect( vc, val, sizeof(val) );

    return mpi_errno;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//in mpid/ch3/src/mpidi_pg.c
/*MPIDI_PG_GetConnString
    This is an independent (not collective) call that returns the connection string for the process identified by a process 
    group and a rank in that process group. This may use PMI_KVS_Get for processes in the same MPI_COMM_WORLD or another mechanism 
    for processes not in the same MPI_COMM_WORLD (specifically, a cache of connection names that is maintained as part of the process 
    group structure, at least until PMI is enhanced).

Temp to get connection value for rank r */

int MPIDI_PG_GetConnString( MPIDI_PG_t *pg, int rank, char *val, int vallen )
{
    int mpi_errno = MPI_SUCCESS;

    if (pg->getConnInfo) {
        mpi_errno = (*pg->getConnInfo)( rank, val, vallen, pg );
    }

    return mpi_errno;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//in mpid/ch3/src/mpidi_pg.c
/* For all of these routines, the format of the process group description that is created and used by the connTo/FromString routines is this:
   (All items are strings, terminated by null)

   process group id string
   sizeof process group (as string)
   conninfo for rank 0
   conninfo for rank 1
   ...

   The "conninfo for rank 0" etc. for the original (MPI_COMM_WORLD) process group are stored in the PMI_KVS space with the keys p<rank>-businesscard .  */

/* The "KVS" versions are for the process group to which the calling process belongs. These use the PMI_KVS routines to access the process information */

/*(function to store into buf the connection information for rank in this process group)*/

//PMI = Process Management Interface

static int getConnInfoKVS( int rank, char *buf, int bufsize, MPIDI_PG_t *pg )
{

    char key[MPIDI_MAX_KVS_KEY_LEN];
    int  mpi_errno = MPI_SUCCESS, rc, pmi_errno;
    int vallen;

    rc = MPL_snprintf(key, MPIDI_MAX_KVS_KEY_LEN, "P%d-businesscard", rank );

#ifdef USE_PMI2_API
    mpi_errno = PMI2_KVS_Get(pg->connData, PMI2_ID_NULL, key, buf, bufsize, &vallen);

#else
    pmi_errno = PMI_KVS_Get(pg->connData, key, buf, bufsize );

#endif
    
    return mpi_errno;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*@
  PMI2_KVS_Get - returns the value associated with key in the key-value space associated with the job ID jobid

  Input Parameters:
  + jobid - the job id identifying the key-value space in which to look for key.  If jobid is NULL, look in the key-value space of this job.
  . src_pmi_id - the pmi id of the process which put this keypair.  This is just a hint to the server.  PMI2_ID_NULL should be passed if no hint is provided.
  . key - key
  - maxvalue - size of the buffer provided in value

  Output Parameters:
  + value - value associated with key
  - vallen - length of the returned value, or, if the length is longer than maxvalue, the negative of the required length is returned
  
  Return values:
  Returns 'MPI_SUCCESS' on success and an MPI error code on failure.
@*/

int PMI2_KVS_Get(const char *jobid, int src_pmi_id, const char key[], char value [], int maxValue, int *valLen)
{
    int pmi2_errno = PMI2_SUCCESS;
    int found, keyfound;
    const char *kvsvalue;
    int kvsvallen, ret, rc;
    char src_pmi_id_str[256];
    const char *errmsg;

    int (*pmi2_kvs_get)(const char*, int, const char *, char *, int, int*);

    pmi2_kvs_get = (int (*)())dlsym(poeptr, "PMI2_KVS_Get");

    if (pmi2_kvs_get == NULL) {
        TRACE_ERR("failed to dlsym pmi2_kvs_get\n");
    }

    return (*pmi2_kvs_get)(jobid, src_pmi_id, key, value, maxValue, valLen);
}


int PMI2_KVS_Get(const char *jobid, int src_pmi_id, const char key[], char value [], int maxValue, int *valLen)
{
    int pmi2_errno = PMI2_SUCCESS;
    int found, keyfound;
    const char *kvsvalue;
    int kvsvallen;
    int ret;
    PMI2_Command cmd = {0};
    int rc;
    char src_pmi_id_str[256];
    const char *errmsg;

    PMI2U_Snprintf(src_pmi_id_str, sizeof(src_pmi_id_str), "%d", src_pmi_id);

    pmi2_errno = PMIi_InitIfSingleton();

    pmi2_errno = PMIi_WriteSimpleCommandStr(PMI2_fd, &cmd, KVSGET_CMD, JOBID_KEY, jobid, SRCID_KEY, src_pmi_id_str, KEY_KEY, key, NULL);

    pmi2_errno = PMIi_ReadCommandExp(PMI2_fd, &cmd, KVSGETRESP_CMD, &rc, &errmsg);

    found = getvalbool(cmd.pairs, cmd.nPairs, FOUND_KEY, &keyfound);

    found = getval(cmd.pairs, cmd.nPairs, VALUE_KEY, &kvsvalue, &kvsvallen);

    ret = PMI2U_Strncpy(value, kvsvalue, maxValue);
    *valLen = ret ? -kvsvallen : kvsvallen;

    PMI2U_Free(cmd.command);
    freepairs(cmd.pairs, cmd.nPairs);
    return pmi2_errno;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


int PMI_KVS_Get( const char kvsname[], const char key[], char value[], int length)
{
    char buf[PMIU_MAXLINE];
    int err = PMI_SUCCESS;
    int  rc;

    /* Connect to the PM if we haven't already.  This is needed in case we're doing an MPI_Comm_join or MPI_Comm_connect/accept from
       the singleton init case.  This test is here because, in the way in which MPICH uses PMI, this is where the test needs to be. */
    if (PMIi_InitIfSingleton() != 0) 
        return -1;

    rc = MPL_snprintf( buf, PMIU_MAXLINE, "cmd=get kvsname=%s key=%s\n", kvsname, key );

    err = GetResponse( buf, "get_result", 0 );

    if (err == PMI_SUCCESS) {
        PMIU_getval( "rc", buf, PMIU_MAXLINE );
        rc = atoi( buf );
        if ( rc == 0 ) {
            PMIU_getval( "value", value, length );
            return( 0 );
        }
    }

    return err;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
 This function is used to request information from the server and check that the response uses the expected command name.  On a successful
 return from this routine, additional PMIU_getval calls may be used to access information about the returned value.
 
 If checkRc is true, this routine also checks that the rc value returned was 0.  If not, it uses the "msg" value to report on the reason for the failure.
 */

static int GetResponse( const char request[], const char expectedCmd[], int checkRc )
{
    int err, n;
    char *p;
    char recvbuf[PMIU_MAXLINE];
    char cmdName[PMIU_MAXLINE];

    err = PMIU_writeline( PMI_fd, (char *)request );

    n = PMIU_readline( PMI_fd, recvbuf, sizeof(recvbuf) );

    err = PMIU_parse_keyvals( recvbuf );

    p = PMIU_getval( "cmd", cmdName, sizeof(cmdName) );

    if (checkRc) {
        p = PMIU_getval( "rc", cmdName, PMIU_MAXLINE );
    }

    return err;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

char *PMIU_getval( const char *keystr, char *valstr, int vallen )
{
    int i, rc;
    
    for (i = 0; i < PMIU_keyval_tab_idx; i++) {
        if ( strcmp( keystr, PMIU_keyval_tab[i].key ) == 0 ) { 
            rc = MPIU_Strncpy( valstr, PMIU_keyval_tab[i].value, vallen );
            return valstr;
           } 
    }
    valstr[0] = '\0';
    return NULL;
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/* Setting a process's connection information 
   
   This is a collective call (for scalability) over all of the processes in the same MPI_COMM_WORLD.
*/

/*MPIDI_PG_SetConnInfo
    This is a collective call over the processes in MPI_COMM_WORLD that takes the rank of the calling process and its connection information, and makes 
    it available for the other processes. It is implemented using the PMI_KVS_Put and PMI_Barrier calls.
*/

int MPIDI_PG_SetConnInfo( int rank, const char *connString ){

    int mpi_errno = MPI_SUCCESS;
    int pmi_errno;
    int len;
    char key[128];

    MPIU_Assert(pg_world->connData);
    
    len = MPL_snprintf(key, sizeof(key), "P%d-businesscard", rank);

    if (len < 0 || len > sizeof(key)) {
        MPIR_ERR_SETANDJUMP1(mpi_errno,MPI_ERR_OTHER, "**snprintf", "**snprintf %d", len);
    }

    pmi_errno = PMI_KVS_Put(pg_world->connData, key, connString );

    if (pmi_errno != PMI_SUCCESS) {
        MPIR_ERR_SETANDJUMP1(mpi_errno,MPI_ERR_OTHER, "**pmi_kvs_put", "**pmi_kvs_put %d", pmi_errno);
    }

    pmi_errno = PMI_KVS_Commit(pg_world->connData);

    if (pmi_errno != PMI_SUCCESS) {
        MPIR_ERR_SETANDJUMP1(mpi_errno,MPI_ERR_OTHER, "**pmi_kvs_commit", "**pmi_kvs_commit %d", pmi_errno);
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////int MPI_Reduce(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, int root, MPI_Comm comm){

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



MPIC_Send(recvbuf, count, datatype, source, MPIR_REDUCE_TAG, comm_ptr, errflag);    //Tag = MPIR_REDUCE_TAG

/* These functions are used in the implementation of collective
   operations. They are wrappers around MPID send/recv functions. They do
   sends/receives by setting the context offset to
   MPID_CONTEXT_INTRA_COLL or MPID_CONTEXT_INTER_COLL. */

int MPIC_Send(const void *buf, MPI_Aint count, MPI_Datatype datatype, int dest, int tag,
                 MPID_Comm *comm_ptr, MPIR_Errflag_t *errflag)
{
    //#define MPID_CONTEXT_INTRA_PT2PT (0)
    //#define MPID_CONTEXT_INTRA_COLL  (1)
    context_id = (comm_ptr->comm_kind == MPID_INTRACOMM) ?  MPID_CONTEXT_INTRA_COLL : MPID_CONTEXT_INTER_COLL;

    mpi_errno = MPID_Send(buf, count, datatype, dest, tag, comm_ptr, context_id, &request_ptr);

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
            /* Note that we don't increase the ref count on the datatype because this is a blocking call, and the calling routine must wait until sreq completes */
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
    eager_pkt->match.parts.rank = comm->rank;
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

#define MPIDI_Comm_get_vc(comm_, rank_, vcp_) *(vcp_) = (comm_)->dev.vcrt->vcr_table[(rank_)]

#define MPIDI_Comm_get_vc_set_active(comm_, rank_, vcp_) do {           
    *(vcp_) = (comm_)->dev.vcrt->vcr_table[(rank_)];                
    if ((*(vcp_))->state == MPIDI_VC_STATE_INACTIVE){    
        MPIDI_CHANGE_VC_STATE((*(vcp_)), ACTIVE);                  
    }                                                               
}while(0)


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //mpid/ch3/channels/nemesis/src/ch3_istartmsg
int MPIDI_CH3_iStartMsg (MPIDI_VC_t *vc, void *hdr, MPIDI_msg_sz_t hdr_sz, MPID_Request **sreq_ptr)
{
    if (vc->ch.iStartContigMsg){
        mpi_errno = vc->ch.iStartContigMsg(vc, hdr, hdr_sz, NULL, 0, sreq_ptr);
    }
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*
 * MPIDI_CH3_iStartMsgv() attempts to send the message immediately.  If the entire message is successfully sent, then NULL is
 * returned.  Otherwise a request is allocated, the iovec and the first buffer pointed to by the iovec (which is assumed to be a
 * MPIDI_CH3_Pkt_t) are copied into the request, and a pointer to the request is returned.  An error condition also results in a
 * request be allocated and the errror being returned in the status field of the request.
 */

/* XXX - What do we do if MPID_Request_create() returns NULL???  
   If MPIDI_CH3_iStartMsgv() returns NULL, the calling code assumes the request completely successfully, but the reality is that we 
   couldn't allocate the memory for a request.  This seems like a flaw in the CH3 API. */

/* NOTE - The completion action associated with a request created by CH3_iStartMsgv() is alway MPIDI_CH3_CA_COMPLETE.  This
   implies that CH3_iStartMsgv() can only be used when the entire message can be described by a single iovec of size MPL_IOV_LIMIT. */
    
int MPIDI_CH3_iStartMsgv(MPIDI_VC_t * vc, MPL_IOV * iov, int n_iov, MPID_Request ** sreq_ptr)
{
    MPID_Request * sreq = NULL;
    MPIDI_CH3I_VC *vcch = &vc->ch;
    int mpi_errno = MPI_SUCCESS;

    MPIU_Assert( n_iov <= MPL_IOV_LIMIT);

    /* The SOCK channel uses a fixed length header, the size of which is the maximum of all possible packet headers */
    iov[0].MPL_IOV_LEN = sizeof(MPIDI_CH3_Pkt_t);
    
    if (vcch->state == MPIDI_CH3I_VC_STATE_CONNECTED) /* MT */
    {
    /* Connection already formed.  If send queue is empty attempt to send data, queuing any unsent data. */
        if (MPIDI_CH3I_SendQ_empty(vcch)) /* MT */
        {
            int rc;
            MPIU_Size_t nb;

            //send queue empty, attempting to write
            
            /* MT - need some signalling to lock down our right to use the channel, thus insuring that the progress engine does also try to write */
            rc = MPIDU_Sock_writev(vcch->sock, iov, n_iov, &nb);

            if (rc == MPI_SUCCESS){

                int offset = 0;
                //wrote nb bytes
            
                while (offset < n_iov)
                {
                    if (nb >= (int)iov[offset].MPL_IOV_LEN){
                        nb -= iov[offset].MPL_IOV_LEN;
                        offset++;
                    }
                    else{
                        sreq = create_request(iov, n_iov, offset, nb);
                        MPIDI_CH3I_SendQ_enqueue_head(vcch, sreq);
                        vcch->conn->send_active = sreq;
                        mpi_errno = MPIDU_Sock_post_writev(vcch->conn->sock, sreq->dev.iov + offset, sreq->dev.iov_count - offset, NULL);
                        break;
                    }
                }

                if (offset == n_iov){
                    //entire write complete
                }
            }
        }
        else{
            sreq = create_request(iov, n_iov, 0, 0);
            MPIDI_CH3I_SendQ_enqueue(vcch, sreq);
        }
    }

    else if (vcch->state == MPIDI_CH3I_VC_STATE_CONNECTING){
    
        /* queue the data so it can be sent after the connection is formed */
        sreq = create_request(iov, n_iov, 0, 0);
        MPIDI_CH3I_SendQ_enqueue(vcch, sreq);
    }
    else if (vcch->state == MPIDI_CH3I_VC_STATE_UNCONNECTED){
    
        /* queue the data so it can be sent after the connection is formed */
        sreq = create_request(iov, n_iov, 0, 0);
        MPIDI_CH3I_SendQ_enqueue(vcch, sreq);
        
        /* Form a new connection */
        MPIDI_CH3I_VC_post_connect(vc);
    }
    else if (vcch->state != MPIDI_CH3I_VC_STATE_FAILED){
        sreq = create_request(iov, n_iov, 0, 0);
        MPIDI_CH3I_SendQ_enqueue(vcch, sreq);
    }


    *sreq_ptr = sreq;
    return mpi_errno;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//in mpid/ch3/channels/sock/src/ch3_progress.c
int MPIDI_CH3I_VC_post_connect(MPIDI_VC_t * vc)
{
    return MPIDI_CH3I_VC_post_sockconnect( vc );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//in mpid/ch3/util/sock/ch3u_connect_sock.c
int MPIDI_CH3I_VC_post_sockconnect(MPIDI_VC_t * vc)
{
    int mpi_errno = MPI_SUCCESS;
    char val[MPIDI_MAX_KVS_VALUE_LEN];
    MPIDI_CH3I_VC *vcch = &vc->ch;

    /* MPIDI_PG_GetConnString() can block & release the lock for the current thread. Prevent other threads from trying to obtain ConnString by setting the VC to *CONNECTING.  */
    if(vcch->state == MPIDI_CH3I_VC_STATE_UNCONNECTED){ 
        vcch->state = MPIDI_CH3I_VC_STATE_CONNECTING;
    }

    mpi_errno = MPIDI_PG_GetConnString( vc->pg, vc->pg_rank, val, sizeof(val));

    mpi_errno = MPIDI_CH3I_Sock_connect( vc, val, sizeof(val) );

    return mpi_errno;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//in mpid/ch3/src/mpidi_pg.c
/*MPIDI_PG_GetConnString
    This is an independent (not collective) call that returns the connection string for the process identified by a process 
    group and a rank in that process group. This may use PMI_KVS_Get for processes in the same MPI_COMM_WORLD or another mechanism 
    for processes not in the same MPI_COMM_WORLD (specifically, a cache of connection names that is maintained as part of the process 
    group structure, at least until PMI is enhanced).

Temp to get connection value for rank r */

int MPIDI_PG_GetConnString( MPIDI_PG_t *pg, int rank, char *val, int vallen )
{
    int mpi_errno = MPI_SUCCESS;

    if (pg->getConnInfo) {
        mpi_errno = (*pg->getConnInfo)( rank, val, vallen, pg );
    }

    return mpi_errno;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//in mpid/ch3/src/mpidi_pg.c
/* For all of these routines, the format of the process group description that is created and used by the connTo/FromString routines is this:
   (All items are strings, terminated by null)

   process group id string
   sizeof process group (as string)
   conninfo for rank 0
   conninfo for rank 1
   ...

   The "conninfo for rank 0" etc. for the original (MPI_COMM_WORLD) process group are stored in the PMI_KVS space with the keys p<rank>-businesscard .  */

/* The "KVS" versions are for the process group to which the calling process belongs. These use the PMI_KVS routines to access the process information */

/*(function to store into buf the connection information for rank in this process group)*/

//PMI = Process Management Interface

static int getConnInfoKVS( int rank, char *buf, int bufsize, MPIDI_PG_t *pg )
{

    char key[MPIDI_MAX_KVS_KEY_LEN];
    int  mpi_errno = MPI_SUCCESS, rc, pmi_errno;
    int vallen;

    rc = MPL_snprintf(key, MPIDI_MAX_KVS_KEY_LEN, "P%d-businesscard", rank );

#ifdef USE_PMI2_API
    mpi_errno = PMI2_KVS_Get(pg->connData, PMI2_ID_NULL, key, buf, bufsize, &vallen);

#else
    pmi_errno = PMI_KVS_Get(pg->connData, key, buf, bufsize );

#endif
    
    return mpi_errno;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*@
  PMI2_KVS_Get - returns the value associated with key in the key-value space associated with the job ID jobid

  Input Parameters:
  + jobid - the job id identifying the key-value space in which to look for key.  If jobid is NULL, look in the key-value space of this job.
  . src_pmi_id - the pmi id of the process which put this keypair.  This is just a hint to the server.  PMI2_ID_NULL should be passed if no hint is provided.
  . key - key
  - maxvalue - size of the buffer provided in value

  Output Parameters:
  + value - value associated with key
  - vallen - length of the returned value, or, if the length is longer than maxvalue, the negative of the required length is returned
  
  Return values:
  Returns 'MPI_SUCCESS' on success and an MPI error code on failure.
@*/

int PMI2_KVS_Get(const char *jobid, int src_pmi_id, const char key[], char value [], int maxValue, int *valLen)
{
    int pmi2_errno = PMI2_SUCCESS;
    int found, keyfound;
    const char *kvsvalue;
    int kvsvallen, ret, rc;
    char src_pmi_id_str[256];
    const char *errmsg;

    int (*pmi2_kvs_get)(const char*, int, const char *, char *, int, int*);

    pmi2_kvs_get = (int (*)())dlsym(poeptr, "PMI2_KVS_Get");

    if (pmi2_kvs_get == NULL) {
        TRACE_ERR("failed to dlsym pmi2_kvs_get\n");
    }

    return (*pmi2_kvs_get)(jobid, src_pmi_id, key, value, maxValue, valLen);
}


int PMI2_KVS_Get(const char *jobid, int src_pmi_id, const char key[], char value [], int maxValue, int *valLen)
{
    int pmi2_errno = PMI2_SUCCESS;
    int found, keyfound;
    const char *kvsvalue;
    int kvsvallen;
    int ret;
    PMI2_Command cmd = {0};
    int rc;
    char src_pmi_id_str[256];
    const char *errmsg;

    PMI2U_Snprintf(src_pmi_id_str, sizeof(src_pmi_id_str), "%d", src_pmi_id);

    pmi2_errno = PMIi_InitIfSingleton();

    pmi2_errno = PMIi_WriteSimpleCommandStr(PMI2_fd, &cmd, KVSGET_CMD, JOBID_KEY, jobid, SRCID_KEY, src_pmi_id_str, KEY_KEY, key, NULL);

    pmi2_errno = PMIi_ReadCommandExp(PMI2_fd, &cmd, KVSGETRESP_CMD, &rc, &errmsg);

    found = getvalbool(cmd.pairs, cmd.nPairs, FOUND_KEY, &keyfound);

    found = getval(cmd.pairs, cmd.nPairs, VALUE_KEY, &kvsvalue, &kvsvallen);

    ret = PMI2U_Strncpy(value, kvsvalue, maxValue);
    *valLen = ret ? -kvsvallen : kvsvallen;

    PMI2U_Free(cmd.command);
    freepairs(cmd.pairs, cmd.nPairs);
    return pmi2_errno;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


int PMI_KVS_Get( const char kvsname[], const char key[], char value[], int length)
{
    char buf[PMIU_MAXLINE];
    int err = PMI_SUCCESS;
    int  rc;

    /* Connect to the PM if we haven't already.  This is needed in case we're doing an MPI_Comm_join or MPI_Comm_connect/accept from
       the singleton init case.  This test is here because, in the way in which MPICH uses PMI, this is where the test needs to be. */
    if (PMIi_InitIfSingleton() != 0) 
        return -1;

    rc = MPL_snprintf( buf, PMIU_MAXLINE, "cmd=get kvsname=%s key=%s\n", kvsname, key );

    err = GetResponse( buf, "get_result", 0 );

    if (err == PMI_SUCCESS) {
        PMIU_getval( "rc", buf, PMIU_MAXLINE );
        rc = atoi( buf );
        if ( rc == 0 ) {
            PMIU_getval( "value", value, length );
            return( 0 );
        }
    }

    return err;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
 This function is used to request information from the server and check that the response uses the expected command name.  On a successful
 return from this routine, additional PMIU_getval calls may be used to access information about the returned value.
 
 If checkRc is true, this routine also checks that the rc value returned was 0.  If not, it uses the "msg" value to report on the reason for the failure.
 */

static int GetResponse( const char request[], const char expectedCmd[], int checkRc )
{
    int err, n;
    char *p;
    char recvbuf[PMIU_MAXLINE];
    char cmdName[PMIU_MAXLINE];

    err = PMIU_writeline( PMI_fd, (char *)request );

    n = PMIU_readline( PMI_fd, recvbuf, sizeof(recvbuf) );

    err = PMIU_parse_keyvals( recvbuf );

    p = PMIU_getval( "cmd", cmdName, sizeof(cmdName) );

    if (checkRc) {
        p = PMIU_getval( "rc", cmdName, PMIU_MAXLINE );
    }

    return err;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

char *PMIU_getval( const char *keystr, char *valstr, int vallen )
{
    int i, rc;
    
    for (i = 0; i < PMIU_keyval_tab_idx; i++) {
        if ( strcmp( keystr, PMIU_keyval_tab[i].key ) == 0 ) { 
            rc = MPIU_Strncpy( valstr, PMIU_keyval_tab[i].value, vallen );
            return valstr;
           } 
    }
    valstr[0] = '\0';
    return NULL;
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/* Setting a process's connection information 
   
   This is a collective call (for scalability) over all of the processes in the same MPI_COMM_WORLD.
*/

/*MPIDI_PG_SetConnInfo
    This is a collective call over the processes in MPI_COMM_WORLD that takes the rank of the calling process and its connection information, and makes 
    it available for the other processes. It is implemented using the PMI_KVS_Put and PMI_Barrier calls.
*/

int MPIDI_PG_SetConnInfo( int rank, const char *connString ){

    int mpi_errno = MPI_SUCCESS;
    int pmi_errno;
    int len;
    char key[128];

    MPIU_Assert(pg_world->connData);
    
    len = MPL_snprintf(key, sizeof(key), "P%d-businesscard", rank);

    if (len < 0 || len > sizeof(key)) {
        MPIR_ERR_SETANDJUMP1(mpi_errno,MPI_ERR_OTHER, "**snprintf", "**snprintf %d", len);
    }

    pmi_errno = PMI_KVS_Put(pg_world->connData, key, connString );

    if (pmi_errno != PMI_SUCCESS) {
        MPIR_ERR_SETANDJUMP1(mpi_errno,MPI_ERR_OTHER, "**pmi_kvs_put", "**pmi_kvs_put %d", pmi_errno);
    }

    pmi_errno = PMI_KVS_Commit(pg_world->connData);

    if (pmi_errno != PMI_SUCCESS) {
        MPIR_ERR_SETANDJUMP1(mpi_errno,MPI_ERR_OTHER, "**pmi_kvs_commit", "**pmi_kvs_commit %d", pmi_errno);
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
