`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:	01:46:41 08/25/2017
// Design Name:
// Module Name:	shift
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
/*
this shift module is used to pipeline/buffer the outputs of the maximum/minimum
module until the other ip cores have also completed.  It takes the operation
inputs and ouputs and arranges the registers so that the reduction table
can know which value is the maximum and which in the minimum.  The max/min
module only outputs a single bit to know which of the two inputs was the max/min,
so the inputs need to be held onto until this output value is known.
*/
module shift (max, min, A, B, C, clk, rst);
input [31:0]A;
input [31:0]B;
input C;
input rst;
input clk;
output [31:0]max;
output [31:0]min;
reg [63:0] tmp_in [1:0];
reg [63:0] tmp_out[11:0];
reg [3:0]i;
reg [3:0]j;
always@(posedge clk) begin
 /*
 if reset, set everything to 0
 */
 if (rst) begin
  for(i=0;i<12;i=i+1)begin
   tmp_out[i] <= 0;
  end
 
  for(j=0;j<2;j=j+1)begin
   tmp_in[j] <= 0;
  end
 end
 
 else begin
 
  /*
  use the output of the max/min module to rearrange the inputs
  so that the maximum is the higher bits and the minimum is
  the lower bits.
  */
  tmp_out[0][63:32] <= (C == 1)? tmp_in[1][63:32]: tmp_in[1][31:0];
  tmp_out[0][31:0]  <= (C == 0)? tmp_in[1][63:32]: tmp_in[1][31:0];
 
  tmp_in[0]<={A,B};
 
  for(i=1;i<12;i=i+1)begin
   tmp_out[i] <= tmp_out[i-1];
  end
 
  for(j=1;j<2;j=j+1)begin
   tmp_in[j] <= tmp_in[j-1];
  end
 
   end
end


assign max = tmp_out[11][63:32];
assign min = tmp_out[11][31:0];
endmodule

