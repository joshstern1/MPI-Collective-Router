`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:	15:58:31 06/20/2017
// Design Name:
// Module Name:	packeter
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
module packeter(packeterOut, dataIn, op, commsize, rank, root, index, algtype, src, dst);
input [21:0]dataIn;
input [1:0]op;
input [2:0]commsize;
input [5:0]rank;
input [3:0]root;
input [7:0]index;
input algtype;
input [5:0]src;
input [5:0]dst;
output [63:0]packeterOut;
parameter DataWidth = 64;
parameter ReductionTableWidth = 73;
parameter ReductionTableSize = 12;
parameter AdderLatency = 14;
parameter PayloadLen=22;
parameter opPos = 22;
parameter opWidth = 2;
parameter RankPos = 24;
parameter RankWidth = 6;
parameter RootPos = 30;
parameter RootWidth = 4;
parameter IndexPos=37;
parameter IndexWidth = 8;
parameter PacketTypePos = 46;
parameter PacketTypeWidth = 4;
parameter DstPos = 50;
parameter DstWidth = 6;
parameter SrcPos = 56;
parameter SrcWidth = 6;
parameter ReductionBitPos=62;
parameter ValidBitPos = 63;
parameter ChildrenPos=64;
parameter ChildrenWidth=3;
parameter WaitPos = 67;
parameter WaitWidth = 4;
parameter ExtraWaitPos=71;
parameter LeafBitPos=72;



/*
this module just takes all of the inputs and packets them together.
it will not be used for the final design and implementation, but
is useful for simulation and analysis/testing.
*/
assign packeterOut[PayloadLen-1:0] = dataIn;
assign packeterOut[opPos+opWidth-1:opPos] = op;
assign packeterOut[RankPos + RankWidth -1:RankPos] = dst; //current rank is equal to the destination
assign packeterOut[RootPos + RootWidth -1:RootPos] = root;
assign packeterOut[36:34] = commsize;
assign packeterOut[IndexPos + IndexWidth -1:IndexPos] = index;
assign packeterOut[45] = algtype;
assign packeterOut[PacketTypePos + PacketTypeWidth -1:PacketTypePos] = 4'b1001; //packet type
assign packeterOut[DstPos + DstWidth -1:DstPos] = dst;
assign packeterOut[SrcPos + SrcWidth -1:SrcPos] = src;
assign packeterOut[62] = (dataIn>0)? 1:0; //reductiontype
assign packeterOut[63] = (dataIn>0)? 1:0; //valid


endmodule



