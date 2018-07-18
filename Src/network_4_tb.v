`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:33:00 07/18/2018
// Design Name:   network_4
// Module Name:   C:/Users/joshtern/MPI-Collective-Router/network_4_tb.v
// Project Name:  MPI-Collective-Router
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: network_4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module network_4_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [83:0] in_xpos_inject_0_0_0;
	reg [83:0] in_ypos_inject_0_0_0;
	reg [83:0] in_xneg_inject_0_0_0;
	reg [83:0] in_yneg_inject_0_0_0;
	reg [83:0] reduce_me_0_0_0;
	reg [49:0] newcomm_0_0_0;
	
	reg [83:0] in_xpos_inject_0_0_1;
	reg [83:0] in_ypos_inject_0_0_1;
	reg [83:0] in_xneg_inject_0_0_1;
	reg [83:0] in_yneg_inject_0_0_1;
	reg [83:0] reduce_me_0_0_1;
	reg [49:0] newcomm_0_0_1;
	
	reg [83:0] in_xpos_inject_0_1_0;
	reg [83:0] in_ypos_inject_0_1_0;
	reg [83:0] in_xneg_inject_0_1_0;
	reg [83:0] in_yneg_inject_0_1_0;
	reg [83:0] reduce_me_0_1_0;
	reg [49:0] newcomm_0_1_0;
	
	reg [83:0] in_xpos_inject_0_1_1;
	reg [83:0] in_ypos_inject_0_1_1;
	reg [83:0] in_xneg_inject_0_1_1;
	reg [83:0] in_yneg_inject_0_1_1;
	reg [83:0] reduce_me_0_1_1;
	reg [49:0] newcomm_0_1_1;

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
	network_4 uut (
		.clk(clk), 
		.rst(rst), 
		.in_xpos_inject_0_0_0(in_xpos_inject_0_0_0), 
		.in_ypos_inject_0_0_0(in_ypos_inject_0_0_0), 
		.in_xneg_inject_0_0_0(in_xneg_inject_0_0_0), 
		.in_yneg_inject_0_0_0(in_yneg_inject_0_0_0), 
		.reduce_me_0_0_0(reduce_me_0_0_0), 
		.newcomm_0_0_0(newcomm_0_0_0), 
		
		.in_xpos_inject_0_0_1(in_xpos_inject_0_0_1), 
		.in_ypos_inject_0_0_1(in_ypos_inject_0_0_1), 
		.in_xneg_inject_0_0_1(in_xneg_inject_0_0_1), 
		.in_yneg_inject_0_0_1(in_yneg_inject_0_0_1), 
		.reduce_me_0_0_1(reduce_me_0_0_1), 
		.newcomm_0_0_1(newcomm_0_0_1), 
		
		.in_xpos_inject_0_1_0(in_xpos_inject_0_1_0), 
		.in_ypos_inject_0_1_0(in_ypos_inject_0_1_0), 
		.in_xneg_inject_0_1_0(in_xneg_inject_0_1_0), 
		.in_yneg_inject_0_1_0(in_yneg_inject_0_1_0), 
		.reduce_me_0_1_0(reduce_me_0_1_0), 
		.newcomm_0_1_0(newcomm_0_1_0), 
		
		.in_xpos_inject_0_1_1(in_xpos_inject_0_1_1), 
		.in_ypos_inject_0_1_1(in_ypos_inject_0_1_1),  
		.in_xneg_inject_0_1_1(in_xneg_inject_0_1_1), 
		.in_yneg_inject_0_1_1(in_yneg_inject_0_1_1), 
		.reduce_me_0_1_1(reduce_me_0_1_1), 
		.newcomm_0_1_1(newcomm_0_1_1), 
		.valid(valid)
	);
	
	reg [7:0]i;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		
		in_xpos_inject_0_0_0 = 0;
		in_ypos_inject_0_0_0 = 0;
		in_xneg_inject_0_0_0 = 0;
		in_yneg_inject_0_0_0 = 0;
		reduce_me_0_0_0 = 0;
		newcomm_0_0_0 = {1'b1, 8'b0, 9'b0, 9'b0, 2'b10, 3'b010, 9'b01, 9'b10};
		
	//|	60  |  59-52  |51-43|  42-34   | 33-31  |   30-27   |26-18| 17-9 | 8-0 |     	
	//|valid|contextid|root |local_rank|children|lg_commsize|third|second|first|
		
		in_xpos_inject_0_0_1 = 0;
		in_ypos_inject_0_0_1 = 0;
		in_xneg_inject_0_0_1 = 0;
		in_yneg_inject_0_0_1 = 0;
		reduce_me_0_0_1 = 0;
		newcomm_0_0_1 = {1'b1, 8'b0, 9'b0, 9'b01, 2'b0, 3'b010, 9'b0, 9'b011};
		
		in_xpos_inject_0_1_0 = 0;
		in_ypos_inject_0_1_0 = 0;
		in_xneg_inject_0_1_0 = 0;
		in_yneg_inject_0_1_0 = 0;
		reduce_me_0_1_0 = 0;
		newcomm_0_1_0 = {1'b1, 8'b0, 9'b0, 9'b010, 2'b01, 3'b010, 9'b011, 9'b0};
		
		in_xpos_inject_0_1_1 = 0;
		in_ypos_inject_0_1_1 = 0;
		in_xneg_inject_0_1_1 = 0;
		in_yneg_inject_0_1_1 = 0;
		reduce_me_0_1_1 = 0;
		newcomm_0_1_1 = {1'b1, 8'b0, 9'b0, 9'b011, 2'b0, 3'b010, 9'b010, 9'b01};

		// Wait 100 ns for global reset to finish
		#105;
		rst = 0;
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//reduce
		
		/*for(i=1;i<2;i=i+1)begin
			reduce_me_0_0_0 = {3'b101, 9'b000000000, 9'b000000000, 9'b000000000, 8'b00000000, i, 2'b00, ShortReduce, 32'b00000000000000000000000000000110};
			
			in_xneg_inject_0_0_1 = {3'b001, 9'b000000000, 9'b000000001, 9'b000000001, 8'b00000000, i, 2'b00, ShortReduce, 32'b00000000000000000000000000000110};
			
			in_yneg_inject_0_1_0 = {3'b011, 9'b000000000, 9'b000001000, 9'b000000010, 8'b00000000, i, 2'b00, ShortReduce, 32'b00000000000000000000000000000110};
			
			in_xneg_inject_0_1_1 = {3'b001, 9'b000001000, 9'b000001001, 9'b000000011, 8'b00000000, i, 2'b00, ShortReduce, 32'b00000000000000000000000000000110};
			
			#10;
		end		
		reduce_me_0_0_0 = 0;
		in_xneg_inject_0_0_1 = 0;
		in_yneg_inject_0_1_0 = 0;
		in_xneg_inject_0_1_1 = 0;*/
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//allreduce
		
		/*for(i=0;i<1;i=i+1)begin
		
			reduce_me_0_0_0 = {3'b101, 9'b000000000, 9'b000000000, 9'b000000000, 8'b00000000, i, 2'b00, ShortAllReduce, 32'b00000000000000000000000000000110};
			in_xpos_inject_0_0_0 = {3'b001, 9'b000000001, 9'b000000000, 9'b000000000, 8'b00000000, i, 2'b00, ShortAllReduce, 32'b00000000000000000000000000000110};
			in_ypos_inject_0_0_0 = {3'b011, 9'b000001000, 9'b000000000, 9'b000000000, 8'b00000000, i, 2'b00, ShortAllReduce, 32'b00000000000000000000000000000110};
			
			reduce_me_0_0_1 = {3'b0101, 9'b000000001, 9'b000000001, 9'b000000001, 8'b00000000, i, 2'b00, ShortAllReduce, 32'b00000000000000000000000000000110};
			in_xneg_inject_0_0_1 = {3'b001, 9'b000000000, 9'b000000001, 9'b000000001, 8'b00000000, i, 2'b00, ShortAllReduce, 32'b00000000000000000000000000000110};
			in_ypos_inject_0_0_1 = {3'b011, 9'b000001001, 9'b000000001, 9'b000000001, 8'b00000000, i, 2'b00, ShortAllReduce, 32'b00000000000000000000000000000110};
			
			reduce_me_0_1_0 = {3'b0101, 9'b000001000, 9'b000001000, 9'b000000010, 8'b00000000, i, 2'b00, ShortAllReduce, 32'b00000000000000000000000000000110};
			in_xpos_inject_0_1_0 = {3'b001, 9'b000001001, 9'b000001000, 9'b000000010, 8'b00000000, i, 2'b00, ShortAllReduce, 32'b00000000000000000000000000000110};
			in_yneg_inject_0_1_0 = {3'b011, 9'b000000000, 9'b000001000, 9'b000000010, 8'b00000000, i, 2'b00, ShortAllReduce, 32'b00000000000000000000000000000110};
			
			reduce_me_0_1_1 = {3'b0101, 9'b000001001, 9'b000001001, 9'b000000011, 8'b00000000, i, 2'b00, ShortAllReduce, 32'b00000000000000000000000000000110};
			in_xneg_inject_0_1_1 = {3'b001, 9'b000001000, 9'b000001001, 9'b000000011, 8'b00000000, i, 2'b00, ShortAllReduce, 32'b00000000000000000000000000000110};
			in_yneg_inject_0_1_1 = {3'b011, 9'b000000001, 9'b000001001, 9'b000000011, 8'b00000000, i, 2'b00, ShortAllReduce, 32'b00000000000000000000000000000110};
			
			#10;
			
		end	
		
		reduce_me_0_0_0 = 0;
		reduce_me_0_0_1 = 0;
		reduce_me_0_1_0 = 0;
		reduce_me_0_1_1 = 0;
		
		in_xpos_inject_0_0_0 = 0;
		in_ypos_inject_0_0_0 = 0;
	
		in_xneg_inject_0_0_1 = 0;
		in_ypos_inject_0_0_1 = 0;
		
		in_xpos_inject_0_1_0 = 0;
		in_yneg_inject_0_1_0 = 0;
		
		in_xneg_inject_0_1_1 = 0;
		in_yneg_inject_0_1_1 = 0;*/
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//bcast
		
		/*for(i=0;i<1;i=i+1)begin
			in_xpos_inject_0_0_0 = {3'b001, 9'b000000001, 9'b000000000, 9'b000000000, 8'b00000000, i, 2'b00, ShortBcast, 32'b00000000000000000000000000000110};
			in_ypos_inject_0_0_0 = {3'b001, 9'b000001000, 9'b000000000, 9'b000000000, 8'b00000000, i, 2'b00, ShortBcast, 32'b00000000000000000000000000000110};
			#10;
		end		
		
		in_xpos_inject_0_0_0 = 0;
		in_ypos_inject_0_0_0 = 0;*/
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//scatter
		
		/*for(i=0;i<1;i=i+1)begin
			in_xpos_inject_0_0_0 = {3'b001, 9'b000000001, 9'b000000000, 9'b000000000, 8'b00000000, 8'b001, 2'b00, Scatter, 32'b00000000000000000000000000000110};
			in_ypos_inject_0_0_0 = {3'b001, 9'b000001000, 9'b000000000, 9'b000000000, 8'b00000000, 8'b010, 2'b00, Scatter, 32'b00000000000000000000000000000110};
			#10;
			in_xpos_inject_0_0_0 = 0;
			in_ypos_inject_0_0_0 = {3'b001, 9'b000001001, 9'b000000000, 9'b000000000, 8'b00000000, 8'b011, 2'b00, Scatter, 32'b00000000000000000000000000000110};
			#10;
		end		
		
		in_xpos_inject_0_0_0 = 0;
		in_ypos_inject_0_0_0 = 0;*/


		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//gather
		
		/*for(i=0;i<1;i=i+1)begin
			in_xneg_inject_0_0_1 = {3'b001, 9'b000000000, 9'b000000001, 9'b000000001, 8'b00000000, 8'b001, 2'b00, Gather, 32'b00000000000000000000000000000110};
			in_yneg_inject_0_1_0 = {3'b001, 9'b000000000, 9'b000001000, 9'b000000010, 8'b00000000, 8'b010, 2'b00, Gather, 32'b00000000000000000000000000000110};
			in_xneg_inject_0_1_1 = {3'b001, 9'b000000000, 9'b000001001, 9'b000000011, 8'b00000000, 8'b011, 2'b00, Gather, 32'b00000000000000000000000000000110};
			#10;
		end		
		
		in_xneg_inject_0_0_1 = 0;
		in_yneg_inject_0_1_0 = 0;
		in_xneg_inject_0_1_1 = 0;*/		
		
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//allgather
		
		for(i=0;i<1;i=i+1)begin
		
			in_xpos_inject_0_0_0 = {3'b001, 9'b000000001, 9'b000000000, 9'b000000000, 8'b00000000, 8'b000, 2'b00, ShortAllGather, 32'b00000000000000000000000000000001};
			in_ypos_inject_0_0_0 = {3'b001, 9'b000001000, 9'b000000000, 9'b000000000, 8'b00000000, 8'b000, 2'b00, ShortAllGather, 32'b00000000000000000000000000000001};
			
			in_xneg_inject_0_0_1 = {3'b001, 9'b000000000, 9'b000000001, 9'b000000001, 8'b00000000, 8'b001, 2'b00, ShortAllGather, 32'b00000000000000000000000000000010};
			in_ypos_inject_0_0_1 = {3'b001, 9'b000001001, 9'b000000001, 9'b000000001, 8'b00000000, 8'b001, 2'b00, ShortAllGather, 32'b00000000000000000000000000000010};
			
			in_xpos_inject_0_1_0 = {3'b001, 9'b000001001, 9'b000001000, 9'b000000010, 8'b00000000, 8'b010, 2'b00, ShortAllGather, 32'b00000000000000000000000000000011};
			in_yneg_inject_0_1_0 = {3'b001, 9'b000000000, 9'b000001000, 9'b000000010, 8'b00000000, 8'b010, 2'b00, ShortAllGather, 32'b00000000000000000000000000000011};
			
			in_xneg_inject_0_1_1 = {3'b001, 9'b000001000, 9'b000001001, 9'b000000011, 8'b00000000, 8'b011, 2'b00, ShortAllGather, 32'b00000000000000000000000000000100};
			in_yneg_inject_0_1_1 = {3'b001, 9'b000000001, 9'b000001001, 9'b000000011, 8'b00000000, 8'b011, 2'b00, ShortAllGather, 32'b00000000000000000000000000000100};
			
			#10;
			
		end	
		
		in_xpos_inject_0_0_0 = 0;
		in_ypos_inject_0_0_0 = 0;
	
		in_xneg_inject_0_0_1 = 0;
		in_ypos_inject_0_0_1 = 0;
		
		in_xpos_inject_0_1_0 = 0;
		in_yneg_inject_0_1_0 = 0;
		
		in_xneg_inject_0_1_1 = 0;
		in_yneg_inject_0_1_1 = 0;

	end

	always begin
		#5 clk = !clk;
	end
      
endmodule

