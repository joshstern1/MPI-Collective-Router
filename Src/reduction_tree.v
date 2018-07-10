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

    output [FAN_IN - 1 : 0] in_avail,
    output [FlitChildWidth-1:0] out,
    output  out_valid
);

	 localparam num_procs = 1 << lg_numprocs;

	 localparam FlitWidth = ValidBitPos + 1;
	 localparam ChildrenWidth=lg_numprocs;	 
	 localparam FlitChildWidth = FlitWidth+ChildrenWidth;

	 localparam ROUTE_LEN = 3;
	 
	 wire [ROUTE_LEN - 1 : 0]selector = (in_valid[0])? 0 : (in_valid[1])? 1 : (in_valid[2])? 2 : (in_valid[3])? 3 : (in_valid[4])? 4 : 5;
	 
	 //reg[ROUTE_LEN - 1 : 0]i;
	
	 assign in_avail[0] = (in_valid>0)? (selector == 0) : 1'b1;
	 assign in_avail[1] = (in_valid>0)? (selector == 1) : 1'b1;
	 assign in_avail[2] = (in_valid>0)? (selector == 2) : 1'b1;
	 assign in_avail[3] = (in_valid>0)? (selector == 3) : 1'b1;
	 assign in_avail[4] = (in_valid>0)? (selector == 4) : 1'b1;
	 assign in_avail[5] = (in_valid>0)? (selector == 5) : 1'b1;
	 
	 assign out_valid = ((in_valid>0) && (!rst))? in_valid[selector] : 1'b0;
	 assign out = ((in_valid>0) && (!rst))? in[selector*FlitChildWidth+: FlitChildWidth] : 0;
	 
	 /*always@(posedge clk)begin
		if(rst) begin
			out <= 0;
			out_valid <= 0;
			//in_avail <= 6'b111111;
		end
		else begin
			out <= (in_valid>0)? in[selector*FLIT_SIZE+: FLIT_SIZE] : 0;
			out_valid <= (in_valid>0)? in_valid[selector] : 0;
			for(i=0; i<FAN_IN; i=i+1)begin
				in_avail[i] <= (in[31:0]==5)? 0 : (in_valid>0)? (selector == i) : 1'b1;
			end
		end
	 end*/
	 

endmodule
