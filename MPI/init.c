
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int MPI_Init( int *argc, char ***argv )
{

    static const char FCNAME[] = "MPI_Init";
    int mpi_errno = MPI_SUCCESS;
    int rc ATTRIBUTE((unused));
    int threadLevel, provided;

    rc = MPID_Wtime_init();
    MPIR_T_env_init();

    if (!strcmp(MPIR_CVAR_DEFAULT_THREAD_LEVEL, "MPI_THREAD_SINGLE")){
        threadLevel = MPI_THREAD_SINGLE;
    }

    mpi_errno = MPIR_Init_thread( argc, argv, threadLevel, &provided );

    return mpi_errno;
}



int MPIR_Init_thread(int * argc, char ***argv, int required, int * provided)
{
    int mpi_errno = MPI_SUCCESS;
    int has_args;
    int has_env;
    int thread_provided;
    int exit_init_cs_on_failure = 0;
    MPID_Info *info_ptr;

    /* Set the functions used to duplicate attributes.  These are when the first corresponding keyval is created */
    MPIR_Process.attr_dup  = 0;
    MPIR_Process.attr_free = 0;

    /* This allows the device to select an alternative function for dimsCreate */
    MPIR_Process.dimsCreate = 0;

    /* "Allocate" from the reserved space for builtin communicators and (partially) initialize predefined communicators.  comm_parent is
       intially NULL and will be allocated by the device if the process group was started using one of the MPI_Comm_spawn functions. */
    MPIR_Process.comm_world = MPID_Comm_builtin + 0;
    MPIR_Comm_init(MPIR_Process.comm_world);
    MPIR_Process.comm_world->handle = MPI_COMM_WORLD;
    MPIR_Process.comm_world->context_id = 0 << MPID_CONTEXT_PREFIX_SHIFT; //(0 << 4 = 0)
    MPIR_Process.comm_world->recvcontext_id = 0 << MPID_CONTEXT_PREFIX_SHIFT;
    MPIR_Process.comm_world->comm_kind = MPID_INTRACOMM;

    /* This initialization of the comm name could be done only when comm_get_name is called */
    MPIU_Strncpy(MPIR_Process.comm_world->name, "MPI_COMM_WORLD", MPI_MAX_OBJECT_NAME);

    MPIR_Process.comm_self          = MPID_Comm_builtin + 1;
    MPIR_Comm_init(MPIR_Process.comm_self);
    MPIR_Process.comm_self->handle      = MPI_COMM_SELF;
    MPIR_Process.comm_self->context_id      = 1 << MPID_CONTEXT_PREFIX_SHIFT; //(1<<4) = 16
    MPIR_Process.comm_self->recvcontext_id  = 1 << MPID_CONTEXT_PREFIX_SHIFT;
    MPIR_Process.comm_self->comm_kind       = MPID_INTRACOMM;
    MPIU_Strncpy(MPIR_Process.comm_self->name, "MPI_COMM_SELF", MPI_MAX_OBJECT_NAME);


    MPIR_Process.comm_parent = NULL;

    /* Setup the initial communicator list in case we have enabled the debugger message-queue interface */
    MPIR_COMML_REMEMBER( MPIR_Process.comm_world );
    MPIR_COMML_REMEMBER( MPIR_Process.comm_self );

    /* Call any and all MPID_Init type functions */
    MPIR_Err_init();
    MPIR_Datatype_init();
    MPIR_Group_init();

    /* define MPI as initialized so that we can use MPI functions within MPID_Init if necessary */
    OPA_store_int(&MPIR_Process.mpich_state, MPICH_IN_INIT);

    /* create MPI_INFO_NULL object */
    /* FIXME: Currently this info object is empty, we need to add data to this as defined by the standard. */
    info_ptr = MPID_Info_builtin + 1;
    info_ptr->handle = MPI_INFO_ENV;
    MPIU_Object_set_ref(info_ptr, 1);
    info_ptr->next  = NULL;
    info_ptr->key   = NULL;
    info_ptr->value = NULL;
    
    mpi_errno = MPID_Init(argc, argv, required, &thread_provided, &has_args, &has_env);

    /* Assert: tag_ub should be a power of 2 minus 1 */
    MPIU_Assert(((unsigned)MPIR_Process.attrs.tag_ub & ((unsigned)MPIR_Process.attrs.tag_ub + 1)) == 0);

    /* Set aside tag space for tagged collectives and failure notification */
    MPIR_Process.attrs.tag_ub     >>= 3;
    /* The bit for error checking is set in a macro in mpiimpl.h for performance reasons. */
    MPIR_Process.tagged_coll_mask   = MPIR_Process.attrs.tag_ub + 1;

    /* Assert: tag_ub is at least the minimum asked for in the MPI spec */
    MPIU_Assert( MPIR_Process.attrs.tag_ub >= 32767 );


    /* Let the device know that the rest of the init process is completed */
    if (mpi_errno == MPI_SUCCESS)   mpi_errno = MPID_InitCompleted();

    return mpi_errno;

}



