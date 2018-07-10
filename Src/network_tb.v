`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:23:52 07/09/2018
// Design Name:   network
// Module Name:   C:/Users/joshtern/MPI-Collective-Router/network_tb.v
// Project Name:  MPI-Collective-Router
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: network
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module network_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [84:0] in_xpos_inject_0_0_0;
	reg [60:0] newcomm_0_0_0;
	reg [84:0] in_xpos_inject_0_0_1;
	reg [60:0] newcomm_0_0_1;

	// Outputs
	wire valid;

	// Instantiate the Unit Under Test (UUT)
	network uut (
		.clk(clk), 
		.rst(rst), 
		.in_xpos_inject_0_0_0(in_xpos_inject_0_0_0), 
		.newcomm_0_0_0(newcomm_0_0_0), 
		.in_xpos_inject_0_0_1(in_xpos_inject_0_0_1), 
		.newcomm_0_0_1(newcomm_0_0_1), 
		.valid(valid)
	);

	initial begin
		// Initialize Inputs 
		clk = 0;
		rst = 1;
		in_xpos_inject_0_0_0 = 0;
		newcomm_0_0_0 = {1'b1, 8'b0, 9'b0, 9'b0, 3'b011, 4'b0011, 9'b01, 9'b10, 9'b100};
		in_xpos_inject_0_0_1 = 0;
		newcomm_0_0_1 = {1'b1, 8'b0, 9'b0, 9'b001, 3'b0, 4'b0011, 9'b0, 9'b011, 9'b101};

		// Wait 100 ns for global reset to finish
		#105;
		rst = 0;
		in_xpos_inject_0_0_1 = 85'b0001000000000001000000000000001000000000000000100110000000000000000000000000000000110;
		#40;
		in_xpos_inject_0_0_1 = 85'b0;
        
		// Add stimulus here

	end
	
	always begin
		#5 clk = !clk;
	end
      
endmodule

 
