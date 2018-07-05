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
    output reg [FLIT_SIZE - 1 : 0] out,
    output reg out_valid
);

	 parameter FLIT_SIZE = 82;
	 parameter cur_x = 0;
	 parameter cur_y = 0;
	 parameter cur_z = 0;
	 parameter ROUTE_LEN = 3;
	 
	 wire [ROUTE_LEN - 1 : 0]selector = (in_valid[0])? 0 : (in_valid[1])? 1 : (in_valid[2])? 2 : (in_valid[3])? 3 : (in_valid[4])? 4 : 5;
	 
	 reg[ROUTE_LEN - 1 : 0]i;
	
	 
	 always@(posedge clk)begin
		if(rst) begin
			out <= 0;
			out_valid <= 0;
			in_avail <= 6'b111111;
		end
		else begin
			out <= (in_valid>0)? in[selector*FLIT_SIZE+: FLIT_SIZE] : 0;
			out_valid <= (in_valid>0)? in_valid[selector] : 0;
			for(i=0; i<FAN_IN; i=i+1)begin
				in_avail[i] <= (in_valid>0)? (selector == i) : 1'b1;
			end
		end
	 end
	 

endmodule
