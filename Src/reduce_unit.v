`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:39 06/01/2018 
// Design Name: 
// Module Name:    reduce_unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module reduce_unit(Outpacket, packetA, clk, rst);

output [81:0]Outpacket;
input [84:0]packetA;
input clk, rst;

assign Outpacket = packetA[81:0];

endmodule
