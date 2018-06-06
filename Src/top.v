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
wire [fifo_lg_size:0]fifo_counter;
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
wire [fifo_lg_size:0] fifo_counter2;
wire rd_en2;

instr_fifo F1 (
 .clk(clk),
 .rst(rst),
 .buf_in(packeterOut),
 .buf_out(first_fifo_out),
 .wr_en(1'b1),
 .rd_en(rd_en2),
 .buf_empty(buf_empty2),
 .buf_full(buf_full2),
 .fifo_counter(fifo_counter2)
);
 
reduce_instr R1 (
 .packetOut(instr_out),
 .packetIn(first_fifo_out),
 .clk(clk),
 .rst(rst),
 .rd_en(rd_en2)
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

