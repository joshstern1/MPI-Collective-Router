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

module top(Outpacket, done, valid_out, clk, rst, valid_in, dst_z, dst_y, dst_x, src_z, src_y, src_x, rank, contextId, tag, algtype, op, payload);

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

parameter ReductionTableWidth = 91;
parameter ReductionTableSize = 6;
parameter AdderLatency = 14;

parameter ReductionBitPos=35;

parameter ChildrenPos=82;
parameter ChildrenWidth=3;
parameter WaitPos = 85;
parameter WaitWidth = 4;
parameter ExtraWaitPos=89;
parameter LeafBitPos=90;

input clk;
input rst;
input [PayloadWidth-1:0]payload;
input [opWidth-1:0] op;
input [AlgTypeWidth-1:0] algtype;
input [TagWidth-1:0] tag;
input [ContextIdWidth-1:0] contextId;
input [DstWidth-1:0] rank;
input [Src_XWidth-1:0] src_x, src_y, src_z;
input [Dst_XWidth-1:0] dst_x, dst_y, dst_z;
input valid_in;
output valid_out;
output done;
output[FlitWidth-1:0]Outpacket;


//packeter
wire [FlitWidth-1:0]packeterOut;

//instr
wire [FlitWidth+ChildrenWidth-1:0]instr_out;

//fifo
wire [12:0]fifo_counter;
wire buf_empty;
wire buf_full;
wire rd_en;
wire wr_en;


//reduction unit
wire [FlitWidth+ChildrenWidth-1:0]packetA;


packeter P1 (
 .packeterOut(packeterOut),
 .payload(payload),
 .op(op),
 .algtype(algtype),
 .tag(tag),
 .contextId(contextId),
 .rank(rank),
 .src_x(src_x),
 .src_y(src_y),
 .src_z(src_z),
 .dst_x(dst_x),
 .dst_y(dst_y),
 .dst_z(dst_z),
 .valid(valid_in)
);
 
wire [FlitWidth-1:0]first_fifo_out;
wire buf_empty2, buf_full2;
wire [12:0] fifo_counter2;

instr_fifo F1 (
 .clk(clk),
 .rst(rst),
 .buf_in(packeterOut),
 .buf_out(first_fifo_out),
 .wr_en(1'b1),
 .rd_en(1'b1),
 .buf_empty(buf_empty2),
 .buf_full(buf_full2),
 .fifo_counter(fifo_counter2)
);
 
reduce_instr R1 (
 .packetOut(instr_out),
 .packetIn(packeterOut),
 .clk(clk),
 .rst(rst)
);


fifo F2 (
 .clk(clk),
 .rst(rst),
 .buf_in(instr_out),
 .buf_out(packetA),
 .wr_en(wr_en),
 .rd_en(rd_en),
 .buf_empty(buf_empty),
 .buf_full(buf_full),
 .fifo_counter(fifo_counter)
);


reduce_unit RE1 (
 .Outpacket(Outpacket),
 .done(done),
 .valid_out(valid_out),
 .clk(clk),
 .rst(rst),
 .packetA(packetA),
 .rd_en(rd_en),
 .wr_en(wr_en),
 .fifo_counter(fifo_counter),
 .buf_empty(buf_empty),
 .buf_full(buf_full)
);


endmodule

