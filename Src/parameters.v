`ifndef PARAMETERS_V
`define PARAMETERS_V

//////////////////////////////////////////
//current rank, root, and world size
parameter cur_rank = 9'b0;
parameter root = 9'b0;
parameter rank_z = 3'b0;
parameter rank_y = 3'b0;
parameter rank_x = 3'b0;
parameter root_z = 3'b0;
parameter root_y = 3'b0;
parameter root_x = 3'b0;

parameter lg_numprocs = 3;
parameter num_procs = 1 << lg_numprocs;

///////////////////////////////////////////
//packet structure
parameter FlitWidth = 82;
parameter PayloadWidth=32;
parameter opPos = 32;
parameter opWidth = 4;
parameter AlgTypePos = 36;
parameter AlgTypeWidth = 2;
parameter TagPos=38;
parameter TagWidth = 8;
parameter ContextIdPos = 46;
parameter ContextIdWidth = 8;
parameter RankPos = 54;
parameter RankWidth = 9;
parameter Src_XPos = 63;
parameter Src_YPos = 66;
parameter Src_ZPos = 69;
parameter Src_XWidth = 3;
parameter Src_YWidth = 3;
parameter Src_ZWidth = 3;
parameter Dst_XPos = 72;
parameter Dst_YPos = 75;
parameter Dst_ZPos = 78;
parameter Dst_XWidth = 3;
parameter Dst_YWidth = 3;
parameter Dst_ZWidth = 3;
parameter SrcPos = 63;
parameter SrcWidth = 9;
parameter DstPos = 72;
parameter DstWidth = 9;
parameter ValidBitPos = 81;

//////////////////////////////////////////
//reduce unit table and adder
parameter ReductionTableWidth = 91;
parameter ReductionTableSize = 6;
parameter AdderLatency = 14;
parameter ReductionBitPos=35;


/////////////////////////////////////////
//children and countdown
parameter ChildrenPos=82;
parameter ChildrenWidth=3;
parameter WaitPos = 85;
parameter WaitWidth = 4;
parameter ExtraWaitPos=89;
parameter LeafBitPos=90;

///////////////////////////////////////
//fifo
parameter fifo_lg_size = 12;
parameter FifoSize = 1<<fifo_lg_size;

/////////////////////////////////////
//communicator table
parameter CommTableWidth = 43;
parameter CommTableSize = 4;
parameter lgCommSizePos = 27;
parameter CommChildrenPos = 31;
parameter LocalRankPos = 34;

////////////////////////////////////
//algorithmic opcodes
parameter LargeBcast = 4'b0101;
parameter MediumBcast = 4'b0110;
parameter ShortBcast = 4'b0111;
parameter Scatter = 4'b1000;
parameter LargeAllGather = 4'b1001;
parameter ShortAllGather = 4'b1010;
parameter Gather = 4'b1011;
parameter ShortReduce = 4'b1100;
parameter LargeReduce = 4'b1101;
parameter ShortAllReduce = 4'b1110;
parameter LargeAllReduce = 4'b1111;



`endif
