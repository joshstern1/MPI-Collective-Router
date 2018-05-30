`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:	13:48:30 07/13/2017
// Design Name:
// Module Name:	reduce_instr
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//inside the router, packeter, and reduce_instruction core
/*
	*|63   	|62       	| 61-59  |58-56   |55-52  	|51-50   |49-46|45-43   |42-40|39-37|36-32|31-0   |
	*|valid bit|reduction bit|src node|dst node|packet type|alg type|index|commsize|root |rank |op   |payload|
 
inside the fifo
	*|66-64   |63   	|62       	| 61-59  |58-56   |55-52  	|51-50     	|49-46|45-43   |42-40|39-37|36-32|31-0   |
	*|children|valid bit|reduction bit|src node|dst node|packet type|algorithm type|index|commsize|root |rank |op   |payload|

//reduction table entry format
 
	*|72  |71       	|70-67 	|66-64         	|63   	|62       	| 61-59  |58-56   |55-52  	|51-50   |49-46|45-43   |42-40|39-37|36-32|31-0   |
	*|leaf|counting down|wait count|children remaining|valid bit|reduction bit|src node|dst node|packet type|alg type|index|commsize|root |rank |op   |payload|
//leaf bit is for if the operation's children count == 0, because then the input is also the output 
//extra bit/counting down is 1 if the wait count was ever set to the proper latency
/////////////////////////////////////////////////////////////////////////////////*/
/*
reduce_instr module makes the algorithmic decisions for the reduction.
it determines the number of children for each reduction and where to
send the final result
two algorithms are currently implemented: binomial tree and rabenseifner's algorithm, which performs a reduce-scatter followed by a gather
the two algorithms are currently configured to work on networks with up to 8 nodes.
*/
module reduce_instr(packetOut, packetIn, clk, rst);
input [63:0] packetIn;
input clk, rst;
output [66:0] packetOut;

parameter DataWidth = 64;
parameter ReductionTableWidth = 73;
parameter ReductionTableSize = 2;
parameter AdderLatency = 14;
parameter PayloadLen=32;
parameter opPos = 32;
parameter opWidth = 5;
parameter RankPos = 37;
parameter RankWidth = 3;
parameter RootPos = 40;
parameter RootWidth = 3;
parameter IndexPos=46;
parameter IndexWidth = 4;
parameter AlgtypePos=50;
parameter AlgtypeWidth=2;
parameter PacketTypePos = 52;
parameter PacketTypeWidth = 4;
parameter DstPos = 56;
parameter DstWidth = 3;
parameter SrcPos = 59;
parameter SrcWidth = 3;
parameter ReductionBitPos=62;
parameter ValidBitPos = 63;
parameter ChildrenPos=64;
parameter ChildrenWidth=3;
parameter WaitPos = 67;
parameter WaitWidth = 4;
parameter ExtraWaitPos=71;
parameter LeafBitPos=72;
parameter lg_numprocs = 3;
parameter numchildren = 1 << lg_numprocs;
wire [RankWidth-1:0]t_rank;
wire [IndexWidth-1:0]t_index;
reg [DstWidth-1:0]dst;
reg [RankWidth-1:0]Rank;
reg [ChildrenWidth-1:0]children;
reg ValidBit;
reg ReductionBit;
reg [SrcWidth-1:0]Src;
reg [PacketTypeWidth-1:0]PcktType;
reg [1:0] AlgType;
reg [IndexWidth-1:0]Index;
reg [2:0]Commsize;
reg [2:0]Root;
reg [opWidth-1:0]Op;
reg [PayloadLen-1:0]Payload;

//t_rank and t_index are temporary variables used for algorithmic calucations
assign t_rank = packetIn[RankPos+RankWidth-1:RankPos];
assign t_index = packetIn[IndexPos+IndexWidth-1:IndexPos];

always @(posedge clk)
begin
 
 /*
 if rst, set everything to 0
 */
 if (rst)
 begin
  children <= numchildren-1;
  dst <= 0;
  ValidBit<=0;
  ReductionBit<=0;
  Src<=0;
  PcktType<=0;
  AlgType<=0;
  Index<=0;
  Commsize<=0;
  Root<=0;
  Op<=0;
  Payload<=0;
  Rank<=0;
 end
 
 else begin
 
 /*
 op=0 corresponds to the binomial tree algorithm
 first step: 1->0 3->2 5->4 7->6
 second step: 2->0 6->4
 third step: 4->0
 
 if the root is not 0, then the result is still finalized at rank 0
 but then sent is the proper root
 */
 
 if (packetIn[AlgtypePos+AlgtypeWidth-1:AlgtypePos]==0) begin
 
 if (t_rank==0)
 begin
  children <= lg_numprocs;
  if (packetIn[RootPos+RootWidth-1:RootPos]!=0) begin
   dst <= packetIn[RootPos+RootWidth-1:RootPos];
  end
  else begin
  dst <= t_rank;
  end
 end
 
 else if (t_rank[0] == 1'b1)
 begin
  children <= 0;
  dst <= t_rank - 1;
 end
 
 else if (t_rank[1] == 1'b1)
 begin
  children <= 1;
  dst <= t_rank - 2;
 end
 
 else if (t_rank[2] == 1'b1)
 begin
  children <= 2;
  dst <= t_rank-4;
 end
 
 end
 
 
 /*
 the second algorithm is rabenseifner's algorithm, which performs a reduce-scatter following by a gather.
 In this algorithm, the reduction buffer is divided up so that all nodes can be doing work at all times,
 unlike the binomial tree algorithm.  this makes this algorithm optimal for long message reductions.
 The reduce buffer will be divided amongst the 8 nodes, and each node will be able to distinguish
 these separate parts of the reduction buffer based on the index value.  an index value of 2, for example,
 corresponds to C, the third part of the reduce buffer. 
 */
 
 else if (packetIn[AlgtypePos+AlgtypeWidth-1:AlgtypePos]==1) begin
 
  if (((t_rank[0]==0)&&(t_index[2]==1)) || ((t_rank[0]==1)&&(t_index[2]==0))) begin //if (rank is even and the index is E-H) or (rank is odd and index is A-D)
   children <= 0; 
   dst <= (t_rank[0]==0)? (t_rank+1):(t_rank-1);
  end
  
  else if (((t_rank[1]==0)&&(t_index[1]==1)) || ((t_rank[1]==1)&&(t_index[1]==0))) begin //if (rank is 0,4 and index is C,D) or (rank is 1,5 and index is G,H) or
                            //(rank is 2,6 and index is A,B) or (rank is 3,7 and index is E,F)
   children <= 1;
   dst <= (t_rank[1]==0)? (t_rank+2):(t_rank-2);
  end
  
  else begin
   if (t_rank[2]==0) begin //else if the rank 0-3
    if (t_index[0]==1) begin //if the (rank,index) is (0,B), (1,F), (2,D), (3,H)
     children <= 2;
     dst <= (t_rank[2]==0)? (t_rank+4):(t_rank-4);
    end
    else begin //else if the (rank,index) is (0,A), (1,E), (2,C), (3,G)
     children <= 3;
     dst <= t_rank;
    end
   end
   else begin //rank is 4-7
    if (t_index[0]==0) begin //if the (rank,index) is (4,A), (5,E), (6,C), (7,G)
     children <= 2;
     dst <= (t_rank[2]==0)? (t_rank+4):(t_rank-4);
     end
    else begin //else if the (rank,index) is (4,B), (5,F), (6,D), (7,H)
     children <= 3;
     dst <= t_rank;
    end
   end
  end
 end 
 
 
 
 /*
 after the children count and dst have been determined, set the
 registers to the input packet contents
 */
 
  ValidBit<=packetIn[ValidBitPos];
  ReductionBit<=packetIn[ReductionBitPos];
  Src<=packetIn[SrcPos+SrcWidth-1:SrcPos];
  PcktType<=packetIn[PacketTypePos+PacketTypeWidth-1:PacketTypePos];
  AlgType<=packetIn[51:50];
  Index<=packetIn[IndexPos+IndexWidth-1:IndexPos];
  Commsize<=packetIn[45:43];
  Root<=packetIn[42:40];
  Op<=packetIn[opPos+opWidth-1:opPos];
  Rank<=packetIn[39:37];
  Payload<=packetIn[PayloadLen-1:0];
end
end
//set the output packet contents to the register values
assign packetOut[DstPos+DstWidth-1:DstPos] = dst;
assign packetOut[RankPos+RankWidth-1:RankPos] = Rank;
assign packetOut[ValidBitPos] = ValidBit;
assign packetOut[ReductionBitPos] = ReductionBit;
assign packetOut[SrcPos+SrcWidth-1:SrcPos] = Src;
assign packetOut[PacketTypePos+PacketTypeWidth-1:PacketTypePos] = PcktType;
assign packetOut[51:50] = AlgType;
assign packetOut[IndexPos+IndexWidth-1:IndexPos] = Index;
assign packetOut[45:43] = Commsize;
assign packetOut[42:40] = Root;
assign packetOut[39:37] = Rank;
assign packetOut[opPos+opWidth-1:opPos] = Op;
assign packetOut[PayloadLen-1:0] = Payload;
assign packetOut[ChildrenPos+ChildrenWidth-1:ChildrenPos] = children;
endmodule

