
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*COMMUNICATOR CREATION*/

int MPI_Comm_create(MPI_Comm comm, MPI_Group group, MPI_Comm *newcomm)
{
    int mpi_errno = MPI_SUCCESS;
    MPID_Comm *comm_ptr = NULL, *newcomm_ptr;
    MPID_Group *group_ptr;

    MPID_Comm_get_ptr( comm, comm_ptr );
    MPID_Group_get_ptr( group, group_ptr );
    
    if (comm_ptr->comm_kind == MPID_INTRACOMM) {
        mpi_errno = MPIR_Comm_create_intra(comm_ptr, group_ptr, &newcomm_ptr);
        if (mpi_errno) MPIR_ERR_POP(mpi_errno);
    }

    if (newcomm_ptr)
        MPID_OBJ_PUBLISH_HANDLE(*newcomm, newcomm_ptr->handle);
    else
        *newcomm = MPI_COMM_NULL;


    return mpi_errno;
}


int MPIR_Comm_create_intra(MPID_Comm *comm_ptr, MPID_Group *group_ptr, MPID_Comm **newcomm_ptr)
{
    int mpi_errno = MPI_SUCCESS;
    MPIU_Context_id_t new_context_id = 0;
    int *mapping = NULL;
    int n;

    n = group_ptr->size;
    *newcomm_ptr = NULL;

    /* Create a new communicator from the specified group members */

    /* Creating the context id is collective over the *input* communicator, so it must be created before we decide if this process is a member of the group */
    /* In the multi-threaded case, MPIR_Get_contextid_sparse assumes that the calling routine already holds the single criticial section */
    mpi_errno = MPIR_Get_contextid_sparse( comm_ptr, &new_context_id, group_ptr->rank == MPI_UNDEFINED );

    if (group_ptr->rank != MPI_UNDEFINED) {
        MPID_Comm *mapping_comm = NULL;

        mpi_errno = MPIR_Comm_create_calculate_mapping(group_ptr, comm_ptr, &mapping, &mapping_comm);

        /* Get the new communicator structure and context id */

        mpi_errno = MPIR_Comm_create( newcomm_ptr );

        (*newcomm_ptr)->recvcontext_id = new_context_id;
        (*newcomm_ptr)->rank           = group_ptr->rank;
        (*newcomm_ptr)->comm_kind      = comm_ptr->comm_kind;
        /* Since the group has been provided, let the new communicator know about the group */
        (*newcomm_ptr)->local_comm     = 0;
        (*newcomm_ptr)->local_group    = group_ptr;
        MPIR_Group_add_ref( group_ptr );

        (*newcomm_ptr)->remote_group   = group_ptr;
        MPIR_Group_add_ref( group_ptr );
        (*newcomm_ptr)->context_id     = (*newcomm_ptr)->recvcontext_id;
        (*newcomm_ptr)->remote_size    = (*newcomm_ptr)->local_size = n;

        /* Setup the communicator's network address mapping.  This is for the remote group, which is the same as the local group for intracommunicators */
        mpi_errno = MPIR_Comm_create_map(n, 0, mapping, NULL, mapping_comm, *newcomm_ptr);

        mpi_errno = MPIR_Comm_commit(*newcomm_ptr);
    }
    else {        /* This process is not in the group */
        new_context_id = 0;
    }

    return mpi_errno;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/* This function allocates and calculates an array (*mapping_out) such that (*mapping_out)[i] is the rank in (*mapping_comm) corresponding to local
  rank i in the given group_ptr.

  Ownership of the (*mapping_out) array is transferred to the caller who is responsible for freeing it. */

int MPIR_Comm_create_calculate_mapping(MPID_Group *group_ptr, MPID_Comm *comm_ptr, int **mapping_out, MPID_Comm **mapping_comm)
{
    int mpi_errno = MPI_SUCCESS;
    int subsetOfWorld = 0;
    int i, j;
    int n;
    int *mapping=0;

    *mapping_out = NULL;
    *mapping_comm = comm_ptr;

    n = group_ptr->size;
    MPIU_CHKPMEM_MALLOC(mapping,int*,n*sizeof(int),mpi_errno,"mapping");

    /* Make sure that the processes for this group are contained within the input communicator.  Also identify the mapping from the ranks of
       the old communicator to the new communicator. We do this by matching the lpids of the members of the group
       with the lpids of the members of the input communicator. It is an error if the group contains a reference to an lpid that
       does not exist in the communicator.

       An important special case is groups (and communicators) that are subsets of MPI_COMM_WORLD.  In this case, the lpids are
       exactly the same as the ranks in comm world.
    */
    /* we examine the group's lpids in both the intracomm and non-comm_world cases */
    MPIR_Group_setup_lpid_list( group_ptr );

    /* Optimize for groups contained within MPI_COMM_WORLD. */
    if (comm_ptr->comm_kind == MPID_INTRACOMM) {
        int wsize;
        subsetOfWorld = 1;
        wsize = MPIR_Process.comm_world->local_size;
        for (i=0; i<n; i++) {
            int g_lpid = group_ptr->lrank_to_lpid[i].lpid;

            /* This mapping is relative to comm world */
            if (g_lpid < wsize) {
                mapping[i] = g_lpid;
            }
            else {
                subsetOfWorld = 0;
                break;
            }
        }
    }

    if (subsetOfWorld) {
        /* Override the comm to be used with the mapping array. */
        *mapping_comm = MPIR_Process.comm_world;
    }
    else {
        for (i=0; i<n; i++) {
            /* mapping[i] is the rank in the communicator of the process that is the ith element of the group */
            mapping[i] = -1;
            for (j=0; j<comm_ptr->local_size; j++) {
                int comm_lpid;
                MPID_Comm_get_lpid( comm_ptr, j, &comm_lpid, FALSE );
                if (comm_lpid == group_ptr->lrank_to_lpid[i].lpid) {
                    mapping[i] = j;
                    break;
                }
            }
        }
    }

    *mapping_out = mapping;

    return mpi_errno;

}



/*@
  MPID_Comm_get_lpid - Get the local process ID for a given VC reference
  @*/

int MPID_Comm_get_lpid(MPID_Comm *comm_ptr, int idx, int * lpid_ptr, MPIU_BOOL is_remote)
{
    if (comm_ptr->comm_kind == MPID_INTRACOMM)
        *lpid_ptr = comm_ptr->dev.vcrt->vcr_table[idx]->lpid;

    return MPI_SUCCESS;
}


/* mapping[i] is equivalent network mapping between the old communicator and the new communicator.  Index 'i' in the old
   communicator has the same network address as 'mapping[i]' in the new communicator.  */

int MPIR_Comm_create_map(int local_n, int remote_n, int *local_mapping, int *remote_mapping, MPID_Comm *mapping_comm, MPID_Comm *newcomm)
{
    int mpi_errno = MPI_SUCCESS;

    MPIR_Comm_map_irregular(newcomm, mapping_comm, local_mapping, local_n, MPIR_COMM_MAP_DIR_L2L, NULL);

    return mpi_errno;
}


int MPIR_Comm_map_irregular(MPID_Comm * newcomm, MPID_Comm * src_comm, int *src_mapping, int src_mapping_size, MPIR_Comm_map_dir_t dir, MPIR_Comm_map_t ** map)
{
    int mpi_errno = MPI_SUCCESS;
    MPIR_Comm_map_t *mapper;

    mapper->type = MPIR_COMM_MAP_IRREGULAR;
    mapper->src_comm = src_comm;
    mapper->dir = dir;
    mapper->src_mapping_size = src_mapping_size;

    if (src_mapping) {
        mapper->src_mapping = src_mapping;
        mapper->free_mapping = 0;
    }
    else {
        MPIU_CHKPMEM_MALLOC(mapper->src_mapping, int *, src_mapping_size * sizeof(int), mpi_errno, "mapper mapping");
        mapper->free_mapping = 1;
    }

    mapper->next = NULL;

    MPL_LL_APPEND(newcomm->mapper_head, newcomm->mapper_tail, mapper);

    if (map)
        *map = mapper;

    return mpi_errno;
} 
