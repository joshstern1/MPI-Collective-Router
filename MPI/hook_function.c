//////////////////////////////////////////////////////////////////////////////////////////////////////////
//mpi/init/init.c
int MPI_Init( int *argc, char ***argv )
{
    mpi_errno = MPIR_Init_thread( argc, argv, threadLevel, &provided );
}



////////////////////////////////////////////////////////////////////////////////////////////////////////
//mpi/init/initthread.c
int MPIR_Init_thread(int * argc, char ***argv, int required, int * provided)
{
    
    mpi_errno = MPID_Init(argc, argv, required, &thread_provided, &has_args, &has_env);

    /* Let the device know that the rest of the init process is completed */
	mpi_errno = MPID_InitCompleted();

    /* Make fields of MPIR_Process global visible and set mpich_state atomically so that MPI_Initialized() etc. are thread safe */
    OPA_write_barrier();
    OPA_store_int(&MPIR_Process.mpich_state, MPICH_POST_INIT);
    return mpi_errno;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////
//mpid/ch3/src/mpid_init.c
int MPID_Init(int *argc, char ***argv, int requested, int *provided, int *has_args, int *has_env)
{
    /* initialization routine for ch3u_comm.c */
    mpi_errno = MPIDI_CH3I_Comm_init();

    /* Perform channel-independent PMI initialization */
    mpi_errno = init_pg( argc, argv, has_args, has_env, &has_parent, &pg_rank, &pg );

    /* We intentionally call this before the channel init so that the channel can use the node_id info. */
    /* Ideally this wouldn't be needed.  Once we have PMIv2 support for node information we should probably eliminate this function. */
    mpi_errno = MPIDI_Populate_vc_node_ids(pg, pg_rank); 

    /* Let the channel perform any necessary initialization. The channel init should assume that PMI_Init has been called and that
       the basic information about the job has been extracted from PMI (e.g., the size and rank of this process, and the process group id)    */
    mpi_errno = MPIDI_CH3_Init(has_parent, pg, pg_rank);  
    
    mpi_errno = MPIDI_VCRT_Create(comm->remote_size, &comm->dev.vcrt);
}


////////////////////////////////////////////////////////////////////////////////////////////////////////
//mpid/ch3/src/mpid_init.c
/* This allows each channel to perform final initialization after the rest of MPI_Init completes.  */
int MPID_InitCompleted( void )
{
    int mpi_errno;
    mpi_errno = MPIDI_CH3_InitCompleted();
    return mpi_errno;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////
//mpid/ch3/src/mpid_init.c
static int init_pg( int *argc, char ***argv, int *has_args, int *has_env, int *has_parent, int *pg_rank_p, MPIDI_PG_t **pg_p )
{
    /* If we use PMI here, make the PMI calls to get the basic values.  Note that systems that return setvals == true
       do not make use of PMI for the KVS routines either (it is assumed that the discover connection information through some other mechanism */

	/* Initialize the process manangement interface (PMI), and get rank and size information about our process group */

	pmi_errno = PMI_Init(has_parent);

	pmi_errno = PMI_Get_rank(&pg_rank);

	pmi_errno = PMI_Get_size(&pg_size);
	
	pmi_errno = PMI_Get_appnum(&appnum);

	/* Now, initialize the process group information with PMI calls */
	/* Get the process group id */
	pmi_errno = PMI_KVS_Get_name_length_max(&pg_id_sz);

	pmi_errno = PMI_KVS_Get_my_name(pg_id, pg_id_sz);

    /* Initialize the process group tracking subsystem   */
    mpi_errno = MPIDI_PG_Init(argc, argv, pg_compare_ids, pg_destroy);

    /* Create a new structure to track the process group for our MPI_COMM_WORLD   */
    mpi_errno = MPIDI_PG_Create(pg_size, pg_id, &pg);

	/* Tell the process group how to get connection information */
    mpi_errno = MPIDI_PG_InitConnKVS( pg );
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
//mpid/ch3/channels/nemesis/src/ch3_init.c
/* Initialize the nemesis channel */
int MPIDI_CH3_Init(int has_parent, MPIDI_PG_t *pg_p, int pg_rank)
{
    mpi_errno = MPID_nem_init (pg_rank, pg_p, has_parent);

    for (i = 0; i < pg_p->size; i++){
		mpi_errno = MPIDI_CH3_VC_Init(&pg_p->vct[i]);
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////////
//mpid/ch3/channels/nemesis/src/ch3_init.c
int MPIDI_CH3_InitCompleted(void)
{
    while (ep)
    {
        mpi_errno = ep->callback();
        ep_tmp = ep;
        ep = ep->next;
        MPIU_Free(ep_tmp);
    }

 fn_exit:
    MPIDI_FUNC_EXIT(MPID_STATE_MPIDI_CH3_INITCOMPLETED);

    //insert hook function

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
//pmi/simple/simple_pmi.c
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
//pmi/simple/simple_pmi.c
/* This function is used to request information from the server and check that the response uses the expected command name.  On a successful
  return from this routine, additional PMIU_getval calls may be used to access information about the returned value.
 
 If checkRc is true, this routine also checks that the rc value returned was 0.  If not, it uses the "msg" value to report on the reason for the failure. */

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
//pmi/simple/simple_pmiutil.c
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
