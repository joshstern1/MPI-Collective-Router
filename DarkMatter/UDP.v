`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
module UDP(
	input clk,
	input rst_n,
	
	//input from UDP_Send_Controller
	input [Payload_Len-1:0]UDP_send_package,
	input UDP_send_valid,
	
	//signals for Ethernet
	output reg[Ethernet_Width-1:0]tx_data,
	output reg tx_data_valid
);

	parameter Ethernet_Width = 16;
	
	//header lengths in bits
	parameter UDP_Header_Len = 64;
	parameter IP_Header_Len = 160;
	parameter Ethernet_Header_Len = 176;	//without the CRC
	parameter Header_Len = UDP_Header_Len + IP_Header_Len + Ethernet_Header_Len;
	
	parameter Payload_Len = 256;
	
////////////////////////////////////////////
//UDP

	parameter SrcPort = 16'b0;
	parameter DstPort = 16'b01;
	parameter UDP_Len = 16'b0101000;	//8 bytes UDP header + 32 bytes of data = 40
	parameter UDP_Checksum = 16'b0;		//UDP checksum is optional

	parameter UDP_Header = {SrcPort, DstPort, UDP_Len, UDP_Checksum};

////////////////////////////////////////////
//IP

	parameter Version = 4'b0100;			//always 4 for ipv4
	parameter IHL = 4'b0101;				//# of 32-bit words in header = 5 
	parameter DSCP = 6'b0;					//DSCP = 0
	parameter ECN = 2'b0;					//Non ECN-Capable Transport, Non-ECT
	parameter IP_Len = 16'b0111100;		//32 bytes of data + 20 bytes of ip header + 8 bytes of udp header = 60
	parameter Identification = 16'b0;	//???
	parameter Flags = 3'b010;				//No Fragmentation
	parameter FragmentOffset = 13'b0;	//No Fragmentation
	parameter TTL = 8'b01000000;			//64 seconds TTL
	parameter Protocol = 8'b010001;		//UDP
	parameter SrcIp = 32'b0;			//TBD
	parameter DstIp = 32'b01;			//TBD
	
	//IP Header Checksum
	parameter TempSum = {Version,IHL,DSCP,ECN} + IP_Len + Identification + {Flags, FragmentOffset} + {TTL, Protocol} + SrcIp[31:16] + SrcIp[15:0] + DstIp[31:16] + DstIp[15:0];
	parameter IP_Checksum = ~TempSum;
		
	parameter IP_Header = {Version, IHL, DSCP, ECN, IP_Len, Identification, Flags, FragmentOffset, TTL, Protocol, IP_Checksum, SrcIp, DstIp};

////////////////////////////////////////////
//Ethernet

	parameter Preamble = 64'haaaaaaaaaaaaaaab;
	parameter DstMAC = 48'b01;
	parameter SrcMAC = 48'b0;
	parameter EtherType = 16'h0800;	
	
	parameter Ethernet_Header = {Preamble, DstMAC, SrcMAC, EtherType};
	
	parameter Packet_Header = {Ethernet_Header, IP_Header, UDP_Header};

////////////////////////////////////////////
//CRC
	
	parameter Packet_No_CRC_Len = Header_Len + Payload_Len - 64;	//CRC does not include Preamble
	wire [Packet_No_CRC_Len - 1 : 0]Packet_No_CRC = {DstMAC, SrcMAC, EtherType, IP_Header, UDP_Header, Queue_Out};
	
	parameter CRC_Len = 32;
	parameter CRC_Gen = 9;
	parameter InterPacketGap = 96'b0;
	wire [Packet_No_CRC_Len + CRC_Len - 1 : 0]CRC_helper = (Packet_No_CRC << CRC_Len)%CRC_Gen;
	
	parameter Ethernet_Tail_Len = CRC_Len + 96;
	wire [Ethernet_Tail_Len - 1 : 0]CRC = {(CRC_Gen - CRC_helper), InterPacketGap};
	
	
///////////////////////////////////////////////////////////////////////////////////
//read data from DRAM and store in queue until ethernet is ready
	parameter Queue_Size = 10;		
	wire [Payload_Len-1:0]Queue_Out;
	reg rd_en;
	
	large_buffer#(
        .buffer_depth(Queue_Size)
    )
    send_queue(
        .clk(clk),
        .rst(!rst_n),
        .in(UDP_send_package),
        .produce(UDP_send_valid),
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
	 parameter SENDING_CRC = 3;
	 
	 reg [1:0]send_state;
	 reg [9:0]header_tracker;
	 reg [9:0]data_tracker;	 
	 reg [9:0]crc_tracker;	 
	 reg [255:0]Packet_Data;
	 
	 
	 always @(posedge clk)begin
		if(!rst_n)begin
			send_state <= IDLE;
			tx_data <= 0;
			tx_data_valid <= 0;
			header_tracker <= 0;
			data_tracker <= 0;
			crc_tracker <= 0;
			rd_en <= 0;
			Packet_Data <= 0;
		end
		else begin
			case(send_state)
				IDLE:
					begin
						send_state <= UDP_send_valid;
						tx_data <= 0;
						tx_data_valid <= 0;
						rd_en <= UDP_send_valid;
						header_tracker <= 0;
						data_tracker <= 0;
						crc_tracker <= 0;
					end
				SENDING_HEADER:	
					begin	
						tx_data <= Packet_Header[(Header_Len-Ethernet_Width-header_tracker)+:Ethernet_Width];
						tx_data_valid <= 1;
						header_tracker <= header_tracker + Ethernet_Width;
						Packet_Data <= (rd_en)? Queue_Out : Packet_Data;
						rd_en <= 0;
						send_state <= (header_tracker == (Header_Len - Ethernet_Width))? SENDING_DATA : SENDING_HEADER;							
					end
				SENDING_DATA:
					begin
						tx_data <= Packet_Data[(Payload_Len-Ethernet_Width-data_tracker)+:Ethernet_Width];
						data_tracker <= data_tracker + Ethernet_Width;
						send_state <= (data_tracker == (Payload_Len - Ethernet_Width))? SENDING_CRC : SENDING_DATA;
					end
				SENDING_CRC:
					begin
						tx_data <= CRC[(Ethernet_Tail_Len-Ethernet_Width-crc_tracker)+:Ethernet_Width];
						crc_tracker <= crc_tracker + Ethernet_Width;
						send_state <= (crc_tracker == (Ethernet_Tail_Len - Ethernet_Width))? IDLE : SENDING_CRC;
					end
			endcase
		end	 
	 end

endmodule
