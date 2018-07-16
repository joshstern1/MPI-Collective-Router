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
	reg [84:0] in_ypos_inject_0_0_0;
	reg [84:0] in_zpos_inject_0_0_0;
	reg [84:0] in_xneg_inject_0_0_0;
	reg [84:0] in_yneg_inject_0_0_0;
	reg [84:0] in_zneg_inject_0_0_0;
	reg [84:0] reduce_me_0_0_0;
	reg [60:0] newcomm_0_0_0;
	
	reg [84:0] in_xpos_inject_0_0_1;
	reg [84:0] in_ypos_inject_0_0_1;
	reg [84:0] in_zpos_inject_0_0_1;
	reg [84:0] in_xneg_inject_0_0_1;
	reg [84:0] in_yneg_inject_0_0_1;
	reg [84:0] in_zneg_inject_0_0_1;
	reg [84:0] reduce_me_0_0_1;
	reg [60:0] newcomm_0_0_1;
	
	reg [84:0] in_xpos_inject_0_1_0;
	reg [84:0] in_ypos_inject_0_1_0;
	reg [84:0] in_zpos_inject_0_1_0;
	reg [84:0] in_xneg_inject_0_1_0;
	reg [84:0] in_yneg_inject_0_1_0;
	reg [84:0] in_zneg_inject_0_1_0;
	reg [84:0] reduce_me_0_1_0;
	reg [60:0] newcomm_0_1_0;
	
	reg [84:0] in_xpos_inject_0_1_1;
	reg [84:0] in_ypos_inject_0_1_1;
	reg [84:0] in_zpos_inject_0_1_1;
	reg [84:0] in_xneg_inject_0_1_1;
	reg [84:0] in_yneg_inject_0_1_1;
	reg [84:0] in_zneg_inject_0_1_1;
	reg [84:0] reduce_me_0_1_1;
	reg [60:0] newcomm_0_1_1;
	
	reg [84:0] in_xpos_inject_1_0_0;
	reg [84:0] in_ypos_inject_1_0_0;
	reg [84:0] in_zpos_inject_1_0_0;
	reg [84:0] in_xneg_inject_1_0_0;
	reg [84:0] in_yneg_inject_1_0_0;
	reg [84:0] in_zneg_inject_1_0_0;
	reg [84:0] reduce_me_1_0_0;
	reg [60:0] newcomm_1_0_0;

	reg [84:0] in_xpos_inject_1_0_1;
	reg [84:0] in_ypos_inject_1_0_1;
	reg [84:0] in_zpos_inject_1_0_1;
	reg [84:0] in_xneg_inject_1_0_1;
	reg [84:0] in_yneg_inject_1_0_1;
	reg [84:0] in_zneg_inject_1_0_1;
	reg [84:0] reduce_me_1_0_1;
	reg [60:0] newcomm_1_0_1;
	
	reg [84:0] in_xpos_inject_1_1_0;
	reg [84:0] in_ypos_inject_1_1_0;
	reg [84:0] in_zpos_inject_1_1_0;
	reg [84:0] in_xneg_inject_1_1_0;
	reg [84:0] in_yneg_inject_1_1_0;
	reg [84:0] in_zneg_inject_1_1_0;
	reg [84:0] reduce_me_1_1_0;
	reg [60:0] newcomm_1_1_0;
	
	reg [84:0] in_xpos_inject_1_1_1;
	reg [84:0] in_ypos_inject_1_1_1;
	reg [84:0] in_zpos_inject_1_1_1;
	reg [84:0] in_xneg_inject_1_1_1;
	reg [84:0] in_yneg_inject_1_1_1;
	reg [84:0] in_zneg_inject_1_1_1;
	reg [84:0] reduce_me_1_1_1;
	reg [60:0] newcomm_1_1_1;

	// Outputs
	wire valid;
	
	localparam Scan = 4'b0011;
	localparam AlltoAll = 4'b0100;
	localparam LargeBcast = 4'b0101;
	localparam MediumBcast = 4'b0110;
	localparam ShortBcast = 4'b0111;
	localparam Scatter = 4'b1000;
	localparam LargeAllGather = 4'b1001;
	localparam ShortAllGather = 4'b1010;
	localparam Gather = 4'b1011;
	localparam ShortReduce = 4'b1100;
	localparam LargeReduce = 4'b1101;
	localparam ShortAllReduce = 4'b1110;
	localparam LargeAllReduce = 4'b1111;

	// Instantiate the Unit Under Test (UUT)
	network uut (
		.clk(clk), 
		.rst(rst), 
		
		.in_xpos_inject_0_0_0(in_xpos_inject_0_0_0), 
		.in_ypos_inject_0_0_0(in_ypos_inject_0_0_0), 
		.in_zpos_inject_0_0_0(in_zpos_inject_0_0_0), 
		.in_xneg_inject_0_0_0(in_xneg_inject_0_0_0), 
		.in_yneg_inject_0_0_0(in_yneg_inject_0_0_0), 
		.in_zneg_inject_0_0_0(in_zneg_inject_0_0_0), 
		.reduce_me_0_0_0(reduce_me_0_0_0),
		.newcomm_0_0_0(newcomm_0_0_0), 
		
		.in_xpos_inject_0_0_1(in_xpos_inject_0_0_1), 
		.in_ypos_inject_0_0_1(in_ypos_inject_0_0_1), 
		.in_zpos_inject_0_0_1(in_zpos_inject_0_0_1), 
		.in_xneg_inject_0_0_1(in_xneg_inject_0_0_1), 
		.in_yneg_inject_0_0_1(in_yneg_inject_0_0_1), 
		.in_zneg_inject_0_0_1(in_zneg_inject_0_0_1), 
		.reduce_me_0_0_1(reduce_me_0_0_1),
		.newcomm_0_0_1(newcomm_0_0_1), 
		
		.in_xpos_inject_0_1_0(in_xpos_inject_0_1_0), 
		.in_ypos_inject_0_1_0(in_ypos_inject_0_1_0), 
		.in_zpos_inject_0_1_0(in_zpos_inject_0_1_0), 
		.in_xneg_inject_0_1_0(in_xneg_inject_0_1_0), 
		.in_yneg_inject_0_1_0(in_yneg_inject_0_1_0), 
		.in_zneg_inject_0_1_0(in_zneg_inject_0_1_0), 
		.reduce_me_0_1_0(reduce_me_0_1_0),
		.newcomm_0_1_0(newcomm_0_1_0), 
		
		.in_xpos_inject_0_1_1(in_xpos_inject_0_1_1), 
		.in_ypos_inject_0_1_1(in_ypos_inject_0_1_1), 
		.in_zpos_inject_0_1_1(in_zpos_inject_0_1_1), 
		.in_xneg_inject_0_1_1(in_xneg_inject_0_1_1), 
		.in_yneg_inject_0_1_1(in_yneg_inject_0_1_1), 
		.in_zneg_inject_0_1_1(in_zneg_inject_0_1_1), 
		.reduce_me_0_1_1(reduce_me_0_1_1),
		.newcomm_0_1_1(newcomm_0_1_1), 
		
		.in_xpos_inject_1_0_0(in_xpos_inject_1_0_0), 
		.in_ypos_inject_1_0_0(in_ypos_inject_1_0_0), 
		.in_zpos_inject_1_0_0(in_zpos_inject_1_0_0), 
		.in_xneg_inject_1_0_0(in_xneg_inject_1_0_0), 
		.in_yneg_inject_1_0_0(in_yneg_inject_1_0_0), 
		.in_zneg_inject_1_0_0(in_zneg_inject_1_0_0), 
		.reduce_me_1_0_0(reduce_me_1_0_0),
		.newcomm_1_0_0(newcomm_1_0_0), 
				
		.in_xpos_inject_1_0_1(in_xpos_inject_1_0_1), 
		.in_ypos_inject_1_0_1(in_ypos_inject_1_0_1), 
		.in_zpos_inject_1_0_1(in_zpos_inject_1_0_1), 
		.in_xneg_inject_1_0_1(in_xneg_inject_1_0_1), 
		.in_yneg_inject_1_0_1(in_yneg_inject_1_0_1), 
		.in_zneg_inject_1_0_1(in_zneg_inject_1_0_1), 
		.reduce_me_1_0_1(reduce_me_1_0_1),
		.newcomm_1_0_1(newcomm_1_0_1), 
		
		.in_xpos_inject_1_1_0(in_xpos_inject_1_1_0), 
		.in_ypos_inject_1_1_0(in_ypos_inject_1_1_0), 
		.in_zpos_inject_1_1_0(in_zpos_inject_1_1_0), 
		.in_xneg_inject_1_1_0(in_xneg_inject_1_1_0), 
		.in_yneg_inject_1_1_0(in_yneg_inject_1_1_0), 
		.in_zneg_inject_1_1_0(in_zneg_inject_1_1_0), 
		.reduce_me_1_1_0(reduce_me_1_1_0),
		.newcomm_1_1_0(newcomm_1_1_0),
		
		.in_xpos_inject_1_1_1(in_xpos_inject_1_1_1), 
		.in_ypos_inject_1_1_1(in_ypos_inject_1_1_1), 
		.in_zpos_inject_1_1_1(in_zpos_inject_1_1_1), 
		.in_xneg_inject_1_1_1(in_xneg_inject_1_1_1), 
		.in_yneg_inject_1_1_1(in_yneg_inject_1_1_1), 
		.in_zneg_inject_1_1_1(in_zneg_inject_1_1_1), 
		.reduce_me_1_1_1(reduce_me_1_1_1),
		.newcomm_1_1_1(newcomm_1_1_1),
		
		.valid(valid)
	);

	reg [7:0]i;

	initial begin
		// Initialize Inputs 
		clk = 0;
		rst = 1;
		in_xpos_inject_0_0_0 = 0;
		in_ypos_inject_0_0_0 = 0;
		in_zpos_inject_0_0_0 = 0;
		in_xneg_inject_0_0_0 = 0;
		in_yneg_inject_0_0_0 = 0;
		in_zneg_inject_0_0_0 = 0;
		reduce_me_0_0_0 = 0;
		newcomm_0_0_0 = {1'b1, 8'b0, 9'b0, 9'b0, 3'b011, 4'b0011, 9'b01, 9'b10, 9'b100};
		
	//|	60  |  59-52  |51-43|  42-34   | 33-31  |   30-27   |26-18| 17-9 | 8-0 |     	
	//|valid|contextid|root |local_rank|children|lg_commsize|third|second|first|
		
		in_xpos_inject_0_0_1 = 0;
		in_ypos_inject_0_0_1 = 0;
		in_zpos_inject_0_0_1 = 0;
		in_xneg_inject_0_0_1 = 0;
		in_yneg_inject_0_0_1 = 0;
		in_zneg_inject_0_0_1 = 0;
		reduce_me_0_0_1 = 0;
		newcomm_0_0_1 = {1'b1, 8'b0, 9'b0, 9'b011, 3'b0, 4'b0011, 9'b0, 9'b011, 9'b101};
		
		in_xpos_inject_0_1_0 = 0;
		in_ypos_inject_0_1_0 = 0;
		in_zpos_inject_0_1_0 = 0;
		in_xneg_inject_0_1_0 = 0;
		in_yneg_inject_0_1_0 = 0;
		in_zneg_inject_0_1_0 = 0;
		reduce_me_0_1_0 = 0;
		newcomm_0_1_0 = {1'b1, 8'b0, 9'b0, 9'b010, 3'b0, 4'b0011, 9'b011, 9'b000, 9'b110};
		
		in_xpos_inject_0_1_1 = 0;
		in_ypos_inject_0_1_1 = 0;
		in_zpos_inject_0_1_1 = 0;
		in_xneg_inject_0_1_1 = 0;
		in_yneg_inject_0_1_1 = 0;
		in_zneg_inject_0_1_1 = 0;
		reduce_me_0_1_1 = 0;
		newcomm_0_1_1 = 0;
		
		in_xpos_inject_1_0_0 = 0;
		in_ypos_inject_1_0_0 = 0;
		in_zpos_inject_1_0_0 = 0;
		in_xneg_inject_1_0_0 = 0;
		in_yneg_inject_1_0_0 = 0;
		in_zneg_inject_1_0_0 = 0;
		reduce_me_1_0_0 = 0;
		newcomm_1_0_0 = {1'b1, 8'b0, 9'b0, 9'b001, 3'b0, 4'b0011, 9'b101, 9'b110, 9'b0};
		
		in_xpos_inject_1_0_1 = 0;
		in_ypos_inject_1_0_1 = 0;
		in_zpos_inject_1_0_1 = 0;
		in_xneg_inject_1_0_1 = 0;
		in_yneg_inject_1_0_1 = 0;
		in_zneg_inject_1_0_1 = 0;
		reduce_me_1_0_1 = 0;
		newcomm_1_0_1 = 0;
		
		in_xpos_inject_1_1_0 = 0;
		in_ypos_inject_1_1_0 = 0;
		in_zpos_inject_1_1_0 = 0;
		in_xneg_inject_1_1_0 = 0;
		in_yneg_inject_1_1_0 = 0;
		in_zneg_inject_1_1_0 = 0;
		reduce_me_1_1_0 = 0;
		newcomm_1_1_0 = 0;
		
		in_xpos_inject_1_1_1 = 0;
		in_ypos_inject_1_1_1 = 0;
		in_zpos_inject_1_1_1 = 0;
		in_xneg_inject_1_1_1 = 0;
		in_yneg_inject_1_1_1 = 0;
		in_zneg_inject_1_1_1 = 0;
		reduce_me_1_1_1 = 0;
		newcomm_1_1_1 = 0;

		//85'b000 1 000000000 001000000 000000001 00000000 00000001 00 1100 00000000000000000000000000000110;

		// Wait 100 ns for global reset to finish
		#105;
		rst = 0;
		for(i=1;i<2;i=i+1)begin
			reduce_me_0_0_0 = {39'b011100000000000000000000000000000000000, i, 2'b00, ShortReduce, 32'b00000000000000000000000000000110};
			in_xneg_inject_0_0_1 = {39'b000100000000000000000100000000100000000, i, 2'b00, ShortReduce, 32'b00000000000000000000000000000110};
			in_yneg_inject_0_1_0 = {39'b000100000000000000100000000001000000000, i, 2'b00, ShortReduce, 32'b00000000000000000000000000000110};
			in_zneg_inject_1_0_0 = {39'b000100000000000100000000000010000000000, i, 2'b00, ShortReduce, 32'b00000000000000000000000000000110};
			#10;
		end
	
		
		reduce_me_0_0_0 = 85'b0;
		in_xneg_inject_0_0_1 = 85'b0;
		in_yneg_inject_0_1_0 = 85'b0;
		in_zneg_inject_1_0_0 = 85'b0;

	end
	
	always begin
		#5 clk = !clk;
	end
      
endmodule

