//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*@

MPI_Comm_split - Creates new communicators based on colors and keys

Input Parameters:
+ comm - communicator (handle) 
. color - control of subset assignment (nonnegative integer).  Processes 
  with the same color are in the same new communicator 
- key - control of rank assignment (integer)

Output Parameters:
. newcomm - new communicator (handle) 

Algorithm:
  1. Use MPI_Allgather to get the color and key from each process
  2. Count the number of processes with the same color; create a 
     communicator with that many processes.  If this process has
     'MPI_UNDEFINED' as the color, create a process with a single member.
  3. Use key to order the ranks
@*/
int MPI_Comm_split(MPI_Comm comm, int color, int key, MPI_Comm *newcomm)
{
    int mpi_errno = MPI_SUCCESS;
    MPID_Comm *comm_ptr = NULL, *newcomm_ptr;

    MPID_Comm_get_ptr( comm, comm_ptr );      /* Get handles to MPI objects. */
        
    mpi_errno = MPIR_Comm_split_impl(comm_ptr, color, key, &newcomm_ptr);

    return mpi_errno;
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


int MPIR_Comm_split_impl(MPID_Comm *comm_ptr, int color, int key, MPID_Comm **newcomm_ptr)
{
    int mpi_errno = MPI_SUCCESS;
    MPID_Comm *local_comm_ptr;
    splittype *table, *remotetable=0;
    sorttype *keytable, *remotekeytable=0;
    int rank, size, remote_size, i, new_size, new_remote_size,
    first_entry = 0, first_remote_entry = 0, *last_ptr;
    int in_newcomm; /* TRUE iff *newcomm should be populated */
    MPIU_Context_id_t   new_context_id, remote_context_id;
    MPIR_Errflag_t errflag = MPIR_ERR_NONE;
    MPIR_Comm_map_t *mapper;

    rank        = comm_ptr->rank;
    size        = comm_ptr->local_size;
    remote_size = comm_ptr->remote_size;
    
    /* Step 1: Find out what color and keys all of the processes have */
    MPIU_CHKLMEM_MALLOC(table,splittype*,size*sizeof(splittype),mpi_errno, "table");
    table[rank].color = color;
    table[rank].key   = key;

    /* Get the communicator to use in collectives on the local group of processes */
    local_comm_ptr = comm_ptr;

    /* Gather information on the local group of processes */
    mpi_errno = MPIR_Allgather_impl( MPI_IN_PLACE, 2, MPI_INT, table, 2, MPI_INT, local_comm_ptr, &errflag );
    // /int MPIR_Allgather_impl(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, MPID_Comm *comm_ptr, MPIR_Errflag_t *errflag)

    /* Step 2: How many processes have our same color? */
    new_size = 0;
    if (color != MPI_UNDEFINED) {
    /* Also replace the color value with the index of the *next* value in this set.  The integer first_entry is the index of the first element */
        last_ptr = &first_entry;
        for (i=0; i<size; i++) {
            /* Replace color with the index in table of the next item of the same color.  We use this to efficiently populate the keyval table */
            if (table[i].color == color) {
                new_size++;
                *last_ptr = i;
                last_ptr  = &table[i].color;
            }
        }
    }

    /* Set the size of the remote group to the size of our group. This simplifies the test below for intercomms with an empty remote group (must create comm_null) */
    new_remote_size = new_size;

    in_newcomm = (color != MPI_UNDEFINED && new_remote_size > 0);   //So it will be 1

    /* Step 3: Create the communicator */
    /* Collectively create a new context id.  The same context id will be used by each (disjoint) collections of processes.  The
       processes whose color is MPI_UNDEFINED will not influence the resulting context id (by passing ignore_id==TRUE). */
    mpi_errno = MPIR_Get_contextid_sparse(local_comm_ptr, &new_context_id, !in_newcomm);

    MPIU_Assert(new_context_id != 0);

    *newcomm_ptr = NULL;

    /* Now, create the new communicator structure if necessary */
    if (in_newcomm) {
    
        mpi_errno = MPIR_Comm_create( newcomm_ptr );

        (*newcomm_ptr)->recvcontext_id = new_context_id;
        (*newcomm_ptr)->local_size      = new_size;
        (*newcomm_ptr)->comm_kind       = comm_ptr->comm_kind;
        /* Other fields depend on whether this is an intercomm or intracomm */

        /* Step 4: Order the processes by their key values.  Sort the list that is stored in table.  To simplify the sort, we extract 
        the table into a smaller array and sort that. Also, store in the "color" entry the rank in the input communicator of the entry. */
        MPIU_CHKLMEM_MALLOC(keytable,sorttype*,new_size*sizeof(sorttype), mpi_errno,"keytable");
        for (i=0; i<new_size; i++) {
            keytable[i].key   = table[first_entry].key;
            keytable[i].color = first_entry;
            first_entry       = table[first_entry].color;
        }

        /* sort key table.  The "color" entry is the rank of the corresponding process in the input communicator */
        MPIU_Sort_inttable( keytable, new_size );

        /* INTRA Communicator */
        (*newcomm_ptr)->context_id     = (*newcomm_ptr)->recvcontext_id;
        (*newcomm_ptr)->remote_size    = new_size;

        MPIR_Comm_map_irregular(*newcomm_ptr, comm_ptr, NULL, new_size, MPIR_COMM_MAP_DIR_L2L, &mapper);

        for (i = 0; i < new_size; i++) {
            mapper->src_mapping[i] = keytable[i].color;
            if (keytable[i].color == comm_ptr->rank)
                (*newcomm_ptr)->rank = i;
        }

        mpi_errno = MPIR_Comm_commit(*newcomm_ptr);
    }
    
    return mpi_errno;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
    Create a communicator structure and perform basic initialization
    (mostly clearing fields and updating the reference count).
 */
int MPIR_Comm_create(MPID_Comm ** newcomm_ptr)
{
    int mpi_errno = MPI_SUCCESS;
    MPID_Comm *newptr;

    newptr = (MPID_Comm *) MPIU_Handle_obj_alloc(&MPID_Comm_mem);

    *newcomm_ptr = newptr;

    mpi_errno = MPIR_Comm_init(newptr);

    /* Insert this new communicator into the list of known communicators. */
    MPIR_COMML_REMEMBER(newptr);

    return mpi_errno;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/* Sort the entries in keytable into increasing order by key.  A stable
   sort should be used incase the key values are not unique. */
static void MPIU_Sort_inttable( sorttype *keytable, int size )
{
    sorttype tmp;
    int i, j;

    /* fall through to insertion sort if qsort is unavailable/disabled */
    for (i = 1; i < size; ++i) {
        tmp = keytable[i];
        j = i - 1;
        while (1) {
            if (keytable[j].key > tmp.key) {
                keytable[j+1] = keytable[j];
                j = j - 1;
                if (j < 0)
                    break;
            }
            else {
                break;
            }
        }
        keytable[j+1] = tmp;
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//MPIR_Comm_map_irregular  (*newcomm_ptr       , comm_ptr            , NULL              new_size              , MPIR_COMM_MAP_DIR_L2L, &mapper);
int MPIR_Comm_map_irregular(MPID_Comm * newcomm, MPID_Comm * src_comm, int *src_mapping, int src_mapping_size, MPIR_Comm_map_dir_t dir, MPIR_Comm_map_t ** map)
{
    int mpi_errno = MPI_SUCCESS;
    MPIR_Comm_map_t *mapper;

    MPIU_CHKPMEM_MALLOC(mapper, MPIR_Comm_map_t *, sizeof(MPIR_Comm_map_t), mpi_errno, "mapper");

    mapper->type = MPIR_COMM_MAP_IRREGULAR;
    mapper->src_comm = src_comm;
    mapper->dir = dir;
    mapper->src_mapping_size = src_mapping_size;

    MPIU_CHKPMEM_MALLOC(mapper->src_mapping, int *, src_mapping_size * sizeof(int), mpi_errno, "mapper mapping");
    mapper->free_mapping = 1;


    mapper->next = NULL;

    MPL_LL_APPEND(newcomm->mapper_head, newcomm->mapper_tail, mapper);

    if (map)
        *map = mapper;

    return mpi_errno;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define MPL_LL_APPEND(head,tail,add) MPL_LL_APPEND_N(head,tail,add,next)
#define MPL_LL_APPEND_N(head,tail,add,_next)                                                   \
do {                                                                                           \
  (add)->_next=NULL;                                                                           \
  if (tail) {                                                                                  \
    (tail)->_next=(add);                                                                       \
  } else {                                                                                     \
    (head)=(add);                                                                              \
  }                                                                                            \
  (tail)=(add);                                                                                \
} while (0)


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
       our hierarchy of communicators */
    MPIU_Assert(comm->node_comm == NULL);
    MPIU_Assert(comm->node_roots_comm == NULL);

    mpi_errno = set_collops(comm);

    /* Notify device of communicator creation */
    mpi_errno = MPID_Dev_comm_create_hook(comm);

    MPIR_Comm_map_free(comm);

    if (comm->comm_kind == MPID_INTRACOMM) {

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

            MPIR_Comm_map_free(comm->node_roots_comm);
        }

        comm->hierarchy_kind = MPID_HIERARCHY_PARENT;
    }

  fn_exit:
    if (external_procs != NULL)
        MPIU_Free(external_procs);
    if (local_procs != NULL)
        MPIU_Free(local_procs);

    return mpi_errno;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/* MPIU_Find_local_and_external -- from the list of processes in comm, builds a list of local processes, i.e., processes on this same
   node, and a list of external processes, i.e., one process from each node.

   Note that this will not work correctly for spawned or attached processes.

   external processes: For a communicator, there is one external process per node.  You can think of this as the root or master process for that node.

   OUT:
     local_size_p      - number of processes on this node
     local_rank_p      - rank of this processes among local processes
     local_ranks_p     - (*local_ranks_p)[i] = the rank in comm of the process with local rank i. This is of size (*local_size_p) external_size_p - number of external processes
     external_rank_p   - rank of this process among the external processes, or -1 if this process is not external
     external_ranks_p  - (*external_ranks_p)[i] = the rank in comm of the process with external rank i. This is of size (*external_size_p)
     intranode_table_p - (*internode_table_p)[i] gives the rank in *local_ranks_p of rank i in comm or -1 if not applicable.  It is of size comm->remote_size.
     internode_table_p - (*internode_table_p)[i] gives the rank in *external_ranks_p of the root of the node containing rank i in comm.  It is of size comm->remote_size.
*/

int MPIU_Find_local_and_external(MPID_Comm *comm, int *local_size_p, int *local_rank_p, int **local_ranks_p,
                                 int *external_size_p, int *external_rank_p, int **external_ranks_p,
                                 int **intranode_table_p, int **internode_table_p)
{
    int mpi_errno = MPI_SUCCESS;
    int *nodes;
    int external_size, external_rank;
    int *external_ranks;
    int local_size, local_rank;
    int *local_ranks;
    int *internode_table, *intranode_table;
    int i;
    MPID_Node_id_t max_node_id, node_id, my_node_id;

    /* Scan through the list of processes in comm and add one process from each node to the list of "external" processes.  We add the first process 
    we find from each node.  nodes[] is an array where we keep track of whether we have already added that node to the list. */
    
    /* these two will be realloc'ed later to the appropriate size (currently unknown) */
    MPIU_CHKPMEM_MALLOC (external_ranks, int *, sizeof(int) * comm->remote_size, mpi_errno, "external_ranks");
    MPIU_CHKPMEM_MALLOC (local_ranks, int *, sizeof(int) * comm->remote_size, mpi_errno, "local_ranks");

    MPIU_CHKPMEM_MALLOC (internode_table, int *, sizeof(int) * comm->remote_size, mpi_errno, "internode_table");
    MPIU_CHKPMEM_MALLOC (intranode_table, int *, sizeof(int) * comm->remote_size, mpi_errno, "intranode_table");

    mpi_errno = MPID_Get_max_node_id(comm, &max_node_id);
    MPIU_Assert(max_node_id >= 0);
    MPIU_CHKLMEM_MALLOC (nodes, int *, sizeof(int) * (max_node_id + 1), mpi_errno, "nodes");

    /* nodes maps node_id to rank in external_ranks of leader for that node */
    for (i = 0; i < (max_node_id + 1); ++i)
        nodes[i] = -1;

    for (i = 0; i < comm->remote_size; ++i)
        intranode_table[i] = -1;
    
    external_size = 0;

    mpi_errno = MPID_Get_node_id(comm, comm->rank, &my_node_id);
    MPIU_Assert(my_node_id >= 0);
    MPIU_Assert(my_node_id <= max_node_id);

    local_size = 0;
    local_rank = -1;
    external_rank = -1;
    
    for (i = 0; i < comm->remote_size; ++i)
    {
        mpi_errno = MPID_Get_node_id(comm, i, &node_id);
        MPIU_Assert(node_id <= max_node_id);

        /* build list of external processes */
        if (nodes[node_id] == -1){
            if (i == comm->rank)
                external_rank = external_size;
            nodes[node_id] = external_size;
            external_ranks[external_size] = i;
            ++external_size;
        }

        /* build the map from rank in comm to rank in external_ranks */
        internode_table[i] = nodes[node_id];

        /* build list of local processes */
        if (node_id == my_node_id){
             if (i == comm->rank)
                 local_rank = local_size;

             intranode_table[i] = local_size;
             local_ranks[local_size] = i;
             ++local_size;
        }
    }

    *local_size_p = local_size;
    *local_rank_p = local_rank;
    *local_ranks_p =  MPIU_Realloc (local_ranks, sizeof(int) * local_size);

    *external_size_p = external_size;
    *external_rank_p = external_rank;
    *external_ranks_p = MPIU_Realloc (external_ranks, sizeof(int) * external_size);

    /* no need to realloc */
    if (intranode_table_p)
        *intranode_table_p = intranode_table;
    if (internode_table_p)
        *internode_table_p = internode_table;
    
    MPIU_CHKPMEM_COMMIT();

 fn_exit:
    return mpi_errno;
}
