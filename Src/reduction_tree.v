`timescale 1ns / 1ns

module reduction_tree#(
    parameter FAN_IN = 6	//PORT_NUM
)
(
    input clk,
    input rst,
    input [FLIT_SIZE * FAN_IN  - 1 : 0] in,
    input [FAN_IN - 1 : 0] in_valid,

    output reg [FAN_IN - 1 : 0] in_avail,
    output reg[FLIT_SIZE - 1 : 0] out,
    output reg out_valid
);

	 parameter FLIT_SIZE = 82;
	 parameter cur_x = 0;
	 parameter cur_y = 0;
	 parameter cur_z = 0;
	 parameter ROUTE_LEN = 3;

	 reg[FAN_IN - 1 : 0]i;
	 
	 reg [ROUTE_LEN - 1 : 0]selector;
	
	 assign out = in[selector*FLIT_SIZE - 1 + FLIT_SIZE : selector * FLIT_SIZE];
	 assign out_valid = in_valid[selector];
	 assign in_avail = selector;
	 
	 always@(posedge clk)begin
		if(rst) begin
			selector <= 0;
		end
		else begin
			selector <= (in_valid[0])? 0 : (in_valid[1])? 1 : (in_valid[2])? 2 : (in_valid[3])? 3 : (in_valid[4])? 4 : 5;
		end
	 end
	 

endmodule
