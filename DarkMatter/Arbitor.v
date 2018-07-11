`timescale 1ns / 1ns
// using find the right most 1 bit method to do round-robin

module Arbitor(
	input					clk,
	input 				rst_n,
	input             enable,
	input  [3:0]		input_mask,
	output [3:0]		output_mask,
	output reg [3:0]	board_sel
);

	
	
	reg [3:0] arbitor;
	
	
	wire [3:0] update_priority_list = (~arbitor) & input_mask;		// Remove the previous selected from the priority list
	
	// Assign output
	assign output_mask = arbitor;			

	
	always@(posedge clk)
		begin
		if(!rst_n) arbitor <= 4'd0;
		else if (enable) arbitor <= (~update_priority_list + 1'b1) & update_priority_list;
		else arbitor <= arbitor;
		end
	
	always@(*)
		begin
		if(!rst_n)
			board_sel <= 7;
		else
			begin
			case(arbitor)
				4'b0001: board_sel <= 0;
				4'b0010: board_sel <= 1;
				4'b0100: board_sel <= 2;
				4'b1000: board_sel <= 3;
				default: board_sel <= 7;		// means invalid
			endcase
			end
		end

endmodule
