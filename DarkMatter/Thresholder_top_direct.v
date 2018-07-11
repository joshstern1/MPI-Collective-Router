`timescale 1ns / 1ns
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Top wrapper for thresholders based on amplitudes
// Function:
//		Connect 8 thresholder modules with the thresholder coordinator
//		Output the first triggering timestamp from the 8 boards and last for triggering window time
//		Attention!!!: Currently how to use the trigger output is not defined. The initial thoughts is: 
//			           Use the first trigger timestamp as the base, then get the start and ending trigger timestamp in different module(DRAM_Ctrl?) and mark those triggered parts in DRAM
//		Glitch 1: The coordinator originally should take 8 input clocks, but currently just use clk from RX0
//		Glitch 2: Ex. Sometime, trigger 0 might trigger on T10, while trigger 6 might trigger on T9. However, Trigger 0 set the trigger earlier than Trigger 6, 
//			       then in that case, we will use T10 as the first trigger time, but this shouldn't be a big problem as the time offset won't be very large, supposing to be within 4 cycles
//
//	Output Definition:
//		triggering_time_stamp: the first triggering timestamp, the receiving side should use this to calculate the starting and ending points. It will remain the same 
//									  during a single triggering event
//		threshold_decision_to_DRAM_ctrl: This signal will keep high from the first triggering point till it reaches ending triggering point. 
//													On the receiving side, it should keep on checking this signal and compare with the triggering time stamp, there will be a falling edge 
//													each time one triggering event is finish
//
// By: Chen Yang
// Rev0: 05/01/2017
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module Thresholder_top_direct(
	input rst_n,										

	input clk,							
	input [15:0]RX_data_0,							
	input [15:0]RX_data_1,										
	input [15:0]RX_data_2,									
	input [15:0]RX_data_3,	

	
	// The first tiggered timestamp, valid only if threshold_decision_to_DRAM_ctrl=1
	// Send to DRAM controller so it can be directly used for mask updating
	output reg [15:0] triggering_time_stamp,
	output reg threshold_decision_to_DRAM_ctrl	// This signal will keep high from the first triggering point till it reaches ending triggering point
																		// on the receiving side, it should keep on checking this signal and compare with the triggering time stamp, 
																		// there will be a falling edge each time one triggering event is finish
);

	parameter THRESHOLD = 20;

	wire [3:0]checker;
	reg [20:0]counter;
	reg [4:0]countdown;
	reg [2:0]state;
	assign checker[0] = (RX_data_0 > THRESHOLD);
	assign checker[1] = (RX_data_1 > THRESHOLD);
	assign checker[2] = (RX_data_2 > THRESHOLD);
	assign checker[3] = (RX_data_3 > THRESHOLD);
	
	always @(posedge clk)begin
		if(!rst_n)begin
			threshold_decision_to_DRAM_ctrl <= 0;
			triggering_time_stamp <= 16'b0;
			counter <= 0;
			state <= 0;
			countdown <= 0;
		end
		else begin
			if(state == 0)begin
				threshold_decision_to_DRAM_ctrl <= (checker > 0);
				triggering_time_stamp <= (checker>0)? counter : triggering_time_stamp;
				counter <= counter + 1;
				state <= (checker > 0)? 1 : 0;
				countdown <= 0;
			end
			else if (state == 1)begin
				threshold_decision_to_DRAM_ctrl = (!(countdown == 10));
				state <= (!(countdown == 10));
				counter <= counter + 1;
				countdown <= (countdown == 10)? 5'b0 : countdown + 1;
			end
		end
	end
	
endmodule
