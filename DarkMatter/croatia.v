`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:13:50 07/11/2018
// Design Name:   top
// Module Name:   C:/Users/joshtern/DM/croatia.v
// Project Name:  DM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module croatia;

	// Inputs
	reg clk;
	reg rst;
	reg [15:0] rx_parallel_data_B0;
	reg [15:0] rx_parallel_data_B1;
	reg [15:0] rx_parallel_data_B2;
	reg [15:0] rx_parallel_data_B3;
	reg [7:0] BRAM_ready_mask;
	reg DRAM_Read_Valid;

	// Outputs
	wire triggering_status;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.rst(rst), 
		.rx_parallel_data_B0(rx_parallel_data_B0), 
		.rx_parallel_data_B1(rx_parallel_data_B1), 
		.rx_parallel_data_B2(rx_parallel_data_B2), 
		.rx_parallel_data_B3(rx_parallel_data_B3), 
		.BRAM_ready_mask(BRAM_ready_mask),
		.DRAM_Read_Valid(DRAM_Read_Valid),
		.triggering_status(triggering_status)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		rx_parallel_data_B0 = 16;
		rx_parallel_data_B1 = 17;
		rx_parallel_data_B2 = 18;
		rx_parallel_data_B3 = 19;
		BRAM_ready_mask = 8'b0;
		DRAM_Read_Valid = 0;

		// Wait 100 ns for global reset to finish
		#100;
       rst = 1;
		 BRAM_ready_mask = 8'b00000001;
		#10;
		 rx_parallel_data_B0 = 21;
		 DRAM_Read_Valid = 1;
		#10;
		 rx_parallel_data_B0 = 16;
		 DRAM_Read_Valid = 0;
	end
      
	always begin
		#5 clk = !clk;
	end
	
endmodule

