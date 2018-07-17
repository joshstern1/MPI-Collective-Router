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

module fifo#(
	parameter lg_numprocs = 3,
	parameter PayloadWidth = 32
)
(
	input rst,
	input clk,
	input wr_en,
   input	rd_en,
	input [FlitWidth+ChildrenWidth-1:0] buf_in,              	 
	output reg[FlitWidth+ChildrenWidth-1:0] buf_out,          	 
	output reg buf_empty, 
	output reg buf_full,
	output reg[fifo_lg_size:0] fifo_counter 
);


//////////////////////////////////////////
localparam num_procs = 1 << lg_numprocs;

//packet structure
localparam opPos = PayloadWidth;
localparam opWidth = 4;
localparam AlgTypePos = opPos+opWidth;
localparam AlgTypeWidth = 2;
localparam TagPos=AlgTypePos+AlgTypeWidth;
localparam TagWidth = 8;
localparam ContextIdPos = TagPos+TagWidth;
localparam ContextIdWidth = 8;
localparam RankPos = ContextIdPos + ContextIdWidth;
localparam RankWidth = 9;
localparam Src_XPos = RankPos+RankWidth;
localparam Src_XWidth = 3;
localparam Src_YPos = Src_XPos+Src_XWidth;
localparam Src_YWidth = 3;
localparam Src_ZPos = Src_YPos+Src_YWidth;
localparam Src_ZWidth = 3;
localparam Dst_XPos = Src_ZPos+Src_ZWidth;
localparam Dst_XWidth = 3;
localparam Dst_YPos = Dst_XPos+Dst_XWidth;
localparam Dst_YWidth = 3;
localparam Dst_ZPos = Dst_YPos+Dst_YWidth;
localparam Dst_ZWidth = 3;
localparam SrcPos = Src_XPos;
localparam SrcWidth = Src_XWidth+Src_YWidth+Src_ZWidth;
localparam DstPos = Dst_XPos;
localparam DstWidth = Dst_XWidth+Dst_YWidth+Dst_ZWidth;
localparam ValidBitPos = Dst_ZPos+Dst_ZWidth;
localparam FlitWidth = ValidBitPos + 1;


/////////////////////////////////////////
//children and countdown
localparam ChildrenPos=ValidBitPos+1;
localparam ChildrenWidth=lg_numprocs;
localparam WaitPos = ChildrenPos+ChildrenWidth;
localparam WaitWidth = 4;
localparam ExtraWaitPos=WaitPos+WaitWidth;
localparam LeafBitPos=ExtraWaitPos+1;

 
//////////////////////////////////////////
//reduce unit table and adder
localparam ReductionTableWidth = LeafBitPos+1;
localparam AdderLatency = 4;
localparam ReductionBitPos=opPos+opWidth-1;


///////////////////////////////////////
//fifo
localparam fifo_lg_size = 4;
localparam FifoSize = 1<<fifo_lg_size;

/////////////////////////////////////
//communicator table
localparam CommTableWidth = (lg_numprocs+2)*DstWidth + lg_numprocs*2+2;
localparam CommTableSize = 4;
localparam lgCommSizePos = lg_numprocs*DstWidth;
localparam CommChildrenPos = lgCommSizePos+lg_numprocs+1;
localparam LocalRankPos = CommChildrenPos + lg_numprocs;
localparam RootPos = LocalRankPos+DstWidth;
localparam NewCommWidth = CommTableWidth+ContextIdWidth;

////////////////////////////////////
//algorithmic opcodes
localparam Scan = 4'b0011;
localparam AlltoAll = 4'b0100;
localparam LargeBcast = 4'b0101;
localparam MediumBcast = 4'b0110;
localparam ShortBcast = 4'b0111;
localparam Scatter = 4'b1000;
localparam LargeAllGather = 4'b1001;
localparam ShortAllGather = 4'b1010;
localparam Gather = 4'b1011;
localparam ShortReduce = 4'b1100;
localparam LargeReduce = 4'b1101;
localparam ShortAllReduce = 4'b1110;
localparam LargeAllReduce = 4'b1111;

////////////////////////////////////
reg[fifo_lg_size-1:0]  rd_ptr, wr_ptr;       
reg[FlitWidth+ChildrenWidth-1:0] buf_mem[FifoSize-1:0];
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
	else if (rd_en && buf_empty)begin
		buf_out <= 0;
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
