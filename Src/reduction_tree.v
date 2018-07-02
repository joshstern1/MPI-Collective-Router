`timescale 1ns / 1ns

module reduction_tree#(
    parameter FAN_IN = 6	//PORT_NUM
)
(
    input clk,
    input rst,
    input [FLIT_SIZE * FAN_IN  - 1 : 0] in,
    input [FAN_IN - 1 : 0] in_valid,
    input out_avail,
    output reg [FAN_IN - 1 : 0] in_avail,
    output [FLIT_SIZE - 1 : 0] out,
    output out_valid
);

	 parameter FLIT_SIZE = 82;
	 parameter cur_x = 0;
	 parameter cur_y = 0;
	 parameter cur_z = 0;
	 parameter ROUTE_LEN = 3;
	 parameter input_Q_size = 5;
	 parameter credit_back_period = 100;
	 parameter credit_threshold = 160;
	 
	 parameter DIR_INJECT=3'd0;
	 parameter DIR_XPOS=3'd1;
	 parameter DIR_YPOS=3'd2;
	 parameter DIR_ZPOS=3'd3;
	 parameter DIR_XNEG=3'd4;
	 parameter DIR_YNEG=3'd5;
	 parameter DIR_ZNEG=3'd6;
	 parameter DIR_EJECT=3'd7;
	 
	 parameter PORT_NUM = 6;
	 parameter VC_NUM = 1;
	 
	 
	 assign out = in[FLIT_SIZE - 1 : 0];
	 assign out_valid = 1;
	 assign in_avail = 6'b000001;
	 
	 //need to pick between the 6 inputs

endmodule
