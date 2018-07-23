`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:49:55 07/19/2018
// Design Name:   network_32
// Module Name:   C:/Users/joshtern/MPI-Collective-Router/network_32_tb.v
// Project Name:  MPI-Collective-Router
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: network_32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module network_32_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [86:0] in_xpos_inject_0_0_0;
	reg [86:0] in_ypos_inject_0_0_0;
	reg [86:0] in_zpos_inject_0_0_0;
	reg [86:0] in_xneg_inject_0_0_0;
	reg [86:0] in_yneg_inject_0_0_0;
	reg [86:0] in_zneg_inject_0_0_0;
	reg [86:0] reduce_me_0_0_0;
	reg [82:0] newcomm_0_0_0;
	reg [86:0] in_xpos_inject_0_0_1;
	reg [86:0] in_ypos_inject_0_0_1;
	reg [86:0] in_zpos_inject_0_0_1;
	reg [86:0] in_xneg_inject_0_0_1;
	reg [86:0] in_yneg_inject_0_0_1;
	reg [86:0] in_zneg_inject_0_0_1;
	reg [86:0] reduce_me_0_0_1;
	reg [82:0] newcomm_0_0_1;
	reg [86:0] in_xpos_inject_0_1_0;
	reg [86:0] in_ypos_inject_0_1_0;
	reg [86:0] in_zpos_inject_0_1_0;
	reg [86:0] in_xneg_inject_0_1_0;
	reg [86:0] in_yneg_inject_0_1_0;
	reg [86:0] in_zneg_inject_0_1_0;
	reg [86:0] reduce_me_0_1_0;
	reg [82:0] newcomm_0_1_0;
	reg [86:0] in_xpos_inject_0_1_1;
	reg [86:0] in_ypos_inject_0_1_1;
	reg [86:0] in_zpos_inject_0_1_1;
	reg [86:0] in_xneg_inject_0_1_1;
	reg [86:0] in_yneg_inject_0_1_1;
	reg [86:0] in_zneg_inject_0_1_1;
	reg [86:0] reduce_me_0_1_1;
	reg [82:0] newcomm_0_1_1;
	reg [86:0] in_xpos_inject_1_0_0;
	reg [86:0] in_ypos_inject_1_0_0;
	reg [86:0] in_zpos_inject_1_0_0;
	reg [86:0] in_xneg_inject_1_0_0;
	reg [86:0] in_yneg_inject_1_0_0;
	reg [86:0] in_zneg_inject_1_0_0;
	reg [86:0] reduce_me_1_0_0;
	reg [82:0] newcomm_1_0_0;
	reg [86:0] in_xpos_inject_1_0_1;
	reg [86:0] in_ypos_inject_1_0_1;
	reg [86:0] in_zpos_inject_1_0_1;
	reg [86:0] in_xneg_inject_1_0_1;
	reg [86:0] in_yneg_inject_1_0_1;
	reg [86:0] in_zneg_inject_1_0_1;
	reg [86:0] reduce_me_1_0_1;
	reg [82:0] newcomm_1_0_1;
	reg [86:0] in_xpos_inject_1_1_0;
	reg [86:0] in_ypos_inject_1_1_0;
	reg [86:0] in_zpos_inject_1_1_0;
	reg [86:0] in_xneg_inject_1_1_0;
	reg [86:0] in_yneg_inject_1_1_0;
	reg [86:0] in_zneg_inject_1_1_0;
	reg [86:0] reduce_me_1_1_0;
	reg [82:0] newcomm_1_1_0;
	reg [86:0] in_xpos_inject_1_1_1;
	reg [86:0] in_ypos_inject_1_1_1;
	reg [86:0] in_zpos_inject_1_1_1;
	reg [86:0] in_xneg_inject_1_1_1;
	reg [86:0] in_yneg_inject_1_1_1;
	reg [86:0] in_zneg_inject_1_1_1;
	reg [86:0] reduce_me_1_1_1;
	reg [82:0] newcomm_1_1_1;
	reg [86:0] in_xpos_inject_0_0_3;
	reg [86:0] in_ypos_inject_0_0_3;
	reg [86:0] in_zpos_inject_0_0_3;
	reg [86:0] in_xneg_inject_0_0_3;
	reg [86:0] in_yneg_inject_0_0_3;
	reg [86:0] in_zneg_inject_0_0_3;
	reg [86:0] reduce_me_0_0_3;
	reg [82:0] newcomm_0_0_3;
	reg [86:0] in_xpos_inject_0_0_2;
	reg [86:0] in_ypos_inject_0_0_2;
	reg [86:0] in_zpos_inject_0_0_2;
	reg [86:0] in_xneg_inject_0_0_2;
	reg [86:0] in_yneg_inject_0_0_2;
	reg [86:0] in_zneg_inject_0_0_2;
	reg [86:0] reduce_me_0_0_2;
	reg [82:0] newcomm_0_0_2;
	reg [86:0] in_xpos_inject_0_1_3;
	reg [86:0] in_ypos_inject_0_1_3;
	reg [86:0] in_zpos_inject_0_1_3;
	reg [86:0] in_xneg_inject_0_1_3;
	reg [86:0] in_yneg_inject_0_1_3;
	reg [86:0] in_zneg_inject_0_1_3;
	reg [86:0] reduce_me_0_1_3;
	reg [82:0] newcomm_0_1_3;
	reg [86:0] in_xpos_inject_0_1_2;
	reg [86:0] in_ypos_inject_0_1_2;
	reg [86:0] in_zpos_inject_0_1_2;
	reg [86:0] in_xneg_inject_0_1_2;
	reg [86:0] in_yneg_inject_0_1_2;
	reg [86:0] in_zneg_inject_0_1_2;
	reg [86:0] reduce_me_0_1_2;
	reg [82:0] newcomm_0_1_2;
	reg [86:0] in_xpos_inject_1_0_3;
	reg [86:0] in_ypos_inject_1_0_3;
	reg [86:0] in_zpos_inject_1_0_3;
	reg [86:0] in_xneg_inject_1_0_3;
	reg [86:0] in_yneg_inject_1_0_3;
	reg [86:0] in_zneg_inject_1_0_3;
	reg [86:0] reduce_me_1_0_3;
	reg [82:0] newcomm_1_0_3;
	reg [86:0] in_xpos_inject_1_0_2;
	reg [86:0] in_ypos_inject_1_0_2;
	reg [86:0] in_zpos_inject_1_0_2;
	reg [86:0] in_xneg_inject_1_0_2;
	reg [86:0] in_yneg_inject_1_0_2;
	reg [86:0] in_zneg_inject_1_0_2;
	reg [86:0] reduce_me_1_0_2;
	reg [82:0] newcomm_1_0_2;
	reg [86:0] in_xpos_inject_1_1_3;
	reg [86:0] in_ypos_inject_1_1_3;
	reg [86:0] in_zpos_inject_1_1_3;
	reg [86:0] in_xneg_inject_1_1_3;
	reg [86:0] in_yneg_inject_1_1_3;
	reg [86:0] in_zneg_inject_1_1_3;
	reg [86:0] reduce_me_1_1_3;
	reg [82:0] newcomm_1_1_3;
	reg [86:0] in_xpos_inject_1_1_2;
	reg [86:0] in_ypos_inject_1_1_2;
	reg [86:0] in_zpos_inject_1_1_2;
	reg [86:0] in_xneg_inject_1_1_2;
	reg [86:0] in_yneg_inject_1_1_2;
	reg [86:0] in_zneg_inject_1_1_2;
	reg [86:0] reduce_me_1_1_2;
	reg [82:0] newcomm_1_1_2;
	reg [86:0] in_xpos_inject_0_3_0;
	reg [86:0] in_ypos_inject_0_3_0;
	reg [86:0] in_zpos_inject_0_3_0;
	reg [86:0] in_xneg_inject_0_3_0;
	reg [86:0] in_yneg_inject_0_3_0;
	reg [86:0] in_zneg_inject_0_3_0;
	reg [86:0] reduce_me_0_3_0;
	reg [82:0] newcomm_0_3_0;
	reg [86:0] in_xpos_inject_0_3_1;
	reg [86:0] in_ypos_inject_0_3_1;
	reg [86:0] in_zpos_inject_0_3_1;
	reg [86:0] in_xneg_inject_0_3_1;
	reg [86:0] in_yneg_inject_0_3_1;
	reg [86:0] in_zneg_inject_0_3_1;
	reg [86:0] reduce_me_0_3_1;
	reg [82:0] newcomm_0_3_1;
	reg [86:0] in_xpos_inject_0_2_0;
	reg [86:0] in_ypos_inject_0_2_0;
	reg [86:0] in_zpos_inject_0_2_0;
	reg [86:0] in_xneg_inject_0_2_0;
	reg [86:0] in_yneg_inject_0_2_0;
	reg [86:0] in_zneg_inject_0_2_0;
	reg [86:0] reduce_me_0_2_0;
	reg [82:0] newcomm_0_2_0;
	reg [86:0] in_xpos_inject_0_2_1;
	reg [86:0] in_ypos_inject_0_2_1;
	reg [86:0] in_zpos_inject_0_2_1;
	reg [86:0] in_xneg_inject_0_2_1;
	reg [86:0] in_yneg_inject_0_2_1;
	reg [86:0] in_zneg_inject_0_2_1;
	reg [86:0] reduce_me_0_2_1;
	reg [82:0] newcomm_0_2_1;
	reg [86:0] in_xpos_inject_1_3_0;
	reg [86:0] in_ypos_inject_1_3_0;
	reg [86:0] in_zpos_inject_1_3_0;
	reg [86:0] in_xneg_inject_1_3_0;
	reg [86:0] in_yneg_inject_1_3_0;
	reg [86:0] in_zneg_inject_1_3_0;
	reg [86:0] reduce_me_1_3_0;
	reg [82:0] newcomm_1_3_0;
	reg [86:0] in_xpos_inject_1_3_1;
	reg [86:0] in_ypos_inject_1_3_1;
	reg [86:0] in_zpos_inject_1_3_1;
	reg [86:0] in_xneg_inject_1_3_1;
	reg [86:0] in_yneg_inject_1_3_1;
	reg [86:0] in_zneg_inject_1_3_1;
	reg [86:0] reduce_me_1_3_1;
	reg [82:0] newcomm_1_3_1;
	reg [86:0] in_xpos_inject_1_2_0;
	reg [86:0] in_ypos_inject_1_2_0;
	reg [86:0] in_zpos_inject_1_2_0;
	reg [86:0] in_xneg_inject_1_2_0;
	reg [86:0] in_yneg_inject_1_2_0;
	reg [86:0] in_zneg_inject_1_2_0;
	reg [86:0] reduce_me_1_2_0;
	reg [82:0] newcomm_1_2_0;
	reg [86:0] in_xpos_inject_1_2_1;
	reg [86:0] in_ypos_inject_1_2_1;
	reg [86:0] in_zpos_inject_1_2_1;
	reg [86:0] in_xneg_inject_1_2_1;
	reg [86:0] in_yneg_inject_1_2_1;
	reg [86:0] in_zneg_inject_1_2_1;
	reg [86:0] reduce_me_1_2_1;
	reg [82:0] newcomm_1_2_1;
	reg [86:0] in_xpos_inject_0_3_3;
	reg [86:0] in_ypos_inject_0_3_3;
	reg [86:0] in_zpos_inject_0_3_3;
	reg [86:0] in_xneg_inject_0_3_3;
	reg [86:0] in_yneg_inject_0_3_3;
	reg [86:0] in_zneg_inject_0_3_3;
	reg [86:0] reduce_me_0_3_3;
	reg [82:0] newcomm_0_3_3;
	reg [86:0] in_xpos_inject_0_3_2;
	reg [86:0] in_ypos_inject_0_3_2;
	reg [86:0] in_zpos_inject_0_3_2;
	reg [86:0] in_xneg_inject_0_3_2;
	reg [86:0] in_yneg_inject_0_3_2;
	reg [86:0] in_zneg_inject_0_3_2;
	reg [86:0] reduce_me_0_3_2;
	reg [82:0] newcomm_0_3_2;
	reg [86:0] in_xpos_inject_0_2_3;
	reg [86:0] in_ypos_inject_0_2_3;
	reg [86:0] in_zpos_inject_0_2_3;
	reg [86:0] in_xneg_inject_0_2_3;
	reg [86:0] in_yneg_inject_0_2_3;
	reg [86:0] in_zneg_inject_0_2_3;
	reg [86:0] reduce_me_0_2_3;
	reg [82:0] newcomm_0_2_3;
	reg [86:0] in_xpos_inject_0_2_2;
	reg [86:0] in_ypos_inject_0_2_2;
	reg [86:0] in_zpos_inject_0_2_2;
	reg [86:0] in_xneg_inject_0_2_2;
	reg [86:0] in_yneg_inject_0_2_2;
	reg [86:0] in_zneg_inject_0_2_2;
	reg [86:0] reduce_me_0_2_2;
	reg [82:0] newcomm_0_2_2;
	reg [86:0] in_xpos_inject_1_3_3;
	reg [86:0] in_ypos_inject_1_3_3;
	reg [86:0] in_zpos_inject_1_3_3;
	reg [86:0] in_xneg_inject_1_3_3;
	reg [86:0] in_yneg_inject_1_3_3;
	reg [86:0] in_zneg_inject_1_3_3;
	reg [86:0] reduce_me_1_3_3;
	reg [82:0] newcomm_1_3_3;
	reg [86:0] in_xpos_inject_1_3_2;
	reg [86:0] in_ypos_inject_1_3_2;
	reg [86:0] in_zpos_inject_1_3_2;
	reg [86:0] in_xneg_inject_1_3_2;
	reg [86:0] in_yneg_inject_1_3_2;
	reg [86:0] in_zneg_inject_1_3_2;
	reg [86:0] reduce_me_1_3_2;
	reg [82:0] newcomm_1_3_2;
	reg [86:0] in_xpos_inject_1_2_3;
	reg [86:0] in_ypos_inject_1_2_3;
	reg [86:0] in_zpos_inject_1_2_3;
	reg [86:0] in_xneg_inject_1_2_3;
	reg [86:0] in_yneg_inject_1_2_3;
	reg [86:0] in_zneg_inject_1_2_3;
	reg [86:0] reduce_me_1_2_3;
	reg [82:0] newcomm_1_2_3;
	reg [86:0] in_xpos_inject_1_2_2;
	reg [86:0] in_ypos_inject_1_2_2;
	reg [86:0] in_zpos_inject_1_2_2;
	reg [86:0] in_xneg_inject_1_2_2;
	reg [86:0] in_yneg_inject_1_2_2;
	reg [86:0] in_zneg_inject_1_2_2;
	reg [86:0] reduce_me_1_2_2;
	reg [82:0] newcomm_1_2_2;

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
	
	localparam ZERO = {3'b0, 3'b0, 3'b0};
	localparam ONE = {3'b0, 3'b0, 3'b01};
	localparam TWO = {3'b0, 3'b01, 3'b0};
	localparam THREE = {3'b0, 3'b1, 3'b1};	 
	localparam FOUR = {3'b1, 3'b0, 3'b0};
	localparam FIVE = {3'b01, 3'b0, 3'b01};
	localparam SIX = {3'b01, 3'b01, 3'b0};
	localparam SEVEN = {3'b01, 3'b01, 3'b01};	 
	localparam EIGHT = {3'b0, 3'b0, 3'b011};
	localparam NINE = {3'b0, 3'b0, 3'b010};
	localparam TEN = {3'b0, 3'b01, 3'b011};
	localparam ELEVEN = {3'b0, 3'b1, 3'b010};	 
	localparam TWELVE = {3'b1, 3'b0, 3'b011};
	localparam THIRTEEN = {3'b01, 3'b0, 3'b010};
	localparam FOURTEEN = {3'b01, 3'b01, 3'b011};
	localparam FIFTEEN = {3'b01, 3'b01, 3'b010};	 
	localparam SIXTEEN = {3'b0, 3'b011, 3'b0};
	localparam SEVENTEEN = {3'b0, 3'b011, 3'b01};
	localparam EIGHTEEN = {3'b0, 3'b010, 3'b0};
	localparam NINETEEN = {3'b0, 3'b10, 3'b1};
	localparam TWENTY = {3'b01, 3'b011, 3'b0};
	localparam TWENTYONE = {3'b01, 3'b011, 3'b01};
	localparam TWENTYTWO = {3'b01, 3'b010, 3'b0};
	localparam TWENTYTHREE = {3'b01, 3'b010, 3'b01};	 
	localparam TWENTYFOUR = {3'b0, 3'b011, 3'b011};
	localparam TWENTYFIVE = {3'b0, 3'b011, 3'b010};
	localparam TWENTYSIX = {3'b0, 3'b010, 3'b011};
	localparam TWENTYSEVEN = {3'b0, 3'b10, 3'b010};	 
	localparam TWENTYEIGHT = {3'b1, 3'b011, 3'b011};
	localparam TWENTYNINE = {3'b01, 3'b011, 3'b010};
	localparam THIRTY = {3'b01, 3'b010, 3'b011};
	localparam THIRTYONE = {3'b01, 3'b010, 3'b010};
	 


	// Instantiate the Unit Under Test (UUT)
	network_32 uut (
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
		.in_xpos_inject_0_0_3(in_xpos_inject_0_0_3), 
		.in_ypos_inject_0_0_3(in_ypos_inject_0_0_3), 
		.in_zpos_inject_0_0_3(in_zpos_inject_0_0_3), 
		.in_xneg_inject_0_0_3(in_xneg_inject_0_0_3), 
		.in_yneg_inject_0_0_3(in_yneg_inject_0_0_3), 
		.in_zneg_inject_0_0_3(in_zneg_inject_0_0_3), 
		.reduce_me_0_0_3(reduce_me_0_0_3), 
		.newcomm_0_0_3(newcomm_0_0_3), 
		.in_xpos_inject_0_0_2(in_xpos_inject_0_0_2), 
		.in_ypos_inject_0_0_2(in_ypos_inject_0_0_2), 
		.in_zpos_inject_0_0_2(in_zpos_inject_0_0_2), 
		.in_xneg_inject_0_0_2(in_xneg_inject_0_0_2), 
		.in_yneg_inject_0_0_2(in_yneg_inject_0_0_2), 
		.in_zneg_inject_0_0_2(in_zneg_inject_0_0_2), 
		.reduce_me_0_0_2(reduce_me_0_0_2), 
		.newcomm_0_0_2(newcomm_0_0_2), 
		.in_xpos_inject_0_1_3(in_xpos_inject_0_1_3), 
		.in_ypos_inject_0_1_3(in_ypos_inject_0_1_3), 
		.in_zpos_inject_0_1_3(in_zpos_inject_0_1_3), 
		.in_xneg_inject_0_1_3(in_xneg_inject_0_1_3), 
		.in_yneg_inject_0_1_3(in_yneg_inject_0_1_3), 
		.in_zneg_inject_0_1_3(in_zneg_inject_0_1_3), 
		.reduce_me_0_1_3(reduce_me_0_1_3), 
		.newcomm_0_1_3(newcomm_0_1_3), 
		.in_xpos_inject_0_1_2(in_xpos_inject_0_1_2), 
		.in_ypos_inject_0_1_2(in_ypos_inject_0_1_2), 
		.in_zpos_inject_0_1_2(in_zpos_inject_0_1_2), 
		.in_xneg_inject_0_1_2(in_xneg_inject_0_1_2), 
		.in_yneg_inject_0_1_2(in_yneg_inject_0_1_2), 
		.in_zneg_inject_0_1_2(in_zneg_inject_0_1_2), 
		.reduce_me_0_1_2(reduce_me_0_1_2), 
		.newcomm_0_1_2(newcomm_0_1_2), 
		.in_xpos_inject_1_0_3(in_xpos_inject_1_0_3), 
		.in_ypos_inject_1_0_3(in_ypos_inject_1_0_3), 
		.in_zpos_inject_1_0_3(in_zpos_inject_1_0_3), 
		.in_xneg_inject_1_0_3(in_xneg_inject_1_0_3), 
		.in_yneg_inject_1_0_3(in_yneg_inject_1_0_3), 
		.in_zneg_inject_1_0_3(in_zneg_inject_1_0_3), 
		.reduce_me_1_0_3(reduce_me_1_0_3), 
		.newcomm_1_0_3(newcomm_1_0_3), 
		.in_xpos_inject_1_0_2(in_xpos_inject_1_0_2), 
		.in_ypos_inject_1_0_2(in_ypos_inject_1_0_2), 
		.in_zpos_inject_1_0_2(in_zpos_inject_1_0_2), 
		.in_xneg_inject_1_0_2(in_xneg_inject_1_0_2), 
		.in_yneg_inject_1_0_2(in_yneg_inject_1_0_2), 
		.in_zneg_inject_1_0_2(in_zneg_inject_1_0_2), 
		.reduce_me_1_0_2(reduce_me_1_0_2), 
		.newcomm_1_0_2(newcomm_1_0_2), 
		.in_xpos_inject_1_1_3(in_xpos_inject_1_1_3), 
		.in_ypos_inject_1_1_3(in_ypos_inject_1_1_3), 
		.in_zpos_inject_1_1_3(in_zpos_inject_1_1_3), 
		.in_xneg_inject_1_1_3(in_xneg_inject_1_1_3), 
		.in_yneg_inject_1_1_3(in_yneg_inject_1_1_3), 
		.in_zneg_inject_1_1_3(in_zneg_inject_1_1_3), 
		.reduce_me_1_1_3(reduce_me_1_1_3), 
		.newcomm_1_1_3(newcomm_1_1_3), 
		.in_xpos_inject_1_1_2(in_xpos_inject_1_1_2), 
		.in_ypos_inject_1_1_2(in_ypos_inject_1_1_2), 
		.in_zpos_inject_1_1_2(in_zpos_inject_1_1_2), 
		.in_xneg_inject_1_1_2(in_xneg_inject_1_1_2), 
		.in_yneg_inject_1_1_2(in_yneg_inject_1_1_2), 
		.in_zneg_inject_1_1_2(in_zneg_inject_1_1_2), 
		.reduce_me_1_1_2(reduce_me_1_1_2), 
		.newcomm_1_1_2(newcomm_1_1_2), 
		.in_xpos_inject_0_3_0(in_xpos_inject_0_3_0), 
		.in_ypos_inject_0_3_0(in_ypos_inject_0_3_0), 
		.in_zpos_inject_0_3_0(in_zpos_inject_0_3_0), 
		.in_xneg_inject_0_3_0(in_xneg_inject_0_3_0), 
		.in_yneg_inject_0_3_0(in_yneg_inject_0_3_0), 
		.in_zneg_inject_0_3_0(in_zneg_inject_0_3_0), 
		.reduce_me_0_3_0(reduce_me_0_3_0), 
		.newcomm_0_3_0(newcomm_0_3_0), 
		.in_xpos_inject_0_3_1(in_xpos_inject_0_3_1), 
		.in_ypos_inject_0_3_1(in_ypos_inject_0_3_1), 
		.in_zpos_inject_0_3_1(in_zpos_inject_0_3_1), 
		.in_xneg_inject_0_3_1(in_xneg_inject_0_3_1), 
		.in_yneg_inject_0_3_1(in_yneg_inject_0_3_1), 
		.in_zneg_inject_0_3_1(in_zneg_inject_0_3_1), 
		.reduce_me_0_3_1(reduce_me_0_3_1), 
		.newcomm_0_3_1(newcomm_0_3_1), 
		.in_xpos_inject_0_2_0(in_xpos_inject_0_2_0), 
		.in_ypos_inject_0_2_0(in_ypos_inject_0_2_0), 
		.in_zpos_inject_0_2_0(in_zpos_inject_0_2_0), 
		.in_xneg_inject_0_2_0(in_xneg_inject_0_2_0), 
		.in_yneg_inject_0_2_0(in_yneg_inject_0_2_0), 
		.in_zneg_inject_0_2_0(in_zneg_inject_0_2_0), 
		.reduce_me_0_2_0(reduce_me_0_2_0), 
		.newcomm_0_2_0(newcomm_0_2_0), 
		.in_xpos_inject_0_2_1(in_xpos_inject_0_2_1), 
		.in_ypos_inject_0_2_1(in_ypos_inject_0_2_1), 
		.in_zpos_inject_0_2_1(in_zpos_inject_0_2_1), 
		.in_xneg_inject_0_2_1(in_xneg_inject_0_2_1), 
		.in_yneg_inject_0_2_1(in_yneg_inject_0_2_1), 
		.in_zneg_inject_0_2_1(in_zneg_inject_0_2_1), 
		.reduce_me_0_2_1(reduce_me_0_2_1), 
		.newcomm_0_2_1(newcomm_0_2_1), 
		.in_xpos_inject_1_3_0(in_xpos_inject_1_3_0), 
		.in_ypos_inject_1_3_0(in_ypos_inject_1_3_0), 
		.in_zpos_inject_1_3_0(in_zpos_inject_1_3_0), 
		.in_xneg_inject_1_3_0(in_xneg_inject_1_3_0), 
		.in_yneg_inject_1_3_0(in_yneg_inject_1_3_0), 
		.in_zneg_inject_1_3_0(in_zneg_inject_1_3_0), 
		.reduce_me_1_3_0(reduce_me_1_3_0), 
		.newcomm_1_3_0(newcomm_1_3_0), 
		.in_xpos_inject_1_3_1(in_xpos_inject_1_3_1), 
		.in_ypos_inject_1_3_1(in_ypos_inject_1_3_1), 
		.in_zpos_inject_1_3_1(in_zpos_inject_1_3_1), 
		.in_xneg_inject_1_3_1(in_xneg_inject_1_3_1), 
		.in_yneg_inject_1_3_1(in_yneg_inject_1_3_1), 
		.in_zneg_inject_1_3_1(in_zneg_inject_1_3_1), 
		.reduce_me_1_3_1(reduce_me_1_3_1), 
		.newcomm_1_3_1(newcomm_1_3_1), 
		.in_xpos_inject_1_2_0(in_xpos_inject_1_2_0), 
		.in_ypos_inject_1_2_0(in_ypos_inject_1_2_0), 
		.in_zpos_inject_1_2_0(in_zpos_inject_1_2_0), 
		.in_xneg_inject_1_2_0(in_xneg_inject_1_2_0), 
		.in_yneg_inject_1_2_0(in_yneg_inject_1_2_0), 
		.in_zneg_inject_1_2_0(in_zneg_inject_1_2_0), 
		.reduce_me_1_2_0(reduce_me_1_2_0), 
		.newcomm_1_2_0(newcomm_1_2_0), 
		.in_xpos_inject_1_2_1(in_xpos_inject_1_2_1), 
		.in_ypos_inject_1_2_1(in_ypos_inject_1_2_1), 
		.in_zpos_inject_1_2_1(in_zpos_inject_1_2_1), 
		.in_xneg_inject_1_2_1(in_xneg_inject_1_2_1), 
		.in_yneg_inject_1_2_1(in_yneg_inject_1_2_1), 
		.in_zneg_inject_1_2_1(in_zneg_inject_1_2_1), 
		.reduce_me_1_2_1(reduce_me_1_2_1), 
		.newcomm_1_2_1(newcomm_1_2_1), 
		.in_xpos_inject_0_3_3(in_xpos_inject_0_3_3), 
		.in_ypos_inject_0_3_3(in_ypos_inject_0_3_3), 
		.in_zpos_inject_0_3_3(in_zpos_inject_0_3_3), 
		.in_xneg_inject_0_3_3(in_xneg_inject_0_3_3), 
		.in_yneg_inject_0_3_3(in_yneg_inject_0_3_3), 
		.in_zneg_inject_0_3_3(in_zneg_inject_0_3_3), 
		.reduce_me_0_3_3(reduce_me_0_3_3), 
		.newcomm_0_3_3(newcomm_0_3_3), 
		.in_xpos_inject_0_3_2(in_xpos_inject_0_3_2), 
		.in_ypos_inject_0_3_2(in_ypos_inject_0_3_2), 
		.in_zpos_inject_0_3_2(in_zpos_inject_0_3_2), 
		.in_xneg_inject_0_3_2(in_xneg_inject_0_3_2), 
		.in_yneg_inject_0_3_2(in_yneg_inject_0_3_2), 
		.in_zneg_inject_0_3_2(in_zneg_inject_0_3_2), 
		.reduce_me_0_3_2(reduce_me_0_3_2), 
		.newcomm_0_3_2(newcomm_0_3_2), 
		.in_xpos_inject_0_2_3(in_xpos_inject_0_2_3), 
		.in_ypos_inject_0_2_3(in_ypos_inject_0_2_3), 
		.in_zpos_inject_0_2_3(in_zpos_inject_0_2_3), 
		.in_xneg_inject_0_2_3(in_xneg_inject_0_2_3), 
		.in_yneg_inject_0_2_3(in_yneg_inject_0_2_3), 
		.in_zneg_inject_0_2_3(in_zneg_inject_0_2_3), 
		.reduce_me_0_2_3(reduce_me_0_2_3), 
		.newcomm_0_2_3(newcomm_0_2_3), 
		.in_xpos_inject_0_2_2(in_xpos_inject_0_2_2), 
		.in_ypos_inject_0_2_2(in_ypos_inject_0_2_2), 
		.in_zpos_inject_0_2_2(in_zpos_inject_0_2_2), 
		.in_xneg_inject_0_2_2(in_xneg_inject_0_2_2), 
		.in_yneg_inject_0_2_2(in_yneg_inject_0_2_2), 
		.in_zneg_inject_0_2_2(in_zneg_inject_0_2_2), 
		.reduce_me_0_2_2(reduce_me_0_2_2), 
		.newcomm_0_2_2(newcomm_0_2_2), 
		.in_xpos_inject_1_3_3(in_xpos_inject_1_3_3), 
		.in_ypos_inject_1_3_3(in_ypos_inject_1_3_3), 
		.in_zpos_inject_1_3_3(in_zpos_inject_1_3_3), 
		.in_xneg_inject_1_3_3(in_xneg_inject_1_3_3), 
		.in_yneg_inject_1_3_3(in_yneg_inject_1_3_3), 
		.in_zneg_inject_1_3_3(in_zneg_inject_1_3_3), 
		.reduce_me_1_3_3(reduce_me_1_3_3), 
		.newcomm_1_3_3(newcomm_1_3_3), 
		.in_xpos_inject_1_3_2(in_xpos_inject_1_3_2), 
		.in_ypos_inject_1_3_2(in_ypos_inject_1_3_2), 
		.in_zpos_inject_1_3_2(in_zpos_inject_1_3_2), 
		.in_xneg_inject_1_3_2(in_xneg_inject_1_3_2), 
		.in_yneg_inject_1_3_2(in_yneg_inject_1_3_2), 
		.in_zneg_inject_1_3_2(in_zneg_inject_1_3_2), 
		.reduce_me_1_3_2(reduce_me_1_3_2), 
		.newcomm_1_3_2(newcomm_1_3_2), 
		.in_xpos_inject_1_2_3(in_xpos_inject_1_2_3), 
		.in_ypos_inject_1_2_3(in_ypos_inject_1_2_3), 
		.in_zpos_inject_1_2_3(in_zpos_inject_1_2_3), 
		.in_xneg_inject_1_2_3(in_xneg_inject_1_2_3), 
		.in_yneg_inject_1_2_3(in_yneg_inject_1_2_3), 
		.in_zneg_inject_1_2_3(in_zneg_inject_1_2_3), 
		.reduce_me_1_2_3(reduce_me_1_2_3), 
		.newcomm_1_2_3(newcomm_1_2_3), 
		.in_xpos_inject_1_2_2(in_xpos_inject_1_2_2), 
		.in_ypos_inject_1_2_2(in_ypos_inject_1_2_2), 
		.in_zpos_inject_1_2_2(in_zpos_inject_1_2_2), 
		.in_xneg_inject_1_2_2(in_xneg_inject_1_2_2), 
		.in_yneg_inject_1_2_2(in_yneg_inject_1_2_2), 
		.in_zneg_inject_1_2_2(in_zneg_inject_1_2_2), 
		.reduce_me_1_2_2(reduce_me_1_2_2), 
		.newcomm_1_2_2(newcomm_1_2_2), 
		.valid(valid)
	);

	reg [7:0]i;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		
	//|	60  |  59-52  |51-43|  42-34   | 33-31  |   30-27   |26-18| 17-9 | 8-0 |     	
	//|valid|contextid|root |local_rank|children|lg_commsize|third|second|first|
	
		in_xpos_inject_0_0_0 = 0;
		in_ypos_inject_0_0_0 = 0;
		in_zpos_inject_0_0_0 = 0;
		in_xneg_inject_0_0_0 = 0;
		in_yneg_inject_0_0_0 = 0;
		in_zneg_inject_0_0_0 = 0;
		reduce_me_0_0_0 = 0;
		newcomm_0_0_0 = {1'b1, 8'd0, 9'd0, 9'd0, 5'd5, 6'd5, 9'd1, 9'd2, 9'd4, 9'd8, 9'd16};
		
		in_xpos_inject_0_0_1 = 0;
		in_ypos_inject_0_0_1 = 0;
		in_zpos_inject_0_0_1 = 0;
		in_xneg_inject_0_0_1 = 0;
		in_yneg_inject_0_0_1 = 0;
		in_zneg_inject_0_0_1 = 0;
		reduce_me_0_0_1 = 0;
		newcomm_0_0_1 = {1'b1, 8'd0, 9'd0, 9'd1, 5'd0, 6'd5, 9'd0, 9'd3, 9'd5, 9'd9, 9'd17};
		
		in_xpos_inject_0_1_0 = 0;
		in_ypos_inject_0_1_0 = 0;
		in_zpos_inject_0_1_0 = 0;
		in_xneg_inject_0_1_0 = 0;
		in_yneg_inject_0_1_0 = 0;
		in_zneg_inject_0_1_0 = 0;
		reduce_me_0_1_0 = 0;
		newcomm_0_1_0 = {1'b1, 8'd0, 9'd0, 9'd2, 5'd1, 6'd5, 9'd3, 9'd0, 9'd6, 9'd10, 9'd18};
		
		in_xpos_inject_0_1_1 = 0;
		in_ypos_inject_0_1_1 = 0;
		in_zpos_inject_0_1_1 = 0;
		in_xneg_inject_0_1_1 = 0;
		in_yneg_inject_0_1_1 = 0;
		in_zneg_inject_0_1_1 = 0;
		reduce_me_0_1_1 = 0;
		newcomm_0_1_1 = {1'b1, 8'd0, 9'd0, 9'd3, 5'd0, 6'd5, 9'd2, 9'd1, 9'd7, 9'd11, 9'd19};
		
		in_xpos_inject_1_0_0 = 0;
		in_ypos_inject_1_0_0 = 0;
		in_zpos_inject_1_0_0 = 0;
		in_xneg_inject_1_0_0 = 0;
		in_yneg_inject_1_0_0 = 0;
		in_zneg_inject_1_0_0 = 0;
		reduce_me_1_0_0 = 0;
		newcomm_1_0_0 = {1'b1, 8'd0, 9'd0, 9'd4, 5'd2, 6'd5, 9'd5, 9'd6, 9'd0, 9'd12, 9'd20};
		
		in_xpos_inject_1_0_1 = 0;
		in_ypos_inject_1_0_1 = 0;
		in_zpos_inject_1_0_1 = 0;
		in_xneg_inject_1_0_1 = 0;
		in_yneg_inject_1_0_1 = 0;
		in_zneg_inject_1_0_1 = 0;
		reduce_me_1_0_1 = 0;
		newcomm_1_0_1 = {1'b1, 8'd0, 9'd0, 9'd5, 5'd0, 6'd5, 9'd4, 9'd7, 9'd1, 9'd13, 9'd21};
		
		in_xpos_inject_1_1_0 = 0;
		in_ypos_inject_1_1_0 = 0;
		in_zpos_inject_1_1_0 = 0;
		in_xneg_inject_1_1_0 = 0;
		in_yneg_inject_1_1_0 = 0;
		in_zneg_inject_1_1_0 = 0;
		reduce_me_1_1_0 = 0;
		newcomm_1_1_0 = {1'b1, 8'd0, 9'd0, 9'd6, 5'd1, 6'd5, 9'd7, 9'd4, 9'd2, 9'd14, 9'd22};
		
		in_xpos_inject_1_1_1 = 0;
		in_ypos_inject_1_1_1 = 0;
		in_zpos_inject_1_1_1 = 0;
		in_xneg_inject_1_1_1 = 0;
		in_yneg_inject_1_1_1 = 0;
		in_zneg_inject_1_1_1 = 0;
		reduce_me_1_1_1 = 0;
		newcomm_1_1_1 = {1'b1, 8'd0, 9'd0, 9'd7, 5'd0, 6'd5, 9'd6, 9'd5, 9'd3, 9'd15, 9'd23};
		
		in_xpos_inject_0_0_3 = 0;
		in_ypos_inject_0_0_3 = 0;
		in_zpos_inject_0_0_3 = 0;
		in_xneg_inject_0_0_3 = 0;
		in_yneg_inject_0_0_3 = 0;
		in_zneg_inject_0_0_3 = 0;
		reduce_me_0_0_3 = 0;
		newcomm_0_0_3 = {1'b1, 8'd0, 9'd0, 9'd8, 5'd3, 6'd5, 9'd9, 9'd10, 9'd12, 9'd0, 9'd24};
		
		in_xpos_inject_0_0_2 = 0;
		in_ypos_inject_0_0_2 = 0;
		in_zpos_inject_0_0_2 = 0;
		in_xneg_inject_0_0_2 = 0;
		in_yneg_inject_0_0_2 = 0;
		in_zneg_inject_0_0_2 = 0;
		reduce_me_0_0_2 = 0;
		newcomm_0_0_2 = {1'b1, 8'd0, 9'd0, 9'd9, 5'd0, 6'd5, 9'd8, 9'd11, 9'd13, 9'd1, 9'd25};
		
		in_xpos_inject_0_1_3 = 0;
		in_ypos_inject_0_1_3 = 0;
		in_zpos_inject_0_1_3 = 0;
		in_xneg_inject_0_1_3 = 0;
		in_yneg_inject_0_1_3 = 0;
		in_zneg_inject_0_1_3 = 0;
		reduce_me_0_1_3 = 0;
		newcomm_0_1_3 = {1'b1, 8'd0, 9'd0, 9'd10, 5'd1, 6'd5, 9'd11, 9'd8, 9'd14, 9'd2, 9'd26};
		
		in_xpos_inject_0_1_2 = 0;
		in_ypos_inject_0_1_2 = 0;
		in_zpos_inject_0_1_2 = 0;
		in_xneg_inject_0_1_2 = 0;
		in_yneg_inject_0_1_2 = 0;
		in_zneg_inject_0_1_2 = 0;
		reduce_me_0_1_2 = 0;
		newcomm_0_1_2 = {1'b1, 8'd0, 9'd0, 9'd11, 5'd0, 6'd5, 9'd10, 9'd9, 9'd15, 9'd3, 9'd27};
		
		in_xpos_inject_1_0_3 = 0;
		in_ypos_inject_1_0_3 = 0;
		in_zpos_inject_1_0_3 = 0;
		in_xneg_inject_1_0_3 = 0;
		in_yneg_inject_1_0_3 = 0;
		in_zneg_inject_1_0_3 = 0;
		reduce_me_1_0_3 = 0;
		newcomm_1_0_3 = {1'b1, 8'd0, 9'd0, 9'd12, 5'd2, 6'd5, 9'd13, 9'd14, 9'd8, 9'd4, 9'd28};
		
		in_xpos_inject_1_0_2 = 0;
		in_ypos_inject_1_0_2 = 0;
		in_zpos_inject_1_0_2 = 0;
		in_xneg_inject_1_0_2 = 0;
		in_yneg_inject_1_0_2 = 0;
		in_zneg_inject_1_0_2 = 0;
		reduce_me_1_0_2 = 0;
		newcomm_1_0_2 = {1'b1, 8'd0, 9'd0, 9'd13, 5'd0, 6'd5, 9'd12, 9'd15, 9'd9, 9'd5, 9'd29};
		
		in_xpos_inject_1_1_3 = 0;
		in_ypos_inject_1_1_3 = 0;
		in_zpos_inject_1_1_3 = 0;
		in_xneg_inject_1_1_3 = 0;
		in_yneg_inject_1_1_3 = 0;
		in_zneg_inject_1_1_3 = 0;
		reduce_me_1_1_3 = 0;
		newcomm_1_1_3 = {1'b1, 8'd0, 9'd0, 9'd14, 5'd1, 6'd5, 9'd15, 9'd12, 9'd10, 9'd6, 9'd30};
		
		in_xpos_inject_1_1_2 = 0;
		in_ypos_inject_1_1_2 = 0;
		in_zpos_inject_1_1_2 = 0;
		in_xneg_inject_1_1_2 = 0;
		in_yneg_inject_1_1_2 = 0;
		in_zneg_inject_1_1_2 = 0;
		reduce_me_1_1_2 = 0;
		newcomm_1_1_2 = {1'b1, 8'd0, 9'd0, 9'd15, 5'd0, 6'd5, 9'd14, 9'd13, 9'd11, 9'd7, 9'd31};
		
		in_xpos_inject_0_3_0 = 0;
		in_ypos_inject_0_3_0 = 0;
		in_zpos_inject_0_3_0 = 0;
		in_xneg_inject_0_3_0 = 0;
		in_yneg_inject_0_3_0 = 0;
		in_zneg_inject_0_3_0 = 0;
		reduce_me_0_3_0 = 0;
		newcomm_0_3_0 = {1'b1, 8'd0, 9'd0, 9'd16, 5'd4, 6'd5, 9'd17, 9'd18, 9'd20, 9'd24, 9'd0};
		
		in_xpos_inject_0_3_1 = 0;
		in_ypos_inject_0_3_1 = 0;
		in_zpos_inject_0_3_1 = 0;
		in_xneg_inject_0_3_1 = 0;
		in_yneg_inject_0_3_1 = 0;
		in_zneg_inject_0_3_1 = 0;
		reduce_me_0_3_1 = 0;
		newcomm_0_3_1 = {1'b1, 8'd0, 9'd0, 9'd17, 5'd0, 6'd5, 9'd16, 9'd19, 9'd21, 9'd25, 9'd1};
		
		in_xpos_inject_0_2_0 = 0;
		in_ypos_inject_0_2_0 = 0;
		in_zpos_inject_0_2_0 = 0;
		in_xneg_inject_0_2_0 = 0;
		in_yneg_inject_0_2_0 = 0;
		in_zneg_inject_0_2_0 = 0;
		reduce_me_0_2_0 = 0;
		newcomm_0_2_0 = {1'b1, 8'd0, 9'd0, 9'd18, 5'd1, 6'd5, 9'd19, 9'd16, 9'd22, 9'd26, 9'd2};
		
		in_xpos_inject_0_2_1 = 0;
		in_ypos_inject_0_2_1 = 0;
		in_zpos_inject_0_2_1 = 0;
		in_xneg_inject_0_2_1 = 0;
		in_yneg_inject_0_2_1 = 0;
		in_zneg_inject_0_2_1 = 0;
		reduce_me_0_2_1 = 0;
		newcomm_0_2_1 = {1'b1, 8'd0, 9'd0, 9'd19, 5'd0, 6'd5, 9'd18, 9'd17, 9'd23, 9'd27, 9'd3};
		
		in_xpos_inject_1_3_0 = 0;
		in_ypos_inject_1_3_0 = 0;
		in_zpos_inject_1_3_0 = 0;
		in_xneg_inject_1_3_0 = 0;
		in_yneg_inject_1_3_0 = 0;
		in_zneg_inject_1_3_0 = 0;
		reduce_me_1_3_0 = 0;
		newcomm_1_3_0 = {1'b1, 8'd0, 9'd0, 9'd20, 5'd2, 6'd5, 9'd21, 9'd22, 9'd16, 9'd28, 9'd4};
		
		in_xpos_inject_1_3_1 = 0;
		in_ypos_inject_1_3_1 = 0;
		in_zpos_inject_1_3_1 = 0;
		in_xneg_inject_1_3_1 = 0;
		in_yneg_inject_1_3_1 = 0;
		in_zneg_inject_1_3_1 = 0;
		reduce_me_1_3_1 = 0;
		newcomm_1_3_1 = {1'b1, 8'd0, 9'd0, 9'd21, 5'd0, 6'd5, 9'd20, 9'd23, 9'd17, 9'd29, 9'd5};
		
		in_xpos_inject_1_2_0 = 0;
		in_ypos_inject_1_2_0 = 0;
		in_zpos_inject_1_2_0 = 0;
		in_xneg_inject_1_2_0 = 0;
		in_yneg_inject_1_2_0 = 0;
		in_zneg_inject_1_2_0 = 0;
		reduce_me_1_2_0 = 0;
		newcomm_1_2_0 = {1'b1, 8'd0, 9'd0, 9'd22, 5'd1, 6'd5, 9'd23, 9'd20, 9'd18, 9'd30, 9'd6};
		
		in_xpos_inject_1_2_1 = 0;
		in_ypos_inject_1_2_1 = 0;
		in_zpos_inject_1_2_1 = 0;
		in_xneg_inject_1_2_1 = 0;
		in_yneg_inject_1_2_1 = 0;
		in_zneg_inject_1_2_1 = 0;
		reduce_me_1_2_1 = 0;
		newcomm_1_2_1 = {1'b1, 8'd0, 9'd0, 9'd23, 5'd0, 6'd5, 9'd22, 9'd21, 9'd19, 9'd31, 9'd7};
		
		in_xpos_inject_0_3_3 = 0;
		in_ypos_inject_0_3_3 = 0;
		in_zpos_inject_0_3_3 = 0;
		in_xneg_inject_0_3_3 = 0;
		in_yneg_inject_0_3_3 = 0;
		in_zneg_inject_0_3_3 = 0;
		reduce_me_0_3_3 = 0;
		newcomm_0_3_3 = {1'b1, 8'd0, 9'd0, 9'd24, 5'd3, 6'd5, 9'd25, 9'd26, 9'd28, 9'd16, 9'd8};
		
		in_xpos_inject_0_3_2 = 0;
		in_ypos_inject_0_3_2 = 0;
		in_zpos_inject_0_3_2 = 0;
		in_xneg_inject_0_3_2 = 0;
		in_yneg_inject_0_3_2 = 0;
		in_zneg_inject_0_3_2 = 0;
		reduce_me_0_3_2 = 0;
		newcomm_0_3_2 = {1'b1, 8'd0, 9'd0, 9'd25, 5'd0, 6'd5, 9'd24, 9'd27, 9'd29, 9'd17, 9'd9};
		
		in_xpos_inject_0_2_3 = 0;
		in_ypos_inject_0_2_3 = 0;
		in_zpos_inject_0_2_3 = 0;
		in_xneg_inject_0_2_3 = 0;
		in_yneg_inject_0_2_3 = 0;
		in_zneg_inject_0_2_3 = 0;
		reduce_me_0_2_3 = 0;
		newcomm_0_2_3 = {1'b1, 8'd0, 9'd0, 9'd26, 5'd1, 6'd5, 9'd27, 9'd24, 9'd30, 9'd18, 9'd10};
		
		in_xpos_inject_0_2_2 = 0;
		in_ypos_inject_0_2_2 = 0;
		in_zpos_inject_0_2_2 = 0;
		in_xneg_inject_0_2_2 = 0;
		in_yneg_inject_0_2_2 = 0;
		in_zneg_inject_0_2_2 = 0;
		reduce_me_0_2_2 = 0;
		newcomm_0_2_2 = {1'b1, 8'd0, 9'd0, 9'd27, 5'd0, 6'd5, 9'd26, 9'd25, 9'd31, 9'd19, 9'd11};
		
		in_xpos_inject_1_3_3 = 0;
		in_ypos_inject_1_3_3 = 0;
		in_zpos_inject_1_3_3 = 0;
		in_xneg_inject_1_3_3 = 0;
		in_yneg_inject_1_3_3 = 0;
		in_zneg_inject_1_3_3 = 0;
		reduce_me_1_3_3 = 0;
		newcomm_1_3_3 = {1'b1, 8'd0, 9'd0, 9'd28, 5'd2, 6'd5, 9'd29, 9'd30, 9'd24, 9'd20, 9'd12};
		
		in_xpos_inject_1_3_2 = 0;
		in_ypos_inject_1_3_2 = 0;
		in_zpos_inject_1_3_2 = 0;
		in_xneg_inject_1_3_2 = 0;
		in_yneg_inject_1_3_2 = 0;
		in_zneg_inject_1_3_2 = 0;
		reduce_me_1_3_2 = 0;
		newcomm_1_3_2 = {1'b1, 8'd0, 9'd0, 9'd29, 5'd0, 6'd5, 9'd28, 9'd31, 9'd25, 9'd21, 9'd13};
		
		in_xpos_inject_1_2_3 = 0;
		in_ypos_inject_1_2_3 = 0;
		in_zpos_inject_1_2_3 = 0;
		in_xneg_inject_1_2_3 = 0;
		in_yneg_inject_1_2_3 = 0;
		in_zneg_inject_1_2_3 = 0;
		reduce_me_1_2_3 = 0;
		newcomm_1_2_3 = {1'b1, 8'd0, 9'd0, 9'd30, 5'd1, 6'd5, 9'd31, 9'd28, 9'd26, 9'd22, 9'd14};
		
		in_xpos_inject_1_2_2 = 0;
		in_ypos_inject_1_2_2 = 0;
		in_zpos_inject_1_2_2 = 0;
		in_xneg_inject_1_2_2 = 0;
		in_yneg_inject_1_2_2 = 0;
		in_zneg_inject_1_2_2 = 0;
		reduce_me_1_2_2 = 0;
		newcomm_1_2_2 = {1'b1, 8'd0, 9'd0, 9'd31, 5'd0, 6'd5, 9'd30, 9'd29, 9'd27, 9'd23, 9'd15};

		// Wait 100 ns for global reset to finish
		#105;
		rst = 0;
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//reduce
		
		/*for(i=1;i<2;i=i+1)begin
				  reduce_me_0_0_0 = {6'b001011, 9'b000000000, 9'b000000000, 9'd0, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_0_0_1 = {6'b000001, 9'b000000000, 9'b000000001, 9'd1, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_0_1_0 = {6'b000011, 9'b000000000, 9'b000001000, 9'd2, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_0_1_1 = {6'b000001, 9'b000001000, 9'b000001001, 9'd3, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zneg_inject_1_0_0 = {6'b000101, 9'b000000000, 9'b001000000, 9'd4, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_1_0_1 = {6'b000001, 9'b001000000, 9'b001000001, 9'd5, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_1_1_0 = {6'b000011, 9'b001000000, 9'b001001000, 9'd6, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_1_1_1 = {6'b000001, 9'b001001000, 9'b001001001, 9'd7, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_0_0_3 = {6'b000111, 9'b000000000, 9'b000000011, 9'd8, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_0_0_2 = {6'b000001, 9'b000000011, 9'b000000010, 9'd9, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_0_1_3 = {6'b000011, 9'b000000011, 9'b000001011, 9'd10, 8'd0, i, 2'b00, ShortReduce, 32'd6};		
			in_xpos_inject_0_1_2 = {6'b000001, 9'b000001011, 9'b000001010, 9'd11, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zneg_inject_1_0_3 = {6'b000101, 9'b000000011, 9'b001000011, 9'd12, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_1_0_2 = {6'b000001, 9'b001000011, 9'b001000010, 9'd13, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_1_1_3 = {6'b000011, 9'b001000011, 9'b001001011, 9'd14, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_1_1_2 = {6'b000001, 9'b001001011, 9'b001001010, 9'd15, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_0_3_0 = {6'b001001, 9'b000000000, 9'b000011000, 9'd16, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_0_3_1 = {6'b000001, 9'b000011000, 9'b000011001, 9'd17, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_0_2_0 = {6'b000011, 9'b000011000, 9'b000010000, 9'd18, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_0_2_1 = {6'b000001, 9'b000010000, 9'b000010001, 9'd19, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zneg_inject_1_3_0 = {6'b000101, 9'b000011000, 9'b001011000, 9'd20, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_1_3_1 = {6'b000001, 9'b001011000, 9'b001011001, 9'd21, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_1_2_0 = {6'b000011, 9'b001011000, 9'b001010000, 9'd22, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_1_2_1 = {6'b000001, 9'b001010000, 9'b001010001, 9'd23, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_0_3_3 = {6'b000111, 9'b000011000, 9'b000011011, 9'd24, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_0_3_2 = {6'b000001, 9'b000011011, 9'b000011010, 9'd25, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_0_2_3 = {6'b000011, 9'b000011011, 9'b000010011, 9'd26, 8'd0, i, 2'b00, ShortReduce, 32'd6};		
			in_xpos_inject_0_2_2 = {6'b000001, 9'b000010011, 9'b000010010, 9'd27, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zneg_inject_1_3_3 = {6'b000101, 9'b000011011, 9'b001011011, 9'd28, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_1_3_2 = {6'b000001, 9'b001011011, 9'b001011010, 9'd29, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_1_2_3 = {6'b000011, 9'b001011011, 9'b001010011, 9'd30, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_1_2_2 = {6'b000001, 9'b001010011, 9'b001010010, 9'd31, 8'd0, i, 2'b00, ShortReduce, 32'd6};
			
			#10;
		end		
		reduce_me_0_0_0 = 0;
		in_xneg_inject_0_0_1 = 0;
		in_yneg_inject_0_1_0 = 0;
		in_xneg_inject_0_1_1 = 0;
		in_zneg_inject_1_0_0 = 0;
		in_xneg_inject_1_0_1 = 0;
		in_yneg_inject_1_1_0 = 0;
		in_xneg_inject_1_1_1 = 0;		
		in_xpos_inject_0_0_3 = 0;
		in_xpos_inject_0_0_2 = 0;
		in_yneg_inject_0_1_3 = 0;
		in_xpos_inject_0_1_2 = 0;
		in_zneg_inject_1_0_3 = 0;
		in_xpos_inject_1_0_2 = 0;
		in_yneg_inject_1_1_3 = 0;
		in_xpos_inject_1_1_2 = 0;		
		in_ypos_inject_0_3_0 = 0;
		in_xneg_inject_0_3_1 = 0;
		in_ypos_inject_0_2_0 = 0;
		in_xneg_inject_0_2_1 = 0;
		in_zneg_inject_1_3_0 = 0;
		in_xneg_inject_1_3_1 = 0;
		in_ypos_inject_1_2_0 = 0;
		in_xneg_inject_1_2_1 = 0;
		in_xpos_inject_0_3_3 = 0;
		in_xpos_inject_0_3_2 = 0;
		in_ypos_inject_0_2_3 = 0;
		in_xpos_inject_0_2_2 = 0;
		in_zneg_inject_1_3_3 = 0;
		in_xpos_inject_1_3_2 = 0;
		in_ypos_inject_1_2_3 = 0;
		in_xpos_inject_1_2_2 = 0;*/
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//allreduce
				
		/*for(i=0;i<1;i=i+1)begin
		
				  reduce_me_0_0_0 = {6'b001011, ZERO, 	  ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_0_0 = {6'b000001, ONE, 	  ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_0_0 = {6'b000011, TWO, 	  ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_0_0 = {6'b000101, FOUR, 	  ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_0_0 = {6'b000111, EIGHT,   ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_0_0 = {6'b001001, SIXTEEN, ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_0_1 = {6'b001011, ONE, 		 ONE, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_0_1 = {6'b000001, ZERO, 	    ONE, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_0_1 = {6'b000011, THREE, 	 ONE, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_0_1 = {6'b000101, FIVE, 		 ONE, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_0_1 = {6'b000111, NINE, 		 ONE, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_0_1 = {6'b001001, SEVENTEEN, ONE, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_1_0 = {6'b001011, TWO, 		TWO, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_1_0 = {6'b000001, THREE, 	TWO, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_1_0 = {6'b000011, ZERO, 		TWO, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_1_0 = {6'b000101, SIX, 		TWO, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_1_0 = {6'b000111, TEN, 		TWO, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_1_0 = {6'b001001, EIGHTEEN, TWO, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_1_1 = {6'b001011, THREE, 	THREE, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_1_1 = {6'b000001, TWO, 	   THREE, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_1_1 = {6'b000011, ONE, 		THREE, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_1_1 = {6'b000101, SEVEN,    THREE, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_1_1 = {6'b000111, ELEVEN,   THREE, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_1_1 = {6'b001001, NINETEEN, THREE, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_0_0 = {6'b001011, FOUR,   FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_0_0 = {6'b000001, FIVE,   FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_0_0 = {6'b000011, SIX, 	 FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_0_0 = {6'b000101, ZERO, 	 FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_0_0 = {6'b000111, TWELVE, FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_0_0 = {6'b001001, TWENTY, FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
		
				  reduce_me_1_0_1 = {6'b001011, FIVE,		 FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_0_1 = {6'b000001, FOUR, 		 FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_0_1 = {6'b000011, SEVEN,	    FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_0_1 = {6'b000101, ONE,		 FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_0_1 = {6'b000111, THIRTEEN,  FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_0_1 = {6'b001001, TWENTYONE, FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_1_0 = {6'b001011, SIX, 		 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_1_0 = {6'b000001, SEVEN, 	 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_1_0 = {6'b000011, FOUR, 		 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_1_0 = {6'b000101, TWO, 		 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_1_0 = {6'b000111, FOURTEEN,  SIX, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_1_0 = {6'b001001, TWENTYTWO, SIX, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_1_1 = {6'b001011, SEVEN, 		SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_1_1 = {6'b000001, SIX, 			SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_1_1 = {6'b000011, FIVE, 			SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_1_1 = {6'b000101, THREE, 		SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_1_1 = {6'b000111, FIFTEEN, 		SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_1_1 = {6'b001001, TWENTYTHREE, SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_0_3 = {6'b001011, EIGHT, 	  EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_0_3 = {6'b000001, NINE, 		  EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_0_3 = {6'b000011, TEN, 		  EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_0_3 = {6'b000101, TWELVE, 	  EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_0_3 = {6'b000111, ZERO, 		  EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_0_3 = {6'b001001, TWENTYFOUR, EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_0_2 = {6'b001011, NINE, 		  NINE, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_0_2 = {6'b000001, EIGHT, 	  NINE, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_0_2 = {6'b000011, ELEVEN, 	  NINE, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_0_2 = {6'b000101, THIRTEEN,	  NINE, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_0_2 = {6'b000111, ONE, 		  NINE, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_0_2 = {6'b001001, TWENTYFIVE, NINE, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_1_3 = {6'b001011, TEN, 		 TEN, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_1_3 = {6'b000001, ELEVEN, 	 TEN, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_1_3 = {6'b000011, EIGHT, 	 TEN, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_1_3 = {6'b000101, FOURTEEN,  TEN, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_1_3 = {6'b000111, TWO,		 TEN, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_1_3 = {6'b001001, TWENTYSIX, TEN, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_1_2 = {6'b001011, ELEVEN, 		ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_1_2 = {6'b000001, TEN, 			ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_1_2 = {6'b000011, NINE, 			ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_1_2 = {6'b000101, FIFTEEN, 		ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_1_2 = {6'b000111, THREE, 		ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_1_3 = {6'b001001, TWENTYSEVEN, ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_0_3 = {6'b001011, TWELVE, 		TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_0_3 = {6'b000001, THIRTEEN, 	TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_0_3 = {6'b000011, FOURTEEN, 	TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_0_3 = {6'b000101, EIGHT, 		TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_0_3 = {6'b000111, FOUR, 			TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_0_3 = {6'b001001, TWENTYEIGHT, TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_0_2 = {6'b001011, THIRTEEN,   THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_0_2 = {6'b000001, TWELVE,     THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_0_2 = {6'b000011, FIFTEEN,    THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_0_2 = {6'b000101, NINE, 		  THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_0_2 = {6'b000111, FIVE, 		  THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_0_2 = {6'b001001, TWENTYNINE, THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_1_3 = {6'b001011, FOURTEEN, FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_1_3 = {6'b000001, FIFTEEN,  FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_1_3 = {6'b000011, TWELVE,   FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_1_3 = {6'b000101, TEN,      FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_1_3 = {6'b000111, SIX,      FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_1_3 = {6'b001001, THIRTY,   FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_1_2 = {6'b001011, FIFTEEN,   FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_1_2 = {6'b000001, FOURTEEN,  FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_1_2 = {6'b000011, THIRTEEN,  FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_1_2 = {6'b000101, ELEVEN,    FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_1_2 = {6'b000111, SEVEN,     FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_1_2 = {6'b001001, THIRTYONE, FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
			//////////////////////////////////////////////////////////////////////////////////////////////////////
			
				  reduce_me_0_3_0 = {6'b001011, SIXTEEN, 	  SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_3_0 = {6'b000001, SEVENTEEN,  SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_3_0 = {6'b000011, EIGHTEEN,   SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_3_0 = {6'b000101, TWENTY, 	  SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_3_0 = {6'b000111, TWENTYFOUR, SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_3_0 = {6'b001001, ZERO, 		  SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_3_1 = {6'b001011, SEVENTEEN,  SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_3_1 = {6'b000001, SIXTEEN,    SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_3_1 = {6'b000011, NINETEEN,   SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_3_1 = {6'b000101, TWENTYONE,  SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_3_1 = {6'b000111, TWENTYFIVE, SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_3_1 = {6'b001001, ONE, 		  SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_2_0 = {6'b001011, EIGHTEEN,	 EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_2_0 = {6'b000001, NINETEEN,  EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_2_0 = {6'b000011, SIXTEEN, 	 EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_2_0 = {6'b000101, TWENTYTWO, EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_2_0 = {6'b000111, TWENTYSIX, EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_2_0 = {6'b001001, TWO, 		 EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_2_1 = {6'b001011, NINETEEN,		NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_2_1 = {6'b000001, EIGHTEEN,		NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_2_1 = {6'b000011, SEVENTEEN, 	NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_2_1 = {6'b000101, TWENTYTHREE, NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_2_1 = {6'b000111, TWENTYSEVEN, NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_2_1 = {6'b001001, THREE, 		NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_3_0 = {6'b001011, TWENTY, 		TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_3_0 = {6'b000001, TWENTYONE,   TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_3_0 = {6'b000011, TWENTYTWO, 	TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_3_0 = {6'b000101, SIXTEEN, 	 	TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_3_0 = {6'b000111, TWENTYEIGHT, TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_3_0 = {6'b001001, FOUR, 			TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
		
				  reduce_me_1_3_1 = {6'b001011, TWENTYONE, 	TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_3_1 = {6'b000001, TWENTY, 		TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_3_1 = {6'b000011, TWENTYTHREE,	TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_3_1 = {6'b000101, SEVENTEEN,	TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_3_1 = {6'b000111, TWENTYNINE,  TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_3_1 = {6'b001001, FIVE, 			TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_2_0 = {6'b001011, TWENTYTWO, 	TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_2_0 = {6'b000001, TWENTYTHREE, TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_2_0 = {6'b000011, TWENTY, 		TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_2_0 = {6'b000101, EIGHTEEN, 	TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_2_0 = {6'b000111, THIRTY,  		TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_2_0 = {6'b001001, SIX, 			TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_2_1 = {6'b001011, TWENTYTHREE,	TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_2_1 = {6'b000001, TWENTYTWO, 	TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_2_1 = {6'b000011, TWENTYONE, 	TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_2_1 = {6'b000101, NINETEEN, 	TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_2_1 = {6'b000111, THIRTYONE, 	TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_2_1 = {6'b001001, SEVEN, 		TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_3_3 = {6'b001011, TWENTYFOUR,  TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_3_3 = {6'b000001, TWENTYFIVE, 	TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_3_3 = {6'b000011, TWENTYSIX, 	TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_3_3 = {6'b000101, TWENTYEIGHT, TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_3_3 = {6'b000111, SIXTEEN, 		TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_3_3 = {6'b001001, EIGHT, 		TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_3_2 = {6'b001011, TWENTYFIVE,  TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_3_2 = {6'b000001, TWENTYFOUR, 	TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_3_2 = {6'b000011, TWENTYSEVEN, TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_3_2 = {6'b000101, TWENTYNINE,	TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_3_2 = {6'b000111, SEVENTEEN, 	TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_3_2 = {6'b001001, NINE, 			TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_2_3 = {6'b001011, TWENTYSIX, 	TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_2_3 = {6'b000001, TWENTYSEVEN, TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_2_3 = {6'b000011, TWENTYFOUR, 	TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_2_3 = {6'b000101, THIRTY,  		TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_2_3 = {6'b000111, EIGHTEEN,		TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_2_3 = {6'b001001, TEN, 			TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_2_2 = {6'b001011, TWENTYSEVEN, TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_2_2 = {6'b000001, TWENTYSIX, 	TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_2_2 = {6'b000011, TWENTYFIVE, 	TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_2_2 = {6'b000101, THIRTYONE, 	TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_2_2 = {6'b000111, NINETEEN, 	TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_2_3 = {6'b001001, ELEVEN, 		TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_3_3 = {6'b001011, TWENTYEIGHT,	TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_3_3 = {6'b000001, TWENTYNINE, 	TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_3_3 = {6'b000011, THIRTY, 		TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_3_3 = {6'b000101, TWENTYFOUR, 	TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_3_3 = {6'b000111, TWENTY, 		TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_3_3 = {6'b001001, TWELVE, 		TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_3_2 = {6'b001011, TWENTYNINE,  TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_3_2 = {6'b000001, TWENTYEIGHT, TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_3_2 = {6'b000011, THIRTYONE,   TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_3_2 = {6'b000101, TWENTYFIVE, 	TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_3_2 = {6'b000111, TWENTYONE, 	TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_3_2 = {6'b001001, THIRTEEN, 	TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_2_3 = {6'b001011, THIRTY,   	THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_2_3 = {6'b000001, THIRTYONE,   THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_2_3 = {6'b000011, TWENTYEIGHT, THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_2_3 = {6'b000101, TWENTYSIX,   THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_2_3 = {6'b000111, TWENTYTWO,   THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_2_3 = {6'b001001, FOURTEEN,   	THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_2_2 = {6'b001011, THIRTYONE, 	THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_2_2 = {6'b000001, THIRTY,  		THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_2_2 = {6'b000011, TWENTYNINE,  THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_2_2 = {6'b000101, TWENTYSEVEN, THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_2_2 = {6'b000111, TWENTYTHREE, THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_2_2 = {6'b001001, FIFTEEN, 		THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
			#10;
			
		end		
		
		in_xpos_inject_0_0_0 = 0;
		in_ypos_inject_0_0_0 = 0;
		in_zpos_inject_0_0_0 = 0;
		in_xneg_inject_0_0_0 = 0;
		in_yneg_inject_0_0_0 = 0;
		in_zneg_inject_0_0_0 = 0;
		reduce_me_0_0_0 = 0;
		in_xpos_inject_0_0_1 = 0;
		in_ypos_inject_0_0_1 = 0;
		in_zpos_inject_0_0_1 = 0;
		in_xneg_inject_0_0_1 = 0;
		in_yneg_inject_0_0_1 = 0;
		in_zneg_inject_0_0_1 = 0;
		reduce_me_0_0_1 = 0;
		in_xpos_inject_0_1_0 = 0;
		in_ypos_inject_0_1_0 = 0;
		in_zpos_inject_0_1_0 = 0;
		in_xneg_inject_0_1_0 = 0;
		in_yneg_inject_0_1_0 = 0;
		in_zneg_inject_0_1_0 = 0;
		reduce_me_0_1_0 = 0;
		in_xpos_inject_0_1_1 = 0;
		in_ypos_inject_0_1_1 = 0;
		in_zpos_inject_0_1_1 = 0;
		in_xneg_inject_0_1_1 = 0;
		in_yneg_inject_0_1_1 = 0;
		in_zneg_inject_0_1_1 = 0;
		reduce_me_0_1_1 = 0;
		in_xpos_inject_1_0_0 = 0;
		in_ypos_inject_1_0_0 = 0;
		in_zpos_inject_1_0_0 = 0;
		in_xneg_inject_1_0_0 = 0;
		in_yneg_inject_1_0_0 = 0;
		in_zneg_inject_1_0_0 = 0;
		reduce_me_1_0_0 = 0;
		in_xpos_inject_1_0_1 = 0;
		in_ypos_inject_1_0_1 = 0;
		in_zpos_inject_1_0_1 = 0;
		in_xneg_inject_1_0_1 = 0;
		in_yneg_inject_1_0_1 = 0;
		in_zneg_inject_1_0_1 = 0;
		reduce_me_1_0_1 = 0;
		in_xpos_inject_1_1_0 = 0;
		in_ypos_inject_1_1_0 = 0;
		in_zpos_inject_1_1_0 = 0;
		in_xneg_inject_1_1_0 = 0;
		in_yneg_inject_1_1_0 = 0;
		in_zneg_inject_1_1_0 = 0;
		reduce_me_1_1_0 = 0;
		in_xpos_inject_1_1_1 = 0;
		in_ypos_inject_1_1_1 = 0;
		in_zpos_inject_1_1_1 = 0;
		in_xneg_inject_1_1_1 = 0;
		in_yneg_inject_1_1_1 = 0;
		in_zneg_inject_1_1_1 = 0;
		reduce_me_1_1_1 = 0;
		in_xpos_inject_0_0_3 = 0;
		in_ypos_inject_0_0_3 = 0;
		in_zpos_inject_0_0_3 = 0;
		in_xneg_inject_0_0_3 = 0;
		in_yneg_inject_0_0_3 = 0;
		in_zneg_inject_0_0_3 = 0;
		reduce_me_0_0_3 = 0;
		in_xpos_inject_0_0_2 = 0;
		in_ypos_inject_0_0_2 = 0;
		in_zpos_inject_0_0_2 = 0;
		in_xneg_inject_0_0_2 = 0;
		in_yneg_inject_0_0_2 = 0;
		in_zneg_inject_0_0_2 = 0;
		reduce_me_0_0_2 = 0;
		in_xpos_inject_0_1_3 = 0;
		in_ypos_inject_0_1_3 = 0;
		in_zpos_inject_0_1_3 = 0;
		in_xneg_inject_0_1_3 = 0;
		in_yneg_inject_0_1_3 = 0;
		in_zneg_inject_0_1_3 = 0;
		reduce_me_0_1_3 = 0;
		in_xpos_inject_0_1_2 = 0;
		in_ypos_inject_0_1_2 = 0;
		in_zpos_inject_0_1_2 = 0;
		in_xneg_inject_0_1_2 = 0;
		in_yneg_inject_0_1_2 = 0;
		in_zneg_inject_0_1_2 = 0;
		reduce_me_0_1_2 = 0;
		in_xpos_inject_1_0_3 = 0;
		in_ypos_inject_1_0_3 = 0;
		in_zpos_inject_1_0_3 = 0;
		in_xneg_inject_1_0_3 = 0;
		in_yneg_inject_1_0_3 = 0;
		in_zneg_inject_1_0_3 = 0;
		reduce_me_1_0_3 = 0;
		in_xpos_inject_1_0_2 = 0;
		in_ypos_inject_1_0_2 = 0;
		in_zpos_inject_1_0_2 = 0;
		in_xneg_inject_1_0_2 = 0;
		in_yneg_inject_1_0_2 = 0;
		in_zneg_inject_1_0_2 = 0;
		reduce_me_1_0_2 = 0;
		in_xpos_inject_1_1_3 = 0;
		in_ypos_inject_1_1_3 = 0;
		in_zpos_inject_1_1_3 = 0;
		in_xneg_inject_1_1_3 = 0;
		in_yneg_inject_1_1_3 = 0;
		in_zneg_inject_1_1_3 = 0;
		reduce_me_1_1_3 = 0;
		in_xpos_inject_1_1_2 = 0;
		in_ypos_inject_1_1_2 = 0;
		in_zpos_inject_1_1_2 = 0;
		in_xneg_inject_1_1_2 = 0;
		in_yneg_inject_1_1_2 = 0;
		in_zneg_inject_1_1_2 = 0;
		reduce_me_1_1_2 = 0;
		in_xpos_inject_0_3_0 = 0;
		in_ypos_inject_0_3_0 = 0;
		in_zpos_inject_0_3_0 = 0;
		in_xneg_inject_0_3_0 = 0;
		in_yneg_inject_0_3_0 = 0;
		in_zneg_inject_0_3_0 = 0;
		reduce_me_0_3_0 = 0;
		in_xpos_inject_0_3_1 = 0;
		in_ypos_inject_0_3_1 = 0;
		in_zpos_inject_0_3_1 = 0;
		in_xneg_inject_0_3_1 = 0;
		in_yneg_inject_0_3_1 = 0;
		in_zneg_inject_0_3_1 = 0;
		reduce_me_0_3_1 = 0;
		in_xpos_inject_0_2_0 = 0;
		in_ypos_inject_0_2_0 = 0;
		in_zpos_inject_0_2_0 = 0;
		in_xneg_inject_0_2_0 = 0;
		in_yneg_inject_0_2_0 = 0;
		in_zneg_inject_0_2_0 = 0;
		reduce_me_0_2_0 = 0;
		in_xpos_inject_0_2_1 = 0;
		in_ypos_inject_0_2_1 = 0;
		in_zpos_inject_0_2_1 = 0;
		in_xneg_inject_0_2_1 = 0;
		in_yneg_inject_0_2_1 = 0;
		in_zneg_inject_0_2_1 = 0;
		reduce_me_0_2_1 = 0;
		in_xpos_inject_1_3_0 = 0;
		in_ypos_inject_1_3_0 = 0;
		in_zpos_inject_1_3_0 = 0;
		in_xneg_inject_1_3_0 = 0;
		in_yneg_inject_1_3_0 = 0;
		in_zneg_inject_1_3_0 = 0;
		reduce_me_1_3_0 = 0;
		in_xpos_inject_1_3_1 = 0;
		in_ypos_inject_1_3_1 = 0;
		in_zpos_inject_1_3_1 = 0;
		in_xneg_inject_1_3_1 = 0;
		in_yneg_inject_1_3_1 = 0;
		in_zneg_inject_1_3_1 = 0;
		reduce_me_1_3_1 = 0;
		in_xpos_inject_1_2_0 = 0;
		in_ypos_inject_1_2_0 = 0;
		in_zpos_inject_1_2_0 = 0;
		in_xneg_inject_1_2_0 = 0;
		in_yneg_inject_1_2_0 = 0;
		in_zneg_inject_1_2_0 = 0;
		reduce_me_1_2_0 = 0;
		in_xpos_inject_1_2_1 = 0;
		in_ypos_inject_1_2_1 = 0;
		in_zpos_inject_1_2_1 = 0;
		in_xneg_inject_1_2_1 = 0;
		in_yneg_inject_1_2_1 = 0;
		in_zneg_inject_1_2_1 = 0;
		reduce_me_1_2_1 = 0;
		in_xpos_inject_0_3_3 = 0;
		in_ypos_inject_0_3_3 = 0;
		in_zpos_inject_0_3_3 = 0;
		in_xneg_inject_0_3_3 = 0;
		in_yneg_inject_0_3_3 = 0;
		in_zneg_inject_0_3_3 = 0;
		reduce_me_0_3_3 = 0;
		in_xpos_inject_0_3_2 = 0;
		in_ypos_inject_0_3_2 = 0;
		in_zpos_inject_0_3_2 = 0;
		in_xneg_inject_0_3_2 = 0;
		in_yneg_inject_0_3_2 = 0;
		in_zneg_inject_0_3_2 = 0;
		reduce_me_0_3_2 = 0;
		in_xpos_inject_0_2_3 = 0;
		in_ypos_inject_0_2_3 = 0;
		in_zpos_inject_0_2_3 = 0;
		in_xneg_inject_0_2_3 = 0;
		in_yneg_inject_0_2_3 = 0;
		in_zneg_inject_0_2_3 = 0;
		reduce_me_0_2_3 = 0;
		in_xpos_inject_0_2_2 = 0;
		in_ypos_inject_0_2_2 = 0;
		in_zpos_inject_0_2_2 = 0;
		in_xneg_inject_0_2_2 = 0;
		in_yneg_inject_0_2_2 = 0;
		in_zneg_inject_0_2_2 = 0;
		reduce_me_0_2_2 = 0;
		in_xpos_inject_1_3_3 = 0;
		in_ypos_inject_1_3_3 = 0;
		in_zpos_inject_1_3_3 = 0;
		in_xneg_inject_1_3_3 = 0;
		in_yneg_inject_1_3_3 = 0;
		in_zneg_inject_1_3_3 = 0;
		reduce_me_1_3_3 = 0;
		in_xpos_inject_1_3_2 = 0;
		in_ypos_inject_1_3_2 = 0;
		in_zpos_inject_1_3_2 = 0;
		in_xneg_inject_1_3_2 = 0;
		in_yneg_inject_1_3_2 = 0;
		in_zneg_inject_1_3_2 = 0;
		reduce_me_1_3_2 = 0;
		in_xpos_inject_1_2_3 = 0;
		in_ypos_inject_1_2_3 = 0;
		in_zpos_inject_1_2_3 = 0;
		in_xneg_inject_1_2_3 = 0;
		in_yneg_inject_1_2_3 = 0;
		in_zneg_inject_1_2_3 = 0;
		reduce_me_1_2_3 = 0;
		in_xpos_inject_1_2_2 = 0;
		in_ypos_inject_1_2_2 = 0;
		in_zpos_inject_1_2_2 = 0;
		in_xneg_inject_1_2_2 = 0;
		in_yneg_inject_1_2_2 = 0;
		in_zneg_inject_1_2_2 = 0;
		reduce_me_1_2_2 = 0;*/
			
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//ring
		
		/*for(i=0;i<1;i=i+1)begin
			in_xpos_inject_0_0_0 = {4'b0001, 9'b000000001, 9'b000000000, 9'b000000000, 8'b00000000, i, 2'b00, LargeAllGather, 32'b00000000000000000000000000000110};
			#10;
		end		
		
		in_xpos_inject_0_0_0 = 85'b0;*/
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//bcast
		
		/*for(i=0;i<1;i=i+1)begin
			in_xpos_inject_0_0_0 = {6'b000001, 9'b000000001, 9'd0, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			in_ypos_inject_0_0_0 = {6'b000001, 9'b000001000, 9'd0, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			in_zpos_inject_0_0_0 = {6'b000001, 9'b001000000, 9'd0, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			in_xneg_inject_0_0_0 = {6'b000001, 9'b000000011, 9'd0, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			in_yneg_inject_0_0_0 = {6'b000001, 9'b000011000, 9'd0, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			#10;
		end		
		
		in_xpos_inject_0_0_0 = 0;
		in_ypos_inject_0_0_0 = 0;
		in_zpos_inject_0_0_0 = 0;
		in_xneg_inject_0_0_0 = 0;
		in_yneg_inject_0_0_0 = 0;*/
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//scatter
		
		/*for(i=0;i<1;i=i+1)begin
			in_xpos_inject_0_0_0 = {6'b000001, 9'b000000001, 9'd0, 9'd0, 8'd0, 8'd1, 2'b00, Scatter, 32'd6};
			in_ypos_inject_0_0_0 = {6'b000001, 9'b000001000, 9'd0, 9'd0, 8'd0, 8'd2, 2'b00, Scatter, 32'd6};
			in_zpos_inject_0_0_0 = {6'b000001, 9'b001000000, 9'd0, 9'd0, 8'd0, 8'd4, 2'b00, Scatter, 32'd6};
			in_xneg_inject_0_0_0 = {6'b000001, 9'b000000011, 9'd0, 9'd0, 8'd0, 8'd8, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {6'b000001, 9'b000011000, 9'd0, 9'd0, 8'd0, 8'd16, 2'b00, Scatter, 32'd6};
			#10;
			in_xpos_inject_0_0_0 = 0;
			in_ypos_inject_0_0_0 = {6'b000001, 9'b000001001, 9'd0, 9'd0, 8'd0, 8'd3, 2'b00, Scatter, 32'd6};
			in_zpos_inject_0_0_0 = {6'b000001, 9'b001000001, 9'd0, 9'd0, 8'd0, 8'd5, 2'b00, Scatter, 32'd6};
			in_xneg_inject_0_0_0 = {6'b000001, 9'b000000010, 9'd0, 9'd0, 8'd0, 8'd9, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {6'b000001, 9'b000011001, 9'd0, 9'd0, 8'd0, 8'd17, 2'b00, Scatter, 32'd6};
			#10;
			in_ypos_inject_0_0_0 = 0;
			in_zpos_inject_0_0_0 = {6'b000001, 9'b001001000, 9'd0, 9'd0, 8'd0, 8'd6, 2'b00, Scatter, 32'd6};
			in_xneg_inject_0_0_0 = {6'b000001, 9'b000001011, 9'd0, 9'd0, 8'd0, 8'd10, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {6'b000001, 9'b000010000, 9'd0, 9'd0, 8'd0, 8'd18, 2'b00, Scatter, 32'd6};
			#10;
			in_zpos_inject_0_0_0 = {6'b000001, 9'b001001001, 9'd0, 9'd0, 8'd0, 8'd7, 2'b00, Scatter, 32'd6};
			in_xneg_inject_0_0_0 = {6'b000001, 9'b000001010, 9'd0, 9'd0, 8'd0, 8'd11, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {6'b000001, 9'b000010001, 9'd0, 9'd0, 8'd0, 8'd19, 2'b00, Scatter, 32'd6};
			#10;
			in_zpos_inject_0_0_0 = 0;
			in_xneg_inject_0_0_0 = {6'b000001, 9'b001000011, 9'd0, 9'd0, 8'd0, 8'd12, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {6'b000001, 9'b001011000, 9'd0, 9'd0, 8'd0, 8'd20, 2'b00, Scatter, 32'd6};
			#10;
			in_xneg_inject_0_0_0 = {6'b000001, 9'b001000010, 9'd0, 9'd0, 8'd0, 8'd13, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {6'b000001, 9'b001011001, 9'd0, 9'd0, 8'd0, 8'd21, 2'b00, Scatter, 32'd6};
			#10;
			in_xneg_inject_0_0_0 = {6'b000001, 9'b001001011, 9'd0, 9'd0, 8'd0, 8'd14, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {6'b000001, 9'b001010000, 9'd0, 9'd0, 8'd0, 8'd22, 2'b00, Scatter, 32'd6};
			#10;
			in_xneg_inject_0_0_0 = {6'b000001, 9'b001001010, 9'd0, 9'd0, 8'd0, 8'd15, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {6'b000001, 9'b001010001, 9'd0, 9'd0, 8'd0, 8'd23, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {6'b000001, 9'b000011011, 9'd0, 9'd0, 8'd0, 8'd24, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {6'b000001, 9'b000011010, 9'd0, 9'd0, 8'd0, 8'd25, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {6'b000001, 9'b000010011, 9'd0, 9'd0, 8'd0, 8'd26, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {6'b000001, 9'b000010010, 9'd0, 9'd0, 8'd0, 8'd27, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {6'b000001, 9'b001011011, 9'd0, 9'd0, 8'd0, 8'd28, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {6'b000001, 9'b001011010, 9'd0, 9'd0, 8'd0, 8'd29, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {6'b000001, 9'b001010011, 9'd0, 9'd0, 8'd0, 8'd30, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {6'b000001, 9'b001010010, 9'd0, 9'd0, 8'd0, 8'd31, 2'b00, Scatter, 32'd6};
			#10;
		end		
		
		in_xpos_inject_0_0_0 = 0;
		in_ypos_inject_0_0_0 = 0;
		in_zpos_inject_0_0_0 = 0;
		in_xneg_inject_0_0_0 = 0;
		in_yneg_inject_0_0_0 = 0;*/
		
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//gather
		
		/*for(i=1;i<2;i=i+1)begin
			
			in_xneg_inject_0_0_1 = {6'b000001, 9'b000000000, 9'b000000001, 9'd1, 8'd0, i, 2'b00, Gather, 32'd1};			
			in_yneg_inject_0_1_0 = {6'b000001, 9'b000000000, 9'b000001000, 9'd2, 8'd0, i, 2'b00, Gather, 32'd2};			
			in_xneg_inject_0_1_1 = {6'b000001, 9'b000001000, 9'b000001001, 9'd3, 8'd0, i, 2'b00, Gather, 32'd3};			
			in_zneg_inject_1_0_0 = {6'b000001, 9'b000000000, 9'b001000000, 9'd4, 8'd0, i, 2'b00, Gather, 32'd4};			
			in_xneg_inject_1_0_1 = {6'b000001, 9'b001000000, 9'b001000001, 9'd5, 8'd0, i, 2'b00, Gather, 32'd5};			
			in_yneg_inject_1_1_0 = {6'b000001, 9'b001000000, 9'b001001000, 9'd6, 8'd0, i, 2'b00, Gather, 32'd6};			
			in_xneg_inject_1_1_1 = {6'b000001, 9'b001001000, 9'b001001001, 9'd7, 8'd0, i, 2'b00, Gather, 32'd7};			
			in_xpos_inject_0_0_3 = {6'b000001, 9'b000000000, 9'b000000011, 9'd8, 8'd0, i, 2'b00, Gather, 32'd8};			
			in_xpos_inject_0_0_2 = {6'b000001, 9'b000000011, 9'b000000010, 9'd9, 8'd0, i, 2'b00, Gather, 32'd9};			
			in_yneg_inject_0_1_3 = {6'b000001, 9'b000000011, 9'b000001011, 9'd10, 8'd0, i, 2'b00, Gather, 32'd10};		
			in_xpos_inject_0_1_2 = {6'b000001, 9'b000001011, 9'b000001010, 9'd11, 8'd0, i, 2'b00, Gather, 32'd11};			
			in_zneg_inject_1_0_3 = {6'b000001, 9'b000000011, 9'b001000011, 9'd12, 8'd0, i, 2'b00, Gather, 32'd12};			
			in_xpos_inject_1_0_2 = {6'b000001, 9'b001000011, 9'b001000010, 9'd13, 8'd0, i, 2'b00, Gather, 32'd13};			
			in_yneg_inject_1_1_3 = {6'b000001, 9'b001000011, 9'b001001011, 9'd14, 8'd0, i, 2'b00, Gather, 32'd14};			
			in_xpos_inject_1_1_2 = {6'b000001, 9'b001001011, 9'b001001010, 9'd15, 8'd0, i, 2'b00, Gather, 32'd15};			
			in_ypos_inject_0_3_0 = {6'b000001, 9'b000000000, 9'b000011000, 9'd16, 8'd0, i, 2'b00, Gather, 32'd16};			
			in_xneg_inject_0_3_1 = {6'b000001, 9'b000011000, 9'b000011001, 9'd17, 8'd0, i, 2'b00, Gather, 32'd17};			
			in_ypos_inject_0_2_0 = {6'b000001, 9'b000011000, 9'b000010000, 9'd18, 8'd0, i, 2'b00, Gather, 32'd18};			
			in_xneg_inject_0_2_1 = {6'b000001, 9'b000010000, 9'b000010001, 9'd19, 8'd0, i, 2'b00, Gather, 32'd19};			
			in_zneg_inject_1_3_0 = {6'b000001, 9'b000011000, 9'b001011000, 9'd20, 8'd0, i, 2'b00, Gather, 32'd20};			
			in_xneg_inject_1_3_1 = {6'b000001, 9'b001011000, 9'b001011001, 9'd21, 8'd0, i, 2'b00, Gather, 32'd21};			
			in_ypos_inject_1_2_0 = {6'b000001, 9'b001011000, 9'b001010000, 9'd22, 8'd0, i, 2'b00, Gather, 32'd22};			
			in_xneg_inject_1_2_1 = {6'b000001, 9'b001010000, 9'b001010001, 9'd23, 8'd0, i, 2'b00, Gather, 32'd23};			
			in_xpos_inject_0_3_3 = {6'b000001, 9'b000011000, 9'b000011011, 9'd24, 8'd0, i, 2'b00, Gather, 32'd24};			
			in_xpos_inject_0_3_2 = {6'b000001, 9'b000011011, 9'b000011010, 9'd25, 8'd0, i, 2'b00, Gather, 32'd25};			
			in_ypos_inject_0_2_3 = {6'b000001, 9'b000011011, 9'b000010011, 9'd26, 8'd0, i, 2'b00, Gather, 32'd26};		
			in_xpos_inject_0_2_2 = {6'b000001, 9'b000010011, 9'b000010010, 9'd27, 8'd0, i, 2'b00, Gather, 32'd27};			
			in_zneg_inject_1_3_3 = {6'b000001, 9'b000011011, 9'b001011011, 9'd28, 8'd0, i, 2'b00, Gather, 32'd28};			
			in_xpos_inject_1_3_2 = {6'b000001, 9'b001011011, 9'b001011010, 9'd29, 8'd0, i, 2'b00, Gather, 32'd29};			
			in_ypos_inject_1_2_3 = {6'b000001, 9'b001011011, 9'b001010011, 9'd30, 8'd0, i, 2'b00, Gather, 32'd30};			
			in_xpos_inject_1_2_2 = {6'b000001, 9'b001010011, 9'b001010010, 9'd31, 8'd0, i, 2'b00, Gather, 32'd31};
			
			#10;
		end		
		reduce_me_0_0_0 = 0;
		in_xneg_inject_0_0_1 = 0;
		in_yneg_inject_0_1_0 = 0;
		in_xneg_inject_0_1_1 = 0;
		in_zneg_inject_1_0_0 = 0;
		in_xneg_inject_1_0_1 = 0;
		in_yneg_inject_1_1_0 = 0;
		in_xneg_inject_1_1_1 = 0;		
		in_xpos_inject_0_0_3 = 0;
		in_xpos_inject_0_0_2 = 0;
		in_yneg_inject_0_1_3 = 0;
		in_xpos_inject_0_1_2 = 0;
		in_zneg_inject_1_0_3 = 0;
		in_xpos_inject_1_0_2 = 0;
		in_yneg_inject_1_1_3 = 0;
		in_xpos_inject_1_1_2 = 0;		
		in_ypos_inject_0_3_0 = 0;
		in_xneg_inject_0_3_1 = 0;
		in_ypos_inject_0_2_0 = 0;
		in_xneg_inject_0_2_1 = 0;
		in_zneg_inject_1_3_0 = 0;
		in_xneg_inject_1_3_1 = 0;
		in_ypos_inject_1_2_0 = 0;
		in_xneg_inject_1_2_1 = 0;
		in_xpos_inject_0_3_3 = 0;
		in_xpos_inject_0_3_2 = 0;
		in_ypos_inject_0_2_3 = 0;
		in_xpos_inject_0_2_2 = 0;
		in_zneg_inject_1_3_3 = 0;
		in_xpos_inject_1_3_2 = 0;
		in_ypos_inject_1_2_3 = 0;
		in_xpos_inject_1_2_2 = 0;*/
		
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//allgather
		
		for(i=0;i<1;i=i+1)begin
		
			in_xpos_inject_0_0_0 = {6'b000001, ONE, 	  ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_0_0 = {6'b000011, TWO, 	  ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_0_0 = {6'b000101, FOUR, 	  ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_0_0_0 = {6'b000111, EIGHT,   ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_0_0 = {6'b001001, SIXTEEN, ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_0_0_1 = {6'b000001, ZERO, 	    ONE, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_0_1 = {6'b000011, THREE, 	 ONE, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_0_1 = {6'b000101, FIVE, 		 ONE, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_0_0_1 = {6'b000111, NINE, 		 ONE, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_0_1 = {6'b001001, SEVENTEEN, ONE, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_0_1_0 = {6'b000001, THREE, 	TWO, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_1_0 = {6'b000011, ZERO, 		TWO, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_1_0 = {6'b000101, SIX, 		TWO, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_0_1_0 = {6'b000111, TEN, 		TWO, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_1_0 = {6'b001001, EIGHTEEN, TWO, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_0_1_1 = {6'b000001, TWO, 	   THREE, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_1_1 = {6'b000011, ONE, 		THREE, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_1_1 = {6'b000101, SEVEN,    THREE, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_0_1_1 = {6'b000111, ELEVEN,   THREE, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_1_1 = {6'b001001, NINETEEN, THREE, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_1_0_0 = {6'b000001, FIVE,   FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_0_0 = {6'b000011, SIX, 	 FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_0_0 = {6'b000101, ZERO, 	 FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_0_0 = {6'b000111, TWELVE, FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_0_0 = {6'b001001, TWENTY, FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
		
			in_xneg_inject_1_0_1 = {6'b000001, FOUR, 		 FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_0_1 = {6'b000011, SEVEN,	    FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_0_1 = {6'b000101, ONE,		 FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_1_0_1 = {6'b000111, THIRTEEN,  FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_0_1 = {6'b001001, TWENTYONE, FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_1_1_0 = {6'b000001, SEVEN, 	 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_1_0 = {6'b000011, FOUR, 		 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_1_0 = {6'b000101, TWO, 		 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_1_0 = {6'b000111, FOURTEEN,  SIX, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_1_0 = {6'b001001, TWENTYTWO, SIX, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_1_1_1 = {6'b000001, SIX, 			SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_1_1 = {6'b000011, FIVE, 			SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_1_1 = {6'b000101, THREE, 		SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_1_1_1 = {6'b000111, FIFTEEN, 		SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_1_1 = {6'b001001, TWENTYTHREE, SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_0_0_3 = {6'b000001, NINE, 		  EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_0_3 = {6'b000011, TEN, 		  EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_0_3 = {6'b000101, TWELVE, 	  EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_0_0_3 = {6'b000111, ZERO, 		  EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_0_3 = {6'b001001, TWENTYFOUR, EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_0_0_2 = {6'b000001, EIGHT, 	  NINE, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_0_2 = {6'b000011, ELEVEN, 	  NINE, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_0_2 = {6'b000101, THIRTEEN,	  NINE, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_0_0_2 = {6'b000111, ONE, 		  NINE, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_0_2 = {6'b001001, TWENTYFIVE, NINE, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_0_1_3 = {6'b000001, ELEVEN, 	 TEN, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_1_3 = {6'b000011, EIGHT, 	 TEN, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_1_3 = {6'b000101, FOURTEEN,  TEN, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_0_1_3 = {6'b000111, TWO,		 TEN, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_1_3 = {6'b001001, TWENTYSIX, TEN, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_0_1_2 = {6'b000001, TEN, 			ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_1_2 = {6'b000011, NINE, 			ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_1_2 = {6'b000101, FIFTEEN, 		ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_0_1_2 = {6'b000111, THREE, 		ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_1_3 = {6'b001001, TWENTYSEVEN, ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_1_0_3 = {6'b000001, THIRTEEN, 	TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_0_3 = {6'b000011, FOURTEEN, 	TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_0_3 = {6'b000101, EIGHT, 		TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_1_0_3 = {6'b000111, FOUR, 			TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_0_3 = {6'b001001, TWENTYEIGHT, TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_1_0_2 = {6'b000001, TWELVE,     THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_0_2 = {6'b000011, FIFTEEN,    THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_0_2 = {6'b000101, NINE, 		  THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_0_2 = {6'b000111, FIVE, 		  THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_0_2 = {6'b001001, TWENTYNINE, THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_1_1_3 = {6'b000001, FIFTEEN,  FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_1_3 = {6'b000011, TWELVE,   FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_1_3 = {6'b000101, TEN,      FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_1_1_3 = {6'b000111, SIX,      FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_1_3 = {6'b001001, THIRTY,   FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_1_1_2 = {6'b000001, FOURTEEN,  FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_1_2 = {6'b000011, THIRTEEN,  FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_1_2 = {6'b000101, ELEVEN,    FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_1_2 = {6'b000111, SEVEN,     FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_1_2 = {6'b001001, THIRTYONE, FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			//////////////////////////////////////////////////////////////////////////////////////////////////////
			
			in_xpos_inject_0_3_0 = {6'b000001, SEVENTEEN,  SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_3_0 = {6'b000011, EIGHTEEN,   SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_3_0 = {6'b000101, TWENTY, 	  SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_0_3_0 = {6'b000111, TWENTYFOUR, SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_3_0 = {6'b001001, ZERO, 		  SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_0_3_1 = {6'b000001, SIXTEEN,    SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_3_1 = {6'b000011, NINETEEN,   SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_3_1 = {6'b000101, TWENTYONE,  SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_0_3_1 = {6'b000111, TWENTYFIVE, SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_3_1 = {6'b001001, ONE, 		  SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_0_2_0 = {6'b000001, NINETEEN,  EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_2_0 = {6'b000011, SIXTEEN, 	 EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_2_0 = {6'b000101, TWENTYTWO, EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_0_2_0 = {6'b000111, TWENTYSIX, EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_2_0 = {6'b001001, TWO, 		 EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllGather, 32'd6};

			in_xneg_inject_0_2_1 = {6'b000001, EIGHTEEN,		NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_2_1 = {6'b000011, SEVENTEEN, 	NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_2_1 = {6'b000101, TWENTYTHREE, NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_0_2_1 = {6'b000111, TWENTYSEVEN, NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_2_1 = {6'b001001, THREE, 		NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllGather, 32'd6};

			in_xpos_inject_1_3_0 = {6'b000001, TWENTYONE,   TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_3_0 = {6'b000011, TWENTYTWO, 	TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_3_0 = {6'b000101, SIXTEEN, 	 	TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_3_0 = {6'b000111, TWENTYEIGHT, TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_3_0 = {6'b001001, FOUR, 			TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
		
			in_xneg_inject_1_3_1 = {6'b000001, TWENTY, 		TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_3_1 = {6'b000011, TWENTYTHREE,	TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_3_1 = {6'b000101, SEVENTEEN,	TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_1_3_1 = {6'b000111, TWENTYNINE,  TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_3_1 = {6'b001001, FIVE, 			TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_1_2_0 = {6'b000001, TWENTYTHREE, TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_2_0 = {6'b000011, TWENTY, 		TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_2_0 = {6'b000101, EIGHTEEN, 	TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_2_0 = {6'b000111, THIRTY,  		TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_2_0 = {6'b001001, SIX, 			TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_1_2_1 = {6'b000001, TWENTYTWO, 	TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_2_1 = {6'b000011, TWENTYONE, 	TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_2_1 = {6'b000101, NINETEEN, 	TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_1_2_1 = {6'b000111, THIRTYONE, 	TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_2_1 = {6'b001001, SEVEN, 		TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_0_3_3 = {6'b000001, TWENTYFIVE, 	TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_3_3 = {6'b000011, TWENTYSIX, 	TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_3_3 = {6'b000101, TWENTYEIGHT, TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_0_3_3 = {6'b000111, SIXTEEN, 		TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_3_3 = {6'b001001, EIGHT, 		TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_0_3_2 = {6'b000001, TWENTYFOUR, 	TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_3_2 = {6'b000011, TWENTYSEVEN, TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_3_2 = {6'b000101, TWENTYNINE,	TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_0_3_2 = {6'b000111, SEVENTEEN, 	TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_3_2 = {6'b001001, NINE, 			TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_0_2_3 = {6'b000001, TWENTYSEVEN, TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_2_3 = {6'b000011, TWENTYFOUR, 	TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_2_3 = {6'b000101, THIRTY,  		TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_0_2_3 = {6'b000111, EIGHTEEN,		TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_2_3 = {6'b001001, TEN, 			TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_0_2_2 = {6'b000001, TWENTYSIX, 	TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_2_2 = {6'b000011, TWENTYFIVE, 	TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_2_2 = {6'b000101, THIRTYONE, 	TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_0_2_2 = {6'b000111, NINETEEN, 	TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_2_3 = {6'b001001, ELEVEN, 		TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_1_3_3 = {6'b000001, TWENTYNINE, 	TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_3_3 = {6'b000011, THIRTY, 		TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_3_3 = {6'b000101, TWENTYFOUR, 	TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_1_3_3 = {6'b000111, TWENTY, 		TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_3_3 = {6'b001001, TWELVE, 		TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_1_3_2 = {6'b000001, TWENTYEIGHT, TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_3_2 = {6'b000011, THIRTYONE,   TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_3_2 = {6'b000101, TWENTYFIVE, 	TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_3_2 = {6'b000111, TWENTYONE, 	TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_3_2 = {6'b001001, THIRTEEN, 	TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_1_2_3 = {6'b000001, THIRTYONE,   THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_2_3 = {6'b000011, TWENTYEIGHT, THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_2_3 = {6'b000101, TWENTYSIX,   THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_1_2_3 = {6'b000111, TWENTYTWO,   THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_2_3 = {6'b001001, FOURTEEN,   	THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_1_2_2 = {6'b000001, THIRTY,  		THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_2_2 = {6'b000011, TWENTYNINE,  THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_2_2 = {6'b000101, TWENTYSEVEN, THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_2_2 = {6'b000111, TWENTYTHREE, THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_2_2 = {6'b001001, FIFTEEN, 		THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			#10;
			
		end		
		
		in_xpos_inject_0_0_0 = 0;
		in_ypos_inject_0_0_0 = 0;
		in_zpos_inject_0_0_0 = 0;
		in_xneg_inject_0_0_0 = 0;
		in_yneg_inject_0_0_0 = 0;
		in_zneg_inject_0_0_0 = 0;
		reduce_me_0_0_0 = 0;
		in_xpos_inject_0_0_1 = 0;
		in_ypos_inject_0_0_1 = 0;
		in_zpos_inject_0_0_1 = 0;
		in_xneg_inject_0_0_1 = 0;
		in_yneg_inject_0_0_1 = 0;
		in_zneg_inject_0_0_1 = 0;
		reduce_me_0_0_1 = 0;
		in_xpos_inject_0_1_0 = 0;
		in_ypos_inject_0_1_0 = 0;
		in_zpos_inject_0_1_0 = 0;
		in_xneg_inject_0_1_0 = 0;
		in_yneg_inject_0_1_0 = 0;
		in_zneg_inject_0_1_0 = 0;
		reduce_me_0_1_0 = 0;
		in_xpos_inject_0_1_1 = 0;
		in_ypos_inject_0_1_1 = 0;
		in_zpos_inject_0_1_1 = 0;
		in_xneg_inject_0_1_1 = 0;
		in_yneg_inject_0_1_1 = 0;
		in_zneg_inject_0_1_1 = 0;
		reduce_me_0_1_1 = 0;
		in_xpos_inject_1_0_0 = 0;
		in_ypos_inject_1_0_0 = 0;
		in_zpos_inject_1_0_0 = 0;
		in_xneg_inject_1_0_0 = 0;
		in_yneg_inject_1_0_0 = 0;
		in_zneg_inject_1_0_0 = 0;
		reduce_me_1_0_0 = 0;
		in_xpos_inject_1_0_1 = 0;
		in_ypos_inject_1_0_1 = 0;
		in_zpos_inject_1_0_1 = 0;
		in_xneg_inject_1_0_1 = 0;
		in_yneg_inject_1_0_1 = 0;
		in_zneg_inject_1_0_1 = 0;
		reduce_me_1_0_1 = 0;
		in_xpos_inject_1_1_0 = 0;
		in_ypos_inject_1_1_0 = 0;
		in_zpos_inject_1_1_0 = 0;
		in_xneg_inject_1_1_0 = 0;
		in_yneg_inject_1_1_0 = 0;
		in_zneg_inject_1_1_0 = 0;
		reduce_me_1_1_0 = 0;
		in_xpos_inject_1_1_1 = 0;
		in_ypos_inject_1_1_1 = 0;
		in_zpos_inject_1_1_1 = 0;
		in_xneg_inject_1_1_1 = 0;
		in_yneg_inject_1_1_1 = 0;
		in_zneg_inject_1_1_1 = 0;
		reduce_me_1_1_1 = 0;
		in_xpos_inject_0_0_3 = 0;
		in_ypos_inject_0_0_3 = 0;
		in_zpos_inject_0_0_3 = 0;
		in_xneg_inject_0_0_3 = 0;
		in_yneg_inject_0_0_3 = 0;
		in_zneg_inject_0_0_3 = 0;
		reduce_me_0_0_3 = 0;
		in_xpos_inject_0_0_2 = 0;
		in_ypos_inject_0_0_2 = 0;
		in_zpos_inject_0_0_2 = 0;
		in_xneg_inject_0_0_2 = 0;
		in_yneg_inject_0_0_2 = 0;
		in_zneg_inject_0_0_2 = 0;
		reduce_me_0_0_2 = 0;
		in_xpos_inject_0_1_3 = 0;
		in_ypos_inject_0_1_3 = 0;
		in_zpos_inject_0_1_3 = 0;
		in_xneg_inject_0_1_3 = 0;
		in_yneg_inject_0_1_3 = 0;
		in_zneg_inject_0_1_3 = 0;
		reduce_me_0_1_3 = 0;
		in_xpos_inject_0_1_2 = 0;
		in_ypos_inject_0_1_2 = 0;
		in_zpos_inject_0_1_2 = 0;
		in_xneg_inject_0_1_2 = 0;
		in_yneg_inject_0_1_2 = 0;
		in_zneg_inject_0_1_2 = 0;
		reduce_me_0_1_2 = 0;
		in_xpos_inject_1_0_3 = 0;
		in_ypos_inject_1_0_3 = 0;
		in_zpos_inject_1_0_3 = 0;
		in_xneg_inject_1_0_3 = 0;
		in_yneg_inject_1_0_3 = 0;
		in_zneg_inject_1_0_3 = 0;
		reduce_me_1_0_3 = 0;
		in_xpos_inject_1_0_2 = 0;
		in_ypos_inject_1_0_2 = 0;
		in_zpos_inject_1_0_2 = 0;
		in_xneg_inject_1_0_2 = 0;
		in_yneg_inject_1_0_2 = 0;
		in_zneg_inject_1_0_2 = 0;
		reduce_me_1_0_2 = 0;
		in_xpos_inject_1_1_3 = 0;
		in_ypos_inject_1_1_3 = 0;
		in_zpos_inject_1_1_3 = 0;
		in_xneg_inject_1_1_3 = 0;
		in_yneg_inject_1_1_3 = 0;
		in_zneg_inject_1_1_3 = 0;
		reduce_me_1_1_3 = 0;
		in_xpos_inject_1_1_2 = 0;
		in_ypos_inject_1_1_2 = 0;
		in_zpos_inject_1_1_2 = 0;
		in_xneg_inject_1_1_2 = 0;
		in_yneg_inject_1_1_2 = 0;
		in_zneg_inject_1_1_2 = 0;
		reduce_me_1_1_2 = 0;
		in_xpos_inject_0_3_0 = 0;
		in_ypos_inject_0_3_0 = 0;
		in_zpos_inject_0_3_0 = 0;
		in_xneg_inject_0_3_0 = 0;
		in_yneg_inject_0_3_0 = 0;
		in_zneg_inject_0_3_0 = 0;
		reduce_me_0_3_0 = 0;
		in_xpos_inject_0_3_1 = 0;
		in_ypos_inject_0_3_1 = 0;
		in_zpos_inject_0_3_1 = 0;
		in_xneg_inject_0_3_1 = 0;
		in_yneg_inject_0_3_1 = 0;
		in_zneg_inject_0_3_1 = 0;
		reduce_me_0_3_1 = 0;
		in_xpos_inject_0_2_0 = 0;
		in_ypos_inject_0_2_0 = 0;
		in_zpos_inject_0_2_0 = 0;
		in_xneg_inject_0_2_0 = 0;
		in_yneg_inject_0_2_0 = 0;
		in_zneg_inject_0_2_0 = 0;
		reduce_me_0_2_0 = 0;
		in_xpos_inject_0_2_1 = 0;
		in_ypos_inject_0_2_1 = 0;
		in_zpos_inject_0_2_1 = 0;
		in_xneg_inject_0_2_1 = 0;
		in_yneg_inject_0_2_1 = 0;
		in_zneg_inject_0_2_1 = 0;
		reduce_me_0_2_1 = 0;
		in_xpos_inject_1_3_0 = 0;
		in_ypos_inject_1_3_0 = 0;
		in_zpos_inject_1_3_0 = 0;
		in_xneg_inject_1_3_0 = 0;
		in_yneg_inject_1_3_0 = 0;
		in_zneg_inject_1_3_0 = 0;
		reduce_me_1_3_0 = 0;
		in_xpos_inject_1_3_1 = 0;
		in_ypos_inject_1_3_1 = 0;
		in_zpos_inject_1_3_1 = 0;
		in_xneg_inject_1_3_1 = 0;
		in_yneg_inject_1_3_1 = 0;
		in_zneg_inject_1_3_1 = 0;
		reduce_me_1_3_1 = 0;
		in_xpos_inject_1_2_0 = 0;
		in_ypos_inject_1_2_0 = 0;
		in_zpos_inject_1_2_0 = 0;
		in_xneg_inject_1_2_0 = 0;
		in_yneg_inject_1_2_0 = 0;
		in_zneg_inject_1_2_0 = 0;
		reduce_me_1_2_0 = 0;
		in_xpos_inject_1_2_1 = 0;
		in_ypos_inject_1_2_1 = 0;
		in_zpos_inject_1_2_1 = 0;
		in_xneg_inject_1_2_1 = 0;
		in_yneg_inject_1_2_1 = 0;
		in_zneg_inject_1_2_1 = 0;
		reduce_me_1_2_1 = 0;
		in_xpos_inject_0_3_3 = 0;
		in_ypos_inject_0_3_3 = 0;
		in_zpos_inject_0_3_3 = 0;
		in_xneg_inject_0_3_3 = 0;
		in_yneg_inject_0_3_3 = 0;
		in_zneg_inject_0_3_3 = 0;
		reduce_me_0_3_3 = 0;
		in_xpos_inject_0_3_2 = 0;
		in_ypos_inject_0_3_2 = 0;
		in_zpos_inject_0_3_2 = 0;
		in_xneg_inject_0_3_2 = 0;
		in_yneg_inject_0_3_2 = 0;
		in_zneg_inject_0_3_2 = 0;
		reduce_me_0_3_2 = 0;
		in_xpos_inject_0_2_3 = 0;
		in_ypos_inject_0_2_3 = 0;
		in_zpos_inject_0_2_3 = 0;
		in_xneg_inject_0_2_3 = 0;
		in_yneg_inject_0_2_3 = 0;
		in_zneg_inject_0_2_3 = 0;
		reduce_me_0_2_3 = 0;
		in_xpos_inject_0_2_2 = 0;
		in_ypos_inject_0_2_2 = 0;
		in_zpos_inject_0_2_2 = 0;
		in_xneg_inject_0_2_2 = 0;
		in_yneg_inject_0_2_2 = 0;
		in_zneg_inject_0_2_2 = 0;
		reduce_me_0_2_2 = 0;
		in_xpos_inject_1_3_3 = 0;
		in_ypos_inject_1_3_3 = 0;
		in_zpos_inject_1_3_3 = 0;
		in_xneg_inject_1_3_3 = 0;
		in_yneg_inject_1_3_3 = 0;
		in_zneg_inject_1_3_3 = 0;
		reduce_me_1_3_3 = 0;
		in_xpos_inject_1_3_2 = 0;
		in_ypos_inject_1_3_2 = 0;
		in_zpos_inject_1_3_2 = 0;
		in_xneg_inject_1_3_2 = 0;
		in_yneg_inject_1_3_2 = 0;
		in_zneg_inject_1_3_2 = 0;
		reduce_me_1_3_2 = 0;
		in_xpos_inject_1_2_3 = 0;
		in_ypos_inject_1_2_3 = 0;
		in_zpos_inject_1_2_3 = 0;
		in_xneg_inject_1_2_3 = 0;
		in_yneg_inject_1_2_3 = 0;
		in_zneg_inject_1_2_3 = 0;
		reduce_me_1_2_3 = 0;
		in_xpos_inject_1_2_2 = 0;
		in_ypos_inject_1_2_2 = 0;
		in_zpos_inject_1_2_2 = 0;
		in_xneg_inject_1_2_2 = 0;
		in_yneg_inject_1_2_2 = 0;
		in_zneg_inject_1_2_2 = 0;
		reduce_me_1_2_2 = 0;

	end
	
	always begin
		#5 clk = !clk;
	end
      
endmodule


 