int MPIR_Comm_init(MPID_Comm * comm_p)
{
    int mpi_errno = MPI_SUCCESS;

    MPIU_Object_set_ref(comm_p, 1);

    /* initialize local and remote sizes to -1 to allow other parts of
     * the stack to detect errors more easily */
    comm_p->local_size = -1;
    comm_p->remote_size = -1;

    /* Clear many items (empty means to use the default; some of these
     * may be overridden within the upper-level communicator initialization) */
    comm_p->errhandler = NULL;
    comm_p->attributes = NULL;
    comm_p->remote_group = NULL;
    comm_p->local_group = NULL;
    comm_p->coll_fns = NULL;
    comm_p->topo_fns = NULL;
    comm_p->name[0] = '\0';
    comm_p->info = NULL;

    comm_p->hierarchy_kind = MPID_HIERARCHY_FLAT;
    comm_p->node_comm = NULL;
    comm_p->node_roots_comm = NULL;
    comm_p->intranode_table = NULL;
    comm_p->internode_table = NULL;

    /* abstractions bleed a bit here... :(*/
    comm_p->next_sched_tag = MPIR_FIRST_NBC_TAG;

    /* Initialize the revoked flag as false */
    comm_p->revoked = 0;
    comm_p->mapper_head = NULL;
    comm_p->mapper_tail = NULL;

    /* Fields not set include context_id, remote and local size, and kind, since different communicator construction routines need different values */
    return mpi_errno;
}







