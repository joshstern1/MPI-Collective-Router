`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:39:35 07/06/2018
// Design Name:   node
// Module Name:   C:/Users/joshtern/MPI-Collective-Router/node_test1.v
// Project Name:  MPI-Collective-Router
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: node
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module node_test1;

	// Inputs
	reg clk;
	reg rst;
	reg [84:0] inject_xpos;
	reg [84:0] inject_ypos;
	reg [81:0] in_xpos_ser;
	reg [81:0] in_ypos_ser;
	reg [60:0] newcomm;

	// Outputs
	wire [81:0] out_xpos_ser;
	wire [81:0] out_ypos_ser;

	// Instantiate the Unit Under Test (UUT)
	node uut (
		.clk(clk), 
		.rst(rst), 
		.inject_xpos(inject_xpos),
		.inject_ypos(inject_ypos),
		.in_xpos_ser(in_xpos_ser), 
		.in_ypos_ser(in_ypos_ser), 
		.newcomm(newcomm),
		.out_xpos_ser(out_xpos_ser), 
		.out_ypos_ser(out_ypos_ser)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		inject_xpos = 0;
		inject_ypos = 0;
		in_xpos_ser = 0;
		in_ypos_ser = 0;
		newcomm = {1'b1, 8'b0, 9'b0, 9'b0, 3'b011, 4'b0011, 9'b01, 9'b10, 9'b100};

		// Wait 100 ns for global reset to finish
		#105;
      rst = 0;
		in_xpos_ser = 82'b1000000000000000000000000000000000000000000100110000000000000000000000000000000110;
		in_ypos_ser = 82'b1000000000000000000000000000000000000000010000100000000000000000000000000000000110;		
		#10;
		in_xpos_ser = 82'b1000000000000000000000000000000000000000000100110000000000000000000000000000000101;
		in_ypos_ser = 82'b1000000000000000000000000000000000000000010000100000000000000000000000000000000101;		
		#10;
		in_xpos_ser = 82'b1000000000000000000000000000000000000000000100110000000000000000000000000000000100;
		in_ypos_ser = 82'b1000000000000000000000000000000000000000010000100000000000000000000000000000000100;
		#10;
		in_xpos_ser = 82'b1000000000000000000000000000000000000000000100110000000000000000000000000000000011;	
		in_ypos_ser = 82'b1000000000000000000000000000000000000000010000100000000000000000000000000000000011;

	end
	
	always begin
		#5 clk = !clk;
	end
      
endmodule

