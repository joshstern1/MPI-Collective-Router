`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
module UDP_Control(
	input clk,
	input rst_n,
	
	//signals for address generating
	input [15:0] triggering_time_stamp,
   input triggering_status,
	input [BOARDS_X_OFFSETS-1:0] prev_channel_offsets,
		
	//signals for reading from DRAM
	output reg DRAM_Read_Enable,
	output reg [24:0]  DRAM_Read_Addr,	
	input [255:0]DRAM_Read_Data,
	input DRAM_Read_Valid,
	
	//signals for Ethernet
	output reg[Ethernet_Width-1:0]tx_data,
	output reg tx_data_valid
);

	parameter Ethernet_Width = 8;
	
	parameter NUM_BOARDS = 8;
	parameter BOARDS_X_OFFSETS = CHANNEL_OFFSET_LEN * NUM_BOARDS;
	parameter CHANNELS_PER_BOARD = 125;	
	parameter CHANNEL_OFFSET_LEN = 14;

	parameter HEAD_DIFF = 0; //used to get the data from 5ms before the event, shoudl be 312
	parameter MAX_COUNTER = NUM_BOARDS * CHANNELS_PER_BOARD * 1250;
	

	//address generator registers
	reg [CHANNEL_OFFSET_LEN-1:0] channel_offset [0:NUM_BOARDS-1];
	reg [2:0]BRAM_Sel;
	reg [6:0]channel_sel;

	//helper registers
	reg [2:0]state;
	reg [20:0]counter;
	reg [3:0]i;

	
/////////////////////////////////////////////////////////////////////////////////////
/////address generator for reading data from DRAM upon triggering event
	always @(posedge clk)begin
		if(!rst_n) begin
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
				channel_sel <= triggering_status; 
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
	
/////////////////////////////////////////////////////////////////////////////////////
//build packet header

	parameter Version = 4'b0100;			//always 4 for ipv4
	parameter IHL = 4'b0101;				//# of 32-bit words in header = 5 
	parameter DSCP = 6'b0;					//???
	parameter ECN = 2'b0;					//???
	parameter IP_Len = 16'b0111100;		//32 bytes of data + 20 bytes of ip header + 8 bytes of udp header = 60
	parameter Identification = 16'b0;	//???
	parameter Flags = 3'b010;				//No Fragmentation
	parameter FragmentOffset = 13'b0;	//No Fragmentation
	parameter TTL = 8'b01000000;			//64 seconds ???
	parameter Protocol = 8'b010001;		//UDP
	parameter SrcIp = 32'hac10;			//TBD
	parameter DstIp = 32'h0a0c;			//TBD
	
	parameter EarlySum = 16'hc54d;	//header sum without src ip + dst ip
	wire [19:0]T1 = EarlySum + SrcIp + DstIp;
	wire [15:0]T2 = T1[15:0] + T1[19:16];
	wire [15:0]IP_Checksum = ~T2;
	
	parameter SrcPort = 16'b0;
	parameter DstPort = 16'b01;
	parameter UDP_Len = 16'b0101000;	//8 bytes UDP header + 32 bytes of data = 40
	parameter UDP_Checksum = 16'b0;		//UDP checksum is optional
	
	wire [223:0]Packet_Header = {Version, IHL, DSCP, ECN, IP_Len, Identification, Flags, FragmentOffset, TTL, Protocol, IP_Checksum, SrcIp, DstIp, SrcPort, DstPort, UDP_Len, UDP_Checksum};

///////////////////////////////////////////////////////////////////////////////////
//read data from DRAM and store in queue until ethernet is ready
	parameter Queue_Size = 10;		
	wire [255:0]Queue_Out;
	reg rd_en;
	
	large_buffer#(
        .buffer_depth(Queue_Size)
    )
    send_queue(
        .clk(clk),
        .rst(!rst_n),
        .in(DRAM_Read_Data),
        .produce(DRAM_Read_Valid),
        .consume(rd_en),
        .full(),
        .empty(),
        .out(Queue_Out)
    );

////////////////////////////////////////////////////////////////////////////////
//send packet header and data	 
	 
	 parameter IDLE = 0;
	 parameter SENDING_HEADER = 1;
	 parameter SENDING_DATA = 2;
	 
	 reg [1:0]send_state;
	 reg [9:0]header_tracker;
	 reg [9:0]data_tracker;	 
	 reg [255:0]Packet_Data;
	 
	 
	 always @(posedge clk)begin
		if(!rst_n)begin
			send_state <= IDLE;
			tx_data <= 0;
			tx_data_valid <= 0;
			header_tracker <= 0;
			data_tracker <= 0;
			rd_en <= 0;
			Packet_Data <= 0;
		end
		else begin
			case(send_state)
				IDLE:
					begin
						send_state <= DRAM_Read_Valid;
						tx_data <= 0;
						tx_data_valid <= 0;
						header_tracker <= 0;
						data_tracker <= 0;
						rd_en <= DRAM_Read_Valid;
					end
				SENDING_HEADER:	
					begin	
						tx_data <= Packet_Header[(224-Ethernet_Width-header_tracker)+:Ethernet_Width];
						tx_data_valid <= 1;
						header_tracker <= header_tracker + Ethernet_Width;
						Packet_Data <= (rd_en)? Queue_Out : Packet_Data;
						rd_en <= 0;
						send_state <= (header_tracker == (224 - Ethernet_Width))? SENDING_DATA : SENDING_HEADER;							
					end
				SENDING_DATA:
					begin
						tx_data <= Packet_Data[(256-Ethernet_Width-data_tracker)+:Ethernet_Width];
						data_tracker <= data_tracker + Ethernet_Width;
						send_state <= (data_tracker == (256 - Ethernet_Width))? IDLE : SENDING_DATA;
					end
			endcase
		end	 
	 end

endmodule
