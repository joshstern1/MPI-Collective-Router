

module reduce_unit#(
	parameter rank_z = 3'b0,
	parameter rank_y = 3'b0,
	parameter rank_x = 3'b0,
	parameter lg_numprocs = 4,
	parameter PayloadWidth = 64,
	parameter ReductionTableSize = 32
)
(
	input clk,
	input	rst,
	input [FlitWidth+ChildrenWidth-1:0]packetA,
	input [12:0]fifo_counter,
	input buf_empty,
	input buf_full,
	output rd_en, 
	output wr_en,
	output valid_out,
	output reg done,
	output[FlitWidth-1:0]Outpacket
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

///////////////////////////////////////

wire [TagWidth-1:0]packetIndex;
wire [ChildrenWidth-1:0]children_count;
wire reductiontype;
wire[ReductionTableWidth-1:0] reduction_table_entry;
wire [WaitWidth-1:0]WaitCount;
wire [PayloadWidth-1:0] dataC;
wire [PayloadWidth-1:0] sum;//, product;

reg [8:0]counter;
//reg done;
reg [ReductionTableSize-1:0]done_index;
reg[ReductionTableWidth-1:0] reduction_table[ReductionTableSize-1:0];
reg [ReductionTableSize-1:0]i;
reg [ReductionTableSize-1:0]j;
reg [ReductionTableSize-1:0]k;


assign rd_en = (reduction_table[packetIndex][ExtraWaitPos]==0);
assign wr_en = 1'b1;


assign packetIndex = packetA[TagPos+TagWidth-1:TagPos]; //have to eventually change this
/*
IMPORTANT NOTE: Recall that the final router would have separate reduction units for local data and outgoing data, meaning that you don't
have to worry about overlapping tags between data that is destined for me and data that is destined for someone else.
Therefore, for data destined for me, I dont have to do any changing of the tags.
However, for data going elsewhere, remember that in a recursive doubling, I have to send data to multiple destinations.
So these multiples of data must have different tags because they will have different children counts. So once a packet enters the 
reduction unit, you must change the location of where in the table you will put it. For now, it is easy to change the table index 
to whatever the destination is. Keep in mind that we are not chaning the tag within the packet, but just changing where it 
is being stored in the table. 
*/
assign children_count = packetA[ChildrenPos+ChildrenWidth-1:ChildrenPos];
assign reductiontype = (packetA[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(packetA[ValidBitPos]);
assign WaitCount = reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos];

//ip core that performs floating point single precision addition. dont forget to make this double precision if possible
adder A1(
  .dataa({reduction_table[packetIndex][PayloadWidth-1:0]}),
  .datab({packetA[PayloadWidth-1:0]}),
  .clock(clk),
  .result(sum)
);

/*multiplier M1(
  .a(reduction_table[packetIndex][63:0]),
  .b(packetA[63:0]),
  .clk(clk),
  .p(product)
);*/

/* the following assignment statements are responsible for creating the output packet.
they combine the results of the reduction table such as the payload, destination, etc.
dataC is just used for simulation and analysis. */
assign reduction_table_entry = reduction_table[done_index];
assign Outpacket[PayloadWidth-1:0] = reduction_table_entry[PayloadWidth-1:0];

//switch to gathering for long reduce
assign Outpacket[opPos+opWidth-1:opPos] = reduction_table_entry[opPos+opWidth-1:opPos];
assign Outpacket[AlgTypePos+AlgTypeWidth-1:AlgTypePos] = 0;
assign Outpacket[DstPos+DstWidth-1:TagPos] = reduction_table_entry[DstPos+DstWidth-1:TagPos];
assign Outpacket[ValidBitPos] = done;
assign dataC = Outpacket[PayloadWidth-1:0];
assign valid_out = !rst; //change this

/* below is the logic for the reduction table.  every instruction is nonblocking and
changes on the positive edge of the clock. */


always@(posedge clk) begin
  /* if the rst is set, set everything in the reduction table to 0.
  the rst must always be set and then turned off before any reductions
  can take place. */
   if (rst)begin	
		for(k=0;k<ReductionTableSize;k=k+1)begin
			reduction_table[k]<=82'b0;
		end		
		counter<=0;
		done<=0;
		done_index<=0;		
   end
   
	else begin//else if the rst is not set
	  //counter is just used for startup period and is used by write enable signal to fifo
		if((counter>=0)&&(counter<=AdderLatency+2))begin
			counter<=counter+1;
		end     
  
   /* if the incoming packet is to be placed in a reduction table slot that is either empty or invalid,
  the parameters of the incoming packet (packetA) are placed in its table slot. */
  
		if (reductiontype && (reduction_table[packetIndex][ValidBitPos]==0))begin //if slot is empty
			reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]<=children_count+1;
			reduction_table[packetIndex][ValidBitPos:0]<= packetA[ValidBitPos:0];//1;
			//reduction_table[packetIndex][ReductionBitPos:0] <= packetA[ReductionBitPos:0];
			
			/* if the reduction requires 0 children, then we set the LeafBit to 1 which indicates a special
			case (that being 0 children), this leafbit will be used later */
			if(children_count == 0)begin
			 reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] <= AdderLatency-1;
			 reduction_table[packetIndex][ExtraWaitPos]<=1;
			 reduction_table[packetIndex][LeafBitPos]<=1;
			end
		end
  
  /* if a reduction was just completed, then that reduction's corresponding reduction table slot must
  be cleared. */
		if (done)begin
			//reduction_table[done_index][ValidBitPos]<=0;
			if (reductiontype)begin
    /*
    if the incoming packet needs to be placed in the same reduction table slot as the reduction
    operation that was just completed, then the valid bit is set and the contents of the incoming
    packet are copied into the reduction table.
    */
				if (done_index==packetIndex)begin
					reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]<=children_count+1;
					reduction_table[packetIndex][ValidBitPos:0]<= packetA[ValidBitPos:0];//1;
					//reduction_table[packetIndex][ReductionBitPos:0] <= packetA[ReductionBitPos:0];
							
					/* if the reduction requires 0 children, then we set the LeafBit to 1 which indicates a special
					case (that being 0 children), this leafbit will be used later */
					if(children_count == 0)begin
					 reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] <= AdderLatency-1;
					 reduction_table[packetIndex][ExtraWaitPos]<=1;
					 reduction_table[packetIndex][LeafBitPos]<=1;
					end
				end
   
   
				//if incoming packet needs to be placed in a different slot than the reduction that was just completed
				else if (done_index!=packetIndex)begin
					reduction_table[done_index]<=82'b0; //clear out reduction table slot that just completed
     
     /*
     check to make sure that the incoming packet to the reduction table was not already received.  if the incoming
     packet has the same index and src, then it should not be copied into the table.  if it is a new packet, copy its
     contents into the reduction table
     */
				  
				  if(reduction_table[packetIndex][ValidBitPos])	begin
						reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos] <= reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]-1;
						reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] <= AdderLatency-1;
						reduction_table[packetIndex][ExtraWaitPos]<=1;
				  end

				  
				end //end if different slot
				
			end //end if reductiontype
			done<=0; //turn off the ready signal
		end //end if done
   
   
	  /* else if the incoming packet is going into a valid and existing table index and a reduction operation
	  was not just completed and the incoming packet is not a repeat, update and start waiting */
	   
		else if((reductiontype) && (reduction_table[packetIndex][ValidBitPos])) begin
			reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] <= AdderLatency-1;
			reduction_table[packetIndex][ExtraWaitPos]<=1;
			if(reduction_table[packetIndex][ExtraWaitPos]==0)begin
				reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos] <= reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]-1;
			end
		end
  
  
  /* the following loop checks all reduction table entry to see if their wait count has fallen to 0,
  meaning the reduction table entry's corresponding ip core output is ready to be copied into
  the reduction table.  A mux is used with the op input serving as the select variable.
  so far, this module supports addition, multiplication, maximum, minimum, logical or,
  logical and, bitwise and, bitwise or.  every ip core produces a result, but only one
  is copied into the reduction table. */
  
  for(i=0;i<ReductionTableSize;i=i+1)begin  
   if ((reduction_table[i][WaitPos+WaitWidth-1:WaitPos]==0)&&(reduction_table[i][ValidBitPos]==1)&&(reduction_table[i][ExtraWaitPos]==1))begin
     if((reduction_table[i][LeafBitPos]==0)&&(counter>AdderLatency))begin
      case(reduction_table[i][opPos+opWidth-1:opPos])
      2'b00: reduction_table[i][PayloadWidth-1:0] <= sum;
		//2'b01: reduction_table[i][PayloadWidth-1:0] <= product;
      endcase
		reduction_table[i][PayloadWidth-1:0] <= sum;
     end
     reduction_table[i][ExtraWaitPos]<=0;
     reduction_table[i][LeafBitPos]<=0;
    
    /* if any of the reduction table entries has received data from all of their children,
    once they have their alu output, the reduction is completed and ready to be sent
    to the next node, or to the host.  The done_index signal is used to record which
    reduction table entry is completed.  On any given cycle, only one reduction
    table entry can be ready to be sent out. */
    
	  if(((reduction_table[i][ChildrenPos+ChildrenWidth-1:ChildrenPos] == 1))&&!(done && done_index==i))begin
		done<=1;
		done_index<=i;
		reduction_table[i][ValidBitPos]<=0;
	  end
   end //end if condition
  end //end for loop

  
  /* the following for loop is used to decrementing the wait counts in all of the reduction table entries.
  if the wait count is greater than 0, decrement it by 1.  We have a special case for the reduction
  table entry that is currently receiving a packet, because we only want to decrement its wait count
  after it is properly set. */
 
  for(j=0;j<ReductionTableSize;j=j+1)begin
   if((reduction_table[j][WaitWidth+WaitPos-1:WaitPos]>0) && (j != packetIndex)) begin
    reduction_table[j][WaitWidth+WaitPos-1:WaitPos] <= reduction_table[j][WaitWidth+WaitPos-1:WaitPos] - 1;
   end
  end
  
  if((reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos]>0)&&(reduction_table[packetIndex][ExtraWaitPos]==1)) begin
	reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] <= reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] - 1;
  end
  
  
 end //end if !rst
 
end  //end always

endmodule
 
 
