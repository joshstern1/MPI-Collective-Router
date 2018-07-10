`timescale 1ns / 1ns

module reduction_tree#(
    parameter FAN_IN = 6,	//PORT_NUM
	 parameter ValidBitPos = 81,
	 parameter lg_numprocs = 3
)
(
    input clk,
    input rst,
    input [FlitChildWidth * FAN_IN  - 1 : 0] in,
    input [FAN_IN - 1 : 0] in_valid,

    output [FlitChildWidth-1:0] out,
    output  out_valid,
	 output [ROUTE_LEN - 1 : 0] selector
);

	 localparam num_procs = 1 << lg_numprocs;

	 localparam FlitWidth = ValidBitPos + 1;
	 localparam ChildrenWidth=lg_numprocs;	 
	 localparam FlitChildWidth = FlitWidth+ChildrenWidth;

	 localparam ROUTE_LEN = 3;
	 
	 assign selector = (in_valid[0])? 0 : (in_valid[1])? 1 : (in_valid[2])? 2 : (in_valid[3])? 3 : (in_valid[4])? 4 : 5;
	 
	 assign out_valid = ((in_valid>0) && (!rst))? in_valid[selector] : 1'b0;
	 assign out = ((in_valid>0) && (!rst))? in[selector*FlitChildWidth+: FlitChildWidth] : 0;

endmodule
