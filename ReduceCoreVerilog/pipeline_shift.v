`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:	14:15:37 08/25/2017
// Design Name:
// Module Name:	pipeline_shift
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
//inside the router, packeter, and reduce_instruction core
/*
	*|63   	|62       	| 61-59  |58-56   |55-52  	|51-50   |49-46|45-43   |42-40|39-37|36-32|31-0   |
	*|valid bit|reduction bit|src node|dst node|packet type|alg type|index|commsize|root |rank |op   |payload|
 
inside the fifo
	*|66-64   |63   	|62       	| 61-59  |58-56   |55-52  	|51-50     	|49-46|45-43   |42-40|39-37|36-32|31-0   |
	*|children|valid bit|reduction bit|src node|dst node|packet type|algorithm type|index|commsize|root |rank |op   |payload|

//reduction table entry format
 
	*|72  |71       	|70-67 	|66-64         	|63   	|62       	| 61-59  |58-56   |55-52  	|51-50   |49-46|45-43   |42-40|39-37|36-32|31-0   |
	*|leaf|counting down|wait count|children remaining|valid bit|reduction bit|src node|dst node|packet type|alg type|index|commsize|root |rank |op   |payload|
//leaf bit is for if the operation's children count == 0, because then the input is also the output 
//extra bit/counting down is 1 if the wait count was ever set to the proper latency
/////////////////////////////////////////////////////////////////////////////////*/
module pipeline_shift(C, A, clk, rst);
input [31:0]A;
input rst;
input clk;
output [31:0]C;
reg [31:0] tmp[12:0];
reg [4:0]i;
always@(posedge clk) begin
 //if rst, set everything to 0
 if (rst) begin
  for(i=0;i<13;i=i+1)begin
   tmp[i] <= 0;
  end
 end
 
 
 /*
 The results of the logical/bitwise or-er and adder modules are passed
 into these shifters which create a pipeline to hold onto the results
 until the operations with longer pipelines
 can be completed.
 */
 
 else begin
 
  tmp[0]<= A;
 
  for(i=1;i<13;i=i+1)begin
   tmp[i] <= tmp[i-1];
  end 
 
   end
end

assign C = tmp[12];

endmodule

