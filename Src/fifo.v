`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Boston University Computer Architecture and Automated Design Lab
// Joshua Stern

/*
	*| 81  |80-78|77-75|74-72|71-69|68-66|65-63|62-54|  53-46  |45-38| 37-36 |35-32| 31-0  |     	
	*|valid|dst_z|dst_y|dst_x|src_z|src_y|src_x|rank |contextId| tag |algtype| op  |payload|
 
inside the fifo
	
	*| 84-82  | 81  |80-78|77-75|74-72|71-69|68-66|65-63|62-54|  53-46  |45-38| 37-36 |35-32| 31-0  |   	
	*|children|valid|dst_z|dst_y|dst_x|src_z|src_y|src_x|rank |contextId| tag |algtype| op  |payload|

//reduction table entry 
 
	*|   90  |     89     |  88-85  | 84-82  | 81  |80-78|77-75|74-72|71-69|68-66|65-63|62-54|  53-46  |45-38| 37-36 |35-32| 31-0  |      	
	*|LeafBit|ExtraWaitBit|waitcount|children|valid|dst_z|dst_y|dst_x|src_z|src_y|src_x|rank |contextId| tag |algtype| op  |payload|
	
//leaf bit is for if the operation's children count == 0, because then the input is also the output 
//extra bit/counting down is 1 if the wait count was ever set to the proper latency
/////////////////////////////////////////////////////////////////////////////////*/

module fifo( clk, rst, buf_in, buf_out, wr_en, rd_en, buf_empty, buf_full, fifo_counter);

parameter cur_rank = 9'b0;
parameter root = 9'b0;
parameter rank_z = 3'b0;
parameter rank_y = 3'b0;
parameter rank_x = 3'b0;
parameter root_z = 3'b0;
parameter root_y = 3'b0;
parameter root_x = 3'b0;

parameter Comm_world_size = 8;

parameter FlitWidth = 82;
parameter PayloadWidth=32;
parameter opPos = 32;
parameter opWidth = 4;
parameter AlgTypePos = 36;
parameter AlgTypeWidth = 2;
parameter TagPos=38;
parameter TagWidth = 8;
parameter ContextIdPos = 46;
parameter ContextIdWidth = 8;
parameter RankPos = 54;
parameter RankWidth = 9;
parameter Src_XPos = 63;
parameter Src_YPos = 66;
parameter Src_ZPos = 69;
parameter Src_XWidth = 3;
parameter Src_YWidth = 3;
parameter Src_ZWidth = 3;
parameter Dst_XPos = 72;
parameter Dst_YPos = 75;
parameter Dst_ZPos = 78;
parameter Dst_XWidth = 3;
parameter Dst_YWidth = 3;
parameter Dst_ZWidth = 3;
parameter SrcPos = 63;
parameter SrcWidth = 9;
parameter DstPos = 72;
parameter DstWidth = 9;
parameter ValidBitPos = 81;

parameter ReductionTableWidth = 91;
parameter ReductionTableSize = 6;
parameter AdderLatency = 14;

parameter ReductionBitPos=35;

parameter ChildrenPos=82;
parameter ChildrenWidth=3;


parameter fifo_lg_size = 12;
parameter FifoSize = 1<<fifo_lg_size;
input             	rst, clk, wr_en, rd_en;  
// reset, system clock, write enable and read enable.
input [FlitWidth+ChildrenWidth-1:0] buf_in;              	 
// data input to be pushed to buffer
output[FlitWidth+ChildrenWidth-1:0]       	buf_out;
// port to output the data using pop.          	 
output            	buf_empty, buf_full; 	 
// buffer empty and full indication
output[fifo_lg_size:0] fifo_counter;        	 
// number of data pushed in to buffer  
reg[FlitWidth+ChildrenWidth-1:0]          	buf_out;
reg               	buf_empty, buf_full;
reg[fifo_lg_size :0]	fifo_counter;
reg[fifo_lg_size-1:0]  rd_ptr, wr_ptr;       	// pointer to read and write addresses
reg[FlitWidth+ChildrenWidth-1:0]          	buf_mem[FifoSize-1:0]; //
reg [fifo_lg_size:0]i;
reg [fifo_lg_size:0]j;
reg [fifo_lg_size:0]k;


always @(fifo_counter)
begin
   buf_empty = (fifo_counter==0);
   buf_full = (fifo_counter== FifoSize);
end


always @(posedge clk or posedge rst)
begin
   if( rst )
   	fifo_counter <= 0;
   else if( (!buf_full && wr_en) && ( !buf_empty && rd_en ) )
   	fifo_counter <= fifo_counter;
   else if( !buf_full && wr_en )
   	fifo_counter <= (buf_in[31:0]>0)?fifo_counter + 1:fifo_counter;
   else if( !buf_empty && rd_en )
   	fifo_counter <= fifo_counter - 1;
   else
  	fifo_counter <= fifo_counter;
end


always @( posedge clk or posedge rst)
begin
  if(rst)begin
   	 buf_out <= 0;
   end
   else if( rd_en && !buf_empty )begin
     	buf_out <= buf_mem[rd_ptr];
   end
   else begin
     	buf_out <= buf_out;
   end
end


always @(posedge clk)
begin
   if( rst ) begin
  for(i=0;i<FifoSize;i=i+1)begin
  	buf_mem[i] <= 0;
  end
  end
   else
   begin
    
     for(j=0;j<FifoSize;j=j+1)
      begin
   	 if(rd_ptr<wr_ptr)
   	 begin
   		 if((j<rd_ptr) || (j>wr_ptr))
   		 begin
   			 buf_mem[j]<=0;
   		 end
   	 end
      end



      for(k=0;k<FifoSize;k=k+1)
   	 begin
   	   if(wr_ptr<rd_ptr)
   	   begin
   		 if((k<rd_ptr)&&(k>wr_ptr))
   		 begin
   			 buf_mem[k]<=0;
   		 end
   	   end
   	 end
    
   if( wr_en && !buf_full )
  	buf_mem[ wr_ptr ] <= buf_in;
   else
  	buf_mem[ wr_ptr ] <= buf_mem[ wr_ptr ];
 end
end


always@(posedge clk or posedge rst)
begin
   if( rst )
   begin
  	wr_ptr <= 0;
  	rd_ptr <= 0;
   end
   else
   begin
  	if( !buf_full && wr_en )	wr_ptr <= wr_ptr + 1;
   	 else  wr_ptr <= wr_ptr;
   	 
  	if( !buf_empty && rd_en )   rd_ptr <= rd_ptr + 1;
  	else rd_ptr <= rd_ptr;
   	 
   end
end


endmodule



 
