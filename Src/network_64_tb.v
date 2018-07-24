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
		#55;
      rst = 0; 
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//reduce
		/*for(i=1;i<2;i=i+1)begin
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
			
			in_zpos_inject_3_0_0 = {7'b0001011, ZERO, 	    9'b011000000, 9'd32, 8'd0, i, 2'b00, ShortReduce, 32'd6};
			in_xneg_inject_3_0_1 = {7'b0000001, THIRTYTWO,   9'b011000001, 9'd33, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_3_1_0 = {7'b0000011, THIRTYTWO,   9'b011001000, 9'd34, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_3_1_1 = {7'b0000001, THIRTYFOUR,  9'b011001001, 9'd35, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zpos_inject_2_0_0 = {7'b0000101, THIRTYTWO,   9'b010000000, 9'd36, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_2_0_1 = {7'b0000001, THIRTYSIX, 	 9'b010000001, 9'd37, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_2_1_0 = {7'b0000011, THIRTYSIX, 	 9'b010001000, 9'd38, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_2_1_1 = {7'b0000001, THIRTYEIGHT, 9'b010001001, 9'd39, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_3_0_3 = {7'b0000111, THIRTYTWO,   9'b011000011, 9'd40, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_3_0_2 = {7'b0000001, FORTY, 		 9'b011000010, 9'd41, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_3_1_3 = {7'b0000011, FORTY, 		 9'b011001011, 9'd42, 8'd0, i, 2'b00, ShortReduce, 32'd6};		
			in_xpos_inject_3_1_2 = {7'b0000001, FORTYTWO, 	 9'b011001010, 9'd43, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zpos_inject_2_0_3 = {7'b0000101, FORTY, 		 9'b010000011, 9'd44, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_2_0_2 = {7'b0000001, FORTYFOUR, 	 9'b010000010, 9'd45, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_yneg_inject_2_1_3 = {7'b0000011, FORTYFOUR, 	 9'b010001011, 9'd46, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_2_1_2 = {7'b0000001, FORTYSIX, 	 9'b010001010, 9'd47, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_3_3_0 = {7'b0001001, THIRTYTWO, 	 9'b011011000, 9'd48, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_3_3_1 = {7'b0000001, FORTYEIGHT,  9'b011011001, 9'd49, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_3_2_0 = {7'b0000011, FORTYEIGHT,  9'b011010000, 9'd50, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_3_2_1 = {7'b0000001, FIFTY, 		 9'b011010001, 9'd51, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zpos_inject_2_3_0 = {7'b0000101, FORTYEIGHT,  9'b010011000, 9'd52, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_2_3_1 = {7'b0000001, FIFTYTWO, 	 9'b010011001, 9'd53, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_2_2_0 = {7'b0000011, FIFTYTWO, 	 9'b010010000, 9'd54, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xneg_inject_2_2_1 = {7'b0000001, FIFTYFOUR, 	 9'b010010001, 9'd55, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_3_3_3 = {7'b0000111, FORTYEIGHT,  9'b011011011, 9'd56, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_3_3_2 = {7'b0000001, FIFTYSIX, 	 9'b011011010, 9'd57, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_3_2_3 = {7'b0000011, FIFTYSIX, 	 9'b011010011, 9'd58, 8'd0, i, 2'b00, ShortReduce, 32'd6};		
			in_xpos_inject_3_2_2 = {7'b0000001, FIFTYEIGHT,  9'b011010010, 9'd59, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_zpos_inject_2_3_3 = {7'b0000101, FIFTYSIX, 	 9'b010011011, 9'd60, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_2_3_2 = {7'b0000001, SIXTY, 		 9'b010011010, 9'd61, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_ypos_inject_2_2_3 = {7'b0000011, SIXTY, 		 9'b010010011, 9'd62, 8'd0, i, 2'b00, ShortReduce, 32'd6};			
			in_xpos_inject_2_2_2 = {7'b0000001, SIXTYTWO, 	 9'b010010010, 9'd63, 8'd0, i, 2'b00, ShortReduce, 32'd6};
			
			#10;
		end*/
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//allreduce
				
		/*for(i=0;i<1;i=i+1)begin
		
				  reduce_me_0_0_0 = {7'b0001101, ZERO, 	  ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_0_0 = {7'b0000001, ONE, 	     ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_0_0 = {7'b0000011, TWO, 	     ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_0_0 = {7'b0000101, FOUR, 	  ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_0_0 = {7'b0000111, EIGHT,     ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_0_0 = {7'b0001001, SIXTEEN,   ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0001011, THIRTYTWO, ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_0_1 = {7'b0001101, ONE, 		 	 ONE, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_0_1 = {7'b0000001, ZERO, 	 	 ONE, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_0_1 = {7'b0000011, THREE, 	 	 ONE, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_0_1 = {7'b0000101, FIVE, 	 	 ONE, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_0_1 = {7'b0000111, NINE, 	    ONE, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_0_1 = {7'b0001001, SEVENTEEN,   ONE, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_0_1 = {7'b0001011, THIRTYTHREE, ONE, 9'd1, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_1_0 = {7'b0001101, TWO, 		   TWO, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_1_0 = {7'b0000001, THREE, 	   TWO, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_1_0 = {7'b0000011, ZERO, 	   TWO, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_1_0 = {7'b0000101, SIX, 		   TWO, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_1_0 = {7'b0000111, TEN, 		   TWO, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_1_0 = {7'b0001001, EIGHTEEN,   TWO, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_1_0 = {7'b0001011, THIRTYFOUR, TWO, 9'd2, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_1_1 = {7'b0001101, THREE, 	 	THREE, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_1_1 = {7'b0000001, TWO, 	    	THREE, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_1_1 = {7'b0000011, ONE, 		 	THREE, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_1_1 = {7'b0000101, SEVEN,    	THREE, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_1_1 = {7'b0000111, ELEVEN,   	THREE, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_1_1 = {7'b0001001, NINETEEN,   THREE, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_1_1 = {7'b0001011, THIRTYFIVE, THREE, 9'd3, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_0_0 = {7'b0001101, FOUR,   	  FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_0_0 = {7'b0000001, FIVE,   	  FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_0_0 = {7'b0000011, SIX, 	  	  FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_0_0 = {7'b0000101, ZERO,   	  FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_0_0 = {7'b0000111, TWELVE,    FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_0_0 = {7'b0001001, TWENTY,    FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_0_0 = {7'b0001011, THIRTYSIX, FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
					
				  reduce_me_1_0_1 = {7'b0001101, FIVE,		    FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_0_1 = {7'b0000001, FOUR, 	    FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_0_1 = {7'b0000011, SEVEN,	  	 FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_0_1 = {7'b0000101, ONE,		    FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_0_1 = {7'b0000111, THIRTEEN,    FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_0_1 = {7'b0001001, TWENTYONE,   FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_0_1 = {7'b0001011, THIRTYSEVEN, FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_1_0 = {7'b0001101, SIX, 		  	 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_1_0 = {7'b0000001, SEVEN, 	  	 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_1_0 = {7'b0000011, FOUR, 	  	 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_1_0 = {7'b0000101, TWO, 		  	 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_1_0 = {7'b0000111, FOURTEEN,  	 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_1_0 = {7'b0001001, TWENTYTWO, 	 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_1_0 = {7'b0001011, THIRTYEIGHT, SIX, 9'd6, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_1_1 = {7'b0001101, SEVEN, 		 SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_1_1 = {7'b0000001, SIX, 			 SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_1_1 = {7'b0000011, FIVE, 		 SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_1_1 = {7'b0000101, THREE, 		 SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_1_1 = {7'b0000111, FIFTEEN, 	 SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_1_1 = {7'b0001001, TWENTYTHREE, SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_1_1 = {7'b0001011, THIRTYNINE,  SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_0_3 = {7'b0001101, EIGHT, 	   EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_0_3 = {7'b0000001, NINE, 		EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_0_3 = {7'b0000011, TEN, 		   EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_0_3 = {7'b0000101, TWELVE, 	   EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_0_3 = {7'b0000111, ZERO, 		EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_0_3 = {7'b0001001, TWENTYFOUR, EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_0_3 = {7'b0001011, FORTY, 	   EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_0_2 = {7'b0001101, NINE, 	   NINE, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_0_2 = {7'b0000001, EIGHT, 	   NINE, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_0_2 = {7'b0000011, ELEVEN, 	   NINE, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_0_2 = {7'b0000101, THIRTEEN,   NINE, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_0_2 = {7'b0000111, ONE, 		   NINE, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_0_2 = {7'b0001001, TWENTYFIVE, NINE, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_0_2 = {7'b0001011, FORTYONE,   NINE, 9'd9, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_1_3 = {7'b0001101, TEN, 		  TEN, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_1_3 = {7'b0000001, ELEVEN, 	  TEN, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_1_3 = {7'b0000011, EIGHT, 	  TEN, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_1_3 = {7'b0000101, FOURTEEN,  TEN, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_1_3 = {7'b0000111, TWO,		  TEN, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_1_3 = {7'b0001001, TWENTYSIX, TEN, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_1_3 = {7'b0001011, FORTYTWO,  TEN, 9'd10, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_1_2 = {7'b0001101, ELEVEN, 		 ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_1_2 = {7'b0000001, TEN, 			 ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_1_2 = {7'b0000011, NINE, 		 ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_1_2 = {7'b0000101, FIFTEEN, 	 ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_1_2 = {7'b0000111, THREE, 		 ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_1_3 = {7'b0001001, TWENTYSEVEN, ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_1_3 = {7'b0001011, FORTYTHREE,  ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_0_3 = {7'b0001101, TWELVE, 		 TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_0_3 = {7'b0000001, THIRTEEN, 	 TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_0_3 = {7'b0000011, FOURTEEN, 	 TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_0_3 = {7'b0000101, EIGHT, 		 TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_0_3 = {7'b0000111, FOUR, 		 TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_0_3 = {7'b0001001, TWENTYEIGHT, TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_0_3 = {7'b0001011, FORTYFOUR,   TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_0_2 = {7'b0001101, THIRTEEN,   THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_0_2 = {7'b0000001, TWELVE,     THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_0_2 = {7'b0000011, FIFTEEN,    THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_0_2 = {7'b0000101, NINE, 		THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_0_2 = {7'b0000111, FIVE, 		THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_0_2 = {7'b0001001, TWENTYNINE, THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_0_2 = {7'b0001011, FORTYFIVE,  THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_1_3 = {7'b0001101, FOURTEEN, FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_1_3 = {7'b0000001, FIFTEEN,  FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_1_3 = {7'b0000011, TWELVE,   FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_1_3 = {7'b0000101, TEN,      FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_1_3 = {7'b0000111, SIX,      FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_1_3 = {7'b0001001, THIRTY,   FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_1_3 = {7'b0001011, FORTYSIX, FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_1_2 = {7'b0001101, FIFTEEN,    FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_1_2 = {7'b0000001, FOURTEEN,   FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_1_2 = {7'b0000011, THIRTEEN,   FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_1_2 = {7'b0000101, ELEVEN,     FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_1_2 = {7'b0000111, SEVEN,      FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_1_2 = {7'b0001001, THIRTYONE,  FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_1_2 = {7'b0001011, FORTYSEVEN, FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_3_0 = {7'b0001101, SIXTEEN, 	SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_3_0 = {7'b0000001, SEVENTEEN,  SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_3_0 = {7'b0000011, EIGHTEEN,   SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_3_0 = {7'b0000101, TWENTY, 	   SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_3_0 = {7'b0000111, TWENTYFOUR, SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_3_0 = {7'b0001001, ZERO, 		SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_3_0 = {7'b0001011, FORTYEIGHT, SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_3_1 = {7'b0001101, SEVENTEEN,  SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_3_1 = {7'b0000001, SIXTEEN,    SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_3_1 = {7'b0000011, NINETEEN,   SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_3_1 = {7'b0000101, TWENTYONE,  SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_3_1 = {7'b0000111, TWENTYFIVE, SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_3_1 = {7'b0001001, ONE, 		   SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_3_1 = {7'b0001011, FORTYNINE,  SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_2_0 = {7'b0001101, EIGHTEEN,  EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_2_0 = {7'b0000001, NINETEEN,  EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_2_0 = {7'b0000011, SIXTEEN,   EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_2_0 = {7'b0000101, TWENTYTWO, EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_2_0 = {7'b0000111, TWENTYSIX, EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_2_0 = {7'b0001001, TWO, 		  EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_2_0 = {7'b0001011, FIFTY,	  EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_2_1 = {7'b0001101, NINETEEN,	 NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_2_1 = {7'b0000001, EIGHTEEN,	 NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_2_1 = {7'b0000011, SEVENTEEN, 	 NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_2_1 = {7'b0000101, TWENTYTHREE, NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_2_1 = {7'b0000111, TWENTYSEVEN, NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_2_1 = {7'b0001001, THREE, 		 NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_2_1 = {7'b0001011, FIFTYONE,	 NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_3_0 = {7'b0001101, TWENTY, 		 TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_3_0 = {7'b0000001, TWENTYONE,   TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_3_0 = {7'b0000011, TWENTYTWO, 	 TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_3_0 = {7'b0000101, SIXTEEN, 	 TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_3_0 = {7'b0000111, TWENTYEIGHT, TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_3_0 = {7'b0001001, FOUR, 		 TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_3_0 = {7'b0001011, FIFTYTWO,	 TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
	
				  reduce_me_1_3_1 = {7'b0001101, TWENTYONE, 	 TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_3_1 = {7'b0000001, TWENTY, 		 TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_3_1 = {7'b0000011, TWENTYTHREE, TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_3_1 = {7'b0000101, SEVENTEEN,	 TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_3_1 = {7'b0000111, TWENTYNINE,  TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_3_1 = {7'b0001001, FIVE, 		 TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_3_1 = {7'b0001011, FIFTYTHREE,	 TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_2_0 = {7'b0001101, TWENTYTWO, 	 TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_2_0 = {7'b0000001, TWENTYTHREE, TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_2_0 = {7'b0000011, TWENTY, 		 TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_2_0 = {7'b0000101, EIGHTEEN, 	 TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_2_0 = {7'b0000111, THIRTY,  	 TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_2_0 = {7'b0001001, SIX, 			 TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_2_0 = {7'b0001011, FIFTYFOUR, 	 TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_2_1 = {7'b0001101, TWENTYTHREE, TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_2_1 = {7'b0000001, TWENTYTWO, 	 TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_2_1 = {7'b0000011, TWENTYONE, 	 TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_2_1 = {7'b0000101, NINETEEN, 	 TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_2_1 = {7'b0000111, THIRTYONE, 	 TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_2_1 = {7'b0001001, SEVEN, 		 TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_2_1 = {7'b0001011, FIFTYFIVE, 	 TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_3_3 = {7'b0001101, TWENTYFOUR,  TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_3_3 = {7'b0000001, TWENTYFIVE,  TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_3_3 = {7'b0000011, TWENTYSIX, 	 TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_3_3 = {7'b0000101, TWENTYEIGHT, TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_3_3 = {7'b0000111, SIXTEEN, 	 TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_3_3 = {7'b0001001, EIGHT, 		 TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_3_3 = {7'b0001011, FIFTYSIX,	 TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_3_2 = {7'b0001101, TWENTYFIVE,  TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_3_2 = {7'b0000001, TWENTYFOUR,  TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_3_2 = {7'b0000011, TWENTYSEVEN, TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_3_2 = {7'b0000101, TWENTYNINE,	 TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_3_2 = {7'b0000111, SEVENTEEN, 	 TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_3_2 = {7'b0001001, NINE, 		 TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_3_2 = {7'b0001011, FIFTYSEVEN,  TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_2_3 = {7'b0001101, TWENTYSIX, 	 TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_2_3 = {7'b0000001, TWENTYSEVEN, TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_2_3 = {7'b0000011, TWENTYFOUR,  TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_2_3 = {7'b0000101, THIRTY,  	 TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_2_3 = {7'b0000111, EIGHTEEN,	 TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_2_3 = {7'b0001001, TEN, 			 TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_2_3 = {7'b0001011, FIFTYEIGHT,  TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_0_2_2 = {7'b0001101, TWENTYSEVEN, TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_0_2_2 = {7'b0000001, TWENTYSIX, 	 TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_0_2_2 = {7'b0000011, TWENTYFIVE,  TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_0_2_2 = {7'b0000101, THIRTYONE, 	 TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_0_2_2 = {7'b0000111, NINETEEN, 	 TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_0_2_3 = {7'b0001001, ELEVEN, 		 TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_0_2_3 = {7'b0001011, FIFTYNINE, 	 TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_3_3 = {7'b0001101, TWENTYEIGHT, TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_3_3 = {7'b0000001, TWENTYNINE,  TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_3_3 = {7'b0000011, THIRTY, 		 TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_3_3 = {7'b0000101, TWENTYFOUR,  TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_3_3 = {7'b0000111, TWENTY, 		 TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_3_3 = {7'b0001001, TWELVE, 		 TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_3_3 = {7'b0001011, SIXTY, 		 TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_3_2 = {7'b0001101, TWENTYNINE,  TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_3_2 = {7'b0000001, TWENTYEIGHT, TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_3_2 = {7'b0000011, THIRTYONE,   TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_3_2 = {7'b0000101, TWENTYFIVE,  TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_3_2 = {7'b0000111, TWENTYONE, 	 TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_3_2 = {7'b0001001, THIRTEEN, 	 TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_3_2 = {7'b0001011, SIXTYONE, 	 TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_2_3 = {7'b0001101, THIRTY,   	 THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_2_3 = {7'b0000001, THIRTYONE,   THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_2_3 = {7'b0000011, TWENTYEIGHT, THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_2_3 = {7'b0000101, TWENTYSIX,   THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_2_3 = {7'b0000111, TWENTYTWO,   THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_2_3 = {7'b0001001, FOURTEEN,    THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_2_3 = {7'b0001011, SIXTYTWO,    THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_1_2_2 = {7'b0001101, THIRTYONE, 	 THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_1_2_2 = {7'b0000001, THIRTY,  	 THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_1_2_2 = {7'b0000011, TWENTYNINE,  THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_1_2_2 = {7'b0000101, TWENTYSEVEN, THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_1_2_2 = {7'b0000111, TWENTYTHREE, THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_1_2_2 = {7'b0001001, FIFTEEN, 	 THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_1_2_2 = {7'b0001011, SIXTYTHREE,  THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			     reduce_me_3_0_0 = {7'b0001101, THIRTYTWO, 	 THIRTYTWO, 9'd32, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_0_0 = {7'b0000001, THIRTYTHREE, THIRTYTWO, 9'd32, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_0_0 = {7'b0000011, THIRTYFOUR,  THIRTYTWO, 9'd32, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_0_0 = {7'b0000101, THIRTYSIX, 	 THIRTYTWO, 9'd32, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_0_0 = {7'b0000111, FORTY,     	 THIRTYTWO, 9'd32, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_0_0 = {7'b0001001, FORTYEIGHT,  THIRTYTWO, 9'd32, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_0_0 = {7'b0001011, ZERO, 		 THIRTYTWO, 9'd32, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_0_1 = {7'b0001101, THIRTYTHREE, THIRTYTHREE, 9'd33, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_0_1 = {7'b0000001, THIRTYTWO, 	 THIRTYTHREE, 9'd33, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_0_1 = {7'b0000011, THIRTYFIVE,  THIRTYTHREE, 9'd33, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_0_1 = {7'b0000101, THIRTYSEVEN, THIRTYTHREE, 9'd33, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_0_1 = {7'b0000111, FORTYONE, 	 THIRTYTHREE, 9'd33, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_0_1 = {7'b0001001, FORTYNINE,   THIRTYTHREE, 9'd33, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_0_1 = {7'b0001011, ONE, 			 THIRTYTHREE, 9'd33, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_1_0 = {7'b0001101, THIRTYFOUR,  THIRTYFOUR, 9'd34, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_1_0 = {7'b0000001, THIRTYFIVE,  THIRTYFOUR, 9'd34, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_1_0 = {7'b0000011, THIRTYTWO, 	 THIRTYFOUR, 9'd34, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_1_0 = {7'b0000101, THIRTYEIGHT, THIRTYFOUR, 9'd34, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_1_0 = {7'b0000111, FORTYTWO, 	 THIRTYFOUR, 9'd34, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_1_0 = {7'b0001001, FIFTY,   	 THIRTYFOUR, 9'd34, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_1_0 = {7'b0001011, TWO, 			 THIRTYFOUR, 9'd34, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_1_1 = {7'b0001101, THIRTYFIVE,  THIRTYFIVE, 9'd35, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_1_1 = {7'b0000001, THIRTYFOUR,  THIRTYFIVE, 9'd35, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_1_1 = {7'b0000011, THIRTYTHREE, THIRTYFIVE, 9'd35, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_1_1 = {7'b0000101, THIRTYNINE,  THIRTYFIVE, 9'd35, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_1_1 = {7'b0000111, FORTYTHREE,  THIRTYFIVE, 9'd35, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_1_1 = {7'b0001001, FIFTYONE,    THIRTYFIVE, 9'd35, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_1_1 = {7'b0001011, THREE, 		 THIRTYFIVE, 9'd35, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_2_0_0 = {7'b0001101, THIRTYSIX,   THIRTYSIX, 9'd36, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_0_0 = {7'b0000001, THIRTYSEVEN, THIRTYSIX, 9'd36, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_0_0 = {7'b0000011, THIRTYEIGHT, THIRTYSIX, 9'd36, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_0_0 = {7'b0000101, THIRTYTWO,   THIRTYSIX, 9'd36, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_0_0 = {7'b0000111, FORTYFOUR,   THIRTYSIX, 9'd36, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_0_0 = {7'b0001001, FIFTYTWO,    THIRTYSIX, 9'd36, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_0_0 = {7'b0001011, FOUR, 		 THIRTYSIX, 9'd36, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
					
				  reduce_me_2_0_1 = {7'b0001101, THIRTYSEVEN, THIRTYSEVEN, 9'd37, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_0_1 = {7'b0000001, THIRTYSIX, 	 THIRTYSEVEN, 9'd37, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_0_1 = {7'b0000011, THIRTYNINE,	 THIRTYSEVEN, 9'd37, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_0_1 = {7'b0000101, THIRTYTHREE, THIRTYSEVEN, 9'd37, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_0_1 = {7'b0000111, FORTYFIVE,   THIRTYSEVEN, 9'd37, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_0_1 = {7'b0001001, FIFTYTHREE,  THIRTYSEVEN, 9'd37, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_0_1 = {7'b0001011, FIVE, 		 THIRTYSEVEN, 9'd37, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_2_1_0 = {7'b0001101, THIRTYEIGHT, THIRTYEIGHT, 9'd38, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_1_0 = {7'b0000001, THIRTYNINE,  THIRTYEIGHT, 9'd38, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_1_0 = {7'b0000011, THIRTYSIX, 	 THIRTYEIGHT, 9'd38, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_1_0 = {7'b0000101, THIRTYFOUR,	 THIRTYEIGHT, 9'd38, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_1_0 = {7'b0000111, FORTYSIX,  	 THIRTYEIGHT, 9'd38, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_1_0 = {7'b0001001, FIFTYFOUR, 	 THIRTYEIGHT, 9'd38, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_1_0 = {7'b0001011, SIX, 			 THIRTYEIGHT, 9'd38, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_2_1_1 = {7'b0001101, THIRTYNINE,  THIRTYNINE, 9'd39, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_1_1 = {7'b0000001, THIRTYEIGHT, THIRTYNINE, 9'd39, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_1_1 = {7'b0000011, THIRTYSEVEN, THIRTYNINE, 9'd39, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_1_1 = {7'b0000101, THIRTYFIVE,  THIRTYNINE, 9'd39, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_1_1 = {7'b0000111, FORTYSEVEN,  THIRTYNINE, 9'd39, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_1_1 = {7'b0001001, FIFTYFIVE, 	 THIRTYNINE, 9'd39, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_1_1 = {7'b0001011, SEVEN,  		 THIRTYNINE, 9'd39, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_0_3 = {7'b0001101, FORTY, 	  FORTY, 9'd40, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_0_3 = {7'b0000001, FORTYONE,  FORTY, 9'd40, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_0_3 = {7'b0000011, FORTYTWO,  FORTY, 9'd40, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_0_3 = {7'b0000101, FORTYFOUR, FORTY, 9'd40, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_0_3 = {7'b0000111, THIRTYTWO, FORTY, 9'd40, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_0_3 = {7'b0001001, FIFTYSIX,  FORTY, 9'd40, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_0_3 = {7'b0001011, EIGHT, 	  FORTY, 9'd40, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_0_2 = {7'b0001101, FORTYONE, 	 FORTYONE, 9'd41, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_0_2 = {7'b0000001, FORTY, 	    FORTYONE, 9'd41, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_0_2 = {7'b0000011, FORTYTHREE,  FORTYONE, 9'd41, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_0_2 = {7'b0000101, FORTYFIVE,   FORTYONE, 9'd41, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_0_2 = {7'b0000111, THIRTYTHREE, FORTYONE, 9'd41, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_0_2 = {7'b0001001, FIFTYSEVEN,  FORTYONE, 9'd41, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_0_2 = {7'b0001011, NINE,   		 FORTYONE, 9'd41, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_1_3 = {7'b0001101, FORTYTWO, 	FORTYTWO, 9'd42, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_1_3 = {7'b0000001, FORTYTHREE, FORTYTWO, 9'd42, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_1_3 = {7'b0000011, FORTY, 	   FORTYTWO, 9'd42, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_1_3 = {7'b0000101, FORTYSIX,   FORTYTWO, 9'd42, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_1_3 = {7'b0000111, THIRTYFOUR,	FORTYTWO, 9'd42, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_1_3 = {7'b0001001, FIFTYEIGHT, FORTYTWO, 9'd42, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_1_3 = {7'b0001011, TEN,  		FORTYTWO, 9'd42, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_1_2 = {7'b0001101, FORTYTHREE, FORTYTHREE, 9'd43, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_1_2 = {7'b0000001, FORTYTWO, 	FORTYTHREE, 9'd43, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_1_2 = {7'b0000011, FORTYONE, 	FORTYTHREE, 9'd43, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_1_2 = {7'b0000101, FORTYSEVEN, FORTYTHREE, 9'd43, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_1_2 = {7'b0000111, THIRTYFIVE, FORTYTHREE, 9'd43, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_1_3 = {7'b0001001, FIFTYNINE,  FORTYTHREE, 9'd43, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_1_3 = {7'b0001011, ELEVEN,     FORTYTHREE, 9'd43, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_2_0_3 = {7'b0001101, FORTYFOUR, FORTYFOUR, 9'd44, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_0_3 = {7'b0000001, FORTYFIVE, FORTYFOUR, 9'd44, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_0_3 = {7'b0000011, FORTYSIX,  FORTYFOUR, 9'd44, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_0_3 = {7'b0000101, FORTY, 	  FORTYFOUR, 9'd44, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_0_3 = {7'b0000111, THIRTYSIX, FORTYFOUR, 9'd44, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_0_3 = {7'b0001001, SIXTY,     FORTYFOUR, 9'd44, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_0_3 = {7'b0001011, TWELVE,    FORTYFOUR, 9'd44, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_2_0_2 = {7'b0001101, FORTYFIVE,   FORTYFIVE, 9'd45, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_0_2 = {7'b0000001, FORTYFOUR,   FORTYFIVE, 9'd45, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_0_2 = {7'b0000011, FORTYSEVEN,  FORTYFIVE, 9'd45, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_0_2 = {7'b0000101, FORTYONE, 	 FORTYFIVE, 9'd45, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_0_2 = {7'b0000111, THIRTYSEVEN, FORTYFIVE, 9'd45, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_0_2 = {7'b0001001, SIXTYONE, 	 FORTYFIVE, 9'd45, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_0_2 = {7'b0001011, THIRTEEN,    FORTYFIVE, 9'd45, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_2_1_3 = {7'b0001101, FORTYSIX, 	 FORTYSIX, 9'd46, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_1_3 = {7'b0000001, FORTYSEVEN,  FORTYSIX, 9'd46, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_1_3 = {7'b0000011, FORTYFOUR,   FORTYSIX, 9'd46, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_1_3 = {7'b0000101, FORTYTWO,    FORTYSIX, 9'd46, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_1_3 = {7'b0000111, THIRTYEIGHT, FORTYSIX, 9'd46, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_1_3 = {7'b0001001, SIXTYTWO,    FORTYSIX, 9'd46, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_1_3 = {7'b0001011, FOURTEEN, 	 FORTYSIX, 9'd46, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_2_1_2 = {7'b0001101, FORTYSEVEN, FORTYSEVEN, 9'd47, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_1_2 = {7'b0000001, FORTYSIX,   FORTYSEVEN, 9'd47, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_1_2 = {7'b0000011, FORTYFIVE,  FORTYSEVEN, 9'd47, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_1_2 = {7'b0000101, FORTYTHREE, FORTYSEVEN, 9'd47, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_1_2 = {7'b0000111, THIRTYNINE, FORTYSEVEN, 9'd47, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_1_2 = {7'b0001001, SIXTYTHREE, FORTYSEVEN, 9'd47, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_1_2 = {7'b0001011, FIFTEEN, 	FORTYSEVEN, 9'd47, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_3_0 = {7'b0001101, FORTYEIGHT, FORTYEIGHT, 9'd48, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_3_0 = {7'b0000001, FORTYNINE,  FORTYEIGHT, 9'd48, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_3_0 = {7'b0000011, FIFTY,   	FORTYEIGHT, 9'd48, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_3_0 = {7'b0000101, FIFTYTWO, 	FORTYEIGHT, 9'd48, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_3_0 = {7'b0000111, FIFTYSIX, 	FORTYEIGHT, 9'd48, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_3_0 = {7'b0001001, THIRTYTWO, 	FORTYEIGHT, 9'd48, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_3_0 = {7'b0001011, SIXTEEN, 	FORTYEIGHT, 9'd48, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_3_1 = {7'b0001101, FORTYNINE,   FORTYNINE, 9'd49, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_3_1 = {7'b0000001, FORTYEIGHT,  FORTYNINE, 9'd49, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_3_1 = {7'b0000011, FIFTYONE,    FORTYNINE, 9'd49, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_3_1 = {7'b0000101, FIFTYTHREE,  FORTYNINE, 9'd49, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_3_1 = {7'b0000111, FIFTYSEVEN,  FORTYNINE, 9'd49, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_3_1 = {7'b0001001, THIRTYTHREE, FORTYNINE, 9'd49, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_3_1 = {7'b0001011, SEVENTEEN,   FORTYNINE, 9'd49, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_2_0 = {7'b0001101, FIFTY,  		FIFTY, 9'd50, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_2_0 = {7'b0000001, FIFTYONE,   FIFTY, 9'd50, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_2_0 = {7'b0000011, FORTYEIGHT, FIFTY, 9'd50, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_2_0 = {7'b0000101, FIFTYFOUR,  FIFTY, 9'd50, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_2_0 = {7'b0000111, FIFTYEIGHT, FIFTY, 9'd50, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_2_0 = {7'b0001001, THIRTYFOUR, FIFTY, 9'd50, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_2_0 = {7'b0001011, EIGHTEEN,	FIFTY, 9'd50, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_2_1 = {7'b0001101, FIFTYONE,	FIFTYONE, 9'd51, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_2_1 = {7'b0000001, FIFTY,	 	FIFTYONE, 9'd51, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_2_1 = {7'b0000011, FORTYNINE, 	FIFTYONE, 9'd51, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_2_1 = {7'b0000101, FIFTYFIVE,  FIFTYONE, 9'd51, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_2_1 = {7'b0000111, FIFTYNINE,  FIFTYONE, 9'd51, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_2_1 = {7'b0001001, THIRTYFIVE, FIFTYONE, 9'd51, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_2_1 = {7'b0001011, NINETEEN,	FIFTYONE, 9'd51, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_2_3_0 = {7'b0001101, FIFTYTWO, 	FIFTYTWO, 9'd52, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_3_0 = {7'b0000001, FIFTYTHREE, FIFTYTWO, 9'd52, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_3_0 = {7'b0000011, FIFTYFOUR, 	FIFTYTWO, 9'd52, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_3_0 = {7'b0000101, FORTYEIGHT, FIFTYTWO, 9'd52, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_3_0 = {7'b0000111, SIXTY, 		FIFTYTWO, 9'd52, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_3_0 = {7'b0001001, THIRTYSIX, 	FIFTYTWO, 9'd52, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_3_0 = {7'b0001011, TWENTY,	 	FIFTYTWO, 9'd52, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
	
				  reduce_me_2_3_1 = {7'b0001101, FIFTYTHREE,  FIFTYTHREE, 9'd53, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_3_1 = {7'b0000001, FIFTYTWO, 	 FIFTYTHREE, 9'd53, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_3_1 = {7'b0000011, FIFTYFIVE, 	 FIFTYTHREE, 9'd53, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_3_1 = {7'b0000101, FORTYNINE,	 FIFTYTHREE, 9'd53, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_3_1 = {7'b0000111, SIXTYONE,  	 FIFTYTHREE, 9'd53, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_3_1 = {7'b0001001, THIRTYSEVEN, FIFTYTHREE, 9'd53, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_3_1 = {7'b0001011, TWENTYONE,	 FIFTYTHREE, 9'd53, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_2_2_0 = {7'b0001101, FIFTYFOUR, 	 FIFTYFOUR, 9'd54, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_2_0 = {7'b0000001, FIFTYFIVE, 	 FIFTYFOUR, 9'd54, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_2_0 = {7'b0000011, FIFTYTWO, 	 FIFTYFOUR, 9'd54, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_2_0 = {7'b0000101, FIFTY, 	 	 FIFTYFOUR, 9'd54, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_2_0 = {7'b0000111, SIXTYTWO,  	 FIFTYFOUR, 9'd54, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_2_0 = {7'b0001001, THIRTYEIGHT, FIFTYFOUR, 9'd54, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_2_0 = {7'b0001011, TWENTYTWO, 	 FIFTYFOUR, 9'd54, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
		
				  reduce_me_2_2_1 = {7'b0001101, FIFTYFIVE,   FIFTYFIVE, 9'd55, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_2_1 = {7'b0000001, FIFTYFOUR, 	 FIFTYFIVE, 9'd55, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_2_1 = {7'b0000011, FIFTYTHREE,  FIFTYFIVE, 9'd55, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_2_1 = {7'b0000101, FIFTYONE, 	 FIFTYFIVE, 9'd55, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_2_1 = {7'b0000111, SIXTYTHREE,  FIFTYFIVE, 9'd55, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_2_1 = {7'b0001001, THIRTYNINE,  FIFTYFIVE, 9'd55, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_2_1 = {7'b0001011, TWENTYTHREE, FIFTYFIVE, 9'd55, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_3_3 = {7'b0001101, FIFTYSIX,   FIFTYSIX, 9'd56, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_3_3 = {7'b0000001, FIFTYSEVEN, FIFTYSIX, 9'd56, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_3_3 = {7'b0000011, FIFTYEIGHT, FIFTYSIX, 9'd56, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_3_3 = {7'b0000101, SIXTY, 		FIFTYSIX, 9'd56, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_3_3 = {7'b0000111, FORTYEIGHT, FIFTYSIX, 9'd56, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_3_3 = {7'b0001001, FORTY, 		FIFTYSIX, 9'd56, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_3_3 = {7'b0001011, TWENTYFOUR,	FIFTYSIX, 9'd56, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_3_2 = {7'b0001101, FIFTYSEVEN, FIFTYSEVEN, 9'd57, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_3_2 = {7'b0000001, FIFTYSIX,   FIFTYSEVEN, 9'd57, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_3_2 = {7'b0000011, FIFTYNINE,  FIFTYSEVEN, 9'd57, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_3_2 = {7'b0000101, SIXTYONE,	FIFTYSEVEN, 9'd57, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_3_2 = {7'b0000111, FORTYNINE, 	FIFTYSEVEN, 9'd57, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_3_2 = {7'b0001001, FORTYONE, 	FIFTYSEVEN, 9'd57, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_3_2 = {7'b0001011, TWENTYFIVE, FIFTYSEVEN, 9'd57, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_2_3 = {7'b0001101, FIFTYEIGHT, FIFTYEIGHT, 9'd58, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_2_3 = {7'b0000001, FIFTYNINE,  FIFTYEIGHT, 9'd58, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_2_3 = {7'b0000011, FIFTYSIX,   FIFTYEIGHT, 9'd58, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_2_3 = {7'b0000101, SIXTYTWO,  	FIFTYEIGHT, 9'd58, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_2_3 = {7'b0000111, FIFTY,	 	FIFTYEIGHT, 9'd58, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_2_3 = {7'b0001001, FORTYTWO, 	FIFTYEIGHT, 9'd58, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_2_3 = {7'b0001011, TWENTYSIX,  FIFTYEIGHT, 9'd58, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_3_2_2 = {7'b0001101, FIFTYNINE,   FIFTYNINE, 9'd59, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_3_2_2 = {7'b0000001, FIFTYEIGHT,  FIFTYNINE, 9'd59, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_3_2_2 = {7'b0000011, FIFTYSEVEN,  FIFTYNINE, 9'd59, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_3_2_2 = {7'b0000101, SIXTYTHREE,  FIFTYNINE, 9'd59, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_3_2_2 = {7'b0000111, FIFTYONE, 	 FIFTYNINE, 9'd59, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_3_2_3 = {7'b0001001, FORTYTHREE,  FIFTYNINE, 9'd59, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_3_2_3 = {7'b0001011, TWENTYSEVEN, FIFTYNINE, 9'd59, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_2_3_3 = {7'b0001101, SIXTY, 		 SIXTY, 9'd60, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_3_3 = {7'b0000001, SIXTYONE,  	 SIXTY, 9'd60, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_3_3 = {7'b0000011, SIXTYTWO, 	 SIXTY, 9'd60, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_3_3 = {7'b0000101, FIFTYSIX,    SIXTY, 9'd60, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_3_3 = {7'b0000111, FIFTYTWO, 	 SIXTY, 9'd60, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_3_3 = {7'b0001001, FORTYFOUR, 	 SIXTY, 9'd60, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_3_3 = {7'b0001011, TWENTYEIGHT, SIXTY, 9'd60, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_2_3_2 = {7'b0001101, SIXTYONE,  	SIXTYONE, 9'd61, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_3_2 = {7'b0000001, SIXTY, 		SIXTYONE, 9'd61, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_3_2 = {7'b0000011, SIXTYTHREE, SIXTYONE, 9'd61, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_3_2 = {7'b0000101, FIFTYSEVEN, SIXTYONE, 9'd61, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_3_2 = {7'b0000111, FIFTYTHREE, SIXTYONE, 9'd61, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_3_2 = {7'b0001001, FORTYFIVE, 	SIXTYONE, 9'd61, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_3_2 = {7'b0001011, TWENTYNINE, SIXTYONE, 9'd61, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_2_2_3 = {7'b0001101, SIXTYTWO,   SIXTYTWO, 9'd62, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_2_3 = {7'b0000001, SIXTYTHREE, SIXTYTWO, 9'd62, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_2_3 = {7'b0000011, SIXTY, 		SIXTYTWO, 9'd62, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_2_3 = {7'b0000101, FIFTYEIGHT, SIXTYTWO, 9'd62, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_2_3 = {7'b0000111, FIFTYFOUR,  SIXTYTWO, 9'd62, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_2_3 = {7'b0001001, FORTYSIX,   SIXTYTWO, 9'd62, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_2_3 = {7'b0001011, THIRTY,     SIXTYTWO, 9'd62, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
				  reduce_me_2_2_2 = {7'b0001101, SIXTYTHREE, SIXTYTHREE, 9'd63, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xpos_inject_2_2_2 = {7'b0000001, SIXTYTWO,  	SIXTYTHREE, 9'd63, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_ypos_inject_2_2_2 = {7'b0000011, SIXTYONE,   SIXTYTHREE, 9'd63, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zpos_inject_2_2_2 = {7'b0000101, FIFTYNINE,  SIXTYTHREE, 9'd63, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_xneg_inject_2_2_2 = {7'b0000111, FIFTYFIVE,  SIXTYTHREE, 9'd63, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_yneg_inject_2_2_2 = {7'b0001001, FORTYSEVEN, SIXTYTHREE, 9'd63, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			in_zneg_inject_2_2_2 = {7'b0001011, THIRTYONE,  SIXTYTHREE, 9'd63, 8'd0, i, 2'b00, ShortAllReduce, 32'd6};
			
			#10;
			
		end*/
			
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
			in_xpos_inject_0_0_0 = {7'b0000001, ONE, 		  ZERO, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			in_ypos_inject_0_0_0 = {7'b0000001, TWO, 		  ZERO, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			in_zpos_inject_0_0_0 = {7'b0000001, FOUR, 	  ZERO, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			in_xneg_inject_0_0_0 = {7'b0000001, EIGHT, 	  ZERO, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			in_yneg_inject_0_0_0 = {7'b0000001, SIXTEEN,   ZERO, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, THIRTYTWO, ZERO, 9'd0, 8'd0, i, 2'b00, ShortBcast, 32'd6};
			#10;
		end*/
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//scatter
		
		/*for(i=0;i<1;i=i+1)begin
			in_xpos_inject_0_0_0 = {7'b0000001, 9'b000000001, 9'd0, 9'd0, 8'd0, 8'd1, 2'b00, Scatter, 32'd6};
			in_ypos_inject_0_0_0 = {7'b0000001, 9'b000001000, 9'd0, 9'd0, 8'd0, 8'd2, 2'b00, Scatter, 32'd6};
			in_zpos_inject_0_0_0 = {7'b0000001, 9'b001000000, 9'd0, 9'd0, 8'd0, 8'd4, 2'b00, Scatter, 32'd6};
			in_xneg_inject_0_0_0 = {7'b0000001, 9'b000000011, 9'd0, 9'd0, 8'd0, 8'd8, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b000011000, 9'd0, 9'd0, 8'd0, 8'd16, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, THIRTYTWO, ZERO, 9'd0, 8'd0, 8'd32, 2'b00, Scatter, 32'd6};
			#10;
			in_xpos_inject_0_0_0 = 0;
			in_ypos_inject_0_0_0 = {7'b0000001, 9'b000001001, 9'd0, 9'd0, 8'd0, 8'd3, 2'b00, Scatter, 32'd6};
			in_zpos_inject_0_0_0 = {7'b0000001, 9'b001000001, 9'd0, 9'd0, 8'd0, 8'd5, 2'b00, Scatter, 32'd6};
			in_xneg_inject_0_0_0 = {7'b0000001, 9'b000000010, 9'd0, 9'd0, 8'd0, 8'd9, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b000011001, 9'd0, 9'd0, 8'd0, 8'd17, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, THIRTYTHREE, ZERO, 9'd0, 8'd0, 8'd33, 2'b00, Scatter, 32'd6};
			#10;
			in_ypos_inject_0_0_0 = 0;
			in_zpos_inject_0_0_0 = {7'b0000001, 9'b001001000, 9'd0, 9'd0, 8'd0, 8'd6, 2'b00, Scatter, 32'd6};
			in_xneg_inject_0_0_0 = {7'b0000001, 9'b000001011, 9'd0, 9'd0, 8'd0, 8'd10, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b000010000, 9'd0, 9'd0, 8'd0, 8'd18, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, THIRTYFOUR, ZERO, 9'd0, 8'd0, 8'd34, 2'b00, Scatter, 32'd6};
			#10;
			in_zpos_inject_0_0_0 = {7'b0000001, 9'b001001001, 9'd0, 9'd0, 8'd0, 8'd7, 2'b00, Scatter, 32'd6};
			in_xneg_inject_0_0_0 = {7'b0000001, 9'b000001010, 9'd0, 9'd0, 8'd0, 8'd11, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b000010001, 9'd0, 9'd0, 8'd0, 8'd19, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, THIRTYFIVE, ZERO, 9'd0, 8'd0, 8'd35, 2'b00, Scatter, 32'd6};
			#10;
			in_zpos_inject_0_0_0 = 0;
			in_xneg_inject_0_0_0 = {7'b0000001, 9'b001000011, 9'd0, 9'd0, 8'd0, 8'd12, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b001011000, 9'd0, 9'd0, 8'd0, 8'd20, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, THIRTYSIX, ZERO, 9'd0, 8'd0, 8'd36, 2'b00, Scatter, 32'd6};
			#10;
			in_xneg_inject_0_0_0 = {7'b0000001, 9'b001000010, 9'd0, 9'd0, 8'd0, 8'd13, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b001011001, 9'd0, 9'd0, 8'd0, 8'd21, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, THIRTYSEVEN, ZERO, 9'd0, 8'd0, 8'd37, 2'b00, Scatter, 32'd6};
			#10;
			in_xneg_inject_0_0_0 = {7'b0000001, 9'b001001011, 9'd0, 9'd0, 8'd0, 8'd14, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b001010000, 9'd0, 9'd0, 8'd0, 8'd22, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, THIRTYEIGHT, ZERO, 9'd0, 8'd0, 8'd38, 2'b00, Scatter, 32'd6};
			#10;
			in_xneg_inject_0_0_0 = {7'b0000001, 9'b001001010, 9'd0, 9'd0, 8'd0, 8'd15, 2'b00, Scatter, 32'd6};
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b001010001, 9'd0, 9'd0, 8'd0, 8'd23, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, THIRTYNINE, ZERO, 9'd0, 8'd0, 8'd39, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b000011011, 9'd0, 9'd0, 8'd0, 8'd24, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, FORTY, ZERO, 9'd0, 8'd0, 8'd40, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b000011010, 9'd0, 9'd0, 8'd0, 8'd25, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, FORTYONE, ZERO, 9'd0, 8'd0, 8'd41, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b000010011, 9'd0, 9'd0, 8'd0, 8'd26, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, FORTYTWO, ZERO, 9'd0, 8'd0, 8'd42, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b000010010, 9'd0, 9'd0, 8'd0, 8'd27, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, FORTYTHREE, ZERO, 9'd0, 8'd0, 8'd43, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b001011011, 9'd0, 9'd0, 8'd0, 8'd28, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, FORTYFOUR, ZERO, 9'd0, 8'd0, 8'd44, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b001011010, 9'd0, 9'd0, 8'd0, 8'd29, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, FORTYFIVE, ZERO, 9'd0, 8'd0, 8'd45, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b001010011, 9'd0, 9'd0, 8'd0, 8'd30, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, FORTYSIX, ZERO, 9'd0, 8'd0, 8'd46, 2'b00, Scatter, 32'd6};
			#10;
			in_yneg_inject_0_0_0 = {7'b0000001, 9'b001010010, 9'd0, 9'd0, 8'd0, 8'd31, 2'b00, Scatter, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0000001, FORTYSEVEN, ZERO, 9'd0, 8'd0, 8'd47, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, FORTYEIGHT, ZERO, 9'd0, 8'd0, 8'd48, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, FORTYNINE, ZERO, 9'd0, 8'd0, 8'd49, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, FIFTY, ZERO, 9'd0, 8'd0, 8'd50, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, FIFTYONE, ZERO, 9'd0, 8'd0, 8'd51, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, FIFTYTWO, ZERO, 9'd0, 8'd0, 8'd52, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, FIFTYTHREE, ZERO, 9'd0, 8'd0, 8'd53, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, FIFTYFOUR, ZERO, 9'd0, 8'd0, 8'd54, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, FIFTYFIVE, ZERO, 9'd0, 8'd0, 8'd55, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, FIFTYSIX, ZERO, 9'd0, 8'd0, 8'd56, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, FIFTYSEVEN, ZERO, 9'd0, 8'd0, 8'd57, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, FIFTYEIGHT, ZERO, 9'd0, 8'd0, 8'd58, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, FIFTYNINE, ZERO, 9'd0, 8'd0, 8'd59, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, SIXTY, ZERO, 9'd0, 8'd0, 8'd60, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, SIXTYONE, ZERO, 9'd0, 8'd0, 8'd61, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, SIXTYTWO, ZERO, 9'd0, 8'd0, 8'd62, 2'b00, Scatter, 32'd6};
			#10;
			in_zneg_inject_0_0_0 = {7'b0000001, SIXTYTHREE, ZERO, 9'd0, 8'd0, 8'd63, 2'b00, Scatter, 32'd6};
			#10;
		end*/
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//gather
		
		for(i=1;i<2;i=i+1)begin
			
			in_xneg_inject_0_0_1 = {7'b0000001, 9'b000000000, 9'b000000001, 9'd1, 8'd0, i, 2'b00, Gather, 32'd1};			
			in_yneg_inject_0_1_0 = {7'b0000001, 9'b000000000, 9'b000001000, 9'd2, 8'd0, i, 2'b00, Gather, 32'd2};			
			in_xneg_inject_0_1_1 = {7'b0000001, 9'b000001000, 9'b000001001, 9'd3, 8'd0, i, 2'b00, Gather, 32'd3};			
			in_zneg_inject_1_0_0 = {7'b0000001, 9'b000000000, 9'b001000000, 9'd4, 8'd0, i, 2'b00, Gather, 32'd4};			
			in_xneg_inject_1_0_1 = {7'b0000001, 9'b001000000, 9'b001000001, 9'd5, 8'd0, i, 2'b00, Gather, 32'd5};			
			in_yneg_inject_1_1_0 = {7'b0000001, 9'b001000000, 9'b001001000, 9'd6, 8'd0, i, 2'b00, Gather, 32'd6};			
			in_xneg_inject_1_1_1 = {7'b0000001, 9'b001001000, 9'b001001001, 9'd7, 8'd0, i, 2'b00, Gather, 32'd7};			
			in_xpos_inject_0_0_3 = {7'b0000001, 9'b000000000, 9'b000000011, 9'd8, 8'd0, i, 2'b00, Gather, 32'd8};			
			in_xpos_inject_0_0_2 = {7'b0000001, 9'b000000011, 9'b000000010, 9'd9, 8'd0, i, 2'b00, Gather, 32'd9};			
			in_yneg_inject_0_1_3 = {7'b0000001, 9'b000000011, 9'b000001011, 9'd10, 8'd0, i, 2'b00, Gather, 32'd10};		
			in_xpos_inject_0_1_2 = {7'b0000001, 9'b000001011, 9'b000001010, 9'd11, 8'd0, i, 2'b00, Gather, 32'd11};			
			in_zneg_inject_1_0_3 = {7'b0000001, 9'b000000011, 9'b001000011, 9'd12, 8'd0, i, 2'b00, Gather, 32'd12};			
			in_xpos_inject_1_0_2 = {7'b0000001, 9'b001000011, 9'b001000010, 9'd13, 8'd0, i, 2'b00, Gather, 32'd13};			
			in_yneg_inject_1_1_3 = {7'b0000001, 9'b001000011, 9'b001001011, 9'd14, 8'd0, i, 2'b00, Gather, 32'd14};			
			in_xpos_inject_1_1_2 = {7'b0000001, 9'b001001011, 9'b001001010, 9'd15, 8'd0, i, 2'b00, Gather, 32'd15};			
			in_ypos_inject_0_3_0 = {7'b0000001, 9'b000000000, 9'b000011000, 9'd16, 8'd0, i, 2'b00, Gather, 32'd16};			
			in_xneg_inject_0_3_1 = {7'b0000001, 9'b000011000, 9'b000011001, 9'd17, 8'd0, i, 2'b00, Gather, 32'd17};			
			in_ypos_inject_0_2_0 = {7'b0000001, 9'b000011000, 9'b000010000, 9'd18, 8'd0, i, 2'b00, Gather, 32'd18};			
			in_xneg_inject_0_2_1 = {7'b0000001, 9'b000010000, 9'b000010001, 9'd19, 8'd0, i, 2'b00, Gather, 32'd19};			
			in_zneg_inject_1_3_0 = {7'b0000001, 9'b000011000, 9'b001011000, 9'd20, 8'd0, i, 2'b00, Gather, 32'd20};			
			in_xneg_inject_1_3_1 = {7'b0000001, 9'b001011000, 9'b001011001, 9'd21, 8'd0, i, 2'b00, Gather, 32'd21};			
			in_ypos_inject_1_2_0 = {7'b0000001, 9'b001011000, 9'b001010000, 9'd22, 8'd0, i, 2'b00, Gather, 32'd22};			
			in_xneg_inject_1_2_1 = {7'b0000001, 9'b001010000, 9'b001010001, 9'd23, 8'd0, i, 2'b00, Gather, 32'd23};			
			in_xpos_inject_0_3_3 = {7'b0000001, 9'b000011000, 9'b000011011, 9'd24, 8'd0, i, 2'b00, Gather, 32'd24};			
			in_xpos_inject_0_3_2 = {7'b0000001, 9'b000011011, 9'b000011010, 9'd25, 8'd0, i, 2'b00, Gather, 32'd25};			
			in_ypos_inject_0_2_3 = {7'b0000001, 9'b000011011, 9'b000010011, 9'd26, 8'd0, i, 2'b00, Gather, 32'd26};		
			in_xpos_inject_0_2_2 = {7'b0000001, 9'b000010011, 9'b000010010, 9'd27, 8'd0, i, 2'b00, Gather, 32'd27};			
			in_zneg_inject_1_3_3 = {7'b0000001, 9'b000011011, 9'b001011011, 9'd28, 8'd0, i, 2'b00, Gather, 32'd28};			
			in_xpos_inject_1_3_2 = {7'b0000001, 9'b001011011, 9'b001011010, 9'd29, 8'd0, i, 2'b00, Gather, 32'd29};			
			in_ypos_inject_1_2_3 = {7'b0000001, 9'b001011011, 9'b001010011, 9'd30, 8'd0, i, 2'b00, Gather, 32'd30};			
			in_xpos_inject_1_2_2 = {7'b0000001, 9'b001010011, 9'b001010010, 9'd31, 8'd0, i, 2'b00, Gather, 32'd31};
			
			in_zpos_inject_3_0_0 = {7'b0001011, ZERO, 	    9'b011000000, 9'd32, 8'd0, i, 2'b00, Gather, 32'd32};
			in_xneg_inject_3_0_1 = {7'b0000001, THIRTYTWO,   9'b011000001, 9'd33, 8'd0, i, 2'b00, Gather, 32'd33};			
			in_yneg_inject_3_1_0 = {7'b0000001, THIRTYTWO,   9'b011001000, 9'd34, 8'd0, i, 2'b00, Gather, 32'd34};			
			in_xneg_inject_3_1_1 = {7'b0000001, THIRTYFOUR,  9'b011001001, 9'd35, 8'd0, i, 2'b00, Gather, 32'd35};			
			in_zpos_inject_2_0_0 = {7'b0000001, THIRTYTWO,   9'b010000000, 9'd36, 8'd0, i, 2'b00, Gather, 32'd36};			
			in_xneg_inject_2_0_1 = {7'b0000001, THIRTYSIX, 	 9'b010000001, 9'd37, 8'd0, i, 2'b00, Gather, 32'd37};			
			in_yneg_inject_2_1_0 = {7'b0000001, THIRTYSIX, 	 9'b010001000, 9'd38, 8'd0, i, 2'b00, Gather, 32'd38};			
			in_xneg_inject_2_1_1 = {7'b0000001, THIRTYEIGHT, 9'b010001001, 9'd39, 8'd0, i, 2'b00, Gather, 32'd39};			
			in_xpos_inject_3_0_3 = {7'b0000001, THIRTYTWO,   9'b011000011, 9'd40, 8'd0, i, 2'b00, Gather, 32'd40};			
			in_xpos_inject_3_0_2 = {7'b0000001, FORTY, 		 9'b011000010, 9'd41, 8'd0, i, 2'b00, Gather, 32'd41};			
			in_yneg_inject_3_1_3 = {7'b0000001, FORTY, 		 9'b011001011, 9'd42, 8'd0, i, 2'b00, Gather, 32'd42};		
			in_xpos_inject_3_1_2 = {7'b0000001, FORTYTWO, 	 9'b011001010, 9'd43, 8'd0, i, 2'b00, Gather, 32'd43};			
			in_zpos_inject_2_0_3 = {7'b0000001, FORTY, 		 9'b010000011, 9'd44, 8'd0, i, 2'b00, Gather, 32'd44};			
			in_xpos_inject_2_0_2 = {7'b0000001, FORTYFOUR, 	 9'b010000010, 9'd45, 8'd0, i, 2'b00, Gather, 32'd45};			
			in_yneg_inject_2_1_3 = {7'b0000001, FORTYFOUR, 	 9'b010001011, 9'd46, 8'd0, i, 2'b00, Gather, 32'd46};			
			in_xpos_inject_2_1_2 = {7'b0000001, FORTYSIX, 	 9'b010001010, 9'd47, 8'd0, i, 2'b00, Gather, 32'd47};			
			in_ypos_inject_3_3_0 = {7'b0000001, THIRTYTWO, 	 9'b011011000, 9'd48, 8'd0, i, 2'b00, Gather, 32'd48};			
			in_xneg_inject_3_3_1 = {7'b0000001, FORTYEIGHT,  9'b011011001, 9'd49, 8'd0, i, 2'b00, Gather, 32'd49};			
			in_ypos_inject_3_2_0 = {7'b0000001, FORTYEIGHT,  9'b011010000, 9'd50, 8'd0, i, 2'b00, Gather, 32'd50};			
			in_xneg_inject_3_2_1 = {7'b0000001, FIFTY, 		 9'b011010001, 9'd51, 8'd0, i, 2'b00, Gather, 32'd51};			
			in_zpos_inject_2_3_0 = {7'b0000001, FORTYEIGHT,  9'b010011000, 9'd52, 8'd0, i, 2'b00, Gather, 32'd52};			
			in_xneg_inject_2_3_1 = {7'b0000001, FIFTYTWO, 	 9'b010011001, 9'd53, 8'd0, i, 2'b00, Gather, 32'd53};			
			in_ypos_inject_2_2_0 = {7'b0000001, FIFTYTWO, 	 9'b010010000, 9'd54, 8'd0, i, 2'b00, Gather, 32'd54};			
			in_xneg_inject_2_2_1 = {7'b0000001, FIFTYFOUR, 	 9'b010010001, 9'd55, 8'd0, i, 2'b00, Gather, 32'd55};			
			in_xpos_inject_3_3_3 = {7'b0000001, FORTYEIGHT,  9'b011011011, 9'd56, 8'd0, i, 2'b00, Gather, 32'd56};			
			in_xpos_inject_3_3_2 = {7'b0000001, FIFTYSIX, 	 9'b011011010, 9'd57, 8'd0, i, 2'b00, Gather, 32'd57};			
			in_ypos_inject_3_2_3 = {7'b0000001, FIFTYSIX, 	 9'b011010011, 9'd58, 8'd0, i, 2'b00, Gather, 32'd58};		
			in_xpos_inject_3_2_2 = {7'b0000001, FIFTYEIGHT,  9'b011010010, 9'd59, 8'd0, i, 2'b00, Gather, 32'd59};			
			in_zpos_inject_2_3_3 = {7'b0000001, FIFTYSIX, 	 9'b010011011, 9'd60, 8'd0, i, 2'b00, Gather, 32'd60};			
			in_xpos_inject_2_3_2 = {7'b0000001, SIXTY, 		 9'b010011010, 9'd61, 8'd0, i, 2'b00, Gather, 32'd61};			
			in_ypos_inject_2_2_3 = {7'b0000001, SIXTY, 		 9'b010010011, 9'd62, 8'd0, i, 2'b00, Gather, 32'd62};			
			in_xpos_inject_2_2_2 = {7'b0000001, SIXTYTWO, 	 9'b010010010, 9'd63, 8'd0, i, 2'b00, Gather, 32'd63};
			
			#10;
		end
				
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//allgather
		
		/*for(i=0;i<1;i=i+1)begin
		
			in_xpos_inject_0_0_0 = {7'b0000001, ONE, 	     ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_0_0 = {7'b0000011, TWO, 	     ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_0_0 = {7'b0000101, FOUR, 	  ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_0_0_0 = {7'b0000111, EIGHT,     ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_0_0 = {7'b0001001, SIXTEEN,   ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_0_0_0 = {7'b0001011, THIRTYTWO, ZERO, 9'd0, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_0_0_1 = {7'b0000001, ZERO, 	 	 ONE, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_0_1 = {7'b0000011, THREE, 	 	 ONE, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_0_1 = {7'b0000101, FIVE, 	 	 ONE, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_0_0_1 = {7'b0000111, NINE, 	    ONE, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_0_1 = {7'b0001001, SEVENTEEN,   ONE, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_0_0_1 = {7'b0001011, THIRTYTHREE, ONE, 9'd1, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_0_1_0 = {7'b0000001, THREE, 	   TWO, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_1_0 = {7'b0000011, ZERO, 	   TWO, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_1_0 = {7'b0000101, SIX, 		   TWO, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_0_1_0 = {7'b0000111, TEN, 		   TWO, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_1_0 = {7'b0001001, EIGHTEEN,   TWO, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_0_1_0 = {7'b0001011, THIRTYFOUR, TWO, 9'd2, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_0_1_1 = {7'b0000001, TWO, 	    	THREE, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_1_1 = {7'b0000011, ONE, 		 	THREE, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_1_1 = {7'b0000101, SEVEN,    	THREE, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_0_1_1 = {7'b0000111, ELEVEN,   	THREE, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_1_1 = {7'b0001001, NINETEEN,   THREE, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_0_1_1 = {7'b0001011, THIRTYFIVE, THREE, 9'd3, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_1_0_0 = {7'b0000001, FIVE,   	  FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_0_0 = {7'b0000011, SIX, 	  	  FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_0_0 = {7'b0000101, ZERO,   	  FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_0_0 = {7'b0000111, TWELVE,    FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_0_0 = {7'b0001001, TWENTY,    FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_1_0_0 = {7'b0001011, THIRTYSIX, FOUR, 9'd4, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
					
			in_xneg_inject_1_0_1 = {7'b0000001, FOUR, 	    FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_0_1 = {7'b0000011, SEVEN,	  	 FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_0_1 = {7'b0000101, ONE,		    FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_1_0_1 = {7'b0000111, THIRTEEN,    FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_0_1 = {7'b0001001, TWENTYONE,   FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_1_0_1 = {7'b0001011, THIRTYSEVEN, FIVE, 9'd5, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_1_1_0 = {7'b0000001, SEVEN, 	  	 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_1_0 = {7'b0000011, FOUR, 	  	 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_1_0 = {7'b0000101, TWO, 		  	 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_1_0 = {7'b0000111, FOURTEEN,  	 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_1_0 = {7'b0001001, TWENTYTWO, 	 SIX, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_1_1_0 = {7'b0001011, THIRTYEIGHT, SIX, 9'd6, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_1_1_1 = {7'b0000001, SIX, 			 SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_1_1 = {7'b0000011, FIVE, 		 SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_1_1 = {7'b0000101, THREE, 		 SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_1_1_1 = {7'b0000111, FIFTEEN, 	 SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_1_1 = {7'b0001001, TWENTYTHREE, SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_1_1_1 = {7'b0001011, THIRTYNINE,  SEVEN, 9'd7, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_0_0_3 = {7'b0000001, NINE, 		EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd8};
			in_ypos_inject_0_0_3 = {7'b0000011, TEN, 		   EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd8};
			in_zpos_inject_0_0_3 = {7'b0000101, TWELVE, 	   EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd8};
			in_xpos_inject_0_0_3 = {7'b0000111, ZERO, 		EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd8};
			in_yneg_inject_0_0_3 = {7'b0001001, TWENTYFOUR, EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd8};
			in_zneg_inject_0_0_3 = {7'b0001011, FORTY, 	   EIGHT, 9'd8, 8'd0, i, 2'b00, ShortAllGather, 32'd8};
			
			in_xpos_inject_0_0_2 = {7'b0000001, EIGHT, 	   NINE, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd9};
			in_ypos_inject_0_0_2 = {7'b0000011, ELEVEN, 	   NINE, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd9};
			in_zpos_inject_0_0_2 = {7'b0000101, THIRTEEN,   NINE, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd9};
			in_xneg_inject_0_0_2 = {7'b0000111, ONE, 		   NINE, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd9};
			in_yneg_inject_0_0_2 = {7'b0001001, TWENTYFIVE, NINE, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd9};
			in_zneg_inject_0_0_2 = {7'b0001011, FORTYONE,   NINE, 9'd9, 8'd0, i, 2'b00, ShortAllGather, 32'd9};
			
			in_xneg_inject_0_1_3 = {7'b0000001, ELEVEN, 	  TEN, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd10};
			in_yneg_inject_0_1_3 = {7'b0000011, EIGHT, 	  TEN, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd10};
			in_zpos_inject_0_1_3 = {7'b0000101, FOURTEEN,  TEN, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd10};
			in_xpos_inject_0_1_3 = {7'b0000111, TWO,		  TEN, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd10};
			in_ypos_inject_0_1_3 = {7'b0001001, TWENTYSIX, TEN, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd10};
			in_zneg_inject_0_1_3 = {7'b0001011, FORTYTWO,  TEN, 9'd10, 8'd0, i, 2'b00, ShortAllGather, 32'd10};
			
			in_xpos_inject_0_1_2 = {7'b0000001, TEN, 			 ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd11};
			in_yneg_inject_0_1_2 = {7'b0000011, NINE, 		 ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd11};
			in_zpos_inject_0_1_2 = {7'b0000101, FIFTEEN, 	 ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd11};
			in_xneg_inject_0_1_2 = {7'b0000111, THREE, 		 ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd11};
			in_ypos_inject_0_1_3 = {7'b0001001, TWENTYSEVEN, ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd11};
			in_zneg_inject_0_1_3 = {7'b0001011, FORTYTHREE,  ELEVEN, 9'd11, 8'd0, i, 2'b00, ShortAllGather, 32'd11};
			
			in_xneg_inject_1_0_3 = {7'b0000001, THIRTEEN, 	 TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd12};
			in_ypos_inject_1_0_3 = {7'b0000011, FOURTEEN, 	 TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd12};
			in_zneg_inject_1_0_3 = {7'b0000101, EIGHT, 		 TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd12};
			in_xpos_inject_1_0_3 = {7'b0000111, FOUR, 		 TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd12};
			in_yneg_inject_1_0_3 = {7'b0001001, TWENTYEIGHT, TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd12};
			in_zpos_inject_1_0_3 = {7'b0001011, FORTYFOUR,   TWELVE, 9'd12, 8'd0, i, 2'b00, ShortAllGather, 32'd12};
			
			in_xpos_inject_1_0_2 = {7'b0000001, TWELVE,     THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd13};
			in_ypos_inject_1_0_2 = {7'b0000011, FIFTEEN,    THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd13};
			in_zneg_inject_1_0_2 = {7'b0000101, NINE, 		THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd13};
			in_xneg_inject_1_0_2 = {7'b0000111, FIVE, 		THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd13};
			in_yneg_inject_1_0_2 = {7'b0001001, TWENTYNINE, THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd13};
			in_zpos_inject_1_0_2 = {7'b0001011, FORTYFIVE,  THIRTEEN, 9'd13, 8'd0, i, 2'b00, ShortAllGather, 32'd13};
			
			in_xneg_inject_1_1_3 = {7'b0000001, FIFTEEN,  FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd14};
			in_yneg_inject_1_1_3 = {7'b0000011, TWELVE,   FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd14};
			in_zneg_inject_1_1_3 = {7'b0000101, TEN,      FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd14};
			in_xpos_inject_1_1_3 = {7'b0000111, SIX,      FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd14};
			in_ypos_inject_1_1_3 = {7'b0001001, THIRTY,   FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd14};
			in_zpos_inject_1_1_3 = {7'b0001011, FORTYSIX, FOURTEEN, 9'd14, 8'd0, i, 2'b00, ShortAllGather, 32'd14};
			
			in_xpos_inject_1_1_2 = {7'b0000001, FOURTEEN,   FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd15};
			in_yneg_inject_1_1_2 = {7'b0000011, THIRTEEN,   FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd15};
			in_zneg_inject_1_1_2 = {7'b0000101, ELEVEN,     FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd15};
			in_xneg_inject_1_1_2 = {7'b0000111, SEVEN,      FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd15};
			in_ypos_inject_1_1_2 = {7'b0001001, THIRTYONE,  FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd15};
			in_zpos_inject_1_1_2 = {7'b0001011, FORTYSEVEN, FIFTEEN, 9'd15, 8'd0, i, 2'b00, ShortAllGather, 32'd15};
			
			in_xpos_inject_0_3_0 = {7'b0000001, SEVENTEEN,  SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_3_0 = {7'b0000011, EIGHTEEN,   SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_3_0 = {7'b0000101, TWENTY, 	   SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_0_3_0 = {7'b0000111, TWENTYFOUR, SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_3_0 = {7'b0001001, ZERO, 		SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_0_3_0 = {7'b0001011, FORTYEIGHT, SIXTEEN, 9'd16, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_0_3_1 = {7'b0000001, SIXTEEN,    SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_3_1 = {7'b0000011, NINETEEN,   SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_3_1 = {7'b0000101, TWENTYONE,  SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_0_3_1 = {7'b0000111, TWENTYFIVE, SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_3_1 = {7'b0001001, ONE, 		   SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_0_3_1 = {7'b0001011, FORTYNINE,  SEVENTEEN, 9'd17, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_0_2_0 = {7'b0000001, NINETEEN,  EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_2_0 = {7'b0000011, SIXTEEN,   EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_2_0 = {7'b0000101, TWENTYTWO, EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_0_2_0 = {7'b0000111, TWENTYSIX, EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_2_0 = {7'b0001001, TWO, 		  EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_0_2_0 = {7'b0001011, FIFTY,	  EIGHTEEN, 9'd18, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_0_2_1 = {7'b0000001, EIGHTEEN,	 NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_2_1 = {7'b0000011, SEVENTEEN, 	 NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_2_1 = {7'b0000101, TWENTYTHREE, NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_0_2_1 = {7'b0000111, TWENTYSEVEN, NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_2_1 = {7'b0001001, THREE, 		 NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_0_2_1 = {7'b0001011, FIFTYONE,	 NINETEEN, 9'd19, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_1_3_0 = {7'b0000001, TWENTYONE,   TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_3_0 = {7'b0000011, TWENTYTWO, 	 TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_3_0 = {7'b0000101, SIXTEEN, 	 TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_3_0 = {7'b0000111, TWENTYEIGHT, TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_3_0 = {7'b0001001, FOUR, 		 TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_1_3_0 = {7'b0001011, FIFTYTWO,	 TWENTY, 9'd20, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
	
			in_xneg_inject_1_3_1 = {7'b0000001, TWENTY, 		 TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_3_1 = {7'b0000011, TWENTYTHREE, TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_3_1 = {7'b0000101, SEVENTEEN,	 TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_1_3_1 = {7'b0000111, TWENTYNINE,  TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_3_1 = {7'b0001001, FIVE, 		 TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_1_3_1 = {7'b0001011, FIFTYTHREE,	 TWENTYONE, 9'd21, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_1_2_0 = {7'b0000001, TWENTYTHREE, TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_2_0 = {7'b0000011, TWENTY, 		 TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_2_0 = {7'b0000101, EIGHTEEN, 	 TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_2_0 = {7'b0000111, THIRTY,  	 TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_2_0 = {7'b0001001, SIX, 			 TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_1_2_0 = {7'b0001011, FIFTYFOUR, 	 TWENTYTWO, 9'd22, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_1_2_1 = {7'b0000001, TWENTYTWO, 	 TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_2_1 = {7'b0000011, TWENTYONE, 	 TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_2_1 = {7'b0000101, NINETEEN, 	 TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_1_2_1 = {7'b0000111, THIRTYONE, 	 TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_2_1 = {7'b0001001, SEVEN, 		 TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_1_2_1 = {7'b0001011, FIFTYFIVE, 	 TWENTYTHREE, 9'd23, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_0_3_3 = {7'b0000001, TWENTYFIVE,  TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_3_3 = {7'b0000011, TWENTYSIX, 	 TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_3_3 = {7'b0000101, TWENTYEIGHT, TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_0_3_3 = {7'b0000111, SIXTEEN, 	 TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_3_3 = {7'b0001001, EIGHT, 		 TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_0_3_3 = {7'b0001011, FIFTYSIX,	 TWENTYFOUR, 9'd24, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_0_3_2 = {7'b0000001, TWENTYFOUR,  TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_3_2 = {7'b0000011, TWENTYSEVEN, TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_3_2 = {7'b0000101, TWENTYNINE,	 TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_0_3_2 = {7'b0000111, SEVENTEEN, 	 TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_3_2 = {7'b0001001, NINE, 		 TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_0_3_2 = {7'b0001011, FIFTYSEVEN,  TWENTYFIVE, 9'd25, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_0_2_3 = {7'b0000001, TWENTYSEVEN, TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_2_3 = {7'b0000011, TWENTYFOUR,  TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_2_3 = {7'b0000101, THIRTY,  	 TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_0_2_3 = {7'b0000111, EIGHTEEN,	 TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_2_3 = {7'b0001001, TEN, 			 TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_0_2_3 = {7'b0001011, FIFTYEIGHT,  TWENTYSIX, 9'd26, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_0_2_2 = {7'b0000001, TWENTYSIX, 	 TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_0_2_2 = {7'b0000011, TWENTYFIVE,  TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_0_2_2 = {7'b0000101, THIRTYONE, 	 TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_0_2_2 = {7'b0000111, NINETEEN, 	 TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_0_2_3 = {7'b0001001, ELEVEN, 		 TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_0_2_3 = {7'b0001011, FIFTYNINE, 	 TWENTYSEVEN, 9'd27, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_1_3_3 = {7'b0000001, TWENTYNINE,  TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_3_3 = {7'b0000011, THIRTY, 		 TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_3_3 = {7'b0000101, TWENTYFOUR,  TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_1_3_3 = {7'b0000111, TWENTY, 		 TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_3_3 = {7'b0001001, TWELVE, 		 TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_1_3_3 = {7'b0001011, SIXTY, 		 TWENTYEIGHT, 9'd28, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_1_3_2 = {7'b0000001, TWENTYEIGHT, TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_3_2 = {7'b0000011, THIRTYONE,   TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_3_2 = {7'b0000101, TWENTYFIVE,  TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_3_2 = {7'b0000111, TWENTYONE, 	 TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_3_2 = {7'b0001001, THIRTEEN, 	 TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_1_3_2 = {7'b0001011, SIXTYONE, 	 TWENTYNINE, 9'd29, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_1_2_3 = {7'b0000001, THIRTYONE,   THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_2_3 = {7'b0000011, TWENTYEIGHT, THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_2_3 = {7'b0000101, TWENTYSIX,   THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_1_2_3 = {7'b0000111, TWENTYTWO,   THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_2_3 = {7'b0001001, FOURTEEN,    THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_1_2_3 = {7'b0001011, SIXTYTWO,    THIRTY, 9'd30, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_1_2_2 = {7'b0000001, THIRTY,  	 THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_1_2_2 = {7'b0000011, TWENTYNINE,  THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_1_2_2 = {7'b0000101, TWENTYSEVEN, THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_1_2_2 = {7'b0000111, TWENTYTHREE, THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_1_2_2 = {7'b0001001, FIFTEEN, 	 THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_1_2_2 = {7'b0001011, SIXTYTHREE,  THIRTYONE, 9'd31, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			in_xpos_inject_3_0_0 = {7'b0000001, THIRTYTHREE, THIRTYTWO, 9'd32, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_0_0 = {7'b0000011, THIRTYFOUR,  THIRTYTWO, 9'd32, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_0_0 = {7'b0000101, THIRTYSIX, 	 THIRTYTWO, 9'd32, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_3_0_0 = {7'b0000111, FORTY,     	 THIRTYTWO, 9'd32, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_0_0 = {7'b0001001, FORTYEIGHT,  THIRTYTWO, 9'd32, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_0_0 = {7'b0001011, ZERO, 		 THIRTYTWO, 9'd32, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_3_0_1 = {7'b0000001, THIRTYTWO, 	 THIRTYTHREE, 9'd33, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_0_1 = {7'b0000011, THIRTYFIVE,  THIRTYTHREE, 9'd33, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_0_1 = {7'b0000101, THIRTYSEVEN, THIRTYTHREE, 9'd33, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_3_0_1 = {7'b0000111, FORTYONE, 	 THIRTYTHREE, 9'd33, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_0_1 = {7'b0001001, FORTYNINE,   THIRTYTHREE, 9'd33, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_0_1 = {7'b0001011, ONE, 			 THIRTYTHREE, 9'd33, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_3_1_0 = {7'b0000001, THIRTYFIVE,  THIRTYFOUR, 9'd34, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_1_0 = {7'b0000011, THIRTYTWO, 	 THIRTYFOUR, 9'd34, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_1_0 = {7'b0000101, THIRTYEIGHT, THIRTYFOUR, 9'd34, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_3_1_0 = {7'b0000111, FORTYTWO, 	 THIRTYFOUR, 9'd34, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_1_0 = {7'b0001001, FIFTY,   	 THIRTYFOUR, 9'd34, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_1_0 = {7'b0001011, TWO, 			 THIRTYFOUR, 9'd34, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_3_1_1 = {7'b0000001, THIRTYFOUR,  THIRTYFIVE, 9'd35, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_1_1 = {7'b0000011, THIRTYTHREE, THIRTYFIVE, 9'd35, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_1_1 = {7'b0000101, THIRTYNINE,  THIRTYFIVE, 9'd35, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_3_1_1 = {7'b0000111, FORTYTHREE,  THIRTYFIVE, 9'd35, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_1_1 = {7'b0001001, FIFTYONE,    THIRTYFIVE, 9'd35, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_1_1 = {7'b0001011, THREE, 		 THIRTYFIVE, 9'd35, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_2_0_0 = {7'b0000001, THIRTYSEVEN, THIRTYSIX, 9'd36, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_0_0 = {7'b0000011, THIRTYEIGHT, THIRTYSIX, 9'd36, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_0_0 = {7'b0000101, THIRTYTWO,   THIRTYSIX, 9'd36, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_2_0_0 = {7'b0000111, FORTYFOUR,   THIRTYSIX, 9'd36, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_0_0 = {7'b0001001, FIFTYTWO,    THIRTYSIX, 9'd36, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_0_0 = {7'b0001011, FOUR, 		 THIRTYSIX, 9'd36, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
					
			in_xneg_inject_2_0_1 = {7'b0000001, THIRTYSIX, 	 THIRTYSEVEN, 9'd37, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_0_1 = {7'b0000011, THIRTYNINE,	 THIRTYSEVEN, 9'd37, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_0_1 = {7'b0000101, THIRTYTHREE, THIRTYSEVEN, 9'd37, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_2_0_1 = {7'b0000111, FORTYFIVE,   THIRTYSEVEN, 9'd37, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_0_1 = {7'b0001001, FIFTYTHREE,  THIRTYSEVEN, 9'd37, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_0_1 = {7'b0001011, FIVE, 		 THIRTYSEVEN, 9'd37, 8'd0, i, 2'b00, ShortAllGather, 32'd6};

			in_xpos_inject_2_1_0 = {7'b0000001, THIRTYNINE,  THIRTYEIGHT, 9'd38, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_1_0 = {7'b0000011, THIRTYSIX, 	 THIRTYEIGHT, 9'd38, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_1_0 = {7'b0000101, THIRTYFOUR,	 THIRTYEIGHT, 9'd38, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_2_1_0 = {7'b0000111, FORTYSIX,  	 THIRTYEIGHT, 9'd38, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_1_0 = {7'b0001001, FIFTYFOUR, 	 THIRTYEIGHT, 9'd38, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_1_0 = {7'b0001011, SIX, 			 THIRTYEIGHT, 9'd38, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_2_1_1 = {7'b0000001, THIRTYEIGHT, THIRTYNINE, 9'd39, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_1_1 = {7'b0000011, THIRTYSEVEN, THIRTYNINE, 9'd39, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_1_1 = {7'b0000101, THIRTYFIVE,  THIRTYNINE, 9'd39, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_2_1_1 = {7'b0000111, FORTYSEVEN,  THIRTYNINE, 9'd39, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_1_1 = {7'b0001001, FIFTYFIVE, 	 THIRTYNINE, 9'd39, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_1_1 = {7'b0001011, SEVEN,  		 THIRTYNINE, 9'd39, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_3_0_3 = {7'b0000001, FORTYONE,  FORTY, 9'd40, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_0_3 = {7'b0000011, FORTYTWO,  FORTY, 9'd40, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_0_3 = {7'b0000101, FORTYFOUR, FORTY, 9'd40, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_3_0_3 = {7'b0000111, THIRTYTWO, FORTY, 9'd40, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_0_3 = {7'b0001001, FIFTYSIX,  FORTY, 9'd40, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_0_3 = {7'b0001011, EIGHT, 	  FORTY, 9'd40, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_3_0_2 = {7'b0000001, FORTY, 	    FORTYONE, 9'd41, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_0_2 = {7'b0000011, FORTYTHREE,  FORTYONE, 9'd41, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_0_2 = {7'b0000101, FORTYFIVE,   FORTYONE, 9'd41, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_3_0_2 = {7'b0000111, THIRTYTHREE, FORTYONE, 9'd41, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_0_2 = {7'b0001001, FIFTYSEVEN,  FORTYONE, 9'd41, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_0_2 = {7'b0001011, NINE,   		 FORTYONE, 9'd41, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_3_1_3 = {7'b0000001, FORTYTHREE, FORTYTWO, 9'd42, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_1_3 = {7'b0000011, FORTY, 	   FORTYTWO, 9'd42, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_1_3 = {7'b0000101, FORTYSIX,   FORTYTWO, 9'd42, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_3_1_3 = {7'b0000111, THIRTYFOUR,	FORTYTWO, 9'd42, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_1_3 = {7'b0001001, FIFTYEIGHT, FORTYTWO, 9'd42, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_1_3 = {7'b0001011, TEN,  		FORTYTWO, 9'd42, 8'd0, i, 2'b00, ShortAllGather, 32'd6};

			in_xpos_inject_3_1_2 = {7'b0000001, FORTYTWO, 	FORTYTHREE, 9'd43, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_1_2 = {7'b0000011, FORTYONE, 	FORTYTHREE, 9'd43, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_1_2 = {7'b0000101, FORTYSEVEN, FORTYTHREE, 9'd43, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_3_1_2 = {7'b0000111, THIRTYFIVE, FORTYTHREE, 9'd43, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_1_3 = {7'b0001001, FIFTYNINE,  FORTYTHREE, 9'd43, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_1_3 = {7'b0001011, ELEVEN,     FORTYTHREE, 9'd43, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_2_0_3 = {7'b0000001, FORTYFIVE, FORTYFOUR, 9'd44, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_0_3 = {7'b0000011, FORTYSIX,  FORTYFOUR, 9'd44, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_0_3 = {7'b0000101, FORTY, 	  FORTYFOUR, 9'd44, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_2_0_3 = {7'b0000111, THIRTYSIX, FORTYFOUR, 9'd44, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_0_3 = {7'b0001001, SIXTY,     FORTYFOUR, 9'd44, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_0_3 = {7'b0001011, TWELVE,    FORTYFOUR, 9'd44, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_2_0_2 = {7'b0000001, FORTYFOUR,   FORTYFIVE, 9'd45, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_0_2 = {7'b0000011, FORTYSEVEN,  FORTYFIVE, 9'd45, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_0_2 = {7'b0000101, FORTYONE, 	 FORTYFIVE, 9'd45, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_2_0_2 = {7'b0000111, THIRTYSEVEN, FORTYFIVE, 9'd45, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_0_2 = {7'b0001001, SIXTYONE, 	 FORTYFIVE, 9'd45, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_0_2 = {7'b0001011, THIRTEEN,    FORTYFIVE, 9'd45, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_2_1_3 = {7'b0000001, FORTYSEVEN,  FORTYSIX, 9'd46, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_1_3 = {7'b0000011, FORTYFOUR,   FORTYSIX, 9'd46, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_1_3 = {7'b0000101, FORTYTWO,    FORTYSIX, 9'd46, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_2_1_3 = {7'b0000111, THIRTYEIGHT, FORTYSIX, 9'd46, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_1_3 = {7'b0001001, SIXTYTWO,    FORTYSIX, 9'd46, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_1_3 = {7'b0001011, FOURTEEN, 	 FORTYSIX, 9'd46, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_2_1_2 = {7'b0000001, FORTYSIX,   FORTYSEVEN, 9'd47, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_1_2 = {7'b0000011, FORTYFIVE,  FORTYSEVEN, 9'd47, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_1_2 = {7'b0000101, FORTYTHREE, FORTYSEVEN, 9'd47, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_2_1_2 = {7'b0000111, THIRTYNINE, FORTYSEVEN, 9'd47, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_1_2 = {7'b0001001, SIXTYTHREE, FORTYSEVEN, 9'd47, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_1_2 = {7'b0001011, FIFTEEN, 	FORTYSEVEN, 9'd47, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_3_3_0 = {7'b0000001, FORTYNINE,  FORTYEIGHT, 9'd48, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_3_0 = {7'b0000011, FIFTY,   	FORTYEIGHT, 9'd48, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_3_0 = {7'b0000101, FIFTYTWO, 	FORTYEIGHT, 9'd48, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_3_3_0 = {7'b0000111, FIFTYSIX, 	FORTYEIGHT, 9'd48, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_3_0 = {7'b0001001, THIRTYTWO, 	FORTYEIGHT, 9'd48, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_3_0 = {7'b0001011, SIXTEEN, 	FORTYEIGHT, 9'd48, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_3_3_1 = {7'b0000001, FORTYEIGHT,  FORTYNINE, 9'd49, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_3_1 = {7'b0000011, FIFTYONE,    FORTYNINE, 9'd49, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_3_1 = {7'b0000101, FIFTYTHREE,  FORTYNINE, 9'd49, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_3_3_1 = {7'b0000111, FIFTYSEVEN,  FORTYNINE, 9'd49, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_3_1 = {7'b0001001, THIRTYTHREE, FORTYNINE, 9'd49, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_3_1 = {7'b0001011, SEVENTEEN,   FORTYNINE, 9'd49, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_3_2_0 = {7'b0000001, FIFTYONE,   FIFTY, 9'd50, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_2_0 = {7'b0000011, FORTYEIGHT, FIFTY, 9'd50, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_2_0 = {7'b0000101, FIFTYFOUR,  FIFTY, 9'd50, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_3_2_0 = {7'b0000111, FIFTYEIGHT, FIFTY, 9'd50, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_2_0 = {7'b0001001, THIRTYFOUR, FIFTY, 9'd50, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_2_0 = {7'b0001011, EIGHTEEN,	FIFTY, 9'd50, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_3_2_1 = {7'b0000001, FIFTY,	 	FIFTYONE, 9'd51, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_2_1 = {7'b0000011, FORTYNINE, 	FIFTYONE, 9'd51, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_2_1 = {7'b0000101, FIFTYFIVE,  FIFTYONE, 9'd51, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_3_2_1 = {7'b0000111, FIFTYNINE,  FIFTYONE, 9'd51, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_2_1 = {7'b0001001, THIRTYFIVE, FIFTYONE, 9'd51, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_2_1 = {7'b0001011, NINETEEN,	FIFTYONE, 9'd51, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_2_3_0 = {7'b0000001, FIFTYTHREE, FIFTYTWO, 9'd52, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_3_0 = {7'b0000011, FIFTYFOUR, 	FIFTYTWO, 9'd52, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_3_0 = {7'b0000101, FORTYEIGHT, FIFTYTWO, 9'd52, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_2_3_0 = {7'b0000111, SIXTY, 		FIFTYTWO, 9'd52, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_3_0 = {7'b0001001, THIRTYSIX, 	FIFTYTWO, 9'd52, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_3_0 = {7'b0001011, TWENTY,	 	FIFTYTWO, 9'd52, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
	
			in_xneg_inject_2_3_1 = {7'b0000001, FIFTYTWO, 	 FIFTYTHREE, 9'd53, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_3_1 = {7'b0000011, FIFTYFIVE, 	 FIFTYTHREE, 9'd53, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_3_1 = {7'b0000101, FORTYNINE,	 FIFTYTHREE, 9'd53, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_2_3_1 = {7'b0000111, SIXTYONE,  	 FIFTYTHREE, 9'd53, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_3_1 = {7'b0001001, THIRTYSEVEN, FIFTYTHREE, 9'd53, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_3_1 = {7'b0001011, TWENTYONE,	 FIFTYTHREE, 9'd53, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_2_2_0 = {7'b0000001, FIFTYFIVE, 	 FIFTYFOUR, 9'd54, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_2_0 = {7'b0000011, FIFTYTWO, 	 FIFTYFOUR, 9'd54, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_2_0 = {7'b0000101, FIFTY, 	 	 FIFTYFOUR, 9'd54, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_2_2_0 = {7'b0000111, SIXTYTWO,  	 FIFTYFOUR, 9'd54, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_2_0 = {7'b0001001, THIRTYEIGHT, FIFTYFOUR, 9'd54, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_2_0 = {7'b0001011, TWENTYTWO, 	 FIFTYFOUR, 9'd54, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
		
			in_xneg_inject_2_2_1 = {7'b0000001, FIFTYFOUR, 	 FIFTYFIVE, 9'd55, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_2_1 = {7'b0000011, FIFTYTHREE,  FIFTYFIVE, 9'd55, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_2_1 = {7'b0000101, FIFTYONE, 	 FIFTYFIVE, 9'd55, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_2_2_1 = {7'b0000111, SIXTYTHREE,  FIFTYFIVE, 9'd55, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_2_1 = {7'b0001001, THIRTYNINE,  FIFTYFIVE, 9'd55, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_2_1 = {7'b0001011, TWENTYTHREE, FIFTYFIVE, 9'd55, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_3_3_3 = {7'b0000001, FIFTYSEVEN, FIFTYSIX, 9'd56, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_3_3 = {7'b0000011, FIFTYEIGHT, FIFTYSIX, 9'd56, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_3_3 = {7'b0000101, SIXTY, 		FIFTYSIX, 9'd56, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_3_3_3 = {7'b0000111, FORTYEIGHT, FIFTYSIX, 9'd56, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_3_3 = {7'b0001001, FORTY, 		FIFTYSIX, 9'd56, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_3_3 = {7'b0001011, TWENTYFOUR,	FIFTYSIX, 9'd56, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_3_3_2 = {7'b0000001, FIFTYSIX,   FIFTYSEVEN, 9'd57, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_3_2 = {7'b0000011, FIFTYNINE,  FIFTYSEVEN, 9'd57, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_3_2 = {7'b0000101, SIXTYONE,	FIFTYSEVEN, 9'd57, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_3_3_2 = {7'b0000111, FORTYNINE, 	FIFTYSEVEN, 9'd57, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_3_2 = {7'b0001001, FORTYONE, 	FIFTYSEVEN, 9'd57, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_3_2 = {7'b0001011, TWENTYFIVE, FIFTYSEVEN, 9'd57, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_3_2_3 = {7'b0000001, FIFTYNINE,  FIFTYEIGHT, 9'd58, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_2_3 = {7'b0000011, FIFTYSIX,   FIFTYEIGHT, 9'd58, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_2_3 = {7'b0000101, SIXTYTWO,  	FIFTYEIGHT, 9'd58, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_3_2_3 = {7'b0000111, FIFTY,	 	FIFTYEIGHT, 9'd58, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_2_3 = {7'b0001001, FORTYTWO, 	FIFTYEIGHT, 9'd58, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_2_3 = {7'b0001011, TWENTYSIX,  FIFTYEIGHT, 9'd58, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_3_2_2 = {7'b0000001, FIFTYEIGHT,  FIFTYNINE, 9'd59, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_3_2_2 = {7'b0000011, FIFTYSEVEN,  FIFTYNINE, 9'd59, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_3_2_2 = {7'b0000101, SIXTYTHREE,  FIFTYNINE, 9'd59, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_3_2_2 = {7'b0000111, FIFTYONE, 	 FIFTYNINE, 9'd59, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_3_2_3 = {7'b0001001, FORTYTHREE,  FIFTYNINE, 9'd59, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_3_2_3 = {7'b0001011, TWENTYSEVEN, FIFTYNINE, 9'd59, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_2_3_3 = {7'b0000001, SIXTYONE,  	 SIXTY, 9'd60, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_3_3 = {7'b0000011, SIXTYTWO, 	 SIXTY, 9'd60, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_3_3 = {7'b0000101, FIFTYSIX,    SIXTY, 9'd60, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_2_3_3 = {7'b0000111, FIFTYTWO, 	 SIXTY, 9'd60, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_3_3 = {7'b0001001, FORTYFOUR, 	 SIXTY, 9'd60, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_3_3 = {7'b0001011, TWENTYEIGHT, SIXTY, 9'd60, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_2_3_2 = {7'b0000001, SIXTY, 		SIXTYONE, 9'd61, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_3_2 = {7'b0000011, SIXTYTHREE, SIXTYONE, 9'd61, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_3_2 = {7'b0000101, FIFTYSEVEN, SIXTYONE, 9'd61, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_2_3_2 = {7'b0000111, FIFTYTHREE, SIXTYONE, 9'd61, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_3_2 = {7'b0001001, FORTYFIVE, 	SIXTYONE, 9'd61, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_3_2 = {7'b0001011, TWENTYNINE, SIXTYONE, 9'd61, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xneg_inject_2_2_3 = {7'b0000001, SIXTYTHREE, SIXTYTWO, 9'd62, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_2_3 = {7'b0000011, SIXTY, 		SIXTYTWO, 9'd62, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_2_3 = {7'b0000101, FIFTYEIGHT, SIXTYTWO, 9'd62, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xpos_inject_2_2_3 = {7'b0000111, FIFTYFOUR,  SIXTYTWO, 9'd62, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_2_3 = {7'b0001001, FORTYSIX,   SIXTYTWO, 9'd62, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_2_3 = {7'b0001011, THIRTY,     SIXTYTWO, 9'd62, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			in_xpos_inject_2_2_2 = {7'b0000001, SIXTYTWO,  	SIXTYTHREE, 9'd63, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_ypos_inject_2_2_2 = {7'b0000011, SIXTYONE,   SIXTYTHREE, 9'd63, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zpos_inject_2_2_2 = {7'b0000101, FIFTYNINE,  SIXTYTHREE, 9'd63, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_xneg_inject_2_2_2 = {7'b0000111, FIFTYFIVE,  SIXTYTHREE, 9'd63, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_yneg_inject_2_2_2 = {7'b0001001, FORTYSEVEN, SIXTYTHREE, 9'd63, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			in_zneg_inject_2_2_2 = {7'b0001011, THIRTYONE,  SIXTYTHREE, 9'd63, 8'd0, i, 2'b00, ShortAllGather, 32'd6};
			
			#10;		
		end	*/
		
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
		in_xpos_inject_3_0_0 = 0;
		in_ypos_inject_3_0_0 = 0;
		in_zpos_inject_3_0_0 = 0;
		in_xneg_inject_3_0_0 = 0;
		in_yneg_inject_3_0_0 = 0;
		in_zneg_inject_3_0_0 = 0;
		reduce_me_3_0_0 = 0;
		in_xpos_inject_3_0_1 = 0;
		in_ypos_inject_3_0_1 = 0;
		in_zpos_inject_3_0_1 = 0;
		in_xneg_inject_3_0_1 = 0;
		in_yneg_inject_3_0_1 = 0;
		in_zneg_inject_3_0_1 = 0;
		reduce_me_3_0_1 = 0;
		in_xpos_inject_3_1_0 = 0;
		in_ypos_inject_3_1_0 = 0;
		in_zpos_inject_3_1_0 = 0;
		in_xneg_inject_3_1_0 = 0;
		in_yneg_inject_3_1_0 = 0;
		in_zneg_inject_3_1_0 = 0;
		reduce_me_3_1_0 = 0;
		in_xpos_inject_3_1_1 = 0;
		in_ypos_inject_3_1_1 = 0;
		in_zpos_inject_3_1_1 = 0;
		in_xneg_inject_3_1_1 = 0;
		in_yneg_inject_3_1_1 = 0;
		in_zneg_inject_3_1_1 = 0;
		reduce_me_3_1_1 = 0;
		in_xpos_inject_2_0_0 = 0;
		in_ypos_inject_2_0_0 = 0;
		in_zpos_inject_2_0_0 = 0;
		in_xneg_inject_2_0_0 = 0;
		in_yneg_inject_2_0_0 = 0;
		in_zneg_inject_2_0_0 = 0;
		reduce_me_2_0_0 = 0;
		in_xpos_inject_2_0_1 = 0;
		in_ypos_inject_2_0_1 = 0;
		in_zpos_inject_2_0_1 = 0;
		in_xneg_inject_2_0_1 = 0;
		in_yneg_inject_2_0_1 = 0;
		in_zneg_inject_2_0_1 = 0;
		reduce_me_2_0_1 = 0;
		in_xpos_inject_2_1_0 = 0;
		in_ypos_inject_2_1_0 = 0;
		in_zpos_inject_2_1_0 = 0;
		in_xneg_inject_2_1_0 = 0;
		in_yneg_inject_2_1_0 = 0;
		in_zneg_inject_2_1_0 = 0;
		reduce_me_2_1_0 = 0;
		in_xpos_inject_2_1_1 = 0;
		in_ypos_inject_2_1_1 = 0;
		in_zpos_inject_2_1_1 = 0;
		in_xneg_inject_2_1_1 = 0;
		in_yneg_inject_2_1_1 = 0;
		in_zneg_inject_2_1_1 = 0;
		reduce_me_2_1_1 = 0;
		in_xpos_inject_3_0_3 = 0;
		in_ypos_inject_3_0_3 = 0;
		in_zpos_inject_3_0_3 = 0;
		in_xneg_inject_3_0_3 = 0;
		in_yneg_inject_3_0_3 = 0;
		in_zneg_inject_3_0_3 = 0;
		reduce_me_3_0_3 = 0;
		in_xpos_inject_3_0_2 = 0;
		in_ypos_inject_3_0_2 = 0;
		in_zpos_inject_3_0_2 = 0;
		in_xneg_inject_3_0_2 = 0;
		in_yneg_inject_3_0_2 = 0;
		in_zneg_inject_3_0_2 = 0;
		reduce_me_3_0_2 = 0;
		in_xpos_inject_3_1_3 = 0;
		in_ypos_inject_3_1_3 = 0;
		in_zpos_inject_3_1_3 = 0;
		in_xneg_inject_3_1_3 = 0;
		in_yneg_inject_3_1_3 = 0;
		in_zneg_inject_3_1_3 = 0;
		reduce_me_3_1_3 = 0;
		in_xpos_inject_3_1_2 = 0;
		in_ypos_inject_3_1_2 = 0;
		in_zpos_inject_3_1_2 = 0;
		in_xneg_inject_3_1_2 = 0;
		in_yneg_inject_3_1_2 = 0;
		in_zneg_inject_3_1_2 = 0;
		reduce_me_3_1_2 = 0;
		in_xpos_inject_2_0_3 = 0;
		in_ypos_inject_2_0_3 = 0;
		in_zpos_inject_2_0_3 = 0;
		in_xneg_inject_2_0_3 = 0;
		in_yneg_inject_2_0_3 = 0;
		in_zneg_inject_2_0_3 = 0;
		reduce_me_2_0_3 = 0;
		in_xpos_inject_2_0_2 = 0;
		in_ypos_inject_2_0_2 = 0;
		in_zpos_inject_2_0_2 = 0;
		in_xneg_inject_2_0_2 = 0;
		in_yneg_inject_2_0_2 = 0;
		in_zneg_inject_2_0_2 = 0;
		reduce_me_2_0_2 = 0;
		in_xpos_inject_2_1_3 = 0;
		in_ypos_inject_2_1_3 = 0;
		in_zpos_inject_2_1_3 = 0;
		in_xneg_inject_2_1_3 = 0;
		in_yneg_inject_2_1_3 = 0;
		in_zneg_inject_2_1_3 = 0;
		reduce_me_2_1_3 = 0;
		in_xpos_inject_2_1_2 = 0;
		in_ypos_inject_2_1_2 = 0;
		in_zpos_inject_2_1_2 = 0;
		in_xneg_inject_2_1_2 = 0;
		in_yneg_inject_2_1_2 = 0;
		in_zneg_inject_2_1_2 = 0;
		reduce_me_2_1_2 = 0;
		in_xpos_inject_3_3_0 = 0;
		in_ypos_inject_3_3_0 = 0;
		in_zpos_inject_3_3_0 = 0;
		in_xneg_inject_3_3_0 = 0;
		in_yneg_inject_3_3_0 = 0;
		in_zneg_inject_3_3_0 = 0;
		reduce_me_3_3_0 = 0;
		in_xpos_inject_3_3_1 = 0;
		in_ypos_inject_3_3_1 = 0;
		in_zpos_inject_3_3_1 = 0;
		in_xneg_inject_3_3_1 = 0;
		in_yneg_inject_3_3_1 = 0;
		in_zneg_inject_3_3_1 = 0;
		reduce_me_3_3_1 = 0;
		in_xpos_inject_3_2_0 = 0;
		in_ypos_inject_3_2_0 = 0;
		in_zpos_inject_3_2_0 = 0;
		in_xneg_inject_3_2_0 = 0;
		in_yneg_inject_3_2_0 = 0;
		in_zneg_inject_3_2_0 = 0;
		reduce_me_3_2_0 = 0;
		in_xpos_inject_3_2_1 = 0;
		in_ypos_inject_3_2_1 = 0;
		in_zpos_inject_3_2_1 = 0;
		in_xneg_inject_3_2_1 = 0;
		in_yneg_inject_3_2_1 = 0;
		in_zneg_inject_3_2_1 = 0;
		reduce_me_3_2_1 = 0;
		in_xpos_inject_2_3_0 = 0;
		in_ypos_inject_2_3_0 = 0;
		in_zpos_inject_2_3_0 = 0;
		in_xneg_inject_2_3_0 = 0;
		in_yneg_inject_2_3_0 = 0;
		in_zneg_inject_2_3_0 = 0;
		reduce_me_2_3_0 = 0;
		in_xpos_inject_2_3_1 = 0;
		in_ypos_inject_2_3_1 = 0;
		in_zpos_inject_2_3_1 = 0;
		in_xneg_inject_2_3_1 = 0;
		in_yneg_inject_2_3_1 = 0;
		in_zneg_inject_2_3_1 = 0;
		reduce_me_2_3_1 = 0;
		in_xpos_inject_2_2_0 = 0;
		in_ypos_inject_2_2_0 = 0;
		in_zpos_inject_2_2_0 = 0;
		in_xneg_inject_2_2_0 = 0;
		in_yneg_inject_2_2_0 = 0;
		in_zneg_inject_2_2_0 = 0;
		reduce_me_2_2_0 = 0;
		in_xpos_inject_2_2_1 = 0;
		in_ypos_inject_2_2_1 = 0;
		in_zpos_inject_2_2_1 = 0;
		in_xneg_inject_2_2_1 = 0;
		in_yneg_inject_2_2_1 = 0;
		in_zneg_inject_2_2_1 = 0;
		reduce_me_2_2_1 = 0;
		in_xpos_inject_3_3_3 = 0;
		in_ypos_inject_3_3_3 = 0;
		in_zpos_inject_3_3_3 = 0;
		in_xneg_inject_3_3_3 = 0;
		in_yneg_inject_3_3_3 = 0;
		in_zneg_inject_3_3_3 = 0;
		reduce_me_3_3_3 = 0;
		in_xpos_inject_3_3_2 = 0;
		in_ypos_inject_3_3_2 = 0;
		in_zpos_inject_3_3_2 = 0;
		in_xneg_inject_3_3_2 = 0;
		in_yneg_inject_3_3_2 = 0;
		in_zneg_inject_3_3_2 = 0;
		reduce_me_3_3_2 = 0;
		in_xpos_inject_3_2_3 = 0;
		in_ypos_inject_3_2_3 = 0;
		in_zpos_inject_3_2_3 = 0;
		in_xneg_inject_3_2_3 = 0;
		in_yneg_inject_3_2_3 = 0;
		in_zneg_inject_3_2_3 = 0;
		reduce_me_3_2_3 = 0;
		in_xpos_inject_3_2_2 = 0;
		in_ypos_inject_3_2_2 = 0;
		in_zpos_inject_3_2_2 = 0;
		in_xneg_inject_3_2_2 = 0;
		in_yneg_inject_3_2_2 = 0;
		in_zneg_inject_3_2_2 = 0;
		reduce_me_3_2_2 = 0;
		in_xpos_inject_2_3_3 = 0;
		in_ypos_inject_2_3_3 = 0;
		in_zpos_inject_2_3_3 = 0;
		in_xneg_inject_2_3_3 = 0;
		in_yneg_inject_2_3_3 = 0;
		in_zneg_inject_2_3_3 = 0;
		reduce_me_2_3_3 = 0;
		in_xpos_inject_2_3_2 = 0;
		in_ypos_inject_2_3_2 = 0;
		in_zpos_inject_2_3_2 = 0;
		in_xneg_inject_2_3_2 = 0;
		in_yneg_inject_2_3_2 = 0;
		in_zneg_inject_2_3_2 = 0;
		reduce_me_2_3_2 = 0;
		in_xpos_inject_2_2_3 = 0;
		in_ypos_inject_2_2_3 = 0;
		in_zpos_inject_2_2_3 = 0;
		in_xneg_inject_2_2_3 = 0;
		in_yneg_inject_2_2_3 = 0;
		in_zneg_inject_2_2_3 = 0;
		reduce_me_2_2_3 = 0;
		in_xpos_inject_2_2_2 = 0;
		in_ypos_inject_2_2_2 = 0;
		in_zpos_inject_2_2_2 = 0;
		in_xneg_inject_2_2_2 = 0;
		in_yneg_inject_2_2_2 = 0;
		in_zneg_inject_2_2_2 = 0;
		reduce_me_2_2_2 = 0;


	end
	
	always begin
		#5 clk = !clk;
	end
      
endmodule

