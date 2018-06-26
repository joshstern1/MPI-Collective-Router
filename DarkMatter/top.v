
module top
(
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// CLOCK AND RESET
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// DRAM Controller clock
	input clkin_125,							// Programmable clk X5 (PIN U31)
													// DRAM controller input reference clock
	// Transciever clock
	input clk_trans,							// Transciever ref clock (R11) Programmable clk X4, set as 125 MHz			
	// BackEnd reset
	input rst_n,								// Pin AK13, Button S3
													// When pressed, rst_n = 0
	// Reset signal to FE Board
	output rst_n_B1_cycloneIV,					// Output reset signal connect to HSMCA-HSM_D3 (K12) 
														// HSMCA PIN 6
	output rst_n_B3_cycloneIV,					// Output reset signal connect to HSMCA-HSM_D2 (F12) 
														// HSMCA PIN 5
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// TRANSCEIVER RX PINs
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	input	SMA_GXB_RX_B0_p,						// HSMCB RX0, P:N2, N:N1

	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// DRAM PINs
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	output [13:0] ddr3b_a,
	output [2:0] ddr3b_ba,
	output ddr3b_casn,
	output ddr3b_cke,
	output ddr3b_clk_n,
	output ddr3b_clk_p,
	output ddr3b_csn,
	output [7:0] ddr3b_dm,
	inout [63:0] ddr3b_dq,
	inout [7:0] ddr3b_dqs_p, 
	inout [7:0] ddr3b_dqs_n,
	output ddr3b_odt,								// PIN AA32
	output ddr3b_rasn,							// PIN Y32
	output ddr3b_resetn,							// PIN AG31
	output ddr3b_wen,								// PIN AM34
	input rzqin_1_5v,								// PIN AP19
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// MISC IN/OUT SIGNALS
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	input DRAM_read_address,
	output MASK_output,					      // Stop bit mask being trucated
	// Triggering status
	output triggering_status
);


	////////////////////////////////////////////////////////////////////////////////////////////////////
	// Output Reset Signals
	////////////////////////////////////////////////////////////////////////////////////////////////////
	assign rst_n_B1_cycloneIV = rst_n;
	assign rst_n_B3_cycloneIV = rst_n;

	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// RX Transceiver Signals
	////////////////////////////////////////////////////////////////////////////////////////////////////
	wire				reconfig_busy;
	wire [69:0]		ch0_0_to_xcvr;
	wire [45:0]		ch0_0_from_xcvr;


	wire 				rx_std_clkout_B0;				// clock recovered from transceiver Board 0
	wire [15:0] 	rx_parallel_data_B0;			// --------------------------------------------------------------------data received from RX Board 0

	
	wire [1:0]     rx_syncstatus_0;
	wire [1:0]     rx_datak_0;

	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// Trigger and DRAM control realted signals
	////////////////////////////////////////////////////////////////////////////////////////////////////	
	wire [15:0]    triggering_time_stamp;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// Triggering Logic
	////////////////////////////////////////////////////////////////////////////////////////////////////
	Thresholder_top_direct Threshold(
		.rst_n(rst_n),										// reset signal, reset on low

		.rx_std_clkout_0(rx_std_clkout_B0),							// clk signal for RX data receiving
		.rx_syncstatus_0(rx_syncstatus_0),							// syncstatus connect to transceiver IP
		.rx_datak_0(rx_datak_0),									// signify the control word or data word
		.RX_data_0(rx_parallel_data_B0),			--------------------------------------------------------------------data received from RX Board 0
		.rx_std_clkout_1(rx_std_clkout_B1),							// clk signal for RX data receiving
		.rx_syncstatus_1(rx_syncstatus_1),							// syncstatus connect to transceiver IP
		.rx_datak_1(rx_datak_1),									// signify the control word or data word
		.RX_data_1(rx_parallel_data_B1),	


		// The first tiggered timestamp, valid only if threshold_decision_to_DRAM_ctrl=1
		// Send to DRAM controller so it can be directly used for mask updating
		////////////////////////////////////////////////////////////////////
		// TODO: Need to implement the related logic in DRAM controller
		////////////////////////////////////////////////////////////////////
		.triggering_time_stamp(triggering_time_stamp),
		.threshold_decision_to_DRAM_ctrl(triggering_status)
	);
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// DRAM Signals
	////////////////////////////////////////////////////////////////////////////////////////////////////
	wire avalon_clk;
	wire DRAM_Read_Enable;
	// DRAM Testing Signals
	wire [255:0] DRAM_Read_data;
	wire DRAM_Read_valid;
	
	// DRAM Controller signal
	wire [7:0] FIFO_ready_mask;
	wire [7:0] BRAM_ready_mask;
	wire [7:0] FIFO_empty;
	wire [7:0] FIFO_rd_request;
	wire [7:0] BRAM_rd_request;
	wire [2:0] BRAM_Sel;
	wire [24:0] DRAM_WR_address;
	wire [255:0] DRAM_Write_Data;
	wire DRAM_Write_Enable;
	wire [4:0] DRAM_Write_Burst_Count;	
	wire DRAM_Write_Burst_Begin;
	wire DRAM_Wait_Request;
	
	// FIFO read out data to DRAM controller
	wire [255:0] Buffer_RD_Data_0;	--------------------------------------data outputted from channel reordering
	wire [255:0] Buffer_RD_Data_1;
	reg [255:0] Selected_Data_to_DRAM;
	
	wire [15:0] FIFO_RD_Data_0; --------------------------------------data outputted from transceiver
	wire [15:0] FIFO_RD_Data_1;

	
	// Logic to select read data from 8 FIFOs
	always@(posedge avalon_clk)
		if(!rst_n)
			Selected_Data_to_DRAM <= 256'd0;
		else
			case(BRAM_Sel)	-------------------------------------select comes from DRAM_Addr_Gen
				0: Selected_Data_to_DRAM <= Buffer_RD_Data_0;
				1: Selected_Data_to_DRAM <= Buffer_RD_Data_1;
			endcase
			
	// DRAM controller
	DRAM_Addr_Gen DRAM_Controller(
		.clk(avalon_clk),
		.rst_n(rst_n),
		
		// signal for address mask
		.triggering_time_stamp(triggering_time_stamp),
		.triggering_status(triggering_status),	   // input from Threshold_Global_Coordinator

		// Signal to buffer
		.BRAM_ready_mask(BRAM_ready_mask),			// bit mask for those ready FIFOs. Each connect to the Channel_Data_Reorder_Buffer module's BRAM_ready_mask pin
		.BRAM_rd_data(Selected_Data_to_DRAM),				-----------------------------------------------data outputted from mux, input to DRAM
		.BRAM_rd_request(BRAM_rd_request),		   // bit mask for rd_request, each bit connect to Channel_Data_Reorder_Buffer module's BRAM_rd_request pin
		.BRAM_Sel(BRAM_Sel),								-----------------------------------------------mux select

		// Signal to DRAM controller
		.DRAM_Wait_Request(DRAM_Wait_Request),
		.DRAM_Write_Enable(DRAM_Write_Enable),
		.DRAM_Write_Burst_Begin(DRAM_Write_Burst_Begin),
		.DRAM_Write_Burst_Count(DRAM_Write_Burst_Count),
		.DRAM_Write_Addr(DRAM_WR_address),				-----------------------------------------------DRAM WRITE ADDR
		.DRAM_Write_Data(DRAM_Write_Data),				-----------------------------------------------DRAM WRITE DATA
		// dummy output for address mask
		.MASK_output(MASK_output)
	);


	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// Transceiver Module and Reorder Buffer
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// Transceiver RX for Board 0
	Trans_RX B0_RX(
		.rst_n(rst_n),
		.clk_trans(clk_trans),
		.SMA_GXB_RX_p(SMA_GXB_RX_B0_p),
		.rx_std_clkout(rx_std_clkout_B0),				// output clk for DRAM controller
		.rx_parallel_data(rx_parallel_data_B0),		// output received data 		--------------------------------------------data received from RX Board 0
		.rx_syncstatus(rx_syncstatus_0),
		.rx_datak(rx_datak_0),
		.RX_reconfig_to_xcvr(ch0_0_to_xcvr),
		.RX_reconfig_from_xcvr(ch0_0_from_xcvr),
		.DRAM_RD_clk(rx_std_clkout_B0),							// reorder buffer readout clk
		.DRAM_RD_req(FIFO_rd_request[0]),						// reorder buffer read request
		.RX_Buffer_empty(FIFO_empty[0]),							// Buffer empty
		.Buffer_RD_Data(FIFO_RD_Data_0),							// Read out data to DRAM   	--------------------------------------data outputted from transceiver
		.Buffer_Data_Ready(FIFO_ready_mask[0])	
		);
		
	Channel_Data_Reorder_Buffer Channel_Data_Reorder_Buffer_0(
		.inclk(rx_std_clkout_B0),
		.outclk(avalon_clk),
		.rst_n(rst_n),
		
		// Signal to buffer
		.FIFO_ready_mask(FIFO_ready_mask[0]),			// bit mask for those ready FIFOs. Each connect to the RX_buf_ctrl module's Buffer_Data_Ready pin
		.FIFO_rd_data(FIFO_RD_Data_0),
		.FIFO_rd_request(FIFO_rd_request[0]),		   // bit mask for rd_request, each bit connect to RX_buf_ctrl module's DRAM_RD_req pin

		// Signal to DRAM user controller
		.BRAM_ready_mask(BRAM_ready_mask[0]),			// bit mask for those ready Reorder Buffers. Each connect to the DRAM_Addr_Gen module's BRAM_ready_mask pin
		.DRAM_wr_data(Buffer_RD_Data_0),					--------------------------------------data outputted from channel reordering
		.BRAM_rd_request(BRAM_rd_request[0])		   // bit mask for rd_request, each bit connect to DRAM_Addr_Gen module's BRAM_rd_request pin
		);
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	// DRAM Control Module
	////////////////////////////////////////////////////////////////////////////////////////////////////		
	// DRAM Controller
	dma_mem dma_mem_inst(

		.sdram_afi_clk_clk									(avalon_clk),
		.sdram_avl_read										(DRAM_Read_Enable),						//.read
		.sdram_avl_write										(DRAM_Write_Enable),                //.write
		.sdram_avl_address									(DRAM_WR_address),                  //.address
		.sdram_avl_writedata									(DRAM_Write_Data),                  //.writedata
		.sdram_avl_burstcount								(DRAM_Write_Burst_Count),           //.burstcount
		.sdram_avl_beginbursttransfer						(DRAM_Write_Burst_Begin),           //.beginbursttransfer

		.sdram_avl_waitrequest_n							(DRAM_Wait_Request),                //.sdram_avl.waitrequest_n
		.sdram_avl_readdata									(DRAM_Read_Data),                   //.readdata
		.sdram_avl_readdatavalid							(DRAM_Read_Valid)                   //.readdatavalid
		);

endmodule