int MPID_Init(int *argc, char ***argv, int requested, int *provided, int *has_args, int *has_env)
{
    int mpi_errno = MPI_SUCCESS;
    int has_parent;
    MPIDI_PG_t * pg=NULL;
    int pg_rank=-1;
    int pg_size;
    MPID_Comm * comm;
    int p;
    int val;

    /* initialization routine for ch3u_comm.c */
    mpi_errno = MPIDI_CH3I_Comm_init();
    
    /* init group of failed processes, and set finalize callback */
    MPIDI_Failed_procs_group = MPID_Group_empty;
    MPIR_Add_finalize(finalize_failed_procs_group, NULL, MPIR_FINALIZE_CALLBACK_PRIO-1);

    /* FIXME: This is a good place to check for environment variables
       and command line options that may control the device */
    MPIDI_Use_pmi2_api = FALSE;

    int ret;
    ret = MPL_env2bool("MPICH_USE_PMI2_API", &val);
    if (ret == 1 && val){
         MPIDI_Use_pmi2_api = TRUE;
    }


    PMI_KVS_Get_value_length_max(&val);
    MPIDI_failed_procs_string = MPIU_Malloc(sizeof(char) * (val+1));

    /* Set global process attributes.  These can be overridden by the channel if necessary.  */
    MPIR_Process.attrs.tag_ub = INT_MAX;
    MPIR_Process.attrs.io = MPI_ANY_SOURCE;

    /* Perform channel-independent PMI initialization  */
    mpi_errno = init_pg( argc, argv, has_args, has_env, &has_parent, &pg_rank, &pg );

    pg_size = MPIDI_PG_Get_size(pg);
    MPIDI_Process.my_pg = pg;  
    MPIDI_Process.my_pg_rank = pg_rank;

    MPIDI_PG_add_ref(pg);

    /* We intentionally call this before the channel init so that the channel can use the node_id info. */
    mpi_errno = MPIDI_Populate_vc_node_ids(pg, pg_rank);

    /* Initialize FTB after PMI init */
    mpi_errno = MPIDU_Ftb_init();

    /* Initialize Window functions table with defaults, then call the channel's
       init function. */
    MPIDI_Win_fns_init(&MPIDI_CH3U_Win_fns);
    MPIDI_CH3_Win_fns_init(&MPIDI_CH3U_Win_fns);
    MPIDI_CH3_Win_hooks_init(&MPIDI_CH3U_Win_hooks);

    /* Let the channel perform any necessary initialization
       The channel init should assume that PMI_Init has been called and that the basic information about the job has been extracted from PMI (e.g.,
       the size and rank of this process, and the process group id)   */
    mpi_errno = MPIDI_CH3_Init(has_parent, pg, pg_rank);

    /* setup receive queue statistics */
    mpi_errno = MPIDI_CH3U_Recvq_init();

    /* Ask channel to expose Window packet ordering. */
    MPIDI_CH3_Win_pkt_orderings_init(&MPIDI_CH3U_Win_pkt_orderings);

    /* Initialize the MPI_COMM_WORLD object  */
    comm = MPIR_Process.comm_world;

    comm->rank        = pg_rank;
    comm->remote_size = pg_size;
    comm->local_size  = pg_size;
    
    mpi_errno = MPIDI_VCRT_Create(comm->remote_size, &comm->dev.vcrt);

    /* Initialize the connection table on COMM_WORLD from the process group's connection table */
    for (p = 0; p < pg_size; p++){
        MPIDI_VCR_Dup(&pg->vct[p], &comm->dev.vcrt->vcr_table[p]);
    }

    mpi_errno = MPIR_Comm_commit(comm);

    /* Initialize the MPI_COMM_SELF object */
    comm = MPIR_Process.comm_self;
    comm->rank        = 0;
    comm->remote_size = 1;
    comm->local_size  = 1;
    
    mpi_errno = MPIDI_VCRT_Create(comm->remote_size, &comm->dev.vcrt);

    MPIDI_VCR_Dup(&pg->vct[pg_rank], &comm->dev.vcrt->vcr_table[0]);

    mpi_errno = MPIR_Comm_commit(comm);

    /* Initialize the MPIR_ICOMM_WORLD object (an internal, private version of MPI_COMM_WORLD)  */
    comm = MPIR_Process.icomm_world;

    comm->rank        = pg_rank;
    comm->remote_size = pg_size;
    comm->local_size  = pg_size;
    MPIDI_VCRT_Add_ref( MPIR_Process.comm_world->dev.vcrt );
    comm->dev.vcrt = MPIR_Process.comm_world->dev.vcrt;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/* Initialize the process group structure by using PMI calls.
 * This routine initializes PMI and uses PMI calls to setup the process group structures. */
static int init_pg( int *argc, char ***argv, int *has_args, int *has_env, int *has_parent, int *pg_rank_p, MPIDI_PG_t **pg_p )
{
    int pmi_errno;
    int mpi_errno = MPI_SUCCESS;
    int pg_rank, pg_size, appnum, pg_id_sz;
    int usePMI=1;
    char *pg_id;
    MPIDI_PG_t *pg = 0;

    /* See if the channel will provide the PMI values. The channel is responsible for defining HAVE_CH3_PRE_INIT and providing the MPIDI_CH3_Pre_init function.*/
#ifdef HAVE_CH3_PRE_INIT
    {
    int setvals;
    mpi_errno = MPIDI_CH3_Pre_init( &setvals, has_parent, &pg_rank, &pg_size );
    if (setvals) usePMI = 0;
    }
#endif 


    else {   /* Create a default pg id */
        pg_id = MPIU_Malloc(2);
        if (pg_id == NULL) {
            MPIR_ERR_SETANDJUMP(mpi_errno,MPI_ERR_OTHER, "**nomem");
        }
        MPIU_Strncpy( pg_id, "0", 2 );
    }

    /* Initialize the process group tracking subsystem  */
    mpi_errno = MPIDI_PG_Init(argc, argv, pg_compare_ids, pg_destroy);

    /* Create a new structure to track the process group for our MPI_COMM_WORLD */
    mpi_errno = MPIDI_PG_Create(pg_size, pg_id, &pg);

    *has_args = TRUE;
    *has_env  = TRUE;

    *pg_p      = pg;
    *pg_rank_p = pg_rank;

    return mpi_errno;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int MPIDI_VCRT_Create(int size, struct MPIDI_VCRT **vcrt_ptr)
{
    MPIDI_VCRT_t * vcrt;
    int mpi_errno = MPI_SUCCESS;


    MPIU_CHKPMEM_MALLOC(vcrt, MPIDI_VCRT_t *, sizeof(MPIDI_VCRT_t) + (size - 1) * sizeof(MPIDI_VC_t *), mpi_errno, "**nomem");
    vcrt->handle = HANDLE_SET_KIND(0, HANDLE_KIND_INVALID);
    MPIU_Object_set_ref(vcrt, 1);
    vcrt->size = size;
    *vcrt_ptr = vcrt;

    return mpi_errno;
}



 /*MPIDI_VCR_Dup - Duplicate a virtual connection reference

  If the VC is being used for the first time in a VC reference table, the reference count is set to two, not one, in order to
  distinquish between freeing a communicator with 'MPI_Comm_free' and 'MPI_Comm_disconnect', and the reference count on the process group
  is incremented (to indicate that the process group is in use). While this has no effect on the process group of 'MPI_COMM_WORLD',
  it is important for process groups accessed through 'MPI_Comm_spawn' or 'MPI_Comm_connect/MPI_Comm_accept'.
    @*/

int MPIDI_VCR_Dup(MPIDI_VCR orig_vcr, MPIDI_VCR * new_vcr)
{
    /* We are allowed to create a vc that belongs to no process group as part of the initial connect/accept action, so in that case,
     ignore the pg ref count update */

    if (MPIU_Object_get_ref(orig_vcr) == 0 && orig_vcr->pg) {
        MPIDI_VC_add_ref( orig_vcr );
        MPIDI_VC_add_ref( orig_vcr );
        MPIDI_PG_add_ref( orig_vcr->pg );
    }
    else {
        MPIDI_VC_add_ref(orig_vcr);
    }

    *new_vcr = orig_vcr;

    return MPI_SUCCESS;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


int MPIR_Comm_commit(MPID_Comm * comm)
{
    int mpi_errno = MPI_SUCCESS;
    int num_local = -1, num_external = -1;
    int local_rank = -1, external_rank = -1;
    int *local_procs = NULL, *external_procs = NULL;

    MPIU_Assert(comm->node_comm == NULL);
    MPIU_Assert(comm->node_roots_comm == NULL);

    mpi_errno = set_collops(comm);

    /* Notify device of communicator creation */
    mpi_errno = MPID_Dev_comm_create_hook(comm);

    MPIR_Comm_map_free(comm);

    if (comm->comm_kind == MPID_INTRACOMM) {

        mpi_errno = MPIU_Find_local_and_external(comm,
                                                 &num_local, &local_rank, &local_procs,
                                                 &num_external, &external_rank, &external_procs,
                                                 &comm->intranode_table, &comm->internode_table);


        /* defensive checks */
        MPIU_Assert(num_local > 0);
        MPIU_Assert(num_local > 1 || external_rank >= 0);
        MPIU_Assert(external_rank < 0 || external_procs != NULL);

        /* if the node_roots_comm and comm would be the same size, then creating
         * the second communicator is useless and wasteful. */
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
    return mpi_errno;
} 
