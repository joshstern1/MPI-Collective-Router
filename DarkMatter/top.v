`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
module top
(
	input clk,									
	input rst,			
	input [15:0] 	rx_parallel_data_B0,			// data received from RX Board 0
	input [15:0] 	rx_parallel_data_B1,			// data received from RX Board 1
	input [15:0] 	rx_parallel_data_B2,			// data received from RX Board 2
	input [15:0] 	rx_parallel_data_B3,			// data received from RX Board 3		
	
	input [7:0] BRAM_ready_mask,
	output triggering_status, 	// Triggering status\
	
	input DRAM_Read_Valid
	
);

	wire [15:0]    triggering_time_stamp;
	
	wire [15:0] rx_parallel_data_B4 = 16'b0;
	wire [15:0] rx_parallel_data_B5 = 16'b0;
	wire [15:0] rx_parallel_data_B6 = 16'b0;
	wire [15:0] rx_parallel_data_B7 = 16'b0;
	
	Thresholder_top_direct Threshold(
		.rst_n(rst),								
		.clk(clk),																
		.RX_data_0(rx_parallel_data_B0),								
		.RX_data_1(rx_parallel_data_B1),								
		.RX_data_2(rx_parallel_data_B2),									
		.RX_data_3(rx_parallel_data_B3),	
		.RX_data_4(rx_parallel_data_B4),								
		.RX_data_5(rx_parallel_data_B5),								
		.RX_data_6(rx_parallel_data_B6),									
		.RX_data_7(rx_parallel_data_B7),

		// The first tiggered timestamp is valid only if triggering_status=1
		// Send to DRAM controller so it can be directly used for mask updating
		// TODO: Need to implement the related logic in DRAM controller
		.triggering_time_stamp(triggering_time_stamp),
		.threshold_decision_to_DRAM_ctrl(triggering_status)
	);
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// DRAM Signals
	////////////////////////////////////////////////////////////////////////////////////////////////////
	wire avalon_clk = clk;
	
	// DRAM Controller signal
	wire [7:0] BRAM_rd_request;
	wire [2:0] BRAM_Sel;
	wire [24:0] DRAM_WR_address;
	wire [255:0] DRAM_Write_Data;
	wire DRAM_Write_Enable;
	wire [4:0] DRAM_Write_Burst_Count;	
	wire DRAM_Write_Burst_Begin;
	wire DRAM_Wait_Request = 1'b1; //////////////////////////////////////////////
	
	// FIFO read out data to DRAM controller
	wire [255:0] Buffer_RD_Data_0 = rx_parallel_data_B0;
	wire [255:0] Buffer_RD_Data_1 = rx_parallel_data_B1;
	wire [255:0] Buffer_RD_Data_2 = rx_parallel_data_B2;
	wire [255:0] Buffer_RD_Data_3 = rx_parallel_data_B3;
	wire [255:0] Buffer_RD_Data_4 = rx_parallel_data_B4;
	wire [255:0] Buffer_RD_Data_5 = rx_parallel_data_B5;
	wire [255:0] Buffer_RD_Data_6 = rx_parallel_data_B6;
	wire [255:0] Buffer_RD_Data_7 = rx_parallel_data_B7;

	reg [255:0] Selected_Data_to_DRAM;
	
	parameter CHANNEL_OFFSET_LEN = 14;
	parameter NUM_BOARDS = 8;
	parameter BOARDS_X_OFFSETS = CHANNEL_OFFSET_LEN * NUM_BOARDS;

	wire [BOARDS_X_OFFSETS-1:0] channel_offsets;


	// Logic to select read data from 8 FIFOs
	always@(posedge avalon_clk)
		if(!rst)
			Selected_Data_to_DRAM <= 256'd0;
		else
			case(BRAM_Sel)
				0: Selected_Data_to_DRAM <= Buffer_RD_Data_0;
				1: Selected_Data_to_DRAM <= Buffer_RD_Data_1;
				2: Selected_Data_to_DRAM <= Buffer_RD_Data_2;
				3: Selected_Data_to_DRAM <= Buffer_RD_Data_3;
				4: Selected_Data_to_DRAM <= Buffer_RD_Data_4;
				5: Selected_Data_to_DRAM <= Buffer_RD_Data_5;
				6: Selected_Data_to_DRAM <= Buffer_RD_Data_6;
				7: Selected_Data_to_DRAM <= Buffer_RD_Data_7;
			endcase
			
	// DRAM controller
	DRAM_Addr_Gen DRAM_Controller(
		.clk(avalon_clk),
		.rst_n(rst),
		.triggering_time_stamp(triggering_time_stamp),
		.triggering_status(triggering_status),	   
		// Signal to buffer
		.BRAM_ready_mask(BRAM_ready_mask),			// bit mask for those ready FIFOs. Each connect to the Channel_Data_Reorder_Buffer module's BRAM_ready_mask pin
		.BRAM_rd_data(Selected_Data_to_DRAM),
		.BRAM_rd_request(BRAM_rd_request),		   // bit mask for rd_request, each bit connect to Channel_Data_Reorder_Buffer module's BRAM_rd_request pin
		.BRAM_Sel(BRAM_Sel),
		// Signal to DRAM controller
		.DRAM_Wait_Request(DRAM_Wait_Request),
		.DRAM_Write_Enable(DRAM_Write_Enable),
		.DRAM_Write_Burst_Begin(DRAM_Write_Burst_Begin),
		.DRAM_Write_Burst_Count(DRAM_Write_Burst_Count),
		.DRAM_Write_Addr(DRAM_WR_address),
		.DRAM_Write_Data(DRAM_Write_Data),
		.MASK_output(),
		.channel_offsets(channel_offsets)
	);
	
	parameter Ethernet_Width = 8;
	wire [Ethernet_Width-1:0]PC_data;

	wire [255:0]DRAM_Read_Data = 255'd21;
	//wire DRAM_Read_Valid = 1'b0;
	wire DRAM_Read_Enable;
	wire [24:0]DRAM_Read_Addr;
	
	UDP_Control UDP(
		.clk(clk),
		.rst_n(rst),
		.triggering_time_stamp(triggering_time_stamp),
		.triggering_status(triggering_status),
		.prev_channel_offsets(channel_offsets),
		.PC_data(PC_data),
		.DRAM_Read_Enable(DRAM_Read_Enable),
		.DRAM_Read_Valid(DRAM_Read_Valid),
		.DRAM_Read_Addr(DRAM_Read_Addr),	
		.DRAM_Read_Data(DRAM_Read_Data)
	);
	

endmodule
