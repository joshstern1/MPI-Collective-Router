`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:42:58 07/03/2018
// Design Name:   router
// Module Name:   C:/Users/joshtern/MPI-Collective-Router/router_test2.v
// Project Name:  MPI-Collective-Router
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: router
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module router_test2;

	// Inputs
	reg clk;
	reg rst;
	reg [81:0] in_xpos;
	reg in_xpos_valid;
	reg [81:0] inject_xpos;
	reg inject_xpos_valid;

	// Outputs
	wire [81:0] out_xpos;
	wire out_xpos_valid;
	wire [81:0] eject_xpos;
	wire eject_xpos_valid;

	// Instantiate the Unit Under Test (UUT)
	router uut (
		.clk(clk), 
		.rst(rst), 
		.in_xpos(in_xpos), 
		.in_xpos_valid(in_xpos_valid), 
		.out_xpos(out_xpos), 
		.out_xpos_valid(out_xpos_valid), 
		.eject_xpos(eject_xpos), 
		.eject_xpos_valid(eject_xpos_valid), 
		.inject_xpos(inject_xpos), 
		.inject_xpos_valid(inject_xpos_valid)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		in_xpos = 0;
		in_xpos_valid = 0;
		inject_xpos = 0;
		inject_xpos_valid = 0;

		// Wait 100 ns for global reset to finish

		#100;
      rst = 0;
		in_xpos_valid = 1;
		in_xpos = 82'b1000000000000000000000000000000000000000000100100000000000000000000000000000000110;	
		#10;
		in_xpos = 82'b1000000000000000000000000000000000000000000100100000000000000000000000000000000101;	
		#10;
		in_xpos = 82'b1000000000000000000000000000000000000000000100100000000000000000000000000000000100;
		#10;
		in_xpos = 82'b1000000000000000000000000000000000000000000100100000000000000000000000000000000011;	
		// Add stimulus here

	end
	
		always begin
	#5 clk = !clk;
	end
      
endmodule

