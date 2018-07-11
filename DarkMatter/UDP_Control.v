`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module UDP_Control(
	input clk,
	input rst,
	input [15:0] triggering_time_stamp,
   input triggering_status,
   output [255:0]PC_data,
	
	output reg DRAM_Read_Enable,
	output reg [24:0]  DRAM_Read_Addr,	
	input [255:0]DRAM_Read_data,
	input DRAM_Read_Valid
);

	parameter MAX = 10;

	assign PC_data = DRAM_Read_data;
	reg [2:0]state;
	reg [10:0]countdown;
	
	always @(posedge clk)begin
		if(!rst) begin
			DRAM_Read_Enable <= 1'b0;
			DRAM_Read_Addr <= 25'b0;
			state <= 0;
		end
		else begin
			if(state == 0)begin
				DRAM_Read_Enable <= triggering_status;
				DRAM_Read_Addr <= (triggering_status)? triggering_time_stamp : 25'b0;
				state <= triggering_status;
				countdown <= 0;
			end
			else if (state == 1)begin
				countdown <= countdown + 1;
				DRAM_Read_Addr <= DRAM_Read_Addr + 1;
				DRAM_Read_Enable <= 1;
				state <= (!(countdown == MAX));
			end
		end
	end

endmodule