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
	
	input [3:0] BRAM_ready_mask,
	output triggering_status 	// Triggering status
);

	wire [1:0]     rx_syncstatus_0 = 0;
	wire [1:0]     rx_syncstatus_1 = 0;
	wire [1:0]     rx_syncstatus_2 = 0;
	wire [1:0]     rx_syncstatus_3 = 0;
	wire [1:0]     rx_datak_0 = 0;
	wire [1:0]     rx_datak_1 = 0;
	wire [1:0]     rx_datak_2 = 0;
	wire [1:0]     rx_datak_3 = 0;

	wire [15:0]    triggering_time_stamp;
	
	Thresholder_top_direct Threshold(
		.rst_n(rst),								
		.clk(clk),																
		.RX_data_0(rx_parallel_data_B0),								
		.RX_data_1(rx_parallel_data_B1),								
		.RX_data_2(rx_parallel_data_B2),									
		.RX_data_3(rx_parallel_data_B3),	

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
	wire [3:0] FIFO_ready_mask;
	wire [3:0] FIFO_empty;
	wire [3:0] FIFO_rd_request;
	wire [3:0] BRAM_rd_request;
	wire [2:0] BRAM_Sel;
	wire [24:0] DRAM_WR_address;
	wire [255:0] DRAM_Write_Data;
	wire DRAM_Write_Enable;
	wire [4:0] DRAM_Write_Burst_Count;	
	wire DRAM_Write_Burst_Begin;
	wire DRAM_Wait_Request = 1'b0; //////////////////////////////////////////////
	
	// FIFO read out data to DRAM controller
	wire [255:0] Buffer_RD_Data_0 = rx_parallel_data_B0;
	wire [255:0] Buffer_RD_Data_1 = rx_parallel_data_B1;
	wire [255:0] Buffer_RD_Data_2 = rx_parallel_data_B2;
	wire [255:0] Buffer_RD_Data_3 = rx_parallel_data_B3;

	reg [255:0] Selected_Data_to_DRAM;
	

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
		.DRAM_Write_Data(DRAM_Write_Data)
	);

	wire [255:0]DRAM_Read_data = 255'b0;
	wire DRAM_Read_Valid = 1'b0;
	wire DRAM_Read_Enable;
	wire [24:0]DRAM_Read_Addr;
	
	UDP_Control UDP(
		.clk(clk),
		.rst(rst),
		.triggering_time_stamp(triggering_time_stamp),
		.triggering_status(triggering_status),
		.PC_data(PC_data),
		.DRAM_Read_Enable(DRAM_Read_Enable),
		.DRAM_Read_Valid(DRAM_Read_Valid),
		.DRAM_Read_Addr(DRAM_Read_Addr),	
		.DRAM_Read_data(DRAM_Read_data)
	);
	

endmodule
