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
	localparam THIRTYTWO = {3'b011, 3'b0, 3'b0};
	localparam THIRTYTHREE = {3'b011, 3'b0, 3'b01};
	localparam THIRTYFOUR = {3'b011, 3'b01, 3'b0};
	localparam THIRTYFIVE = {3'b011, 3'b1, 3'b1};	 
	localparam THIRTYSIX = {3'b010, 3'b0, 3'b0};
	localparam THIRTYSEVEN = {3'b010, 3'b0, 3'b01};
	localparam THIRTYEIGHT = {3'b010, 3'b01, 3'b0};
	localparam THIRTYNINE = {3'b010, 3'b01, 3'b01};	 
	localparam FORTY = {3'b011, 3'b0, 3'b011};
	localparam FORTYONE = {3'b011, 3'b0, 3'b010};
	localparam FORTYTWO = {3'b011, 3'b01, 3'b011};
	localparam FORTYTHREE = {3'b011, 3'b1, 3'b010};	 
	localparam FORTYFOUR = {3'b010, 3'b0, 3'b011};
	localparam FORTYFIVE = {3'b010, 3'b0, 3'b010};
	localparam FORTYSIX = {3'b010, 3'b01, 3'b011};
	localparam FORTYSEVEN = {3'b010, 3'b01, 3'b010};	 
	localparam FORTYEIGHT = {3'b011, 3'b011, 3'b0};
	localparam FORTYNINE = {3'b011, 3'b011, 3'b01};
	localparam FIFTY = {3'b011, 3'b010, 3'b0};
	localparam FIFTYONE = {3'b011, 3'b10, 3'b1};	 
	localparam FIFTYTWO = {3'b010, 3'b011, 3'b0};
	localparam FIFTYTHREE = {3'b010, 3'b011, 3'b01};
	localparam FIFTYFOUR = {3'b010, 3'b010, 3'b0};
	localparam FIFTYFIVE = {3'b010, 3'b010, 3'b01};	 
	localparam FIFTYSIX = {3'b011, 3'b011, 3'b011};
	localparam FIFTYSEVEN = {3'b011, 3'b011, 3'b010};
	localparam FIFTYEIGHT = {3'b011, 3'b010, 3'b011};
	localparam FIFTYNINE = {3'b011, 3'b10, 3'b010};	 
	localparam SIXTY = {3'b010, 3'b011, 3'b011};
	localparam SIXTYONE = {3'b010, 3'b011, 3'b010};
	localparam SIXTYTWO = {3'b010, 3'b010, 3'b011};
	localparam SIXTYTHREE = {3'b010, 3'b010, 3'b010};


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
		newcomm_0_0_0 = {1'b1, 8'd0, 9'd0, 9'd0, 6'd6, 7'd6, 9'd1, 9'd2, 9'd4, 9'd8, 9'd16, 9'd32};
		
		in_xpos_inject_0_0_1 = 0;
		in_ypos_inject_0_0_1 = 0;
		in_zpos_inject_0_0_1 = 0;
		in_xneg_inject_0_0_1 = 0;
		in_yneg_inject_0_0_1 = 0;
		in_zneg_inject_0_0_1 = 0;
		reduce_me_0_0_1 = 0;
		newcomm_0_0_1 = {1'b1, 8'd0, 9'd0, 9'd1, 6'd0, 7'd6, 9'd0, 9'd3, 9'd5, 9'd9, 9'd17, 9'd33};
		
		in_xpos_inject_0_1_0 = 0;
		in_ypos_inject_0_1_0 = 0;
		in_zpos_inject_0_1_0 = 0;
		in_xneg_inject_0_1_0 = 0;
		in_yneg_inject_0_1_0 = 0;
		in_zneg_inject_0_1_0 = 0;
		reduce_me_0_1_0 = 0;
		newcomm_0_1_0 = {1'b1, 8'd0, 9'd0, 9'd2, 6'd1, 7'd6, 9'd3, 9'd0, 9'd6, 9'd10, 9'd18, 9'd34};
		
		in_xpos_inject_0_1_1 = 0;
		in_ypos_inject_0_1_1 = 0;
		in_zpos_inject_0_1_1 = 0;
		in_xneg_inject_0_1_1 = 0;
		in_yneg_inject_0_1_1 = 0;
		in_zneg_inject_0_1_1 = 0;
		reduce_me_0_1_1 = 0;
		newcomm_0_1_1 = {1'b1, 8'd0, 9'd0, 9'd3, 6'd0, 7'd6, 9'd2, 9'd1, 9'd7, 9'd11, 9'd19, 9'd35};
		
		in_xpos_inject_1_0_0 = 0;
		in_ypos_inject_1_0_0 = 0;
		in_zpos_inject_1_0_0 = 0;
		in_xneg_inject_1_0_0 = 0;
		in_yneg_inject_1_0_0 = 0;
		in_zneg_inject_1_0_0 = 0;
		reduce_me_1_0_0 = 0;
		newcomm_1_0_0 = {1'b1, 8'd0, 9'd0, 9'd4, 6'd2, 7'd6, 9'd5, 9'd6, 9'd0, 9'd12, 9'd20, 9'd36};
		
		in_xpos_inject_1_0_1 = 0;
		in_ypos_inject_1_0_1 = 0;
		in_zpos_inject_1_0_1 = 0;
		in_xneg_inject_1_0_1 = 0;
		in_yneg_inject_1_0_1 = 0;
		in_zneg_inject_1_0_1 = 0;
		reduce_me_1_0_1 = 0;
		newcomm_1_0_1 = {1'b1, 8'd0, 9'd0, 9'd5, 6'd0, 7'd6, 9'd4, 9'd7, 9'd1, 9'd13, 9'd21, 9'd37};
		
		in_xpos_inject_1_1_0 = 0;
		in_ypos_inject_1_1_0 = 0;
		in_zpos_inject_1_1_0 = 0;
		in_xneg_inject_1_1_0 = 0;
		in_yneg_inject_1_1_0 = 0;
		in_zneg_inject_1_1_0 = 0;
		reduce_me_1_1_0 = 0;
		newcomm_1_1_0 = {1'b1, 8'd0, 9'd0, 9'd6, 6'd1, 7'd6, 9'd7, 9'd4, 9'd2, 9'd14, 9'd22, 9'd38};
		
		in_xpos_inject_1_1_1 = 0;
		in_ypos_inject_1_1_1 = 0;
		in_zpos_inject_1_1_1 = 0;
		in_xneg_inject_1_1_1 = 0;
		in_yneg_inject_1_1_1 = 0;
		in_zneg_inject_1_1_1 = 0;
		reduce_me_1_1_1 = 0;
		newcomm_1_1_1 = {1'b1, 8'd0, 9'd0, 9'd7, 6'd0, 7'd6, 9'd6, 9'd5, 9'd3, 9'd15, 9'd23, 9'd39};
		
		in_xpos_inject_0_0_3 = 0;
		in_ypos_inject_0_0_3 = 0;
		in_zpos_inject_0_0_3 = 0;
		in_xneg_inject_0_0_3 = 0;
		in_yneg_inject_0_0_3 = 0;
		in_zneg_inject_0_0_3 = 0;
		reduce_me_0_0_3 = 0;
		newcomm_0_0_3 = {1'b1, 8'd0, 9'd0, 9'd8, 6'd3, 7'd6, 9'd9, 9'd10, 9'd12, 9'd0, 9'd24, 9'd40};
		
		in_xpos_inject_0_0_2 = 0;
		in_ypos_inject_0_0_2 = 0;
		in_zpos_inject_0_0_2 = 0;
		in_xneg_inject_0_0_2 = 0;
		in_yneg_inject_0_0_2 = 0;
		in_zneg_inject_0_0_2 = 0;
		reduce_me_0_0_2 = 0;
		newcomm_0_0_2 = {1'b1, 8'd0, 9'd0, 9'd9, 6'd0, 7'd6, 9'd8, 9'd11, 9'd13, 9'd1, 9'd25, 9'd41};
		
		in_xpos_inject_0_1_3 = 0;
		in_ypos_inject_0_1_3 = 0;
		in_zpos_inject_0_1_3 = 0;
		in_xneg_inject_0_1_3 = 0;
		in_yneg_inject_0_1_3 = 0;
		in_zneg_inject_0_1_3 = 0;
		reduce_me_0_1_3 = 0;
		newcomm_0_1_3 = {1'b1, 8'd0, 9'd0, 9'd10, 6'd1, 7'd6, 9'd11, 9'd8, 9'd14, 9'd2, 9'd26, 9'd42};
		
		in_xpos_inject_0_1_2 = 0;
		in_ypos_inject_0_1_2 = 0;
		in_zpos_inject_0_1_2 = 0;
		in_xneg_inject_0_1_2 = 0;
		in_yneg_inject_0_1_2 = 0;
		in_zneg_inject_0_1_2 = 0;
		reduce_me_0_1_2 = 0;
		newcomm_0_1_2 = {1'b1, 8'd0, 9'd0, 9'd11, 6'd0, 7'd6, 9'd10, 9'd9, 9'd15, 9'd3, 9'd27, 9'd43};
		
		in_xpos_inject_1_0_3 = 0;
		in_ypos_inject_1_0_3 = 0;
		in_zpos_inject_1_0_3 = 0;
		in_xneg_inject_1_0_3 = 0;
		in_yneg_inject_1_0_3 = 0;
		in_zneg_inject_1_0_3 = 0;
		reduce_me_1_0_3 = 0;
		newcomm_1_0_3 = {1'b1, 8'd0, 9'd0, 9'd12, 6'd2, 7'd6, 9'd13, 9'd14, 9'd8, 9'd4, 9'd28, 9'd44};
		
		in_xpos_inject_1_0_2 = 0;
		in_ypos_inject_1_0_2 = 0;
		in_zpos_inject_1_0_2 = 0;
		in_xneg_inject_1_0_2 = 0;
		in_yneg_inject_1_0_2 = 0;
		in_zneg_inject_1_0_2 = 0;
		reduce_me_1_0_2 = 0;
		newcomm_1_0_2 = {1'b1, 8'd0, 9'd0, 9'd13, 6'd0, 7'd6, 9'd12, 9'd15, 9'd9, 9'd5, 9'd29, 9'd45};
		
		in_xpos_inject_1_1_3 = 0;
		in_ypos_inject_1_1_3 = 0;
		in_zpos_inject_1_1_3 = 0;
		in_xneg_inject_1_1_3 = 0;
		in_yneg_inject_1_1_3 = 0;
		in_zneg_inject_1_1_3 = 0;
		reduce_me_1_1_3 = 0;
		newcomm_1_1_3 = {1'b1, 8'd0, 9'd0, 9'd14, 6'd1, 7'd6, 9'd15, 9'd12, 9'd10, 9'd6, 9'd30, 9'd46};
		
		in_xpos_inject_1_1_2 = 0;
		in_ypos_inject_1_1_2 = 0;
		in_zpos_inject_1_1_2 = 0;
		in_xneg_inject_1_1_2 = 0;
		in_yneg_inject_1_1_2 = 0;
		in_zneg_inject_1_1_2 = 0;
		reduce_me_1_1_2 = 0;
		newcomm_1_1_2 = {1'b1, 8'd0, 9'd0, 9'd15, 6'd0, 7'd6, 9'd14, 9'd13, 9'd11, 9'd7, 9'd31, 9'd47};
		
		in_xpos_inject_0_3_0 = 0;
		in_ypos_inject_0_3_0 = 0;
		in_zpos_inject_0_3_0 = 0;
		in_xneg_inject_0_3_0 = 0;
		in_yneg_inject_0_3_0 = 0;
		in_zneg_inject_0_3_0 = 0;
		reduce_me_0_3_0 = 0;
		newcomm_0_3_0 = {1'b1, 8'd0, 9'd0, 9'd16, 6'd4, 7'd6, 9'd17, 9'd18, 9'd20, 9'd24, 9'd0, 9'd48};
		
		in_xpos_inject_0_3_1 = 0;
		in_ypos_inject_0_3_1 = 0;
		in_zpos_inject_0_3_1 = 0;
		in_xneg_inject_0_3_1 = 0;
		in_yneg_inject_0_3_1 = 0;
		in_zneg_inject_0_3_1 = 0;
		reduce_me_0_3_1 = 0;
		newcomm_0_3_1 = {1'b1, 8'd0, 9'd0, 9'd17, 6'd0, 7'd6, 9'd16, 9'd19, 9'd21, 9'd25, 9'd1, 9'd49};
		
		in_xpos_inject_0_2_0 = 0;
		in_ypos_inject_0_2_0 = 0;
		in_zpos_inject_0_2_0 = 0;
		in_xneg_inject_0_2_0 = 0;
		in_yneg_inject_0_2_0 = 0;
		in_zneg_inject_0_2_0 = 0;
		reduce_me_0_2_0 = 0;
		newcomm_0_2_0 = {1'b1, 8'd0, 9'd0, 9'd18, 6'd1, 7'd6, 9'd19, 9'd16, 9'd22, 9'd26, 9'd2, 9'd50};
		
		in_xpos_inject_0_2_1 = 0;
		in_ypos_inject_0_2_1 = 0;
		in_zpos_inject_0_2_1 = 0;
		in_xneg_inject_0_2_1 = 0;
		in_yneg_inject_0_2_1 = 0;
		in_zneg_inject_0_2_1 = 0;
		reduce_me_0_2_1 = 0;
		newcomm_0_2_1 = {1'b1, 8'd0, 9'd0, 9'd19, 6'd0, 7'd6, 9'd18, 9'd17, 9'd23, 9'd27, 9'd3, 9'd51};
		
		in_xpos_inject_1_3_0 = 0;
		in_ypos_inject_1_3_0 = 0;
		in_zpos_inject_1_3_0 = 0;
		in_xneg_inject_1_3_0 = 0;
		in_yneg_inject_1_3_0 = 0;
		in_zneg_inject_1_3_0 = 0;
		reduce_me_1_3_0 = 0;
		newcomm_1_3_0 = {1'b1, 8'd0, 9'd0, 9'd20, 6'd2, 7'd6, 9'd21, 9'd22, 9'd16, 9'd28, 9'd4, 9'd52};
		
		in_xpos_inject_1_3_1 = 0;
		in_ypos_inject_1_3_1 = 0;
		in_zpos_inject_1_3_1 = 0;
		in_xneg_inject_1_3_1 = 0;
		in_yneg_inject_1_3_1 = 0;
		in_zneg_inject_1_3_1 = 0;
		reduce_me_1_3_1 = 0;
		newcomm_1_3_1 = {1'b1, 8'd0, 9'd0, 9'd21, 6'd0, 7'd6, 9'd20, 9'd23, 9'd17, 9'd29, 9'd5, 9'd53};
		
		in_xpos_inject_1_2_0 = 0;
		in_ypos_inject_1_2_0 = 0;
		in_zpos_inject_1_2_0 = 0;
		in_xneg_inject_1_2_0 = 0;
		in_yneg_inject_1_2_0 = 0;
		in_zneg_inject_1_2_0 = 0;
		reduce_me_1_2_0 = 0;
		newcomm_1_2_0 = {1'b1, 8'd0, 9'd0, 9'd22, 6'd1, 7'd6, 9'd23, 9'd20, 9'd18, 9'd30, 9'd6, 9'd54};
		
		in_xpos_inject_1_2_1 = 0;
		in_ypos_inject_1_2_1 = 0;
		in_zpos_inject_1_2_1 = 0;
		in_xneg_inject_1_2_1 = 0;
		in_yneg_inject_1_2_1 = 0;
		in_zneg_inject_1_2_1 = 0;
		reduce_me_1_2_1 = 0;
		newcomm_1_2_1 = {1'b1, 8'd0, 9'd0, 9'd23, 6'd0, 7'd6, 9'd22, 9'd21, 9'd19, 9'd31, 9'd7, 9'd55};
		
		in_xpos_inject_0_3_3 = 0;
		in_ypos_inject_0_3_3 = 0;
		in_zpos_inject_0_3_3 = 0;
		in_xneg_inject_0_3_3 = 0;
		in_yneg_inject_0_3_3 = 0;
		in_zneg_inject_0_3_3 = 0;
		reduce_me_0_3_3 = 0;
		newcomm_0_3_3 = {1'b1, 8'd0, 9'd0, 9'd24, 6'd3, 7'd6, 9'd25, 9'd26, 9'd28, 9'd16, 9'd8, 9'd56};
		
		in_xpos_inject_0_3_2 = 0;
		in_ypos_inject_0_3_2 = 0;
		in_zpos_inject_0_3_2 = 0;
		in_xneg_inject_0_3_2 = 0;
		in_yneg_inject_0_3_2 = 0;
		in_zneg_inject_0_3_2 = 0;
		reduce_me_0_3_2 = 0;
		newcomm_0_3_2 = {1'b1, 8'd0, 9'd0, 9'd25, 6'd0, 7'd6, 9'd24, 9'd27, 9'd29, 9'd17, 9'd9, 9'd57};
		
		in_xpos_inject_0_2_3 = 0;
		in_ypos_inject_0_2_3 = 0;
		in_zpos_inject_0_2_3 = 0;
		in_xneg_inject_0_2_3 = 0;
		in_yneg_inject_0_2_3 = 0;
		in_zneg_inject_0_2_3 = 0;
		reduce_me_0_2_3 = 0;
		newcomm_0_2_3 = {1'b1, 8'd0, 9'd0, 9'd26, 6'd1, 7'd6, 9'd27, 9'd24, 9'd30, 9'd18, 9'd10, 9'd58};
		
		in_xpos_inject_0_2_2 = 0;
		in_ypos_inject_0_2_2 = 0;
		in_zpos_inject_0_2_2 = 0;
		in_xneg_inject_0_2_2 = 0;
		in_yneg_inject_0_2_2 = 0;
		in_zneg_inject_0_2_2 = 0;
		reduce_me_0_2_2 = 0;
		newcomm_0_2_2 = {1'b1, 8'd0, 9'd0, 9'd27, 6'd0, 7'd6, 9'd26, 9'd25, 9'd31, 9'd19, 9'd11, 9'd59};
		
		in_xpos_inject_1_3_3 = 0;
		in_ypos_inject_1_3_3 = 0;
		in_zpos_inject_1_3_3 = 0;
		in_xneg_inject_1_3_3 = 0;
		in_yneg_inject_1_3_3 = 0;
		in_zneg_inject_1_3_3 = 0;
		reduce_me_1_3_3 = 0;
		newcomm_1_3_3 = {1'b1, 8'd0, 9'd0, 9'd28, 6'd2, 7'd6, 9'd29, 9'd30, 9'd24, 9'd20, 9'd12, 9'd60};
		
		in_xpos_inject_1_3_2 = 0;
		in_ypos_inject_1_3_2 = 0;
		in_zpos_inject_1_3_2 = 0;
		in_xneg_inject_1_3_2 = 0;
		in_yneg_inject_1_3_2 = 0;
		in_zneg_inject_1_3_2 = 0;
		reduce_me_1_3_2 = 0;
		newcomm_1_3_2 = {1'b1, 8'd0, 9'd0, 9'd29, 6'd0, 7'd6, 9'd28, 9'd31, 9'd25, 9'd21, 9'd13, 9'd61};
		
		in_xpos_inject_1_2_3 = 0;
		in_ypos_inject_1_2_3 = 0;
		in_zpos_inject_1_2_3 = 0;
		in_xneg_inject_1_2_3 = 0;
		in_yneg_inject_1_2_3 = 0;
		in_zneg_inject_1_2_3 = 0;
		reduce_me_1_2_3 = 0;
		newcomm_1_2_3 = {1'b1, 8'd0, 9'd0, 9'd30, 6'd1, 7'd6, 9'd31, 9'd28, 9'd26, 9'd22, 9'd14, 9'd62};
		
		in_xpos_inject_1_2_2 = 0;
		in_ypos_inject_1_2_2 = 0;
		in_zpos_inject_1_2_2 = 0;
		in_xneg_inject_1_2_2 = 0;
		in_yneg_inject_1_2_2 = 0;
		in_zneg_inject_1_2_2 = 0;
		reduce_me_1_2_2 = 0;
		newcomm_1_2_2 = {1'b1, 8'd0, 9'd0, 9'd31, 6'd0, 7'd6, 9'd30, 9'd29, 9'd27, 9'd23, 9'd15, 9'd63};
		
		in_xpos_inject_3_0_0 = 0;
		in_ypos_inject_3_0_0 = 0;
		in_zpos_inject_3_0_0 = 0;
		in_xneg_inject_3_0_0 = 0;
		in_yneg_inject_3_0_0 = 0;
		in_zneg_inject_3_0_0 = 0;
		reduce_me_3_0_0 = 0;
		newcomm_3_0_0 = {1'b1, 8'd0, 9'd0, 9'd32, 6'd5, 7'd6, 9'd33, 9'd34, 9'd36, 9'd40, 9'd48, 9'd0};
		
		in_xpos_inject_3_0_1 = 0;
		in_ypos_inject_3_0_1 = 0;
		in_zpos_inject_3_0_1 = 0;
		in_xneg_inject_3_0_1 = 0;
		in_yneg_inject_3_0_1 = 0;
		in_zneg_inject_3_0_1 = 0;
		reduce_me_3_0_1 = 0;
		newcomm_3_0_1 = {1'b1, 8'd0, 9'd0, 9'd33, 6'd0, 7'd6, 9'd32, 9'd35, 9'd37, 9'd41, 9'd49, 9'd1};
		
		in_xpos_inject_3_1_0 = 0;
		in_ypos_inject_3_1_0 = 0;
		in_zpos_inject_3_1_0 = 0;
		in_xneg_inject_3_1_0 = 0;
		in_yneg_inject_3_1_0 = 0;
		in_zneg_inject_3_1_0 = 0;
		reduce_me_3_1_0 = 0;
		newcomm_3_1_0 = {1'b1, 8'd0, 9'd0, 9'd34, 6'd1, 7'd6, 9'd35, 9'd32, 9'd38, 9'd42, 9'd50, 9'd2};
		
		in_xpos_inject_3_1_1 = 0;
		in_ypos_inject_3_1_1 = 0;
		in_zpos_inject_3_1_1 = 0;
		in_xneg_inject_3_1_1 = 0;
		in_yneg_inject_3_1_1 = 0;
		in_zneg_inject_3_1_1 = 0;
		reduce_me_3_1_1 = 0;
		newcomm_3_1_1 = {1'b1, 8'd0, 9'd0, 9'd35, 6'd0, 7'd6, 9'd34, 9'd33, 9'd39, 9'd43, 9'd51, 9'd3};
		
		in_xpos_inject_2_0_0 = 0;
		in_ypos_inject_2_0_0 = 0;
		in_zpos_inject_2_0_0 = 0;
		in_xneg_inject_2_0_0 = 0;
		in_yneg_inject_2_0_0 = 0;
		in_zneg_inject_2_0_0 = 0;
		reduce_me_2_0_0 = 0;
		newcomm_2_0_0 = {1'b1, 8'd0, 9'd0, 9'd36, 6'd2, 7'd6, 9'd37, 9'd38, 9'd32, 9'd44, 9'd52, 9'd4};
		
		in_xpos_inject_2_0_1 = 0;
		in_ypos_inject_2_0_1 = 0;
		in_zpos_inject_2_0_1 = 0;
		in_xneg_inject_2_0_1 = 0;
		in_yneg_inject_2_0_1 = 0;
		in_zneg_inject_2_0_1 = 0;
		reduce_me_2_0_1 = 0;
		newcomm_2_0_1 = {1'b1, 8'd0, 9'd0, 9'd37, 6'd0, 7'd6, 9'd36, 9'd39, 9'd33, 9'd45, 9'd53, 9'd5};
		
		in_xpos_inject_2_1_0 = 0;
		in_ypos_inject_2_1_0 = 0;
		in_zpos_inject_2_1_0 = 0;
		in_xneg_inject_2_1_0 = 0;
		in_yneg_inject_2_1_0 = 0;
		in_zneg_inject_2_1_0 = 0;
		reduce_me_2_1_0 = 0;
		newcomm_2_1_0 = {1'b1, 8'd0, 9'd0, 9'd38, 6'd1, 7'd6, 9'd39, 9'd36, 9'd34, 9'd46, 9'd54, 9'd6};
		
		in_xpos_inject_2_1_1 = 0;
		in_ypos_inject_2_1_1 = 0;
		in_zpos_inject_2_1_1 = 0;
		in_xneg_inject_2_1_1 = 0;
		in_yneg_inject_2_1_1 = 0;
		in_zneg_inject_2_1_1 = 0;
		reduce_me_2_1_1 = 0;
		newcomm_2_1_1 = {1'b1, 8'd0, 9'd0, 9'd39, 6'd0, 7'd6, 9'd38, 9'd37, 9'd35, 9'd47, 9'd55, 9'd7};
		
		in_xpos_inject_3_0_3 = 0;
		in_ypos_inject_3_0_3 = 0;
		in_zpos_inject_3_0_3 = 0;
		in_xneg_inject_3_0_3 = 0;
		in_yneg_inject_3_0_3 = 0;
		in_zneg_inject_3_0_3 = 0;
		reduce_me_3_0_3 = 0;
		newcomm_3_0_3 = {1'b1, 8'd0, 9'd0, 9'd40, 6'd3, 7'd6, 9'd41, 9'd42, 9'd44, 9'd32, 9'd56, 9'd8};
		
		in_xpos_inject_3_0_2 = 0;
		in_ypos_inject_3_0_2 = 0;
		in_zpos_inject_3_0_2 = 0;
		in_xneg_inject_3_0_2 = 0;
		in_yneg_inject_3_0_2 = 0;
		in_zneg_inject_3_0_2 = 0;
		reduce_me_3_0_2 = 0;
		newcomm_3_0_2 = {1'b1, 8'd0, 9'd0, 9'd41, 6'd0, 7'd6, 9'd40, 9'd43, 9'd45, 9'd33, 9'd57, 9'd9};
		
		in_xpos_inject_3_1_3 = 0;
		in_ypos_inject_3_1_3 = 0;
		in_zpos_inject_3_1_3 = 0;
		in_xneg_inject_3_1_3 = 0;
		in_yneg_inject_3_1_3 = 0;
		in_zneg_inject_3_1_3 = 0;
		reduce_me_3_1_3 = 0;
		newcomm_3_1_3 = {1'b1, 8'd0, 9'd0, 9'd42, 6'd1, 7'd6, 9'd43, 9'd40, 9'd46, 9'd34, 9'd58, 9'd10};
		
		in_xpos_inject_3_1_2 = 0;
		in_ypos_inject_3_1_2 = 0;
		in_zpos_inject_3_1_2 = 0;
		in_xneg_inject_3_1_2 = 0;
		in_yneg_inject_3_1_2 = 0;
		in_zneg_inject_3_1_2 = 0;
		reduce_me_3_1_2 = 0;
		newcomm_3_1_2 = {1'b1, 8'd0, 9'd0, 9'd43, 6'd0, 7'd6, 9'd42, 9'd41, 9'd47, 9'd35, 9'd59, 9'd11};
		
		in_xpos_inject_2_0_3 = 0;
		in_ypos_inject_2_0_3 = 0;
		in_zpos_inject_2_0_3 = 0;
		in_xneg_inject_2_0_3 = 0;
		in_yneg_inject_2_0_3 = 0;
		in_zneg_inject_2_0_3 = 0;
		reduce_me_2_0_3 = 0;
		newcomm_2_0_3 = {1'b1, 8'd0, 9'd0, 9'd44, 6'd2, 7'd6, 9'd45, 9'd46, 9'd40, 9'd36, 9'd60, 9'd12};
		
		in_xpos_inject_2_0_2 = 0;
		in_ypos_inject_2_0_2 = 0;
		in_zpos_inject_2_0_2 = 0;
		in_xneg_inject_2_0_2 = 0;
		in_yneg_inject_2_0_2 = 0;
		in_zneg_inject_2_0_2 = 0;
		reduce_me_2_0_2 = 0;
		newcomm_2_0_2 = {1'b1, 8'd0, 9'd0, 9'd45, 6'd0, 7'd6, 9'd44, 9'd47, 9'd41, 9'd37, 9'd61, 9'd13};
		
		in_xpos_inject_2_1_3 = 0;
		in_ypos_inject_2_1_3 = 0;
		in_zpos_inject_2_1_3 = 0;
		in_xneg_inject_2_1_3 = 0;
		in_yneg_inject_2_1_3 = 0;
		in_zneg_inject_2_1_3 = 0;
		reduce_me_2_1_3 = 0;
		newcomm_2_1_3 = {1'b1, 8'd0, 9'd0, 9'd46, 6'd1, 7'd6, 9'd47, 9'd44, 9'd42, 9'd38, 9'd62, 9'd14};
		
		in_xpos_inject_2_1_2 = 0;
		in_ypos_inject_2_1_2 = 0;
		in_zpos_inject_2_1_2 = 0;
		in_xneg_inject_2_1_2 = 0;
		in_yneg_inject_2_1_2 = 0;
		in_zneg_inject_2_1_2 = 0;
		reduce_me_2_1_2 = 0;
		newcomm_2_1_2 = {1'b1, 8'd0, 9'd0, 9'd47, 6'd0, 7'd6, 9'd46, 9'd45, 9'd43, 9'd39, 9'd63, 9'd15};
		
		in_xpos_inject_3_3_0 = 0;
		in_ypos_inject_3_3_0 = 0;
		in_zpos_inject_3_3_0 = 0;
		in_xneg_inject_3_3_0 = 0;
		in_yneg_inject_3_3_0 = 0;
		in_zneg_inject_3_3_0 = 0;
		reduce_me_3_3_0 = 0;
		newcomm_3_3_0 = {1'b1, 8'd0, 9'd0, 9'd48, 6'd4, 7'd6, 9'd49, 9'd50, 9'd52, 9'd56, 9'd32, 9'd16};
		
		in_xpos_inject_3_3_1 = 0;
		in_ypos_inject_3_3_1 = 0;
		in_zpos_inject_3_3_1 = 0;
		in_xneg_inject_3_3_1 = 0;
		in_yneg_inject_3_3_1 = 0;
		in_zneg_inject_3_3_1 = 0;
		reduce_me_3_3_1 = 0;
		newcomm_3_3_1 = {1'b1, 8'd0, 9'd0, 9'd49, 6'd0, 7'd6, 9'd48, 9'd51, 9'd53, 9'd57, 9'd33, 9'd17};
		
		in_xpos_inject_3_2_0 = 0;
		in_ypos_inject_3_2_0 = 0;
		in_zpos_inject_3_2_0 = 0;
		in_xneg_inject_3_2_0 = 0;
		in_yneg_inject_3_2_0 = 0;
		in_zneg_inject_3_2_0 = 0;
		reduce_me_3_2_0 = 0;
		newcomm_3_2_0 = {1'b1, 8'd0, 9'd0, 9'd50, 6'd1, 7'd6, 9'd51, 9'd48, 9'd54, 9'd58, 9'd34, 9'd18};
		
		in_xpos_inject_3_2_1 = 0;
		in_ypos_inject_3_2_1 = 0;
		in_zpos_inject_3_2_1 = 0;
		in_xneg_inject_3_2_1 = 0;
		in_yneg_inject_3_2_1 = 0;
		in_zneg_inject_3_2_1 = 0;
		reduce_me_3_2_1 = 0;
		newcomm_3_2_1 = {1'b1, 8'd0, 9'd0, 9'd51, 6'd0, 7'd6, 9'd50, 9'd49, 9'd55, 9'd59, 9'd35, 9'd19};
		
		in_xpos_inject_2_3_0 = 0;
		in_ypos_inject_2_3_0 = 0;
		in_zpos_inject_2_3_0 = 0;
		in_xneg_inject_2_3_0 = 0;
		in_yneg_inject_2_3_0 = 0;
		in_zneg_inject_2_3_0 = 0;
		reduce_me_2_3_0 = 0;
		newcomm_2_3_0 = {1'b1, 8'd0, 9'd0, 9'd52, 6'd2, 7'd6, 9'd53, 9'd54, 9'd48, 9'd60, 9'd36, 9'd20};
		
		in_xpos_inject_2_3_1 = 0;
		in_ypos_inject_2_3_1 = 0;
		in_zpos_inject_2_3_1 = 0;
		in_xneg_inject_2_3_1 = 0;
		in_yneg_inject_2_3_1 = 0;
		in_zneg_inject_2_3_1 = 0;
		reduce_me_2_3_1 = 0;
		newcomm_2_3_1 = {1'b1, 8'd0, 9'd0, 9'd53, 6'd0, 7'd6, 9'd52, 9'd55, 9'd49, 9'd61, 9'd37, 9'd21};
		
		in_xpos_inject_2_2_0 = 0;
		in_ypos_inject_2_2_0 = 0;
		in_zpos_inject_2_2_0 = 0;
		in_xneg_inject_2_2_0 = 0;
		in_yneg_inject_2_2_0 = 0;
		in_zneg_inject_2_2_0 = 0;
		reduce_me_2_2_0 = 0;
		newcomm_2_2_0 = {1'b1, 8'd0, 9'd0, 9'd54, 6'd1, 7'd6, 9'd55, 9'd52, 9'd50, 9'd62, 9'd38, 9'd22};
		
		in_xpos_inject_2_2_1 = 0;
		in_ypos_inject_2_2_1 = 0;
		in_zpos_inject_2_2_1 = 0;
		in_xneg_inject_2_2_1 = 0;
		in_yneg_inject_2_2_1 = 0;
		in_zneg_inject_2_2_1 = 0;
		reduce_me_2_2_1 = 0;
		newcomm_2_2_1 = {1'b1, 8'd0, 9'd0, 9'd55, 6'd0, 7'd6, 9'd54, 9'd53, 9'd51, 9'd63, 9'd39, 9'd23};
		
		in_xpos_inject_3_3_3 = 0;
		in_ypos_inject_3_3_3 = 0;
		in_zpos_inject_3_3_3 = 0;
		in_xneg_inject_3_3_3 = 0;
		in_yneg_inject_3_3_3 = 0;
		in_zneg_inject_3_3_3 = 0;
		reduce_me_3_3_3 = 0;
		newcomm_3_3_3 = {1'b1, 8'd0, 9'd0, 9'd56, 6'd3, 7'd6, 9'd57, 9'd58, 9'd60, 9'd48, 9'd40, 9'd24};
		
		in_xpos_inject_3_3_2 = 0;
		in_ypos_inject_3_3_2 = 0;
		in_zpos_inject_3_3_2 = 0;
		in_xneg_inject_3_3_2 = 0;
		in_yneg_inject_3_3_2 = 0;
		in_zneg_inject_3_3_2 = 0;
		reduce_me_3_3_2 = 0;
		newcomm_3_3_2 = {1'b1, 8'd0, 9'd0, 9'd57, 6'd0, 7'd6, 9'd56, 9'd59, 9'd61, 9'd49, 9'd41, 9'd25};
		
		in_xpos_inject_3_2_3 = 0;
		in_ypos_inject_3_2_3 = 0;
		in_zpos_inject_3_2_3 = 0;
		in_xneg_inject_3_2_3 = 0;
		in_yneg_inject_3_2_3 = 0;
		in_zneg_inject_3_2_3 = 0;
		reduce_me_3_2_3 = 0;
		newcomm_3_2_3 = {1'b1, 8'd0, 9'd0, 9'd58, 6'd1, 7'd6, 9'd59, 9'd56, 9'd62, 9'd50, 9'd42, 9'd26};
		
		in_xpos_inject_3_2_2 = 0;
		in_ypos_inject_3_2_2 = 0;
		in_zpos_inject_3_2_2 = 0;
		in_xneg_inject_3_2_2 = 0;
		in_yneg_inject_3_2_2 = 0;
		in_zneg_inject_3_2_2 = 0;
		reduce_me_3_2_2 = 0;
		newcomm_3_2_2 = {1'b1, 8'd0, 9'd0, 9'd59, 6'd0, 7'd6, 9'd58, 9'd57, 9'd63, 9'd51, 9'd43, 9'd27};
		
		in_xpos_inject_2_3_3 = 0;
		in_ypos_inject_2_3_3 = 0;
		in_zpos_inject_2_3_3 = 0;
		in_xneg_inject_2_3_3 = 0;
		in_yneg_inject_2_3_3 = 0;
		in_zneg_inject_2_3_3 = 0;
		reduce_me_2_3_3 = 0;
		newcomm_2_3_3 = {1'b1, 8'd0, 9'd0, 9'd60, 6'd2, 7'd6, 9'd61, 9'd62, 9'd56, 9'd52, 9'd44, 9'd28};
		
		in_xpos_inject_2_3_2 = 0;
		in_ypos_inject_2_3_2 = 0;
		in_zpos_inject_2_3_2 = 0;
		in_xneg_inject_2_3_2 = 0;
		in_yneg_inject_2_3_2 = 0;
		in_zneg_inject_2_3_2 = 0;
		reduce_me_2_3_2 = 0;
		newcomm_2_3_2 = {1'b1, 8'd0, 9'd0, 9'd61, 6'd0, 7'd6, 9'd60, 9'd63, 9'd57, 9'd53, 9'd45, 9'd29};
		
		in_xpos_inject_2_2_3 = 0;
		in_ypos_inject_2_2_3 = 0;
		in_zpos_inject_2_2_3 = 0;
		in_xneg_inject_2_2_3 = 0;
		in_yneg_inject_2_2_3 = 0;
		in_zneg_inject_2_2_3 = 0;
		reduce_me_2_2_3 = 0;
		newcomm_2_2_3 = {1'b1, 8'd0, 9'd0, 9'd62, 6'd1, 7'd6, 9'd63, 9'd60, 9'd58, 9'd54, 9'd46, 9'd30};
		
		in_xpos_inject_2_2_2 = 0;
		in_ypos_inject_2_2_2 = 0;
		in_zpos_inject_2_2_2 = 0;
		in_xneg_inject_2_2_2 = 0;
		in_yneg_inject_2_2_2 = 0;
		in_zneg_inject_2_2_2 = 0;
		reduce_me_2_2_2 = 0;
		newcomm_2_2_2 = {1'b1, 8'd0, 9'd0, 9'd63, 6'd0, 7'd6, 9'd62, 9'd61, 9'd59, 9'd55, 9'd47, 9'd31};

		// Wait 100 ns for global reset to finish
		#105;
      rst = 0; 

		for(i=1;i<2;i=i+1)begin
				  reduce_me_0_0_0 = {7'b0001101, 9'b000000000, 9'b000000000, 9'd0, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_0_0_1 = {7'b0000001, 9'b000000000, 9'b000000001, 9'd1, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_0_1_0 = {7'b0000011, 9'b000000000, 9'b000001000, 9'd2, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_0_1_1 = {7'b0000001, 9'b000001000, 9'b000001001, 9'd3, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zneg_inject_1_0_0 = {7'b0000101, 9'b000000000, 9'b001000000, 9'd4, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_1_0_1 = {7'b0000001, 9'b001000000, 9'b001000001, 9'd5, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_1_1_0 = {7'b0000011, 9'b001000000, 9'b001001000, 9'd6, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_1_1_1 = {7'b0000001, 9'b001001000, 9'b001001001, 9'd7, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_0_0_3 = {7'b0000111, 9'b000000000, 9'b000000011, 9'd8, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_0_0_2 = {7'b0000001, 9'b000000011, 9'b000000010, 9'd9, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_0_1_3 = {7'b0000011, 9'b000000011, 9'b000001011, 9'd10, 8'd0, i, 2'b00, ShortReduce, 32'd6};		
			in_xpos_inject_0_1_2 = {7'b0000001, 9'b000001011, 9'b000001010, 9'd11, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zneg_inject_1_0_3 = {7'b0000101, 9'b000000011, 9'b001000011, 9'd12, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_1_0_2 = {7'b0000001, 9'b001000011, 9'b001000010, 9'd13, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_1_1_3 = {7'b0000011, 9'b001000011, 9'b001001011, 9'd14, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_1_1_2 = {7'b0000001, 9'b001001011, 9'b001001010, 9'd15, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_0_3_0 = {7'b0001001, 9'b000000000, 9'b000011000, 9'd16, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_0_3_1 = {7'b0000001, 9'b000011000, 9'b000011001, 9'd17, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_0_2_0 = {7'b0000011, 9'b000011000, 9'b000010000, 9'd18, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_0_2_1 = {7'b0000001, 9'b000010000, 9'b000010001, 9'd19, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zneg_inject_1_3_0 = {7'b0000101, 9'b000011000, 9'b001011000, 9'd20, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_1_3_1 = {7'b0000001, 9'b001011000, 9'b001011001, 9'd21, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_1_2_0 = {7'b0000011, 9'b001011000, 9'b001010000, 9'd22, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_1_2_1 = {7'b0000001, 9'b001010000, 9'b001010001, 9'd23, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_0_3_3 = {7'b0000111, 9'b000011000, 9'b000011011, 9'd24, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_0_3_2 = {7'b0000001, 9'b000011011, 9'b000011010, 9'd25, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_0_2_3 = {7'b0000011, 9'b000011011, 9'b000010011, 9'd26, 8'd0, i, 2'b00, ShortReduce, 32'd6};		
			in_xpos_inject_0_2_2 = {7'b0000001, 9'b000010011, 9'b000010010, 9'd27, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zneg_inject_1_3_3 = {7'b0000101, 9'b000011011, 9'b001011011, 9'd28, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_1_3_2 = {7'b0000001, 9'b001011011, 9'b001011010, 9'd29, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_1_2_3 = {7'b0000011, 9'b001011011, 9'b001010011, 9'd30, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_1_2_2 = {7'b0000001, 9'b001010011, 9'b001010010, 9'd31, 8'd0, i, 2'b00, ShortReduce, 32'd6};
			
			in_xneg_inject_3_0_0 = {7'b0001011, ZERO, 	    9'b011000001, 9'd32, 8'd0, i, 2'b00, ShortReduce, 32'd6};
			in_xneg_inject_3_0_1 = {7'b0000001, THIRTYTWO,   9'b011000001, 9'd33, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_3_1_0 = {7'b0000011, THIRTYTWO,   9'b011001000, 9'd34, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_3_1_1 = {7'b0000001, THIRTYFOUR,  9'b011001001, 9'd35, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zneg_inject_2_0_0 = {7'b0000101, THIRTYTWO,   9'b010000000, 9'd36, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_2_0_1 = {7'b0000001, THIRTYSIX, 	 9'b010000001, 9'd37, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_2_1_0 = {7'b0000011, THIRTYSIX, 	 9'b010001000, 9'd38, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_2_1_1 = {7'b0000001, THIRTYEIGHT, 9'b010001001, 9'd39, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_3_0_3 = {7'b0000111, THIRTYTWO,   9'b011000011, 9'd40, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_3_0_2 = {7'b0000001, FORTY, 		 9'b011000010, 9'd41, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_3_1_3 = {7'b0000011, FORTY, 		 9'b011001011, 9'd42, 8'd0, i, 2'b00, ShortReduce, 32'd6};		
			in_xpos_inject_3_1_2 = {7'b0000001, FORTYTWO, 	 9'b011001010, 9'd43, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zneg_inject_2_0_3 = {7'b0000101, FORTY, 		 9'b010000011, 9'd44, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_2_0_2 = {7'b0000001, FORTYFOUR, 	 9'b010000010, 9'd45, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_2_1_3 = {7'b0000011, FORTYFOUR, 	 9'b010001011, 9'd46, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_2_1_2 = {7'b0000001, FORTYSIX, 	 9'b010001010, 9'd47, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_3_3_0 = {7'b0001001, THIRTYTWO, 	 9'b011011000, 9'd48, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_3_3_1 = {7'b0000001, FORTYEIGHT,  9'b011011001, 9'd49, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_3_2_0 = {7'b0000011, FORTYEIGHT,  9'b011010000, 9'd50, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_3_2_1 = {7'b0000001, FIFTY, 		 9'b011010001, 9'd51, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zneg_inject_2_3_0 = {7'b0000101, FORTYEIGHT,  9'b010011000, 9'd52, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_2_3_1 = {7'b0000001, FIFTYTWO, 	 9'b010011001, 9'd53, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_2_2_0 = {7'b0000011, FIFTYTWO, 	 9'b010010000, 9'd54, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_2_2_1 = {7'b0000001, FIFTYFOUR, 	 9'b010010001, 9'd55, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_3_3_3 = {7'b0000111, FORTYEIGHT,  9'b011011011, 9'd56, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_3_3_2 = {7'b0000001, FIFTYSIX, 	 9'b011011010, 9'd57, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_3_2_3 = {7'b0000011, FIFTYSIX, 	 9'b011010011, 9'd58, 8'd0, i, 2'b00, ShortReduce, 32'd6};		
			in_xpos_inject_3_2_2 = {7'b0000001, FIFTYEIGHT,  9'b011010010, 9'd59, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zneg_inject_2_3_3 = {7'b0000101, FIFTYSIX, 	 9'b010011011, 9'd60, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_2_3_2 = {7'b0000001, SIXTY, 		 9'b010011010, 9'd61, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_2_2_3 = {7'b0000011, SIXTY, 		 9'b010010011, 9'd62, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_2_2_2 = {7'b0000001, SIXTYTWO, 	 9'b010010010, 9'd63, 8'd0, i, 2'b00, ShortReduce, 32'd6};
			
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

