`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:39:36 07/23/2018
// Design Name:   network_64
// Module Name:   C:/Users/joshtern/MPI-Collective-Router/network_64_tb.v
// Project Name:  MPI-Collective-Router
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: network_64
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module network_64_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [87:0] in_xpos_inject_0_0_0;
	reg [87:0] in_ypos_inject_0_0_0;
	reg [87:0] in_zpos_inject_0_0_0;
	reg [87:0] in_xneg_inject_0_0_0;
	reg [87:0] in_yneg_inject_0_0_0;
	reg [87:0] in_zneg_inject_0_0_0;
	reg [87:0] reduce_me_0_0_0;
	reg [93:0] newcomm_0_0_0;
	reg [87:0] in_xpos_inject_0_0_1;
	reg [87:0] in_ypos_inject_0_0_1;
	reg [87:0] in_zpos_inject_0_0_1;
	reg [87:0] in_xneg_inject_0_0_1;
	reg [87:0] in_yneg_inject_0_0_1;
	reg [87:0] in_zneg_inject_0_0_1;
	reg [87:0] reduce_me_0_0_1;
	reg [93:0] newcomm_0_0_1;
	reg [87:0] in_xpos_inject_0_1_0;
	reg [87:0] in_ypos_inject_0_1_0;
	reg [87:0] in_zpos_inject_0_1_0;
	reg [87:0] in_xneg_inject_0_1_0;
	reg [87:0] in_yneg_inject_0_1_0;
	reg [87:0] in_zneg_inject_0_1_0;
	reg [87:0] reduce_me_0_1_0;
	reg [93:0] newcomm_0_1_0;
	reg [87:0] in_xpos_inject_0_1_1;
	reg [87:0] in_ypos_inject_0_1_1;
	reg [87:0] in_zpos_inject_0_1_1;
	reg [87:0] in_xneg_inject_0_1_1;
	reg [87:0] in_yneg_inject_0_1_1;
	reg [87:0] in_zneg_inject_0_1_1;
	reg [87:0] reduce_me_0_1_1;
	reg [93:0] newcomm_0_1_1;
	reg [87:0] in_xpos_inject_1_0_0;
	reg [87:0] in_ypos_inject_1_0_0;
	reg [87:0] in_zpos_inject_1_0_0;
	reg [87:0] in_xneg_inject_1_0_0;
	reg [87:0] in_yneg_inject_1_0_0;
	reg [87:0] in_zneg_inject_1_0_0;
	reg [87:0] reduce_me_1_0_0;
	reg [93:0] newcomm_1_0_0;
	reg [87:0] in_xpos_inject_1_0_1;
	reg [87:0] in_ypos_inject_1_0_1;
	reg [87:0] in_zpos_inject_1_0_1;
	reg [87:0] in_xneg_inject_1_0_1;
	reg [87:0] in_yneg_inject_1_0_1;
	reg [87:0] in_zneg_inject_1_0_1;
	reg [87:0] reduce_me_1_0_1;
	reg [93:0] newcomm_1_0_1;
	reg [87:0] in_xpos_inject_1_1_0;
	reg [87:0] in_ypos_inject_1_1_0;
	reg [87:0] in_zpos_inject_1_1_0;
	reg [87:0] in_xneg_inject_1_1_0;
	reg [87:0] in_yneg_inject_1_1_0;
	reg [87:0] in_zneg_inject_1_1_0;
	reg [87:0] reduce_me_1_1_0;
	reg [93:0] newcomm_1_1_0;
	reg [87:0] in_xpos_inject_1_1_1;
	reg [87:0] in_ypos_inject_1_1_1;
	reg [87:0] in_zpos_inject_1_1_1;
	reg [87:0] in_xneg_inject_1_1_1;
	reg [87:0] in_yneg_inject_1_1_1;
	reg [87:0] in_zneg_inject_1_1_1;
	reg [87:0] reduce_me_1_1_1;
	reg [93:0] newcomm_1_1_1;
	reg [87:0] in_xpos_inject_0_0_3;
	reg [87:0] in_ypos_inject_0_0_3;
	reg [87:0] in_zpos_inject_0_0_3;
	reg [87:0] in_xneg_inject_0_0_3;
	reg [87:0] in_yneg_inject_0_0_3;
	reg [87:0] in_zneg_inject_0_0_3;
	reg [87:0] reduce_me_0_0_3;
	reg [93:0] newcomm_0_0_3;
	reg [87:0] in_xpos_inject_0_0_2;
	reg [87:0] in_ypos_inject_0_0_2;
	reg [87:0] in_zpos_inject_0_0_2;
	reg [87:0] in_xneg_inject_0_0_2;
	reg [87:0] in_yneg_inject_0_0_2;
	reg [87:0] in_zneg_inject_0_0_2;
	reg [87:0] reduce_me_0_0_2;
	reg [93:0] newcomm_0_0_2;
	reg [87:0] in_xpos_inject_0_1_3;
	reg [87:0] in_ypos_inject_0_1_3;
	reg [87:0] in_zpos_inject_0_1_3;
	reg [87:0] in_xneg_inject_0_1_3;
	reg [87:0] in_yneg_inject_0_1_3;
	reg [87:0] in_zneg_inject_0_1_3;
	reg [87:0] reduce_me_0_1_3;
	reg [93:0] newcomm_0_1_3;
	reg [87:0] in_xpos_inject_0_1_2;
	reg [87:0] in_ypos_inject_0_1_2;
	reg [87:0] in_zpos_inject_0_1_2;
	reg [87:0] in_xneg_inject_0_1_2;
	reg [87:0] in_yneg_inject_0_1_2;
	reg [87:0] in_zneg_inject_0_1_2;
	reg [87:0] reduce_me_0_1_2;
	reg [93:0] newcomm_0_1_2;
	reg [87:0] in_xpos_inject_1_0_3;
	reg [87:0] in_ypos_inject_1_0_3;
	reg [87:0] in_zpos_inject_1_0_3;
	reg [87:0] in_xneg_inject_1_0_3;
	reg [87:0] in_yneg_inject_1_0_3;
	reg [87:0] in_zneg_inject_1_0_3;
	reg [87:0] reduce_me_1_0_3;
	reg [93:0] newcomm_1_0_3;
	reg [87:0] in_xpos_inject_1_0_2;
	reg [87:0] in_ypos_inject_1_0_2;
	reg [87:0] in_zpos_inject_1_0_2;
	reg [87:0] in_xneg_inject_1_0_2;
	reg [87:0] in_yneg_inject_1_0_2;
	reg [87:0] in_zneg_inject_1_0_2;
	reg [87:0] reduce_me_1_0_2;
	reg [93:0] newcomm_1_0_2;
	reg [87:0] in_xpos_inject_1_1_3;
	reg [87:0] in_ypos_inject_1_1_3;
	reg [87:0] in_zpos_inject_1_1_3;
	reg [87:0] in_xneg_inject_1_1_3;
	reg [87:0] in_yneg_inject_1_1_3;
	reg [87:0] in_zneg_inject_1_1_3;
	reg [87:0] reduce_me_1_1_3;
	reg [93:0] newcomm_1_1_3;
	reg [87:0] in_xpos_inject_1_1_2;
	reg [87:0] in_ypos_inject_1_1_2;
	reg [87:0] in_zpos_inject_1_1_2;
	reg [87:0] in_xneg_inject_1_1_2;
	reg [87:0] in_yneg_inject_1_1_2;
	reg [87:0] in_zneg_inject_1_1_2;
	reg [87:0] reduce_me_1_1_2;
	reg [93:0] newcomm_1_1_2;
	reg [87:0] in_xpos_inject_0_3_0;
	reg [87:0] in_ypos_inject_0_3_0;
	reg [87:0] in_zpos_inject_0_3_0;
	reg [87:0] in_xneg_inject_0_3_0;
	reg [87:0] in_yneg_inject_0_3_0;
	reg [87:0] in_zneg_inject_0_3_0;
	reg [87:0] reduce_me_0_3_0;
	reg [93:0] newcomm_0_3_0;
	reg [87:0] in_xpos_inject_0_3_1;
	reg [87:0] in_ypos_inject_0_3_1;
	reg [87:0] in_zpos_inject_0_3_1;
	reg [87:0] in_xneg_inject_0_3_1;
	reg [87:0] in_yneg_inject_0_3_1;
	reg [87:0] in_zneg_inject_0_3_1;
	reg [87:0] reduce_me_0_3_1;
	reg [93:0] newcomm_0_3_1;
	reg [87:0] in_xpos_inject_0_2_0;
	reg [87:0] in_ypos_inject_0_2_0;
	reg [87:0] in_zpos_inject_0_2_0;
	reg [87:0] in_xneg_inject_0_2_0;
	reg [87:0] in_yneg_inject_0_2_0;
	reg [87:0] in_zneg_inject_0_2_0;
	reg [87:0] reduce_me_0_2_0;
	reg [93:0] newcomm_0_2_0;
	reg [87:0] in_xpos_inject_0_2_1;
	reg [87:0] in_ypos_inject_0_2_1;
	reg [87:0] in_zpos_inject_0_2_1;
	reg [87:0] in_xneg_inject_0_2_1;
	reg [87:0] in_yneg_inject_0_2_1;
	reg [87:0] in_zneg_inject_0_2_1;
	reg [87:0] reduce_me_0_2_1;
	reg [93:0] newcomm_0_2_1;
	reg [87:0] in_xpos_inject_1_3_0;
	reg [87:0] in_ypos_inject_1_3_0;
	reg [87:0] in_zpos_inject_1_3_0;
	reg [87:0] in_xneg_inject_1_3_0;
	reg [87:0] in_yneg_inject_1_3_0;
	reg [87:0] in_zneg_inject_1_3_0;
	reg [87:0] reduce_me_1_3_0;
	reg [93:0] newcomm_1_3_0;
	reg [87:0] in_xpos_inject_1_3_1;
	reg [87:0] in_ypos_inject_1_3_1;
	reg [87:0] in_zpos_inject_1_3_1;
	reg [87:0] in_xneg_inject_1_3_1;
	reg [87:0] in_yneg_inject_1_3_1;
	reg [87:0] in_zneg_inject_1_3_1;
	reg [87:0] reduce_me_1_3_1;
	reg [93:0] newcomm_1_3_1;
	reg [87:0] in_xpos_inject_1_2_0;
	reg [87:0] in_ypos_inject_1_2_0;
	reg [87:0] in_zpos_inject_1_2_0;
	reg [87:0] in_xneg_inject_1_2_0;
	reg [87:0] in_yneg_inject_1_2_0;
	reg [87:0] in_zneg_inject_1_2_0;
	reg [87:0] reduce_me_1_2_0;
	reg [93:0] newcomm_1_2_0;
	reg [87:0] in_xpos_inject_1_2_1;
	reg [87:0] in_ypos_inject_1_2_1;
	reg [87:0] in_zpos_inject_1_2_1;
	reg [87:0] in_xneg_inject_1_2_1;
	reg [87:0] in_yneg_inject_1_2_1;
	reg [87:0] in_zneg_inject_1_2_1;
	reg [87:0] reduce_me_1_2_1;
	reg [93:0] newcomm_1_2_1;
	reg [87:0] in_xpos_inject_0_3_3;
	reg [87:0] in_ypos_inject_0_3_3;
	reg [87:0] in_zpos_inject_0_3_3;
	reg [87:0] in_xneg_inject_0_3_3;
	reg [87:0] in_yneg_inject_0_3_3;
	reg [87:0] in_zneg_inject_0_3_3;
	reg [87:0] reduce_me_0_3_3;
	reg [93:0] newcomm_0_3_3;
	reg [87:0] in_xpos_inject_0_3_2;
	reg [87:0] in_ypos_inject_0_3_2;
	reg [87:0] in_zpos_inject_0_3_2;
	reg [87:0] in_xneg_inject_0_3_2;
	reg [87:0] in_yneg_inject_0_3_2;
	reg [87:0] in_zneg_inject_0_3_2;
	reg [87:0] reduce_me_0_3_2;
	reg [93:0] newcomm_0_3_2;
	reg [87:0] in_xpos_inject_0_2_3;
	reg [87:0] in_ypos_inject_0_2_3;
	reg [87:0] in_zpos_inject_0_2_3;
	reg [87:0] in_xneg_inject_0_2_3;
	reg [87:0] in_yneg_inject_0_2_3;
	reg [87:0] in_zneg_inject_0_2_3;
	reg [87:0] reduce_me_0_2_3;
	reg [93:0] newcomm_0_2_3;
	reg [87:0] in_xpos_inject_0_2_2;
	reg [87:0] in_ypos_inject_0_2_2;
	reg [87:0] in_zpos_inject_0_2_2;
	reg [87:0] in_xneg_inject_0_2_2;
	reg [87:0] in_yneg_inject_0_2_2;
	reg [87:0] in_zneg_inject_0_2_2;
	reg [87:0] reduce_me_0_2_2;
	reg [93:0] newcomm_0_2_2;
	reg [87:0] in_xpos_inject_1_3_3;
	reg [87:0] in_ypos_inject_1_3_3;
	reg [87:0] in_zpos_inject_1_3_3;
	reg [87:0] in_xneg_inject_1_3_3;
	reg [87:0] in_yneg_inject_1_3_3;
	reg [87:0] in_zneg_inject_1_3_3;
	reg [87:0] reduce_me_1_3_3;
	reg [93:0] newcomm_1_3_3;
	reg [87:0] in_xpos_inject_1_3_2;
	reg [87:0] in_ypos_inject_1_3_2;
	reg [87:0] in_zpos_inject_1_3_2;
	reg [87:0] in_xneg_inject_1_3_2;
	reg [87:0] in_yneg_inject_1_3_2;
	reg [87:0] in_zneg_inject_1_3_2;
	reg [87:0] reduce_me_1_3_2;
	reg [93:0] newcomm_1_3_2;
	reg [87:0] in_xpos_inject_1_2_3;
	reg [87:0] in_ypos_inject_1_2_3;
	reg [87:0] in_zpos_inject_1_2_3;
	reg [87:0] in_xneg_inject_1_2_3;
	reg [87:0] in_yneg_inject_1_2_3;
	reg [87:0] in_zneg_inject_1_2_3;
	reg [87:0] reduce_me_1_2_3;
	reg [93:0] newcomm_1_2_3;
	reg [87:0] in_xpos_inject_1_2_2;
	reg [87:0] in_ypos_inject_1_2_2;
	reg [87:0] in_zpos_inject_1_2_2;
	reg [87:0] in_xneg_inject_1_2_2;
	reg [87:0] in_yneg_inject_1_2_2;
	reg [87:0] in_zneg_inject_1_2_2;
	reg [87:0] reduce_me_1_2_2;
	reg [93:0] newcomm_1_2_2;
	reg [87:0] in_xpos_inject_3_0_0;
	reg [87:0] in_ypos_inject_3_0_0;
	reg [87:0] in_zpos_inject_3_0_0;
	reg [87:0] in_xneg_inject_3_0_0;
	reg [87:0] in_yneg_inject_3_0_0;
	reg [87:0] in_zneg_inject_3_0_0;
	reg [87:0] reduce_me_3_0_0;
	reg [93:0] newcomm_3_0_0;
	reg [87:0] in_xpos_inject_3_0_1;
	reg [87:0] in_ypos_inject_3_0_1;
	reg [87:0] in_zpos_inject_3_0_1;
	reg [87:0] in_xneg_inject_3_0_1;
	reg [87:0] in_yneg_inject_3_0_1;
	reg [87:0] in_zneg_inject_3_0_1;
	reg [87:0] reduce_me_3_0_1;
	reg [93:0] newcomm_3_0_1;
	reg [87:0] in_xpos_inject_3_1_0;
	reg [87:0] in_ypos_inject_3_1_0;
	reg [87:0] in_zpos_inject_3_1_0;
	reg [87:0] in_xneg_inject_3_1_0;
	reg [87:0] in_yneg_inject_3_1_0;
	reg [87:0] in_zneg_inject_3_1_0;
	reg [87:0] reduce_me_3_1_0;
	reg [93:0] newcomm_3_1_0;
	reg [87:0] in_xpos_inject_3_1_1;
	reg [87:0] in_ypos_inject_3_1_1;
	reg [87:0] in_zpos_inject_3_1_1;
	reg [87:0] in_xneg_inject_3_1_1;
	reg [87:0] in_yneg_inject_3_1_1;
	reg [87:0] in_zneg_inject_3_1_1;
	reg [87:0] reduce_me_3_1_1;
	reg [93:0] newcomm_3_1_1;
	reg [87:0] in_xpos_inject_2_0_0;
	reg [87:0] in_ypos_inject_2_0_0;
	reg [87:0] in_zpos_inject_2_0_0;
	reg [87:0] in_xneg_inject_2_0_0;
	reg [87:0] in_yneg_inject_2_0_0;
	reg [87:0] in_zneg_inject_2_0_0;
	reg [87:0] reduce_me_2_0_0;
	reg [93:0] newcomm_2_0_0;
	reg [87:0] in_xpos_inject_2_0_1;
	reg [87:0] in_ypos_inject_2_0_1;
	reg [87:0] in_zpos_inject_2_0_1;
	reg [87:0] in_xneg_inject_2_0_1;
	reg [87:0] in_yneg_inject_2_0_1;
	reg [87:0] in_zneg_inject_2_0_1;
	reg [87:0] reduce_me_2_0_1;
	reg [93:0] newcomm_2_0_1;
	reg [87:0] in_xpos_inject_2_1_0;
	reg [87:0] in_ypos_inject_2_1_0;
	reg [87:0] in_zpos_inject_2_1_0;
	reg [87:0] in_xneg_inject_2_1_0;
	reg [87:0] in_yneg_inject_2_1_0;
	reg [87:0] in_zneg_inject_2_1_0;
	reg [87:0] reduce_me_2_1_0;
	reg [93:0] newcomm_2_1_0;
	reg [87:0] in_xpos_inject_2_1_1;
	reg [87:0] in_ypos_inject_2_1_1;
	reg [87:0] in_zpos_inject_2_1_1;
	reg [87:0] in_xneg_inject_2_1_1;
	reg [87:0] in_yneg_inject_2_1_1;
	reg [87:0] in_zneg_inject_2_1_1;
	reg [87:0] reduce_me_2_1_1;
	reg [93:0] newcomm_2_1_1;
	reg [87:0] in_xpos_inject_3_0_3;
	reg [87:0] in_ypos_inject_3_0_3;
	reg [87:0] in_zpos_inject_3_0_3;
	reg [87:0] in_xneg_inject_3_0_3;
	reg [87:0] in_yneg_inject_3_0_3;
	reg [87:0] in_zneg_inject_3_0_3;
	reg [87:0] reduce_me_3_0_3;
	reg [93:0] newcomm_3_0_3;
	reg [87:0] in_xpos_inject_3_0_2;
	reg [87:0] in_ypos_inject_3_0_2;
	reg [87:0] in_zpos_inject_3_0_2;
	reg [87:0] in_xneg_inject_3_0_2;
	reg [87:0] in_yneg_inject_3_0_2;
	reg [87:0] in_zneg_inject_3_0_2;
	reg [87:0] reduce_me_3_0_2;
	reg [93:0] newcomm_3_0_2;
	reg [87:0] in_xpos_inject_3_1_3;
	reg [87:0] in_ypos_inject_3_1_3;
	reg [87:0] in_zpos_inject_3_1_3;
	reg [87:0] in_xneg_inject_3_1_3;
	reg [87:0] in_yneg_inject_3_1_3;
	reg [87:0] in_zneg_inject_3_1_3;
	reg [87:0] reduce_me_3_1_3;
	reg [93:0] newcomm_3_1_3;
	reg [87:0] in_xpos_inject_3_1_2;
	reg [87:0] in_ypos_inject_3_1_2;
	reg [87:0] in_zpos_inject_3_1_2;
	reg [87:0] in_xneg_inject_3_1_2;
	reg [87:0] in_yneg_inject_3_1_2;
	reg [87:0] in_zneg_inject_3_1_2;
	reg [87:0] reduce_me_3_1_2;
	reg [93:0] newcomm_3_1_2;
	reg [87:0] in_xpos_inject_2_0_3;
	reg [87:0] in_ypos_inject_2_0_3;
	reg [87:0] in_zpos_inject_2_0_3;
	reg [87:0] in_xneg_inject_2_0_3;
	reg [87:0] in_yneg_inject_2_0_3;
	reg [87:0] in_zneg_inject_2_0_3;
	reg [87:0] reduce_me_2_0_3;
	reg [93:0] newcomm_2_0_3;
	reg [87:0] in_xpos_inject_2_0_2;
	reg [87:0] in_ypos_inject_2_0_2;
	reg [87:0] in_zpos_inject_2_0_2;
	reg [87:0] in_xneg_inject_2_0_2;
	reg [87:0] in_yneg_inject_2_0_2;
	reg [87:0] in_zneg_inject_2_0_2;
	reg [87:0] reduce_me_2_0_2;
	reg [93:0] newcomm_2_0_2;
	reg [87:0] in_xpos_inject_2_1_3;
	reg [87:0] in_ypos_inject_2_1_3;
	reg [87:0] in_zpos_inject_2_1_3;
	reg [87:0] in_xneg_inject_2_1_3;
	reg [87:0] in_yneg_inject_2_1_3;
	reg [87:0] in_zneg_inject_2_1_3;
	reg [87:0] reduce_me_2_1_3;
	reg [93:0] newcomm_2_1_3;
	reg [87:0] in_xpos_inject_2_1_2;
	reg [87:0] in_ypos_inject_2_1_2;
	reg [87:0] in_zpos_inject_2_1_2;
	reg [87:0] in_xneg_inject_2_1_2;
	reg [87:0] in_yneg_inject_2_1_2;
	reg [87:0] in_zneg_inject_2_1_2;
	reg [87:0] reduce_me_2_1_2;
	reg [93:0] newcomm_2_1_2;
	reg [87:0] in_xpos_inject_3_3_0;
	reg [87:0] in_ypos_inject_3_3_0;
	reg [87:0] in_zpos_inject_3_3_0;
	reg [87:0] in_xneg_inject_3_3_0;
	reg [87:0] in_yneg_inject_3_3_0;
	reg [87:0] in_zneg_inject_3_3_0;
	reg [87:0] reduce_me_3_3_0;
	reg [93:0] newcomm_3_3_0;
	reg [87:0] in_xpos_inject_3_3_1;
	reg [87:0] in_ypos_inject_3_3_1;
	reg [87:0] in_zpos_inject_3_3_1;
	reg [87:0] in_xneg_inject_3_3_1;
	reg [87:0] in_yneg_inject_3_3_1;
	reg [87:0] in_zneg_inject_3_3_1;
	reg [87:0] reduce_me_3_3_1;
	reg [93:0] newcomm_3_3_1;
	reg [87:0] in_xpos_inject_3_2_0;
	reg [87:0] in_ypos_inject_3_2_0;
	reg [87:0] in_zpos_inject_3_2_0;
	reg [87:0] in_xneg_inject_3_2_0;
	reg [87:0] in_yneg_inject_3_2_0;
	reg [87:0] in_zneg_inject_3_2_0;
	reg [87:0] reduce_me_3_2_0;
	reg [93:0] newcomm_3_2_0;
	reg [87:0] in_xpos_inject_3_2_1;
	reg [87:0] in_ypos_inject_3_2_1;
	reg [87:0] in_zpos_inject_3_2_1;
	reg [87:0] in_xneg_inject_3_2_1;
	reg [87:0] in_yneg_inject_3_2_1;
	reg [87:0] in_zneg_inject_3_2_1;
	reg [87:0] reduce_me_3_2_1;
	reg [93:0] newcomm_3_2_1;
	reg [87:0] in_xpos_inject_2_3_0;
	reg [87:0] in_ypos_inject_2_3_0;
	reg [87:0] in_zpos_inject_2_3_0;
	reg [87:0] in_xneg_inject_2_3_0;
	reg [87:0] in_yneg_inject_2_3_0;
	reg [87:0] in_zneg_inject_2_3_0;
	reg [87:0] reduce_me_2_3_0;
	reg [93:0] newcomm_2_3_0;
	reg [87:0] in_xpos_inject_2_3_1;
	reg [87:0] in_ypos_inject_2_3_1;
	reg [87:0] in_zpos_inject_2_3_1;
	reg [87:0] in_xneg_inject_2_3_1;
	reg [87:0] in_yneg_inject_2_3_1;
	reg [87:0] in_zneg_inject_2_3_1;
	reg [87:0] reduce_me_2_3_1;
	reg [93:0] newcomm_2_3_1;
	reg [87:0] in_xpos_inject_2_2_0;
	reg [87:0] in_ypos_inject_2_2_0;
	reg [87:0] in_zpos_inject_2_2_0;
	reg [87:0] in_xneg_inject_2_2_0;
	reg [87:0] in_yneg_inject_2_2_0;
	reg [87:0] in_zneg_inject_2_2_0;
	reg [87:0] reduce_me_2_2_0;
	reg [93:0] newcomm_2_2_0;
	reg [87:0] in_xpos_inject_2_2_1;
	reg [87:0] in_ypos_inject_2_2_1;
	reg [87:0] in_zpos_inject_2_2_1;
	reg [87:0] in_xneg_inject_2_2_1;
	reg [87:0] in_yneg_inject_2_2_1;
	reg [87:0] in_zneg_inject_2_2_1;
	reg [87:0] reduce_me_2_2_1;
	reg [93:0] newcomm_2_2_1;
	reg [87:0] in_xpos_inject_3_3_3;
	reg [87:0] in_ypos_inject_3_3_3;
	reg [87:0] in_zpos_inject_3_3_3;
	reg [87:0] in_xneg_inject_3_3_3;
	reg [87:0] in_yneg_inject_3_3_3;
	reg [87:0] in_zneg_inject_3_3_3;
	reg [87:0] reduce_me_3_3_3;
	reg [93:0] newcomm_3_3_3;
	reg [87:0] in_xpos_inject_3_3_2;
	reg [87:0] in_ypos_inject_3_3_2;
	reg [87:0] in_zpos_inject_3_3_2;
	reg [87:0] in_xneg_inject_3_3_2;
	reg [87:0] in_yneg_inject_3_3_2;
	reg [87:0] in_zneg_inject_3_3_2;
	reg [87:0] reduce_me_3_3_2;
	reg [93:0] newcomm_3_3_2;
	reg [87:0] in_xpos_inject_3_2_3;
	reg [87:0] in_ypos_inject_3_2_3;
	reg [87:0] in_zpos_inject_3_2_3;
	reg [87:0] in_xneg_inject_3_2_3;
	reg [87:0] in_yneg_inject_3_2_3;
	reg [87:0] in_zneg_inject_3_2_3;
	reg [87:0] reduce_me_3_2_3;
	reg [93:0] newcomm_3_2_3;
	reg [87:0] in_xpos_inject_3_2_2;
	reg [87:0] in_ypos_inject_3_2_2;
	reg [87:0] in_zpos_inject_3_2_2;
	reg [87:0] in_xneg_inject_3_2_2;
	reg [87:0] in_yneg_inject_3_2_2;
	reg [87:0] in_zneg_inject_3_2_2;
	reg [87:0] reduce_me_3_2_2;
	reg [93:0] newcomm_3_2_2;
	reg [87:0] in_xpos_inject_2_3_3;
	reg [87:0] in_ypos_inject_2_3_3;
	reg [87:0] in_zpos_inject_2_3_3;
	reg [87:0] in_xneg_inject_2_3_3;
	reg [87:0] in_yneg_inject_2_3_3;
	reg [87:0] in_zneg_inject_2_3_3;
	reg [87:0] reduce_me_2_3_3;
	reg [93:0] newcomm_2_3_3;
	reg [87:0] in_xpos_inject_2_3_2;
	reg [87:0] in_ypos_inject_2_3_2;
	reg [87:0] in_zpos_inject_2_3_2;
	reg [87:0] in_xneg_inject_2_3_2;
	reg [87:0] in_yneg_inject_2_3_2;
	reg [87:0] in_zneg_inject_2_3_2;
	reg [87:0] reduce_me_2_3_2;
	reg [93:0] newcomm_2_3_2;
	reg [87:0] in_xpos_inject_2_2_3;
	reg [87:0] in_ypos_inject_2_2_3;
	reg [87:0] in_zpos_inject_2_2_3;
	reg [87:0] in_xneg_inject_2_2_3;
	reg [87:0] in_yneg_inject_2_2_3;
	reg [87:0] in_zneg_inject_2_2_3;
	reg [87:0] reduce_me_2_2_3;
	reg [93:0] newcomm_2_2_3;
	reg [87:0] in_xpos_inject_2_2_2;
	reg [87:0] in_ypos_inject_2_2_2;
	reg [87:0] in_zpos_inject_2_2_2;
	reg [87:0] in_xneg_inject_2_2_2;
	reg [87:0] in_yneg_inject_2_2_2;
	reg [87:0] in_zneg_inject_2_2_2;
	reg [87:0] reduce_me_2_2_2;
	reg [93:0] newcomm_2_2_2;

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
	network_64 uut (
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
		.in_xpos_inject_3_0_0(in_xpos_inject_3_0_0), 
		.in_ypos_inject_3_0_0(in_ypos_inject_3_0_0), 
		.in_zpos_inject_3_0_0(in_zpos_inject_3_0_0), 
		.in_xneg_inject_3_0_0(in_xneg_inject_3_0_0), 
		.in_yneg_inject_3_0_0(in_yneg_inject_3_0_0), 
		.in_zneg_inject_3_0_0(in_zneg_inject_3_0_0), 
		.reduce_me_3_0_0(reduce_me_3_0_0), 
		.newcomm_3_0_0(newcomm_3_0_0), 
		.in_xpos_inject_3_0_1(in_xpos_inject_3_0_1), 
		.in_ypos_inject_3_0_1(in_ypos_inject_3_0_1), 
		.in_zpos_inject_3_0_1(in_zpos_inject_3_0_1), 
		.in_xneg_inject_3_0_1(in_xneg_inject_3_0_1), 
		.in_yneg_inject_3_0_1(in_yneg_inject_3_0_1), 
		.in_zneg_inject_3_0_1(in_zneg_inject_3_0_1), 
		.reduce_me_3_0_1(reduce_me_3_0_1), 
		.newcomm_3_0_1(newcomm_3_0_1), 
		.in_xpos_inject_3_1_0(in_xpos_inject_3_1_0), 
		.in_ypos_inject_3_1_0(in_ypos_inject_3_1_0), 
		.in_zpos_inject_3_1_0(in_zpos_inject_3_1_0), 
		.in_xneg_inject_3_1_0(in_xneg_inject_3_1_0), 
		.in_yneg_inject_3_1_0(in_yneg_inject_3_1_0), 
		.in_zneg_inject_3_1_0(in_zneg_inject_3_1_0), 
		.reduce_me_3_1_0(reduce_me_3_1_0), 
		.newcomm_3_1_0(newcomm_3_1_0), 
		.in_xpos_inject_3_1_1(in_xpos_inject_3_1_1), 
		.in_ypos_inject_3_1_1(in_ypos_inject_3_1_1), 
		.in_zpos_inject_3_1_1(in_zpos_inject_3_1_1), 
		.in_xneg_inject_3_1_1(in_xneg_inject_3_1_1), 
		.in_yneg_inject_3_1_1(in_yneg_inject_3_1_1), 
		.in_zneg_inject_3_1_1(in_zneg_inject_3_1_1), 
		.reduce_me_3_1_1(reduce_me_3_1_1), 
		.newcomm_3_1_1(newcomm_3_1_1), 
		.in_xpos_inject_2_0_0(in_xpos_inject_2_0_0), 
		.in_ypos_inject_2_0_0(in_ypos_inject_2_0_0), 
		.in_zpos_inject_2_0_0(in_zpos_inject_2_0_0), 
		.in_xneg_inject_2_0_0(in_xneg_inject_2_0_0), 
		.in_yneg_inject_2_0_0(in_yneg_inject_2_0_0), 
		.in_zneg_inject_2_0_0(in_zneg_inject_2_0_0), 
		.reduce_me_2_0_0(reduce_me_2_0_0), 
		.newcomm_2_0_0(newcomm_2_0_0), 
		.in_xpos_inject_2_0_1(in_xpos_inject_2_0_1), 
		.in_ypos_inject_2_0_1(in_ypos_inject_2_0_1), 
		.in_zpos_inject_2_0_1(in_zpos_inject_2_0_1), 
		.in_xneg_inject_2_0_1(in_xneg_inject_2_0_1), 
		.in_yneg_inject_2_0_1(in_yneg_inject_2_0_1), 
		.in_zneg_inject_2_0_1(in_zneg_inject_2_0_1), 
		.reduce_me_2_0_1(reduce_me_2_0_1), 
		.newcomm_2_0_1(newcomm_2_0_1), 
		.in_xpos_inject_2_1_0(in_xpos_inject_2_1_0), 
		.in_ypos_inject_2_1_0(in_ypos_inject_2_1_0), 
		.in_zpos_inject_2_1_0(in_zpos_inject_2_1_0), 
		.in_xneg_inject_2_1_0(in_xneg_inject_2_1_0), 
		.in_yneg_inject_2_1_0(in_yneg_inject_2_1_0), 
		.in_zneg_inject_2_1_0(in_zneg_inject_2_1_0), 
		.reduce_me_2_1_0(reduce_me_2_1_0), 
		.newcomm_2_1_0(newcomm_2_1_0), 
		.in_xpos_inject_2_1_1(in_xpos_inject_2_1_1), 
		.in_ypos_inject_2_1_1(in_ypos_inject_2_1_1), 
		.in_zpos_inject_2_1_1(in_zpos_inject_2_1_1), 
		.in_xneg_inject_2_1_1(in_xneg_inject_2_1_1), 
		.in_yneg_inject_2_1_1(in_yneg_inject_2_1_1), 
		.in_zneg_inject_2_1_1(in_zneg_inject_2_1_1), 
		.reduce_me_2_1_1(reduce_me_2_1_1), 
		.newcomm_2_1_1(newcomm_2_1_1), 
		.in_xpos_inject_3_0_3(in_xpos_inject_3_0_3), 
		.in_ypos_inject_3_0_3(in_ypos_inject_3_0_3), 
		.in_zpos_inject_3_0_3(in_zpos_inject_3_0_3), 
		.in_xneg_inject_3_0_3(in_xneg_inject_3_0_3), 
		.in_yneg_inject_3_0_3(in_yneg_inject_3_0_3), 
		.in_zneg_inject_3_0_3(in_zneg_inject_3_0_3), 
		.reduce_me_3_0_3(reduce_me_3_0_3), 
		.newcomm_3_0_3(newcomm_3_0_3), 
		.in_xpos_inject_3_0_2(in_xpos_inject_3_0_2), 
		.in_ypos_inject_3_0_2(in_ypos_inject_3_0_2), 
		.in_zpos_inject_3_0_2(in_zpos_inject_3_0_2), 
		.in_xneg_inject_3_0_2(in_xneg_inject_3_0_2), 
		.in_yneg_inject_3_0_2(in_yneg_inject_3_0_2), 
		.in_zneg_inject_3_0_2(in_zneg_inject_3_0_2), 
		.reduce_me_3_0_2(reduce_me_3_0_2), 
		.newcomm_3_0_2(newcomm_3_0_2), 
		.in_xpos_inject_3_1_3(in_xpos_inject_3_1_3), 
		.in_ypos_inject_3_1_3(in_ypos_inject_3_1_3), 
		.in_zpos_inject_3_1_3(in_zpos_inject_3_1_3), 
		.in_xneg_inject_3_1_3(in_xneg_inject_3_1_3), 
		.in_yneg_inject_3_1_3(in_yneg_inject_3_1_3), 
		.in_zneg_inject_3_1_3(in_zneg_inject_3_1_3), 
		.reduce_me_3_1_3(reduce_me_3_1_3), 
		.newcomm_3_1_3(newcomm_3_1_3), 
		.in_xpos_inject_3_1_2(in_xpos_inject_3_1_2), 
		.in_ypos_inject_3_1_2(in_ypos_inject_3_1_2), 
		.in_zpos_inject_3_1_2(in_zpos_inject_3_1_2), 
		.in_xneg_inject_3_1_2(in_xneg_inject_3_1_2), 
		.in_yneg_inject_3_1_2(in_yneg_inject_3_1_2), 
		.in_zneg_inject_3_1_2(in_zneg_inject_3_1_2), 
		.reduce_me_3_1_2(reduce_me_3_1_2), 
		.newcomm_3_1_2(newcomm_3_1_2), 
		.in_xpos_inject_2_0_3(in_xpos_inject_2_0_3), 
		.in_ypos_inject_2_0_3(in_ypos_inject_2_0_3), 
		.in_zpos_inject_2_0_3(in_zpos_inject_2_0_3), 
		.in_xneg_inject_2_0_3(in_xneg_inject_2_0_3), 
		.in_yneg_inject_2_0_3(in_yneg_inject_2_0_3), 
		.in_zneg_inject_2_0_3(in_zneg_inject_2_0_3), 
		.reduce_me_2_0_3(reduce_me_2_0_3), 
		.newcomm_2_0_3(newcomm_2_0_3), 
		.in_xpos_inject_2_0_2(in_xpos_inject_2_0_2), 
		.in_ypos_inject_2_0_2(in_ypos_inject_2_0_2), 
		.in_zpos_inject_2_0_2(in_zpos_inject_2_0_2), 
		.in_xneg_inject_2_0_2(in_xneg_inject_2_0_2), 
		.in_yneg_inject_2_0_2(in_yneg_inject_2_0_2), 
		.in_zneg_inject_2_0_2(in_zneg_inject_2_0_2), 
		.reduce_me_2_0_2(reduce_me_2_0_2), 
		.newcomm_2_0_2(newcomm_2_0_2), 
		.in_xpos_inject_2_1_3(in_xpos_inject_2_1_3), 
		.in_ypos_inject_2_1_3(in_ypos_inject_2_1_3), 
		.in_zpos_inject_2_1_3(in_zpos_inject_2_1_3), 
		.in_xneg_inject_2_1_3(in_xneg_inject_2_1_3), 
		.in_yneg_inject_2_1_3(in_yneg_inject_2_1_3), 
		.in_zneg_inject_2_1_3(in_zneg_inject_2_1_3), 
		.reduce_me_2_1_3(reduce_me_2_1_3), 
		.newcomm_2_1_3(newcomm_2_1_3), 
		.in_xpos_inject_2_1_2(in_xpos_inject_2_1_2), 
		.in_ypos_inject_2_1_2(in_ypos_inject_2_1_2), 
		.in_zpos_inject_2_1_2(in_zpos_inject_2_1_2), 
		.in_xneg_inject_2_1_2(in_xneg_inject_2_1_2), 
		.in_yneg_inject_2_1_2(in_yneg_inject_2_1_2), 
		.in_zneg_inject_2_1_2(in_zneg_inject_2_1_2), 
		.reduce_me_2_1_2(reduce_me_2_1_2), 
		.newcomm_2_1_2(newcomm_2_1_2), 
		.in_xpos_inject_3_3_0(in_xpos_inject_3_3_0), 
		.in_ypos_inject_3_3_0(in_ypos_inject_3_3_0), 
		.in_zpos_inject_3_3_0(in_zpos_inject_3_3_0), 
		.in_xneg_inject_3_3_0(in_xneg_inject_3_3_0), 
		.in_yneg_inject_3_3_0(in_yneg_inject_3_3_0), 
		.in_zneg_inject_3_3_0(in_zneg_inject_3_3_0), 
		.reduce_me_3_3_0(reduce_me_3_3_0), 
		.newcomm_3_3_0(newcomm_3_3_0), 
		.in_xpos_inject_3_3_1(in_xpos_inject_3_3_1), 
		.in_ypos_inject_3_3_1(in_ypos_inject_3_3_1), 
		.in_zpos_inject_3_3_1(in_zpos_inject_3_3_1), 
		.in_xneg_inject_3_3_1(in_xneg_inject_3_3_1), 
		.in_yneg_inject_3_3_1(in_yneg_inject_3_3_1), 
		.in_zneg_inject_3_3_1(in_zneg_inject_3_3_1), 
		.reduce_me_3_3_1(reduce_me_3_3_1), 
		.newcomm_3_3_1(newcomm_3_3_1), 
		.in_xpos_inject_3_2_0(in_xpos_inject_3_2_0), 
		.in_ypos_inject_3_2_0(in_ypos_inject_3_2_0), 
		.in_zpos_inject_3_2_0(in_zpos_inject_3_2_0), 
		.in_xneg_inject_3_2_0(in_xneg_inject_3_2_0), 
		.in_yneg_inject_3_2_0(in_yneg_inject_3_2_0), 
		.in_zneg_inject_3_2_0(in_zneg_inject_3_2_0), 
		.reduce_me_3_2_0(reduce_me_3_2_0), 
		.newcomm_3_2_0(newcomm_3_2_0), 
		.in_xpos_inject_3_2_1(in_xpos_inject_3_2_1), 
		.in_ypos_inject_3_2_1(in_ypos_inject_3_2_1), 
		.in_zpos_inject_3_2_1(in_zpos_inject_3_2_1), 
		.in_xneg_inject_3_2_1(in_xneg_inject_3_2_1), 
		.in_yneg_inject_3_2_1(in_yneg_inject_3_2_1), 
		.in_zneg_inject_3_2_1(in_zneg_inject_3_2_1), 
		.reduce_me_3_2_1(reduce_me_3_2_1), 
		.newcomm_3_2_1(newcomm_3_2_1), 
		.in_xpos_inject_2_3_0(in_xpos_inject_2_3_0), 
		.in_ypos_inject_2_3_0(in_ypos_inject_2_3_0), 
		.in_zpos_inject_2_3_0(in_zpos_inject_2_3_0), 
		.in_xneg_inject_2_3_0(in_xneg_inject_2_3_0), 
		.in_yneg_inject_2_3_0(in_yneg_inject_2_3_0), 
		.in_zneg_inject_2_3_0(in_zneg_inject_2_3_0), 
		.reduce_me_2_3_0(reduce_me_2_3_0), 
		.newcomm_2_3_0(newcomm_2_3_0), 
		.in_xpos_inject_2_3_1(in_xpos_inject_2_3_1), 
		.in_ypos_inject_2_3_1(in_ypos_inject_2_3_1), 
		.in_zpos_inject_2_3_1(in_zpos_inject_2_3_1), 
		.in_xneg_inject_2_3_1(in_xneg_inject_2_3_1), 
		.in_yneg_inject_2_3_1(in_yneg_inject_2_3_1), 
		.in_zneg_inject_2_3_1(in_zneg_inject_2_3_1), 
		.reduce_me_2_3_1(reduce_me_2_3_1), 
		.newcomm_2_3_1(newcomm_2_3_1), 
		.in_xpos_inject_2_2_0(in_xpos_inject_2_2_0), 
		.in_ypos_inject_2_2_0(in_ypos_inject_2_2_0), 
		.in_zpos_inject_2_2_0(in_zpos_inject_2_2_0), 
		.in_xneg_inject_2_2_0(in_xneg_inject_2_2_0), 
		.in_yneg_inject_2_2_0(in_yneg_inject_2_2_0), 
		.in_zneg_inject_2_2_0(in_zneg_inject_2_2_0), 
		.reduce_me_2_2_0(reduce_me_2_2_0), 
		.newcomm_2_2_0(newcomm_2_2_0), 
		.in_xpos_inject_2_2_1(in_xpos_inject_2_2_1), 
		.in_ypos_inject_2_2_1(in_ypos_inject_2_2_1), 
		.in_zpos_inject_2_2_1(in_zpos_inject_2_2_1), 
		.in_xneg_inject_2_2_1(in_xneg_inject_2_2_1), 
		.in_yneg_inject_2_2_1(in_yneg_inject_2_2_1), 
		.in_zneg_inject_2_2_1(in_zneg_inject_2_2_1), 
		.reduce_me_2_2_1(reduce_me_2_2_1), 
		.newcomm_2_2_1(newcomm_2_2_1), 
		.in_xpos_inject_3_3_3(in_xpos_inject_3_3_3), 
		.in_ypos_inject_3_3_3(in_ypos_inject_3_3_3), 
		.in_zpos_inject_3_3_3(in_zpos_inject_3_3_3), 
		.in_xneg_inject_3_3_3(in_xneg_inject_3_3_3), 
		.in_yneg_inject_3_3_3(in_yneg_inject_3_3_3), 
		.in_zneg_inject_3_3_3(in_zneg_inject_3_3_3), 
		.reduce_me_3_3_3(reduce_me_3_3_3), 
		.newcomm_3_3_3(newcomm_3_3_3), 
		.in_xpos_inject_3_3_2(in_xpos_inject_3_3_2), 
		.in_ypos_inject_3_3_2(in_ypos_inject_3_3_2), 
		.in_zpos_inject_3_3_2(in_zpos_inject_3_3_2), 
		.in_xneg_inject_3_3_2(in_xneg_inject_3_3_2), 
		.in_yneg_inject_3_3_2(in_yneg_inject_3_3_2), 
		.in_zneg_inject_3_3_2(in_zneg_inject_3_3_2), 
		.reduce_me_3_3_2(reduce_me_3_3_2), 
		.newcomm_3_3_2(newcomm_3_3_2), 
		.in_xpos_inject_3_2_3(in_xpos_inject_3_2_3), 
		.in_ypos_inject_3_2_3(in_ypos_inject_3_2_3), 
		.in_zpos_inject_3_2_3(in_zpos_inject_3_2_3), 
		.in_xneg_inject_3_2_3(in_xneg_inject_3_2_3), 
		.in_yneg_inject_3_2_3(in_yneg_inject_3_2_3), 
		.in_zneg_inject_3_2_3(in_zneg_inject_3_2_3), 
		.reduce_me_3_2_3(reduce_me_3_2_3), 
		.newcomm_3_2_3(newcomm_3_2_3), 
		.in_xpos_inject_3_2_2(in_xpos_inject_3_2_2), 
		.in_ypos_inject_3_2_2(in_ypos_inject_3_2_2), 
		.in_zpos_inject_3_2_2(in_zpos_inject_3_2_2), 
		.in_xneg_inject_3_2_2(in_xneg_inject_3_2_2), 
		.in_yneg_inject_3_2_2(in_yneg_inject_3_2_2), 
		.in_zneg_inject_3_2_2(in_zneg_inject_3_2_2), 
		.reduce_me_3_2_2(reduce_me_3_2_2), 
		.newcomm_3_2_2(newcomm_3_2_2), 
		.in_xpos_inject_2_3_3(in_xpos_inject_2_3_3), 
		.in_ypos_inject_2_3_3(in_ypos_inject_2_3_3), 
		.in_zpos_inject_2_3_3(in_zpos_inject_2_3_3), 
		.in_xneg_inject_2_3_3(in_xneg_inject_2_3_3), 
		.in_yneg_inject_2_3_3(in_yneg_inject_2_3_3), 
		.in_zneg_inject_2_3_3(in_zneg_inject_2_3_3), 
		.reduce_me_2_3_3(reduce_me_2_3_3), 
		.newcomm_2_3_3(newcomm_2_3_3), 
		.in_xpos_inject_2_3_2(in_xpos_inject_2_3_2), 
		.in_ypos_inject_2_3_2(in_ypos_inject_2_3_2), 
		.in_zpos_inject_2_3_2(in_zpos_inject_2_3_2), 
		.in_xneg_inject_2_3_2(in_xneg_inject_2_3_2), 
		.in_yneg_inject_2_3_2(in_yneg_inject_2_3_2), 
		.in_zneg_inject_2_3_2(in_zneg_inject_2_3_2), 
		.reduce_me_2_3_2(reduce_me_2_3_2), 
		.newcomm_2_3_2(newcomm_2_3_2), 
		.in_xpos_inject_2_2_3(in_xpos_inject_2_2_3), 
		.in_ypos_inject_2_2_3(in_ypos_inject_2_2_3), 
		.in_zpos_inject_2_2_3(in_zpos_inject_2_2_3), 
		.in_xneg_inject_2_2_3(in_xneg_inject_2_2_3), 
		.in_yneg_inject_2_2_3(in_yneg_inject_2_2_3), 
		.in_zneg_inject_2_2_3(in_zneg_inject_2_2_3), 
		.reduce_me_2_2_3(reduce_me_2_2_3), 
		.newcomm_2_2_3(newcomm_2_2_3), 
		.in_xpos_inject_2_2_2(in_xpos_inject_2_2_2), 
		.in_ypos_inject_2_2_2(in_ypos_inject_2_2_2), 
		.in_zpos_inject_2_2_2(in_zpos_inject_2_2_2), 
		.in_xneg_inject_2_2_2(in_xneg_inject_2_2_2), 
		.in_yneg_inject_2_2_2(in_yneg_inject_2_2_2), 
		.in_zneg_inject_2_2_2(in_zneg_inject_2_2_2), 
		.reduce_me_2_2_2(reduce_me_2_2_2), 
		.newcomm_2_2_2(newcomm_2_2_2), 
		.valid(valid)
	);

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
		newcomm_0_0_0 = 0;
		in_xpos_inject_0_0_1 = 0;
		in_ypos_inject_0_0_1 = 0;
		in_zpos_inject_0_0_1 = 0;
		in_xneg_inject_0_0_1 = 0;
		in_yneg_inject_0_0_1 = 0;
		in_zneg_inject_0_0_1 = 0;
		reduce_me_0_0_1 = 0;
		newcomm_0_0_1 = 0;
		in_xpos_inject_0_1_0 = 0;
		in_ypos_inject_0_1_0 = 0;
		in_zpos_inject_0_1_0 = 0;
		in_xneg_inject_0_1_0 = 0;
		in_yneg_inject_0_1_0 = 0;
		in_zneg_inject_0_1_0 = 0;
		reduce_me_0_1_0 = 0;
		newcomm_0_1_0 = 0;
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
		newcomm_1_0_0 = 0;
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
		in_xpos_inject_0_0_3 = 0;
		in_ypos_inject_0_0_3 = 0;
		in_zpos_inject_0_0_3 = 0;
		in_xneg_inject_0_0_3 = 0;
		in_yneg_inject_0_0_3 = 0;
		in_zneg_inject_0_0_3 = 0;
		reduce_me_0_0_3 = 0;
		newcomm_0_0_3 = 0;
		in_xpos_inject_0_0_2 = 0;
		in_ypos_inject_0_0_2 = 0;
		in_zpos_inject_0_0_2 = 0;
		in_xneg_inject_0_0_2 = 0;
		in_yneg_inject_0_0_2 = 0;
		in_zneg_inject_0_0_2 = 0;
		reduce_me_0_0_2 = 0;
		newcomm_0_0_2 = 0;
		in_xpos_inject_0_1_3 = 0;
		in_ypos_inject_0_1_3 = 0;
		in_zpos_inject_0_1_3 = 0;
		in_xneg_inject_0_1_3 = 0;
		in_yneg_inject_0_1_3 = 0;
		in_zneg_inject_0_1_3 = 0;
		reduce_me_0_1_3 = 0;
		newcomm_0_1_3 = 0;
		in_xpos_inject_0_1_2 = 0;
		in_ypos_inject_0_1_2 = 0;
		in_zpos_inject_0_1_2 = 0;
		in_xneg_inject_0_1_2 = 0;
		in_yneg_inject_0_1_2 = 0;
		in_zneg_inject_0_1_2 = 0;
		reduce_me_0_1_2 = 0;
		newcomm_0_1_2 = 0;
		in_xpos_inject_1_0_3 = 0;
		in_ypos_inject_1_0_3 = 0;
		in_zpos_inject_1_0_3 = 0;
		in_xneg_inject_1_0_3 = 0;
		in_yneg_inject_1_0_3 = 0;
		in_zneg_inject_1_0_3 = 0;
		reduce_me_1_0_3 = 0;
		newcomm_1_0_3 = 0;
		in_xpos_inject_1_0_2 = 0;
		in_ypos_inject_1_0_2 = 0;
		in_zpos_inject_1_0_2 = 0;
		in_xneg_inject_1_0_2 = 0;
		in_yneg_inject_1_0_2 = 0;
		in_zneg_inject_1_0_2 = 0;
		reduce_me_1_0_2 = 0;
		newcomm_1_0_2 = 0;
		in_xpos_inject_1_1_3 = 0;
		in_ypos_inject_1_1_3 = 0;
		in_zpos_inject_1_1_3 = 0;
		in_xneg_inject_1_1_3 = 0;
		in_yneg_inject_1_1_3 = 0;
		in_zneg_inject_1_1_3 = 0;
		reduce_me_1_1_3 = 0;
		newcomm_1_1_3 = 0;
		in_xpos_inject_1_1_2 = 0;
		in_ypos_inject_1_1_2 = 0;
		in_zpos_inject_1_1_2 = 0;
		in_xneg_inject_1_1_2 = 0;
		in_yneg_inject_1_1_2 = 0;
		in_zneg_inject_1_1_2 = 0;
		reduce_me_1_1_2 = 0;
		newcomm_1_1_2 = 0;
		in_xpos_inject_0_3_0 = 0;
		in_ypos_inject_0_3_0 = 0;
		in_zpos_inject_0_3_0 = 0;
		in_xneg_inject_0_3_0 = 0;
		in_yneg_inject_0_3_0 = 0;
		in_zneg_inject_0_3_0 = 0;
		reduce_me_0_3_0 = 0;
		newcomm_0_3_0 = 0;
		in_xpos_inject_0_3_1 = 0;
		in_ypos_inject_0_3_1 = 0;
		in_zpos_inject_0_3_1 = 0;
		in_xneg_inject_0_3_1 = 0;
		in_yneg_inject_0_3_1 = 0;
		in_zneg_inject_0_3_1 = 0;
		reduce_me_0_3_1 = 0;
		newcomm_0_3_1 = 0;
		in_xpos_inject_0_2_0 = 0;
		in_ypos_inject_0_2_0 = 0;
		in_zpos_inject_0_2_0 = 0;
		in_xneg_inject_0_2_0 = 0;
		in_yneg_inject_0_2_0 = 0;
		in_zneg_inject_0_2_0 = 0;
		reduce_me_0_2_0 = 0;
		newcomm_0_2_0 = 0;
		in_xpos_inject_0_2_1 = 0;
		in_ypos_inject_0_2_1 = 0;
		in_zpos_inject_0_2_1 = 0;
		in_xneg_inject_0_2_1 = 0;
		in_yneg_inject_0_2_1 = 0;
		in_zneg_inject_0_2_1 = 0;
		reduce_me_0_2_1 = 0;
		newcomm_0_2_1 = 0;
		in_xpos_inject_1_3_0 = 0;
		in_ypos_inject_1_3_0 = 0;
		in_zpos_inject_1_3_0 = 0;
		in_xneg_inject_1_3_0 = 0;
		in_yneg_inject_1_3_0 = 0;
		in_zneg_inject_1_3_0 = 0;
		reduce_me_1_3_0 = 0;
		newcomm_1_3_0 = 0;
		in_xpos_inject_1_3_1 = 0;
		in_ypos_inject_1_3_1 = 0;
		in_zpos_inject_1_3_1 = 0;
		in_xneg_inject_1_3_1 = 0;
		in_yneg_inject_1_3_1 = 0;
		in_zneg_inject_1_3_1 = 0;
		reduce_me_1_3_1 = 0;
		newcomm_1_3_1 = 0;
		in_xpos_inject_1_2_0 = 0;
		in_ypos_inject_1_2_0 = 0;
		in_zpos_inject_1_2_0 = 0;
		in_xneg_inject_1_2_0 = 0;
		in_yneg_inject_1_2_0 = 0;
		in_zneg_inject_1_2_0 = 0;
		reduce_me_1_2_0 = 0;
		newcomm_1_2_0 = 0;
		in_xpos_inject_1_2_1 = 0;
		in_ypos_inject_1_2_1 = 0;
		in_zpos_inject_1_2_1 = 0;
		in_xneg_inject_1_2_1 = 0;
		in_yneg_inject_1_2_1 = 0;
		in_zneg_inject_1_2_1 = 0;
		reduce_me_1_2_1 = 0;
		newcomm_1_2_1 = 0;
		in_xpos_inject_0_3_3 = 0;
		in_ypos_inject_0_3_3 = 0;
		in_zpos_inject_0_3_3 = 0;
		in_xneg_inject_0_3_3 = 0;
		in_yneg_inject_0_3_3 = 0;
		in_zneg_inject_0_3_3 = 0;
		reduce_me_0_3_3 = 0;
		newcomm_0_3_3 = 0;
		in_xpos_inject_0_3_2 = 0;
		in_ypos_inject_0_3_2 = 0;
		in_zpos_inject_0_3_2 = 0;
		in_xneg_inject_0_3_2 = 0;
		in_yneg_inject_0_3_2 = 0;
		in_zneg_inject_0_3_2 = 0;
		reduce_me_0_3_2 = 0;
		newcomm_0_3_2 = 0;
		in_xpos_inject_0_2_3 = 0;
		in_ypos_inject_0_2_3 = 0;
		in_zpos_inject_0_2_3 = 0;
		in_xneg_inject_0_2_3 = 0;
		in_yneg_inject_0_2_3 = 0;
		in_zneg_inject_0_2_3 = 0;
		reduce_me_0_2_3 = 0;
		newcomm_0_2_3 = 0;
		in_xpos_inject_0_2_2 = 0;
		in_ypos_inject_0_2_2 = 0;
		in_zpos_inject_0_2_2 = 0;
		in_xneg_inject_0_2_2 = 0;
		in_yneg_inject_0_2_2 = 0;
		in_zneg_inject_0_2_2 = 0;
		reduce_me_0_2_2 = 0;
		newcomm_0_2_2 = 0;
		in_xpos_inject_1_3_3 = 0;
		in_ypos_inject_1_3_3 = 0;
		in_zpos_inject_1_3_3 = 0;
		in_xneg_inject_1_3_3 = 0;
		in_yneg_inject_1_3_3 = 0;
		in_zneg_inject_1_3_3 = 0;
		reduce_me_1_3_3 = 0;
		newcomm_1_3_3 = 0;
		in_xpos_inject_1_3_2 = 0;
		in_ypos_inject_1_3_2 = 0;
		in_zpos_inject_1_3_2 = 0;
		in_xneg_inject_1_3_2 = 0;
		in_yneg_inject_1_3_2 = 0;
		in_zneg_inject_1_3_2 = 0;
		reduce_me_1_3_2 = 0;
		newcomm_1_3_2 = 0;
		in_xpos_inject_1_2_3 = 0;
		in_ypos_inject_1_2_3 = 0;
		in_zpos_inject_1_2_3 = 0;
		in_xneg_inject_1_2_3 = 0;
		in_yneg_inject_1_2_3 = 0;
		in_zneg_inject_1_2_3 = 0;
		reduce_me_1_2_3 = 0;
		newcomm_1_2_3 = 0;
		in_xpos_inject_1_2_2 = 0;
		in_ypos_inject_1_2_2 = 0;
		in_zpos_inject_1_2_2 = 0;
		in_xneg_inject_1_2_2 = 0;
		in_yneg_inject_1_2_2 = 0;
		in_zneg_inject_1_2_2 = 0;
		reduce_me_1_2_2 = 0;
		newcomm_1_2_2 = 0;
		in_xpos_inject_3_0_0 = 0;
		in_ypos_inject_3_0_0 = 0;
		in_zpos_inject_3_0_0 = 0;
		in_xneg_inject_3_0_0 = 0;
		in_yneg_inject_3_0_0 = 0;
		in_zneg_inject_3_0_0 = 0;
		reduce_me_3_0_0 = 0;
		newcomm_3_0_0 = 0;
		in_xpos_inject_3_0_1 = 0;
		in_ypos_inject_3_0_1 = 0;
		in_zpos_inject_3_0_1 = 0;
		in_xneg_inject_3_0_1 = 0;
		in_yneg_inject_3_0_1 = 0;
		in_zneg_inject_3_0_1 = 0;
		reduce_me_3_0_1 = 0;
		newcomm_3_0_1 = 0;
		in_xpos_inject_3_1_0 = 0;
		in_ypos_inject_3_1_0 = 0;
		in_zpos_inject_3_1_0 = 0;
		in_xneg_inject_3_1_0 = 0;
		in_yneg_inject_3_1_0 = 0;
		in_zneg_inject_3_1_0 = 0;
		reduce_me_3_1_0 = 0;
		newcomm_3_1_0 = 0;
		in_xpos_inject_3_1_1 = 0;
		in_ypos_inject_3_1_1 = 0;
		in_zpos_inject_3_1_1 = 0;
		in_xneg_inject_3_1_1 = 0;
		in_yneg_inject_3_1_1 = 0;
		in_zneg_inject_3_1_1 = 0;
		reduce_me_3_1_1 = 0;
		newcomm_3_1_1 = 0;
		in_xpos_inject_2_0_0 = 0;
		in_ypos_inject_2_0_0 = 0;
		in_zpos_inject_2_0_0 = 0;
		in_xneg_inject_2_0_0 = 0;
		in_yneg_inject_2_0_0 = 0;
		in_zneg_inject_2_0_0 = 0;
		reduce_me_2_0_0 = 0;
		newcomm_2_0_0 = 0;
		in_xpos_inject_2_0_1 = 0;
		in_ypos_inject_2_0_1 = 0;
		in_zpos_inject_2_0_1 = 0;
		in_xneg_inject_2_0_1 = 0;
		in_yneg_inject_2_0_1 = 0;
		in_zneg_inject_2_0_1 = 0;
		reduce_me_2_0_1 = 0;
		newcomm_2_0_1 = 0;
		in_xpos_inject_2_1_0 = 0;
		in_ypos_inject_2_1_0 = 0;
		in_zpos_inject_2_1_0 = 0;
		in_xneg_inject_2_1_0 = 0;
		in_yneg_inject_2_1_0 = 0;
		in_zneg_inject_2_1_0 = 0;
		reduce_me_2_1_0 = 0;
		newcomm_2_1_0 = 0;
		in_xpos_inject_2_1_1 = 0;
		in_ypos_inject_2_1_1 = 0;
		in_zpos_inject_2_1_1 = 0;
		in_xneg_inject_2_1_1 = 0;
		in_yneg_inject_2_1_1 = 0;
		in_zneg_inject_2_1_1 = 0;
		reduce_me_2_1_1 = 0;
		newcomm_2_1_1 = 0;
		in_xpos_inject_3_0_3 = 0;
		in_ypos_inject_3_0_3 = 0;
		in_zpos_inject_3_0_3 = 0;
		in_xneg_inject_3_0_3 = 0;
		in_yneg_inject_3_0_3 = 0;
		in_zneg_inject_3_0_3 = 0;
		reduce_me_3_0_3 = 0;
		newcomm_3_0_3 = 0;
		in_xpos_inject_3_0_2 = 0;
		in_ypos_inject_3_0_2 = 0;
		in_zpos_inject_3_0_2 = 0;
		in_xneg_inject_3_0_2 = 0;
		in_yneg_inject_3_0_2 = 0;
		in_zneg_inject_3_0_2 = 0;
		reduce_me_3_0_2 = 0;
		newcomm_3_0_2 = 0;
		in_xpos_inject_3_1_3 = 0;
		in_ypos_inject_3_1_3 = 0;
		in_zpos_inject_3_1_3 = 0;
		in_xneg_inject_3_1_3 = 0;
		in_yneg_inject_3_1_3 = 0;
		in_zneg_inject_3_1_3 = 0;
		reduce_me_3_1_3 = 0;
		newcomm_3_1_3 = 0;
		in_xpos_inject_3_1_2 = 0;
		in_ypos_inject_3_1_2 = 0;
		in_zpos_inject_3_1_2 = 0;
		in_xneg_inject_3_1_2 = 0;
		in_yneg_inject_3_1_2 = 0;
		in_zneg_inject_3_1_2 = 0;
		reduce_me_3_1_2 = 0;
		newcomm_3_1_2 = 0;
		in_xpos_inject_2_0_3 = 0;
		in_ypos_inject_2_0_3 = 0;
		in_zpos_inject_2_0_3 = 0;
		in_xneg_inject_2_0_3 = 0;
		in_yneg_inject_2_0_3 = 0;
		in_zneg_inject_2_0_3 = 0;
		reduce_me_2_0_3 = 0;
		newcomm_2_0_3 = 0;
		in_xpos_inject_2_0_2 = 0;
		in_ypos_inject_2_0_2 = 0;
		in_zpos_inject_2_0_2 = 0;
		in_xneg_inject_2_0_2 = 0;
		in_yneg_inject_2_0_2 = 0;
		in_zneg_inject_2_0_2 = 0;
		reduce_me_2_0_2 = 0;
		newcomm_2_0_2 = 0;
		in_xpos_inject_2_1_3 = 0;
		in_ypos_inject_2_1_3 = 0;
		in_zpos_inject_2_1_3 = 0;
		in_xneg_inject_2_1_3 = 0;
		in_yneg_inject_2_1_3 = 0;
		in_zneg_inject_2_1_3 = 0;
		reduce_me_2_1_3 = 0;
		newcomm_2_1_3 = 0;
		in_xpos_inject_2_1_2 = 0;
		in_ypos_inject_2_1_2 = 0;
		in_zpos_inject_2_1_2 = 0;
		in_xneg_inject_2_1_2 = 0;
		in_yneg_inject_2_1_2 = 0;
		in_zneg_inject_2_1_2 = 0;
		reduce_me_2_1_2 = 0;
		newcomm_2_1_2 = 0;
		in_xpos_inject_3_3_0 = 0;
		in_ypos_inject_3_3_0 = 0;
		in_zpos_inject_3_3_0 = 0;
		in_xneg_inject_3_3_0 = 0;
		in_yneg_inject_3_3_0 = 0;
		in_zneg_inject_3_3_0 = 0;
		reduce_me_3_3_0 = 0;
		newcomm_3_3_0 = 0;
		in_xpos_inject_3_3_1 = 0;
		in_ypos_inject_3_3_1 = 0;
		in_zpos_inject_3_3_1 = 0;
		in_xneg_inject_3_3_1 = 0;
		in_yneg_inject_3_3_1 = 0;
		in_zneg_inject_3_3_1 = 0;
		reduce_me_3_3_1 = 0;
		newcomm_3_3_1 = 0;
		in_xpos_inject_3_2_0 = 0;
		in_ypos_inject_3_2_0 = 0;
		in_zpos_inject_3_2_0 = 0;
		in_xneg_inject_3_2_0 = 0;
		in_yneg_inject_3_2_0 = 0;
		in_zneg_inject_3_2_0 = 0;
		reduce_me_3_2_0 = 0;
		newcomm_3_2_0 = 0;
		in_xpos_inject_3_2_1 = 0;
		in_ypos_inject_3_2_1 = 0;
		in_zpos_inject_3_2_1 = 0;
		in_xneg_inject_3_2_1 = 0;
		in_yneg_inject_3_2_1 = 0;
		in_zneg_inject_3_2_1 = 0;
		reduce_me_3_2_1 = 0;
		newcomm_3_2_1 = 0;
		in_xpos_inject_2_3_0 = 0;
		in_ypos_inject_2_3_0 = 0;
		in_zpos_inject_2_3_0 = 0;
		in_xneg_inject_2_3_0 = 0;
		in_yneg_inject_2_3_0 = 0;
		in_zneg_inject_2_3_0 = 0;
		reduce_me_2_3_0 = 0;
		newcomm_2_3_0 = 0;
		in_xpos_inject_2_3_1 = 0;
		in_ypos_inject_2_3_1 = 0;
		in_zpos_inject_2_3_1 = 0;
		in_xneg_inject_2_3_1 = 0;
		in_yneg_inject_2_3_1 = 0;
		in_zneg_inject_2_3_1 = 0;
		reduce_me_2_3_1 = 0;
		newcomm_2_3_1 = 0;
		in_xpos_inject_2_2_0 = 0;
		in_ypos_inject_2_2_0 = 0;
		in_zpos_inject_2_2_0 = 0;
		in_xneg_inject_2_2_0 = 0;
		in_yneg_inject_2_2_0 = 0;
		in_zneg_inject_2_2_0 = 0;
		reduce_me_2_2_0 = 0;
		newcomm_2_2_0 = 0;
		in_xpos_inject_2_2_1 = 0;
		in_ypos_inject_2_2_1 = 0;
		in_zpos_inject_2_2_1 = 0;
		in_xneg_inject_2_2_1 = 0;
		in_yneg_inject_2_2_1 = 0;
		in_zneg_inject_2_2_1 = 0;
		reduce_me_2_2_1 = 0;
		newcomm_2_2_1 = 0;
		in_xpos_inject_3_3_3 = 0;
		in_ypos_inject_3_3_3 = 0;
		in_zpos_inject_3_3_3 = 0;
		in_xneg_inject_3_3_3 = 0;
		in_yneg_inject_3_3_3 = 0;
		in_zneg_inject_3_3_3 = 0;
		reduce_me_3_3_3 = 0;
		newcomm_3_3_3 = 0;
		in_xpos_inject_3_3_2 = 0;
		in_ypos_inject_3_3_2 = 0;
		in_zpos_inject_3_3_2 = 0;
		in_xneg_inject_3_3_2 = 0;
		in_yneg_inject_3_3_2 = 0;
		in_zneg_inject_3_3_2 = 0;
		reduce_me_3_3_2 = 0;
		newcomm_3_3_2 = 0;
		in_xpos_inject_3_2_3 = 0;
		in_ypos_inject_3_2_3 = 0;
		in_zpos_inject_3_2_3 = 0;
		in_xneg_inject_3_2_3 = 0;
		in_yneg_inject_3_2_3 = 0;
		in_zneg_inject_3_2_3 = 0;
		reduce_me_3_2_3 = 0;
		newcomm_3_2_3 = 0;
		in_xpos_inject_3_2_2 = 0;
		in_ypos_inject_3_2_2 = 0;
		in_zpos_inject_3_2_2 = 0;
		in_xneg_inject_3_2_2 = 0;
		in_yneg_inject_3_2_2 = 0;
		in_zneg_inject_3_2_2 = 0;
		reduce_me_3_2_2 = 0;
		newcomm_3_2_2 = 0;
		in_xpos_inject_2_3_3 = 0;
		in_ypos_inject_2_3_3 = 0;
		in_zpos_inject_2_3_3 = 0;
		in_xneg_inject_2_3_3 = 0;
		in_yneg_inject_2_3_3 = 0;
		in_zneg_inject_2_3_3 = 0;
		reduce_me_2_3_3 = 0;
		newcomm_2_3_3 = 0;
		in_xpos_inject_2_3_2 = 0;
		in_ypos_inject_2_3_2 = 0;
		in_zpos_inject_2_3_2 = 0;
		in_xneg_inject_2_3_2 = 0;
		in_yneg_inject_2_3_2 = 0;
		in_zneg_inject_2_3_2 = 0;
		reduce_me_2_3_2 = 0;
		newcomm_2_3_2 = 0;
		in_xpos_inject_2_2_3 = 0;
		in_ypos_inject_2_2_3 = 0;
		in_zpos_inject_2_2_3 = 0;
		in_xneg_inject_2_2_3 = 0;
		in_yneg_inject_2_2_3 = 0;
		in_zneg_inject_2_2_3 = 0;
		reduce_me_2_2_3 = 0;
		newcomm_2_2_3 = 0;
		in_xpos_inject_2_2_2 = 0;
		in_ypos_inject_2_2_2 = 0;
		in_zpos_inject_2_2_2 = 0;
		in_xneg_inject_2_2_2 = 0;
		in_yneg_inject_2_2_2 = 0;
		in_zneg_inject_2_2_2 = 0;
		reduce_me_2_2_2 = 0;
		newcomm_2_2_2 = 0;

		// Wait 100 ns for global reset to finish
		#105;
      rst = 0; 
		// Add stimulus here

	end
      
endmodule

