`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:32:08 07/19/2018
// Design Name:   network_16
// Module Name:   C:/Users/joshtern/MPI-Collective-Router/network_16_tb.v
// Project Name:  MPI-Collective-Router
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: network_16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module network_16_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [181:0] in_xpos_inject_0_0_0;
	reg [181:0] in_ypos_inject_0_0_0;
	reg [181:0] in_zpos_inject_0_0_0;
	reg [181:0] in_xneg_inject_0_0_0;
	reg [181:0] in_yneg_inject_0_0_0;
	reg [181:0] in_zneg_inject_0_0_0;
	reg [181:0] reduce_me_0_0_0;
	reg [71:0] newcomm_0_0_0;
	reg [181:0] in_xpos_inject_0_0_1;
	reg [181:0] in_ypos_inject_0_0_1;
	reg [181:0] in_zpos_inject_0_0_1;
	reg [181:0] in_xneg_inject_0_0_1;
	reg [181:0] in_yneg_inject_0_0_1;
	reg [181:0] in_zneg_inject_0_0_1;
	reg [181:0] reduce_me_0_0_1;
	reg [71:0] newcomm_0_0_1;
	reg [181:0] in_xpos_inject_0_1_0;
	reg [181:0] in_ypos_inject_0_1_0;
	reg [181:0] in_zpos_inject_0_1_0;
	reg [181:0] in_xneg_inject_0_1_0;
	reg [181:0] in_yneg_inject_0_1_0;
	reg [181:0] in_zneg_inject_0_1_0;
	reg [181:0] reduce_me_0_1_0;
	reg [71:0] newcomm_0_1_0;
	reg [181:0] in_xpos_inject_0_1_1;
	reg [181:0] in_ypos_inject_0_1_1;
	reg [181:0] in_zpos_inject_0_1_1;
	reg [181:0] in_xneg_inject_0_1_1;
	reg [181:0] in_yneg_inject_0_1_1;
	reg [181:0] in_zneg_inject_0_1_1;
	reg [181:0] reduce_me_0_1_1;
	reg [71:0] newcomm_0_1_1;
	reg [181:0] in_xpos_inject_1_0_0;
	reg [181:0] in_ypos_inject_1_0_0;
	reg [181:0] in_zpos_inject_1_0_0;
	reg [181:0] in_xneg_inject_1_0_0;
	reg [181:0] in_yneg_inject_1_0_0;
	reg [181:0] in_zneg_inject_1_0_0;
	reg [181:0] reduce_me_1_0_0;
	reg [71:0] newcomm_1_0_0;
	reg [181:0] in_xpos_inject_1_0_1;
	reg [181:0] in_ypos_inject_1_0_1;
	reg [181:0] in_zpos_inject_1_0_1;
	reg [181:0] in_xneg_inject_1_0_1;
	reg [181:0] in_yneg_inject_1_0_1;
	reg [181:0] in_zneg_inject_1_0_1;
	reg [181:0] reduce_me_1_0_1;
	reg [71:0] newcomm_1_0_1;
	reg [181:0] in_xpos_inject_1_1_0;
	reg [181:0] in_ypos_inject_1_1_0;
	reg [181:0] in_zpos_inject_1_1_0;
	reg [181:0] in_xneg_inject_1_1_0;
	reg [181:0] in_yneg_inject_1_1_0;
	reg [181:0] in_zneg_inject_1_1_0;
	reg [181:0] reduce_me_1_1_0;
	reg [71:0] newcomm_1_1_0;
	reg [181:0] in_xpos_inject_1_1_1;
	reg [181:0] in_ypos_inject_1_1_1;
	reg [181:0] in_zpos_inject_1_1_1;
	reg [181:0] in_xneg_inject_1_1_1;
	reg [181:0] in_yneg_inject_1_1_1;
	reg [181:0] in_zneg_inject_1_1_1;
	reg [181:0] reduce_me_1_1_1;
	reg [71:0] newcomm_1_1_1;
	reg [181:0] in_xpos_inject_0_0_3;
	reg [181:0] in_ypos_inject_0_0_3;
	reg [181:0] in_zpos_inject_0_0_3;
	reg [181:0] in_xneg_inject_0_0_3;
	reg [181:0] in_yneg_inject_0_0_3;
	reg [181:0] in_zneg_inject_0_0_3;
	reg [181:0] reduce_me_0_0_3;
	reg [71:0] newcomm_0_0_3;
	reg [181:0] in_xpos_inject_0_0_2;
	reg [181:0] in_ypos_inject_0_0_2;
	reg [181:0] in_zpos_inject_0_0_2;
	reg [181:0] in_xneg_inject_0_0_2;
	reg [181:0] in_yneg_inject_0_0_2;
	reg [181:0] in_zneg_inject_0_0_2;
	reg [181:0] reduce_me_0_0_2;
	reg [71:0] newcomm_0_0_2;
	reg [181:0] in_xpos_inject_0_1_3;
	reg [181:0] in_ypos_inject_0_1_3;
	reg [181:0] in_zpos_inject_0_1_3;
	reg [181:0] in_xneg_inject_0_1_3;
	reg [181:0] in_yneg_inject_0_1_3;
	reg [181:0] in_zneg_inject_0_1_3;
	reg [181:0] reduce_me_0_1_3;
	reg [71:0] newcomm_0_1_3;
	reg [181:0] in_xpos_inject_0_1_2;
	reg [181:0] in_ypos_inject_0_1_2;
	reg [181:0] in_zpos_inject_0_1_2;
	reg [181:0] in_xneg_inject_0_1_2;
	reg [181:0] in_yneg_inject_0_1_2;
	reg [181:0] in_zneg_inject_0_1_2;
	reg [181:0] reduce_me_0_1_2;
	reg [71:0] newcomm_0_1_2;
	reg [181:0] in_xpos_inject_1_0_3;
	reg [181:0] in_ypos_inject_1_0_3;
	reg [181:0] in_zpos_inject_1_0_3;
	reg [181:0] in_xneg_inject_1_0_3;
	reg [181:0] in_yneg_inject_1_0_3;
	reg [181:0] in_zneg_inject_1_0_3;
	reg [181:0] reduce_me_1_0_3;
	reg [71:0] newcomm_1_0_3;
	reg [181:0] in_xpos_inject_1_0_2;
	reg [181:0] in_ypos_inject_1_0_2;
	reg [181:0] in_zpos_inject_1_0_2;
	reg [181:0] in_xneg_inject_1_0_2;
	reg [181:0] in_yneg_inject_1_0_2;
	reg [181:0] in_zneg_inject_1_0_2;
	reg [181:0] reduce_me_1_0_2;
	reg [71:0] newcomm_1_0_2;
	reg [181:0] in_xpos_inject_1_1_3;
	reg [181:0] in_ypos_inject_1_1_3;
	reg [181:0] in_zpos_inject_1_1_3;
	reg [181:0] in_xneg_inject_1_1_3;
	reg [181:0] in_yneg_inject_1_1_3;
	reg [181:0] in_zneg_inject_1_1_3;
	reg [181:0] reduce_me_1_1_3;
	reg [71:0] newcomm_1_1_3;
	reg [181:0] in_xpos_inject_1_1_2;
	reg [181:0] in_ypos_inject_1_1_2;
	reg [181:0] in_zpos_inject_1_1_2;
	reg [181:0] in_xneg_inject_1_1_2;
	reg [181:0] in_yneg_inject_1_1_2;
	reg [181:0] in_zneg_inject_1_1_2;
	reg [181:0] reduce_me_1_1_2;
	reg [71:0] newcomm_1_1_2;

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
	network_16 uut (
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
		newcomm_0_0_0 = {1'b1, 8'd0, 9'd0, 9'd0, 4'd4, 5'd4, 9'd1, 9'd2, 9'd4, 9'd8};
		
		in_xpos_inject_0_0_1 = 0;
		in_ypos_inject_0_0_1 = 0;
		in_zpos_inject_0_0_1 = 0;
		in_xneg_inject_0_0_1 = 0;
		in_yneg_inject_0_0_1 = 0;
		in_zneg_inject_0_0_1 = 0;
		reduce_me_0_0_1 = 0;
		newcomm_0_0_1 = {1'b1, 8'd0, 9'd0, 9'd1, 4'd0, 5'd4, 9'd0, 9'd3, 9'd5, 9'd9};
		
		in_xpos_inject_0_1_0 = 0;
		in_ypos_inject_0_1_0 = 0;
		in_zpos_inject_0_1_0 = 0;
		in_xneg_inject_0_1_0 = 0;
		in_yneg_inject_0_1_0 = 0;
		in_zneg_inject_0_1_0 = 0;
		reduce_me_0_1_0 = 0;
		newcomm_0_1_0 = {1'b1, 8'd0, 9'd0, 9'd2, 4'd1, 5'd4, 9'd3, 9'd0, 9'd6, 9'd10};
		
		in_xpos_inject_0_1_1 = 0;
		in_ypos_inject_0_1_1 = 0;
		in_zpos_inject_0_1_1 = 0;
		in_xneg_inject_0_1_1 = 0;
		in_yneg_inject_0_1_1 = 0;
		in_zneg_inject_0_1_1 = 0;
		reduce_me_0_1_1 = 0;
		newcomm_0_1_1 = {1'b1, 8'd0, 9'd0, 9'd3, 4'd0, 5'd4, 9'd2, 9'd1, 9'd7, 9'd11};
		
		in_xpos_inject_1_0_0 = 0;
		in_ypos_inject_1_0_0 = 0;
		in_zpos_inject_1_0_0 = 0;
		in_xneg_inject_1_0_0 = 0;
		in_yneg_inject_1_0_0 = 0;
		in_zneg_inject_1_0_0 = 0;
		reduce_me_1_0_0 = 0;
		newcomm_1_0_0 = {1'b1, 8'd0, 9'd0, 9'd4, 4'd2, 5'd4, 9'd5, 9'd6, 9'd0, 9'd12};
		
		in_xpos_inject_1_0_1 = 0;
		in_ypos_inject_1_0_1 = 0;
		in_zpos_inject_1_0_1 = 0;
		in_xneg_inject_1_0_1 = 0;
		in_yneg_inject_1_0_1 = 0;
		in_zneg_inject_1_0_1 = 0;
		reduce_me_1_0_1 = 0;
		newcomm_1_0_1 = {1'b1, 8'd0, 9'd0, 9'd5, 4'd0, 5'd4, 9'd4, 9'd7, 9'd1, 9'd13};
		
		in_xpos_inject_1_1_0 = 0;
		in_ypos_inject_1_1_0 = 0;
		in_zpos_inject_1_1_0 = 0;
		in_xneg_inject_1_1_0 = 0;
		in_yneg_inject_1_1_0 = 0;
		in_zneg_inject_1_1_0 = 0;
		reduce_me_1_1_0 = 0;
		newcomm_1_1_0 = {1'b1, 8'd0, 9'd0, 9'd6, 4'd1, 5'd4, 9'd7, 9'd4, 9'd2, 9'd14};
		
		in_xpos_inject_1_1_1 = 0;
		in_ypos_inject_1_1_1 = 0;
		in_zpos_inject_1_1_1 = 0;
		in_xneg_inject_1_1_1 = 0;
		in_yneg_inject_1_1_1 = 0;
		in_zneg_inject_1_1_1 = 0;
		reduce_me_1_1_1 = 0;
		newcomm_1_1_1 = {1'b1, 8'd0, 9'd0, 9'd7, 4'd0, 5'd4, 9'd6, 9'd5, 9'd3, 9'd15};
		
		in_xpos_inject_0_0_3 = 0;
		in_ypos_inject_0_0_3 = 0;
		in_zpos_inject_0_0_3 = 0;
		in_xneg_inject_0_0_3 = 0;
		in_yneg_inject_0_0_3 = 0;
		in_zneg_inject_0_0_3 = 0;
		reduce_me_0_0_3 = 0;
		newcomm_0_0_3 = {1'b1, 8'd0, 9'd0, 9'd8, 4'd3, 5'd4, 9'd9, 9'd10, 9'd12, 9'd0};
		
		in_xpos_inject_0_0_2 = 0;
		in_ypos_inject_0_0_2 = 0;
		in_zpos_inject_0_0_2 = 0;
		in_xneg_inject_0_0_2 = 0;
		in_yneg_inject_0_0_2 = 0;
		in_zneg_inject_0_0_2 = 0;
		reduce_me_0_0_2 = 0;
		newcomm_0_0_2 = {1'b1, 8'd0, 9'd0, 9'd9, 4'd0, 5'd4, 9'd8, 9'd11, 9'd13, 9'd1};
		
		in_xpos_inject_0_1_3 = 0;
		in_ypos_inject_0_1_3 = 0;
		in_zpos_inject_0_1_3 = 0;
		in_xneg_inject_0_1_3 = 0;
		in_yneg_inject_0_1_3 = 0;
		in_zneg_inject_0_1_3 = 0;
		reduce_me_0_1_3 = 0;
		newcomm_0_1_3 = {1'b1, 8'd0, 9'd0, 9'd10, 4'd1, 5'd4, 9'd11, 9'd8, 9'd14, 9'd2};
		
		in_xpos_inject_0_1_2 = 0;
		in_ypos_inject_0_1_2 = 0;
		in_zpos_inject_0_1_2 = 0;
		in_xneg_inject_0_1_2 = 0;
		in_yneg_inject_0_1_2 = 0;
		in_zneg_inject_0_1_2 = 0;
		reduce_me_0_1_2 = 0;
		newcomm_0_1_2 = {1'b1, 8'd0, 9'd0, 9'd11, 4'd0, 5'd4, 9'd10, 9'd9, 9'd15, 9'd3};
		
		in_xpos_inject_1_0_3 = 0;
		in_ypos_inject_1_0_3 = 0;
		in_zpos_inject_1_0_3 = 0;
		in_xneg_inject_1_0_3 = 0;
		in_yneg_inject_1_0_3 = 0;
		in_zneg_inject_1_0_3 = 0;
		reduce_me_1_0_3 = 0;
		newcomm_1_0_3 = {1'b1, 8'd0, 9'd0, 9'd12, 4'd2, 5'd4, 9'd13, 9'd14, 9'd8, 9'd4};
		
		in_xpos_inject_1_0_2 = 0;
		in_ypos_inject_1_0_2 = 0;
		in_zpos_inject_1_0_2 = 0;
		in_xneg_inject_1_0_2 = 0;
		in_yneg_inject_1_0_2 = 0;
		in_zneg_inject_1_0_2 = 0;
		reduce_me_1_0_2 = 0;
		newcomm_1_0_2 = {1'b1, 8'd0, 9'd0, 9'd13, 4'd0, 5'd4, 9'd12, 9'd15, 9'd9, 9'd5};
		
		in_xpos_inject_1_1_3 = 0;
		in_ypos_inject_1_1_3 = 0;
		in_zpos_inject_1_1_3 = 0;
		in_xneg_inject_1_1_3 = 0;
		in_yneg_inject_1_1_3 = 0;
		in_zneg_inject_1_1_3 = 0;
		reduce_me_1_1_3 = 0;
		newcomm_1_1_3 = {1'b1, 8'd0, 9'd0, 9'd14, 4'd1, 5'd4, 9'd15, 9'd12, 9'd10, 9'd6};
		
		in_xpos_inject_1_1_2 = 0;
		in_ypos_inject_1_1_2 = 0;
		in_zpos_inject_1_1_2 = 0;
		in_xneg_inject_1_1_2 = 0;
		in_yneg_inject_1_1_2 = 0;
		in_zneg_inject_1_1_2 = 0;
		reduce_me_1_1_2 = 0;
		newcomm_1_1_2 = {1'b1, 8'd0, 9'd0, 9'd15, 4'd0, 5'd4, 9'd14, 9'd13, 9'd11, 9'd7};

				// Wait 100 ns for global reset to finish
		#105;
		rst = 0;
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//reduce
		
		for(i=0;i<1;i=i+1)begin
			reduce_me_0_0_0 = {5'b01001, 9'b000000000, 9'b000000000, 9'd0, 8'd0, i, 2'b00, ShortReduce, 128'd6};
			
			in_xneg_inject_0_0_1 = {5'b00001, 9'b000000000, 9'b000000001, 9'd1, 8'd0, i, 2'b00, ShortReduce, 128'd6};
			
			in_yneg_inject_0_1_0 = {5'b00011, 9'b000000000, 9'b000001000, 9'd2, 8'd0, i, 2'b00, ShortReduce, 128'd6};
			
			in_xneg_inject_0_1_1 = {5'b00001, 9'b000001000, 9'b000001001, 9'd3, 8'd0, i, 2'b00, ShortReduce, 128'd6};
			
			in_zneg_inject_1_0_0 = {5'b00101, 9'b000000000, 9'b001000000, 9'd4, 8'd0, i, 2'b00, ShortReduce, 128'd6};
			
			in_xneg_inject_1_0_1 = {5'b00001, 9'b001000000, 9'b001000001, 9'd5, 8'd0, i, 2'b00, ShortReduce, 128'd6};
	
			in_yneg_inject_1_1_0 = {5'b00011, 9'b001000000, 9'b001001000, 9'd6, 8'd0, i, 2'b00, ShortReduce, 128'd6};
			
			in_xneg_inject_1_1_1 = {5'b00001, 9'b001001000, 9'b001001001, 9'd7, 8'd0, i, 2'b00, ShortReduce, 128'd6};
			
			in_xpos_inject_0_0_3 = {5'b00111, 9'b000000000, 9'b000000011, 9'd8, 8'd0, i, 2'b00, ShortReduce, 128'd6};
			
			in_xpos_inject_0_0_2 = {5'b00001, 9'b000000011, 9'b000000010, 9'd9, 8'd0, i, 2'b00, ShortReduce, 128'd6};
			
			in_yneg_inject_0_1_3 = {5'b00011, 9'b000000011, 9'b000001011, 9'd10, 8'd0, i, 2'b00, ShortReduce, 128'd6};
		
			in_xpos_inject_0_1_2 = {5'b00001, 9'b000001011, 9'b000001010, 9'd11, 8'd0, i, 2'b00, ShortReduce, 128'd6};
			
			in_zneg_inject_1_0_3 = {5'b00101, 9'b000000011, 9'b001000011, 9'd12, 8'd0, i, 2'b00, ShortReduce, 128'd6};
			
			in_xpos_inject_1_0_2 = {5'b00001, 9'b001000011, 9'b001000010, 9'd13, 8'd0, i, 2'b00, ShortReduce, 128'd6};
	
			in_yneg_inject_1_1_3 = {5'b00011, 9'b001000011, 9'b001001011, 9'd14, 8'd0, i, 2'b00, ShortReduce, 128'd6};
			
			in_xpos_inject_1_1_2 = {5'b00001, 9'b001001011, 9'b001001010, 9'd15, 8'd0, i, 2'b00, ShortReduce, 128'd6};
			
			#2;
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
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//allreduce
				
		/*for(i=0;i<128;i=i+1)begin
		
				  reduce_me_0_0_0 = {5'b01001, 9'b000000000, 9'b000000000, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_0_0 = {5'b00001, 9'b000000001, 9'b000000000, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_0_0 = {5'b00011, 9'b000001000, 9'b000000000, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_0_0 = {5'b00101, 9'b001000000, 9'b000000000, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_0_0 = {5'b00111, 9'b000000011, 9'b000000000, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_0_1 = {5'b01001, 9'b000000001, 9'b000000001, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_0_1 = {5'b00001, 9'b000000000, 9'b000000001, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_0_1 = {5'b00011, 9'b000001001, 9'b000000001, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_0_1 = {5'b00101, 9'b001000001, 9'b000000001, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_0_1 = {5'b00111, 9'b000000010, 9'b000000001, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_1_0 = {5'b01001, 9'b000001000, 9'b000001000, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_1_0 = {5'b00001, 9'b000001001, 9'b000001000, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_1_0 = {5'b00011, 9'b000000000, 9'b000001000, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_1_0 = {5'b00101, 9'b001001000, 9'b000001000, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_1_0 = {5'b00111, 9'b000001011, 9'b000001000, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_1_1 = {5'b01001, 9'b000001001, 9'b000001001, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_1_1 = {5'b00001, 9'b000001000, 9'b000001001, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_1_1 = {5'b00011, 9'b000000001, 9'b000001001, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_1_1 = {5'b00101, 9'b001001001, 9'b000001001, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_1_1 = {5'b00111, 9'b000001010, 9'b000001001, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_0_0 = {5'b01001, 9'b001000000, 9'b001000000, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_0_0 = {5'b00001, 9'b001000001, 9'b001000000, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_0_0 = {5'b00011, 9'b001001000, 9'b001000000, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_0_0 = {5'b00101, 9'b000000000, 9'b001000000, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_0_0 = {5'b00111, 9'b001000011, 9'b001000000, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_0_1 = {5'b01001, 9'b001000001, 9'b001000001, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_0_1 = {5'b00001, 9'b001000000, 9'b001000001, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_0_1 = {5'b00011, 9'b001001001, 9'b001000001, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_0_1 = {5'b00101, 9'b000000001, 9'b001000001, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_0_1 = {5'b00111, 9'b001000010, 9'b001000001, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_1_0 = {5'b01001, 9'b001001000, 9'b001001000, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_1_0 = {5'b00001, 9'b001001001, 9'b001001000, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_1_0 = {5'b00011, 9'b001000000, 9'b001001000, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_1_0 = {5'b00101, 9'b000001000, 9'b001001000, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_1_0 = {5'b00111, 9'b001001011, 9'b001001000, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_1_1 = {5'b01001, 9'b001001001, 9'b001001001, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_1_1 = {5'b00001, 9'b001001000, 9'b001001001, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_1_1 = {5'b00011, 9'b001000001, 9'b001001001, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_1_1 = {5'b00101, 9'b000001001, 9'b001001001, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_1_1 = {5'b00111, 9'b001001010, 9'b001001001, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_0_3 = {5'b01001, 9'b000000011, 9'b000000011, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_0_3 = {5'b00001, 9'b000000010, 9'b000000011, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_0_3 = {5'b00011, 9'b000001011, 9'b000000011, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_0_3 = {5'b00101, 9'b001000011, 9'b000000011, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_0_3 = {5'b00111, 9'b000000000, 9'b000000011, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_0_2 = {5'b01001, 9'b000000010, 9'b000000010, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_0_2 = {5'b00001, 9'b000000011, 9'b000000010, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_0_2 = {5'b00011, 9'b000001010, 9'b000000010, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_0_2 = {5'b00101, 9'b001000010, 9'b000000010, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_0_2 = {5'b00111, 9'b000000001, 9'b000000010, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_1_3 = {5'b01001, 9'b000001011, 9'b000001011, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_1_3 = {5'b00001, 9'b000001010, 9'b000001011, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_1_3 = {5'b00011, 9'b000000011, 9'b000001011, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_1_3 = {5'b00101, 9'b001001011, 9'b000001011, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_1_3 = {5'b00111, 9'b000001000, 9'b000001011, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_1_2 = {5'b01001, 9'b000001010, 9'b000001010, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_1_2 = {5'b00001, 9'b000001011, 9'b000001010, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_1_2 = {5'b00011, 9'b000000010, 9'b000001010, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_1_2 = {5'b00101, 9'b001001010, 9'b000001010, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_1_2 = {5'b00111, 9'b000001001, 9'b000001010, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_0_3 = {5'b01001, 9'b001000011, 9'b001000011, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_0_3 = {5'b00001, 9'b001000010, 9'b001000011, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_0_3 = {5'b00011, 9'b001001011, 9'b001000011, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_0_3 = {5'b00101, 9'b000000011, 9'b001000011, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_0_3 = {5'b00111, 9'b001000000, 9'b001000011, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_0_2 = {5'b01001, 9'b001000010, 9'b001000010, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_0_2 = {5'b00001, 9'b001000011, 9'b001000010, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_0_2 = {5'b00011, 9'b001001010, 9'b001000010, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_0_2 = {5'b00101, 9'b000000010, 9'b001000010, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_0_2 = {5'b00111, 9'b001000001, 9'b001000010, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_1_3 = {5'b01001, 9'b001001011, 9'b001001011, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_1_3 = {5'b00001, 9'b001001010, 9'b001001011, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_1_3 = {5'b00011, 9'b001000011, 9'b001001011, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_1_3 = {5'b00101, 9'b000001011, 9'b001001011, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_1_3 = {5'b00111, 9'b001001000, 9'b001001011, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_1_2 = {5'b01001, 9'b001001010, 9'b001001010, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_1_2 = {5'b00001, 9'b001001011, 9'b001001010, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_1_2 = {5'b00011, 9'b001000010, 9'b001001010, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_1_2 = {5'b00101, 9'b000001010, 9'b001001010, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_1_2 = {5'b00111, 9'b001001001, 9'b001001010, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
			#1;
			
		end		
		
				  reduce_me_0_0_0 = 0;
			in_xpos_inject_0_0_0 = 0;
			in_ypos_inject_0_0_0 = 0;
			in_zpos_inject_0_0_0 = 0;
			in_xneg_inject_0_0_0 = 0;			
				  reduce_me_0_0_1 = 0;
			in_xneg_inject_0_0_1 = 0;
			in_ypos_inject_0_0_1 = 0;
			in_zpos_inject_0_0_1 = 0;
			in_xpos_inject_0_0_1 = 0;			
				  reduce_me_0_1_0 = 0;
			in_xpos_inject_0_1_0 = 0;
			in_yneg_inject_0_1_0 = 0;
			in_zpos_inject_0_1_0 = 0;
			in_xneg_inject_0_1_0 = 0;			
				  reduce_me_0_1_1 = 0;
			in_xneg_inject_0_1_1 = 0;
			in_yneg_inject_0_1_1 = 0;
			in_zpos_inject_0_1_1 = 0;
			in_xpos_inject_0_1_1 = 0;			
				  reduce_me_1_0_0 = 0;
			in_xpos_inject_1_0_0 = 0;
			in_ypos_inject_1_0_0 = 0;
			in_zneg_inject_1_0_0 = 0;
			in_xneg_inject_1_0_0 = 0;			
				  reduce_me_1_0_1 = 0;
			in_xneg_inject_1_0_1 = 0;
			in_ypos_inject_1_0_1 = 0;
			in_zneg_inject_1_0_1 = 0;
			in_xpos_inject_1_0_1 = 0;			
				  reduce_me_1_1_0 = 0;
			in_xpos_inject_1_1_0 = 0;
			in_yneg_inject_1_1_0 = 0;
			in_zneg_inject_1_1_0 = 0;
			in_xneg_inject_1_1_0 = 0;			
				  reduce_me_1_1_1 = 0;
			in_xneg_inject_1_1_1 = 0;
			in_yneg_inject_1_1_1 = 0;
			in_zneg_inject_1_1_1 = 0;
			in_xpos_inject_1_1_1 = 0;			
				  reduce_me_0_0_3 = 0;
			in_xpos_inject_0_0_3 = 0;
			in_ypos_inject_0_0_3 = 0;
			in_zpos_inject_0_0_3 = 0;
			in_xneg_inject_0_0_3 = 0;			
				  reduce_me_0_0_2 = 0;
			in_xneg_inject_0_0_2 = 0;
			in_ypos_inject_0_0_2 = 0;
			in_zpos_inject_0_0_2 = 0;
			in_xpos_inject_0_0_2 = 0;			
				  reduce_me_0_1_3 = 0;
			in_xpos_inject_0_1_3 = 0;
			in_yneg_inject_0_1_3 = 0;
			in_zpos_inject_0_1_3 = 0;
			in_xneg_inject_0_1_3 = 0;			
				  reduce_me_0_1_2 = 0;
			in_xneg_inject_0_1_2 = 0;
			in_yneg_inject_0_1_2 = 0;
			in_zpos_inject_0_1_2 = 0;
			in_xpos_inject_0_1_2 = 0;			
				  reduce_me_1_0_3 = 0;
			in_xpos_inject_1_0_3 = 0;
			in_ypos_inject_1_0_3 = 0;
			in_zneg_inject_1_0_3 = 0;
			in_xneg_inject_1_0_3 = 0;			
				  reduce_me_1_0_2 = 0;
			in_xneg_inject_1_0_2 = 0;
			in_ypos_inject_1_0_2 = 0;
			in_zneg_inject_1_0_2 = 0;
			in_xpos_inject_1_0_2 = 0;			
				  reduce_me_1_1_3 = 0;
			in_xpos_inject_1_1_3 = 0;
			in_yneg_inject_1_1_3 = 0;
			in_zneg_inject_1_1_3 = 0;
			in_xneg_inject_1_1_3 = 0;			
				  reduce_me_1_1_2 = 0;
			in_xneg_inject_1_1_2 = 0;
			in_yneg_inject_1_1_2 = 0;
			in_zneg_inject_1_1_2 = 0;
			in_xpos_inject_1_1_2 = 0;*/
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//ring
		
		/*for(i=0;i<1;i=i+1)begin
			in_xpos_inject_0_0_0 = {4'b0001, 9'b000000001, 9'b000000000, 9'b000000000, 8'b00000000, i, 2'b00, LargeAllGather, 32'b00000000000000000000000000000110};
			#10;
		end		
		
		in_xpos_inject_0_0_0 = 85'b0;*/
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//bcast
		
		/*for(i=0;i<128;i=i+1)begin
			in_xpos_inject_0_0_0 = {5'b00001, 9'b000000001, 9'd0, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			in_ypos_inject_0_0_0 = {5'b00001, 9'b000001000, 9'd0, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			in_zpos_inject_0_0_0 = {5'b00001, 9'b001000000, 9'd0, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			in_xneg_inject_0_0_0 = {5'b00001, 9'b000000011, 9'd0, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			#1;
		end		
		
		in_xpos_inject_0_0_0 = 0;
		in_ypos_inject_0_0_0 = 0;
		in_zpos_inject_0_0_0 = 0;
		in_xneg_inject_0_0_0 = 0;*/
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//scatter
		
		/*for(i=0;i<128;i=i+1)begin
			in_xpos_inject_0_0_0 = {5'b00001, 9'b000000001, 9'd0, 9'd0, 8'd0, 8'd1, 2'b00, Scatter, 32'd6};
			in_ypos_inject_0_0_0 = {5'b00001, 9'b000001000, 9'd0, 9'd0, 8'd0, 8'd2, 2'b00, Scatter, 32'd6};
			in_zpos_inject_0_0_0 = {5'b00001, 9'b001000000, 9'd0, 9'd0, 8'd0, 8'd4, 2'b00, Scatter, 32'd6};
			in_xneg_inject_0_0_0 = {5'b00001, 9'b000000011, 9'd0, 9'd0, 8'd0, 8'd8, 2'b00, Scatter, 32'd6};
			#1;
			in_xpos_inject_0_0_0 = 0;
			in_ypos_inject_0_0_0 = {5'b00001, 9'b000001001, 9'd0, 9'd0, 8'd0, 8'd3, 2'b00, Scatter, 32'd6};
			in_zpos_inject_0_0_0 = {5'b00001, 9'b001000001, 9'd0, 9'd0, 8'd0, 8'd5, 2'b00, Scatter, 32'd6};
			in_xneg_inject_0_0_0 = {5'b00001, 9'b000000010, 9'd0, 9'd0, 8'd0, 8'd9, 2'b00, Scatter, 32'd6};
			#1;
			in_ypos_inject_0_0_0 = 0;
			in_zpos_inject_0_0_0 = {5'b00001, 9'b001001000, 9'd0, 9'd0, 8'd0, 8'd6, 2'b00, Scatter, 32'd6};
			in_xneg_inject_0_0_0 = {5'b00001, 9'b000001011, 9'd0, 9'd0, 8'd0, 8'd10, 2'b00, Scatter, 32'd6};
			#1;
			in_zpos_inject_0_0_0 = {5'b00001, 9'b001001001, 9'd0, 9'd0, 8'd0, 8'd7, 2'b00, Scatter, 32'd6};
			in_xneg_inject_0_0_0 = {5'b00001, 9'b000001010, 9'd0, 9'd0, 8'd0, 8'd11, 2'b00, Scatter, 32'd6};
			#1;
			in_zpos_inject_0_0_0 = 0;
			in_xneg_inject_0_0_0 = {5'b00001, 9'b001000011, 9'd0, 9'd0, 8'd0, 8'd12, 2'b00, Scatter, 32'd6};
			#1;
			in_xneg_inject_0_0_0 = {5'b00001, 9'b001000010, 9'd0, 9'd0, 8'd0, 8'd13, 2'b00, Scatter, 32'd6};
			#1;
			in_xneg_inject_0_0_0 = {5'b00001, 9'b001001011, 9'd0, 9'd0, 8'd0, 8'd14, 2'b00, Scatter, 32'd6};
			#1;
			in_xneg_inject_0_0_0 = {5'b00001, 9'b001001010, 9'd0, 9'd0, 8'd0, 8'd15, 2'b00, Scatter, 32'd6};
			#1;
		end		
		
		in_xpos_inject_0_0_0 = 0;
		in_ypos_inject_0_0_0 = 0;
		in_zpos_inject_0_0_0 = 0;
		in_xneg_inject_0_0_0 = 0;*/
		
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//gather
		
		/*for(i=0;i<128;i=i+1)begin
			in_xneg_inject_0_0_1 = {5'b00001, 9'd0, 9'b000000001, 9'd1, 8'd0, 8'd0, 2'b00, Gather, 32'd1};
			in_yneg_inject_0_1_0 = {5'b00001, 9'd0, 9'b000001000, 9'd2, 8'd0, 8'd0, 2'b00, Gather, 32'd2};
			in_xneg_inject_0_1_1 = {5'b00001, 9'd0, 9'b000001001, 9'd3, 8'd0, 8'd0, 2'b00, Gather, 32'd3};
			in_zneg_inject_1_0_0 = {5'b00001, 9'd0, 9'b001000000, 9'd4, 8'd0, 8'd0, 2'b00, Gather, 32'd4};
			in_xneg_inject_1_0_1 = {5'b00001, 9'd0, 9'b001000001, 9'd5, 8'd0, 8'd0, 2'b00, Gather, 32'd5};
			in_yneg_inject_1_1_0 = {5'b00001, 9'd0, 9'b001001000, 9'd6, 8'd0, 8'd0, 2'b00, Gather, 32'd6};
			in_xneg_inject_1_1_1 = {5'b00001, 9'd0, 9'b001001001, 9'd7, 8'd0, 8'd0, 2'b00, Gather, 32'd7};
			
			in_xpos_inject_0_0_3 = {5'b00001, 9'd0, 9'b000000011, 9'd8, 8'd0, 8'd0, 2'b00, Gather, 32'd8};
			in_xpos_inject_0_0_2 = {5'b00001, 9'd0, 9'b000000010, 9'd9, 8'd0, 8'd0, 2'b00, Gather, 32'd9};
			in_yneg_inject_0_1_3 = {5'b00001, 9'd0, 9'b000001011, 9'd10, 8'd0, 8'd0, 2'b00, Gather, 32'd10};
			in_xpos_inject_0_1_2 = {5'b00001, 9'd0, 9'b000001010, 9'd11, 8'd0, 8'd0, 2'b00, Gather, 32'd11};
			in_zneg_inject_1_0_3 = {5'b00001, 9'd0, 9'b001000011, 9'd12, 8'd0, 8'd0, 2'b00, Gather, 32'd12};
			in_xpos_inject_1_0_2 = {5'b00001, 9'd0, 9'b001000010, 9'd13, 8'd0, 8'd0, 2'b00, Gather, 32'd13};
			in_yneg_inject_1_1_3 = {5'b00001, 9'd0, 9'b001001011, 9'd14, 8'd0, 8'd0, 2'b00, Gather, 32'd14};
			in_xpos_inject_1_1_2 = {5'b00001, 9'd0, 9'b001001010, 9'd15, 8'd0, 8'd0, 2'b00, Gather, 32'd15};
			#1;
		end		
		
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
		in_xpos_inject_1_1_2 = 0;*/
		
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//allgather
		
		/*for(i=0;i<128;i=i+1)begin
		
			in_xpos_inject_0_0_0 = {5'b00001, 9'b000000001, 9'b000000000, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd16};
			in_ypos_inject_0_0_0 = {5'b00011, 9'b000001000, 9'b000000000, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd16};
			in_zpos_inject_0_0_0 = {5'b00101, 9'b001000000, 9'b000000000, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd16};
			in_xneg_inject_0_0_0 = {5'b00111, 9'b000000011, 9'b000000000, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd16};
			
			in_xneg_inject_0_0_1 = {5'b00001, 9'b000000000, 9'b000000001, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd1};
			in_ypos_inject_0_0_1 = {5'b00011, 9'b000001001, 9'b000000001, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd1};
			in_zpos_inject_0_0_1 = {5'b00101, 9'b001000001, 9'b000000001, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd1};
			in_xpos_inject_0_0_1 = {5'b00111, 9'b000000010, 9'b000000001, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd1};
			
			in_xpos_inject_0_1_0 = {5'b00001, 9'b000001001, 9'b000001000, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd2};
			in_yneg_inject_0_1_0 = {5'b00011, 9'b000000000, 9'b000001000, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd2};
			in_zpos_inject_0_1_0 = {5'b00101, 9'b001001000, 9'b000001000, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd2};
			in_xneg_inject_0_1_0 = {5'b00111, 9'b000001011, 9'b000001000, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd2};
			
			in_xneg_inject_0_1_1 = {5'b00001, 9'b000001000, 9'b000001001, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd3};
			in_yneg_inject_0_1_1 = {5'b00011, 9'b000000001, 9'b000001001, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd3};
			in_zpos_inject_0_1_1 = {5'b00101, 9'b001001001, 9'b000001001, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd3};
			in_xpos_inject_0_1_1 = {5'b00111, 9'b000001010, 9'b000001001, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd3};
			
			in_xpos_inject_1_0_0 = {5'b00001, 9'b001000001, 9'b001000000, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd4};
			in_ypos_inject_1_0_0 = {5'b00011, 9'b001001000, 9'b001000000, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd4};
			in_zneg_inject_1_0_0 = {5'b00101, 9'b000000000, 9'b001000000, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd4};
			in_xneg_inject_1_0_0 = {5'b00111, 9'b001000011, 9'b001000000, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd4};
			
			in_xneg_inject_1_0_1 = {5'b00001, 9'b001000000, 9'b001000001, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd5};
			in_ypos_inject_1_0_1 = {5'b00011, 9'b001001001, 9'b001000001, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd5};
			in_zneg_inject_1_0_1 = {5'b00101, 9'b000000001, 9'b001000001, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd5};
			in_xpos_inject_1_0_1 = {5'b00111, 9'b001000010, 9'b001000001, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd5};
			
			in_xpos_inject_1_1_0 = {5'b00001, 9'b001001001, 9'b001001000, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_1_0 = {5'b00011, 9'b001000000, 9'b001001000, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_1_0 = {5'b00101, 9'b000001000, 9'b001001000, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_1_0 = {5'b00111, 9'b001001011, 9'b001001000, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_1_1_1 = {5'b00001, 9'b001001000, 9'b001001001, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd7};
			in_yneg_inject_1_1_1 = {5'b00011, 9'b001000001, 9'b001001001, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd7};
			in_zneg_inject_1_1_1 = {5'b00101, 9'b000001001, 9'b001001001, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd7};
			in_xpos_inject_1_1_1 = {5'b00111, 9'b001001010, 9'b001001001, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd7};
			
			in_xneg_inject_0_0_3 = {5'b00001, 9'b000000010, 9'b000000011, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd8};
			in_ypos_inject_0_0_3 = {5'b00011, 9'b000001011, 9'b000000011, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd8};
			in_zpos_inject_0_0_3 = {5'b00101, 9'b001000011, 9'b000000011, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd8};
			in_xpos_inject_0_0_3 = {5'b00111, 9'b000000000, 9'b000000011, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd8};
			
			in_xpos_inject_0_0_2 = {5'b00001, 9'b000000011, 9'b000000010, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd9};
			in_ypos_inject_0_0_2 = {5'b00011, 9'b000001010, 9'b000000010, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd9};
			in_zpos_inject_0_0_2 = {5'b00101, 9'b001000010, 9'b000000010, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd9};
			in_xneg_inject_0_0_2 = {5'b00111, 9'b000000001, 9'b000000010, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd9};
			
			in_xneg_inject_0_1_3 = {5'b00001, 9'b000001010, 9'b000001011, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd10};
			in_yneg_inject_0_1_3 = {5'b00011, 9'b000000011, 9'b000001011, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd10};
			in_zpos_inject_0_1_3 = {5'b00101, 9'b001001011, 9'b000001011, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd10};
			in_xpos_inject_0_1_3 = {5'b00111, 9'b000001000, 9'b000001011, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd10};
			
			in_xpos_inject_0_1_2 = {5'b00001, 9'b000001011, 9'b000001010, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd11};
			in_yneg_inject_0_1_2 = {5'b00011, 9'b000000010, 9'b000001010, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd11};
			in_zpos_inject_0_1_2 = {5'b00101, 9'b001001010, 9'b000001010, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd11};
			in_xneg_inject_0_1_2 = {5'b00111, 9'b000001001, 9'b000001010, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd11};
			
			in_xneg_inject_1_0_3 = {5'b00001, 9'b001000010, 9'b001000011, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd12};
			in_ypos_inject_1_0_3 = {5'b00011, 9'b001001011, 9'b001000011, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd12};
			in_zneg_inject_1_0_3 = {5'b00101, 9'b000000011, 9'b001000011, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd12};
			in_xpos_inject_1_0_3 = {5'b00111, 9'b001000000, 9'b001000011, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd12};
			
			in_xpos_inject_1_0_2 = {5'b00001, 9'b001000011, 9'b001000010, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd13};
			in_ypos_inject_1_0_2 = {5'b00011, 9'b001001010, 9'b001000010, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd13};
			in_zneg_inject_1_0_2 = {5'b00101, 9'b000000010, 9'b001000010, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd13};
			in_xneg_inject_1_0_2 = {5'b00111, 9'b001000001, 9'b001000010, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd13};
			
			in_xneg_inject_1_1_3 = {5'b00001, 9'b001001010, 9'b001001011, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd14};
			in_yneg_inject_1_1_3 = {5'b00011, 9'b001000011, 9'b001001011, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd14};
			in_zneg_inject_1_1_3 = {5'b00101, 9'b000001011, 9'b001001011, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd14};
			in_xpos_inject_1_1_3 = {5'b00111, 9'b001001000, 9'b001001011, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd14};
			
			in_xpos_inject_1_1_2 = {5'b00001, 9'b001001011, 9'b001001010, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd15};
			in_yneg_inject_1_1_2 = {5'b00011, 9'b001000010, 9'b001001010, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd15};
			in_zneg_inject_1_1_2 = {5'b00101, 9'b000001010, 9'b001001010, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd15};
			in_xneg_inject_1_1_2 = {5'b00111, 9'b001001001, 9'b001001010, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd15};
			
			#0.5;
			
		end	
		
			in_xpos_inject_0_0_0 = 0;
			in_ypos_inject_0_0_0 = 0;
			in_zpos_inject_0_0_0 = 0;
			in_xneg_inject_0_0_0 = 0;			
			
			in_xneg_inject_0_0_1 = 0;
			in_ypos_inject_0_0_1 = 0;
			in_zpos_inject_0_0_1 = 0;
			in_xpos_inject_0_0_1 = 0;			
			
			in_xpos_inject_0_1_0 = 0;
			in_yneg_inject_0_1_0 = 0;
			in_zpos_inject_0_1_0 = 0;
			in_xneg_inject_0_1_0 = 0;			
			
			in_xneg_inject_0_1_1 = 0;
			in_yneg_inject_0_1_1 = 0;
			in_zpos_inject_0_1_1 = 0;
			in_xpos_inject_0_1_1 = 0;			
			
			in_xpos_inject_1_0_0 = 0;
			in_ypos_inject_1_0_0 = 0;
			in_zneg_inject_1_0_0 = 0;
			in_xneg_inject_1_0_0 = 0;			
			
			in_xneg_inject_1_0_1 = 0;
			in_ypos_inject_1_0_1 = 0;
			in_zneg_inject_1_0_1 = 0;
			in_xpos_inject_1_0_1 = 0;			
			
			in_xpos_inject_1_1_0 = 0;
			in_yneg_inject_1_1_0 = 0;
			in_zneg_inject_1_1_0 = 0;
			in_xneg_inject_1_1_0 = 0;			
			
			in_xneg_inject_1_1_1 = 0;
			in_yneg_inject_1_1_1 = 0;
			in_zneg_inject_1_1_1 = 0;
			in_xpos_inject_1_1_1 = 0;			
			
			in_xpos_inject_0_0_3 = 0;
			in_ypos_inject_0_0_3 = 0;
			in_zpos_inject_0_0_3 = 0;
			in_xneg_inject_0_0_3 = 0;			
			
			in_xneg_inject_0_0_2 = 0;
			in_ypos_inject_0_0_2 = 0;
			in_zpos_inject_0_0_2 = 0;
			in_xpos_inject_0_0_2 = 0;			
			
			in_xpos_inject_0_1_3 = 0;
			in_yneg_inject_0_1_3 = 0;
			in_zpos_inject_0_1_3 = 0;
			in_xneg_inject_0_1_3 = 0;			
			
			in_xneg_inject_0_1_2 = 0;
			in_yneg_inject_0_1_2 = 0;
			in_zpos_inject_0_1_2 = 0;
			in_xpos_inject_0_1_2 = 0;			
			
			in_xpos_inject_1_0_3 = 0;
			in_ypos_inject_1_0_3 = 0;
			in_zneg_inject_1_0_3 = 0;
			in_xneg_inject_1_0_3 = 0;			
			
			in_xneg_inject_1_0_2 = 0;
			in_ypos_inject_1_0_2 = 0;
			in_zneg_inject_1_0_2 = 0;
			in_xpos_inject_1_0_2 = 0;			
			
			in_xpos_inject_1_1_3 = 0;
			in_yneg_inject_1_1_3 = 0;
			in_zneg_inject_1_1_3 = 0;
			in_xneg_inject_1_1_3 = 0;			
			
			in_xneg_inject_1_1_2 = 0;
			in_yneg_inject_1_1_2 = 0;
			in_zneg_inject_1_1_2 = 0;
			in_xpos_inject_1_1_2 = 0;*/

	end
	
	always begin
		#1 clk = !clk;
	end
      
endmodule


 
