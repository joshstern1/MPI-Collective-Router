`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
module UDP_Control(
	input clk,
	input rst,
	input [15:0] triggering_time_stamp,
   input triggering_status,
	input [BOARDS_X_OFFSETS-1:0] prev_channel_offsets,
   output [255:0]PC_data,
	
	output reg DRAM_Read_Enable,
	output reg [24:0]  DRAM_Read_Addr,	
	input [255:0]DRAM_Read_data,
	input DRAM_Read_Valid
);

	parameter HEAD_DIFF = 0; //5ms should be 312
	parameter MAX_COUNTER = NUM_BOARDS * CHANNELS_PER_BOARD * 1250;
	
	parameter CHANNEL_OFFSET_LEN = 14;
	parameter NUM_BOARDS = 8;
	parameter BOARDS_X_OFFSETS = CHANNEL_OFFSET_LEN * NUM_BOARDS;
	parameter CHANNELS_PER_BOARD = 125;


	reg [CHANNEL_OFFSET_LEN-1:0] channel_offset [0:NUM_BOARDS-1];
	reg [2:0]BRAM_Sel;
	reg [6:0]channel_sel;


	assign PC_data = DRAM_Read_data;
	
	reg [2:0]state;
	reg [20:0]counter;
	reg [3:0]i;
	
/////////////////////////////////////////////////////////////////////////////////////
/////address generator for reading data from DRAM upon triggering event
	always @(posedge clk)begin
		if(!rst) begin
			DRAM_Read_Enable <= 1'b0;
			DRAM_Read_Addr <= 25'b0;
			BRAM_Sel <= 3'b0;
			channel_sel <= 7'b0;
			counter <= 0;
			state <= 0;
			for(i=0; i<NUM_BOARDS; i=i+1)begin
				channel_offset[i] <= 14'b0;
			end
		end
		else if(state == 0)begin
				DRAM_Read_Enable <= triggering_status;
				DRAM_Read_Addr <= {1'b0, BRAM_Sel, channel_sel, prev_channel_offsets[CHANNEL_OFFSET_LEN-1:0]};
				channel_sel <= triggering_status; //normally 0, changes to 1 on trigger so its ready for the 2nd read (1st read with state = 1) 
				state <= triggering_status;
				counter <= 1;
				for(i=0; i<NUM_BOARDS; i=i+1)begin
					channel_offset[i] <= prev_channel_offsets[(CHANNEL_OFFSET_LEN*i)+:CHANNEL_OFFSET_LEN] - HEAD_DIFF;
				end
		end
		else if (state == 1)begin
			counter <= counter + 1;
			state <= (counter != MAX_COUNTER);
			DRAM_Read_Addr <= {1'b0, BRAM_Sel, channel_sel, channel_offset[BRAM_Sel]};
			DRAM_Read_Enable <= 1;
			channel_sel <= channel_sel + 1;
			if(channel_sel == (CHANNELS_PER_BOARD-1))begin
				channel_sel <= 0;
				if(BRAM_Sel < (NUM_BOARDS-1))begin
					BRAM_Sel <= BRAM_Sel + 1;
				end
				else begin
					BRAM_Sel <= 0;		
					for(i=0; i<NUM_BOARDS; i=i+1)begin
						channel_offset[i] <= channel_offset[i] + 1;
					end
				end
			end
		end
	end
/////end address generator for reading data from DRAM upon triggering event
/////////////////////////////////////////////////////////////////////////////////////

endmodule
