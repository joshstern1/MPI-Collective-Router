//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*MPIDI_PG_GetConnString
    This is an independent (i.e., not collective) call that returns the connection string for the process identified by a process 
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

/* Provides a hook for the top level functions to perform some manipulation on a communicator just before it is given to the application level.

   For example, we create sub-communicators for SMP-aware collectives at this step. */

int MPIR_Comm_commit(MPID_Comm * comm)
{
    int mpi_errno = MPI_SUCCESS;
    int num_local = -1, num_external = -1;
    int local_rank = -1, external_rank = -1;
    int *local_procs = NULL, *external_procs = NULL;

    /* It's OK to relax these assertions, but we should do so very intentionally.  For now this function is the only place that we create
     * our hierarchy of communicators */
    MPIU_Assert(comm->node_comm == NULL);
    MPIU_Assert(comm->node_roots_comm == NULL);

    mpi_errno = set_collops(comm);

    /* Notify device of communicator creation */
    mpi_errno = MPID_Dev_comm_create_hook(comm);

    MPIR_Comm_map_free(comm);

    mpi_errno = MPIU_Find_local_and_external(comm, &num_local, &local_rank, &local_procs, &num_external, &external_rank, &external_procs, &comm->intranode_table, &comm->internode_table);

    /* defensive checks */
    MPIU_Assert(num_local > 0);
    MPIU_Assert(num_local > 1 || external_rank >= 0);
    MPIU_Assert(external_rank < 0 || external_procs != NULL);

    /* if the node_roots_comm and comm would be the same size, then creating the second communicator is useless and wasteful. */
    if (num_external == comm->remote_size) {
        MPIU_Assert(num_local == 1);
        goto fn_exit;
    }

    /* we don't need a local comm if this process is the only one on this node */
    if (num_local > 1) {
        mpi_errno = MPIR_Comm_create(&comm->node_comm);

        comm->node_comm->context_id = comm->context_id + MPID_CONTEXT_INTRANODE_OFFSET;
        comm->node_comm->recvcontext_id = comm->node_comm->context_id;
        comm->node_comm->rank = local_rank;
        comm->node_comm->comm_kind = MPID_INTRACOMM;
        comm->node_comm->hierarchy_kind = MPID_HIERARCHY_NODE;
        comm->node_comm->local_comm = NULL;

        comm->node_comm->local_size = num_local;
        comm->node_comm->remote_size = num_local;

        MPIR_Comm_map_irregular(comm->node_comm, comm, local_procs, num_local, MPIR_COMM_MAP_DIR_L2L, NULL);

        mpi_errno = set_collops(comm->node_comm);

        /* Notify device of communicator creation */
        mpi_errno = MPID_Dev_comm_create_hook(comm->node_comm);

        /* don't call MPIR_Comm_commit here */

        MPIR_Comm_map_free(comm->node_comm);
    }


    /* this process may not be a member of the node_roots_comm */
    if (local_rank == 0) {
        mpi_errno = MPIR_Comm_create(&comm->node_roots_comm);

        comm->node_roots_comm->context_id = comm->context_id + MPID_CONTEXT_INTERNODE_OFFSET;
        comm->node_roots_comm->recvcontext_id = comm->node_roots_comm->context_id;
        comm->node_roots_comm->rank = external_rank;
        comm->node_roots_comm->comm_kind = MPID_INTRACOMM;
        comm->node_roots_comm->hierarchy_kind = MPID_HIERARCHY_NODE_ROOTS;
        comm->node_roots_comm->local_comm = NULL;

        comm->node_roots_comm->local_size = num_external;
        comm->node_roots_comm->remote_size = num_external;

        MPIR_Comm_map_irregular(comm->node_roots_comm, comm, external_procs, num_external, MPIR_COMM_MAP_DIR_L2L, NULL);

         mpi_errno = set_collops(comm->node_roots_comm);

        /* Notify device of communicator creation */
        mpi_errno = MPID_Dev_comm_create_hook(comm->node_roots_comm);

        /* don't call MPIR_Comm_commit here */

        MPIR_Comm_map_free(comm->node_roots_comm);
    }

    comm->hierarchy_kind = MPID_HIERARCHY_PARENT;
    


    if (external_procs != NULL)
        MPIU_Free(external_procs);
    if (local_procs != NULL)
        MPIU_Free(local_procs);

    return mpi_errno;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
