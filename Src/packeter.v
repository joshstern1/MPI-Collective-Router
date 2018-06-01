`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Boston University Computer Architecture and Automated Design Lab
// Joshua Stern

/*
	*| 81  |80-78|77-75|74-72|71-69|68-66|65-63|62-54|  53-46  |45-38| 37-36 |35-32| 31-0  |     	
	*|valid|dst_z|dst_y|dst_x|src_z|src_y|src_x|rank |contextId| tag |algtype| op  |payload|
 
inside the fifo
	
	*| 84-82  | 81  |80-78|77-75|74-72|71-69|68-66|65-63|62-54|  53-46  |45-38| 37-36 |35-32| 31-0  |   	
	*|children|valid|dst_z|dst_y|dst_x|src_z|src_y|src_x|rank |contextId| tag |algtype| op  |payload|

//reduction table entry 
 
	*|   90  |     89     |  88-85  | 84-82  | 81  |80-78|77-75|74-72|71-69|68-66|65-63|62-54|  53-46  |45-38| 37-36 |35-32| 31-0  |      	
	*|LeafBit|ExtraWaitBit|waitcount|children|valid|dst_z|dst_y|dst_x|src_z|src_y|src_x|rank |contextId| tag |algtype| op  |payload|
	
//leaf bit is for if the operation's children count == 0, because then the input is also the output 
//extra bit/counting down is 1 if the wait count was ever set to the proper latency
/////////////////////////////////////////////////////////////////////////////////*/

module packeter(packeterOut, payload, op, algtype, tag, contextId, rank, src_x, src_y, src_z, dst_x, dst_y, dst_z, valid);

parameter cur_rank = 9'b0;
parameter root = 9'b0;
parameter rank_z = 3'b0;
parameter rank_y = 3'b0;
parameter rank_x = 3'b0;
parameter root_z = 3'b0;
parameter root_y = 3'b0;
parameter root_x = 3'b0;

parameter Comm_world_size = 8;

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


input [PayloadWidth-1:0]payload;
input [opWidth-1:0] op;
input [AlgTypeWidth-1:0] algtype;
input [TagWidth-1:0] tag;
input [ContextIdWidth-1:0] contextId;
input [DstWidth-1:0]rank;
input [Src_XWidth-1:0] src_x, src_y, src_z;
input [Dst_XWidth-1:0] dst_x, dst_y, dst_z;
input valid;
output [FlitWidth-1:0]packeterOut;


assign packeterOut[PayloadWidth-1:0] = payload;
assign packeterOut[opPos+opWidth-1:opPos] = op;
assign packeterOut[AlgTypePos+AlgTypeWidth-1:AlgTypePos] = algtype;
assign packeterOut[TagPos+TagWidth-1:TagPos] = tag;
assign packeterOut[ContextIdPos+ContextIdWidth-1:ContextIdPos] = contextId;
assign packeterOut[RankPos+RankWidth-1:RankPos] = rank;
assign packeterOut[Src_XPos+Src_XWidth-1:Src_XPos] = src_x;
assign packeterOut[Src_YPos+Src_YWidth-1:Src_YPos] = src_y;
assign packeterOut[Src_ZPos+Src_ZWidth-1:Src_ZPos] = src_z;
assign packeterOut[Dst_XPos+Dst_XWidth-1:Dst_XPos] = dst_x;
assign packeterOut[Dst_YPos+Dst_YWidth-1:Dst_YPos] = dst_y;
assign packeterOut[Dst_ZPos+Dst_ZWidth-1:Dst_ZPos] = dst_z;
assign packeterOut[ValidBitPos] = valid;


endmodule

