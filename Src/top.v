`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Boston University Computer Architecture and Automated Design Lab
// Joshua Stern

/*
	*| 72  |71-69|68-66|65-63|62-60|59-57|56-54|  53-46  |45-38| 37-36 |35-32| 31-0  |     	
	*|valid|dst_z|dst_y|dst_x|src_z|src_y|src_x|contextId| tag |algtype| op  |payload|
 
inside the fifo
	
	*| 75-73  | 72  |71-69|68-66|65-63|62-60|59-57|56-54|  53-46  |45-38| 37-36 |35-32| 31-0  |     	
	*|children|valid|dst_z|dst_y|dst_x|src_z|src_y|src_x|contextId| tag |algtype| op  |payload|

//reduction table entry 
 
	*|   81  |     80     |  79-76  | 75-73  | 72  |71-69|68-66|65-63|62-60|59-57|56-54|  53-46  |45-38| 37-36 |35-32| 31-0  |     	
	*|LeafBit|ExtraWaitBit|waitcount|children|valid|dst_z|dst_y|dst_x|src_z|src_y|src_x|contextId| tag |algtype| op  |payload|
	
//leaf bit is for if the operation's children count == 0, because then the input is also the output 
//extra bit/counting down is 1 if the wait count was ever set to the proper latency
/////////////////////////////////////////////////////////////////////////////////*/

module top(Outpacket, done, valid_out, clk, rst, valid_in, dst_z, dst_y, dst_x, src_z, src_y, src_x, contextId, tag, algtype, op, payload);

parameter rank = 9'b0;
parameter root = 9'b0;
parameter rank_z = 3'b000;
parameter rank_y = 3'b000;
parameter rank_x = 3'b000;
parameter root_z = 3'b000;
parameter root_y = 3'b000;
parameter root_x = 3'b000;

parameter Comm_world_size = 8;

parameter FlitWidth = 73;
parameter PayloadWidth=32;
parameter opPos = 32;
parameter opWidth = 4;
parameter AlgTypePos = 36;
parameter AlgTypeWidth = 2;
parameter TagPos=38;
parameter TagWidth = 8;
parameter ContextIdPos = 46;
parameter ContextIdWidth = 8;
parameter Src_XPos = 54;
parameter Src_YPos = 57;
parameter Src_ZPos = 60;
parameter Src_XWidth = 3;
parameter Src_YWidth = 3;
parameter Src_ZWidth = 3;
parameter Dst_XPos = 63;
parameter Dst_YPos = 66;
parameter Dst_ZPos = 69;
parameter Dst_XWidth = 3;
parameter Dst_YWidth = 3;
parameter Dst_ZWidth = 3;
parameter SrcPos = 54;
parameter SrcWidth = 9;
parameter DstPos = 63;
parameter DstWidth = 9;
parameter ValidBitPos = 72;

parameter ReductionTableWidth = 82;
parameter ReductionTableSize = 2;
parameter AdderLatency = 14;

parameter ReductionBitPos=35;

parameter ChildrenPos=73;
parameter ChildrenWidth=3;
parameter WaitPos = 76;
parameter WaitWidth = 4;
parameter ExtraWaitPos=80;
parameter LeafBitPos=81;

input clk;
input rst;
input [PayloadWidth-1:0]payload;
input [opWidth-1:0] op;
input [AlgTypeWidth-1:0] algtype;
input [TagWidth-1:0] tag;
input [ContextIdWidth-1:0] contextId;
input [Src_XWidth-1:0] src_x, src_y, src_z;
input [Dst_XWidth-1:0] dst_x, dst_y, dst_z;
input valid_in;
output valid_out;
output done;
output[FlitWidth-1:0]Outpacket;


//packeter
wire [FlitWidth-1:0]packeterOut;
wire buf_empty;
wire buf_full;

//instr
wire [FlitWidth+ChildrenWidth-1:0]instr_out;

//fifo
wire [12:0]fifo_counter;
wire rd_en;
wire wr_en;

//reduction unit
wire [FlitWidth+ChildrenWidth-1:0]packetA;
wire [TagWidth-1:0]packetIndex;
wire [ChildrenWidth-1:0]children_count;
wire reductiontype;
wire[ReductionTableWidth-1:0] reduction_table_entry;
wire [WaitWidth-1:0]WaitCount;
wire [PayloadWidth-1:0] dataC;
wire [PayloadWidth-1:0] sum;

reg [8:0]counter;
reg done;
reg done_index;
reg[ReductionTableWidth-1:0] reduction_table[ReductionTableSize-1:0];
reg [ReductionTableSize-1:0]i;
reg [ReductionTableSize-1:0]j;
reg [ReductionTableSize-1:0]k;


assign rd_en = (reduction_table[packetIndex][ExtraWaitPos]==0);
assign wr_en = 1'b1;

packeter P1 (
 .packeterOut(packeterOut),
 .payload(payload),
 .op(op),
 .algtype(algtype),
 .tag(tag),
 .contextId(contextId),
 .src_x(src_x),
 .src_y(src_y),
 .src_z(src_z),
 .dst_x(dst_x),
 .dst_y(dst_y),
 .dst_z(dst_z),
 .valid(valid_in)
);
 
reduce_instr R1 (
 .packetOut(instr_out),
 .packetIn(packeterOut),
 .clk(clk),
 .rst(rst)
);


fifo F1 (
 .clk(clk),
 .rst(rst),
 .buf_in(instr_out),
 .buf_out(packetA),
 .wr_en(wr_en),
 .rd_en(rd_en),
 .buf_empty(buf_empty),
 .buf_full(buf_full),
 .fifo_counter(fifo_counter)
);

assign packetIndex = packetA[TagPos+TagWidth-1:TagPos];
assign children_count = packetA[ChildrenPos+ChildrenWidth-1:ChildrenPos];
assign reductiontype = packetA[ReductionBitPos];
assign WaitCount = reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos];

//ip core that performs floating point single precision addition. dont forget to make this double precision if possible
addy A1(
  .a(reduction_table[packetIndex][PayloadWidth-1:0]),
  .b(packetA[PayloadWidth-1:0]),
  .clk(clk),
  .s(sum)
);

/* the following assignment statements are responsible for creating the output packet.
they combine the results of the reduction table such as the payload, destination, etc.
dataC is just used for simulation and analysis. */
assign reduction_table_entry = reduction_table[done_index];
assign Outpacket[ContextIdPos+ContextIdWidth-1:0] = reduction_table_entry[ContextIdPos+ContextIdWidth-1:0];
assign Outpacket[SrcPos+SrcWidth-1:SrcPos] = rank;	//only if outgoing unit, if local unit, keep the src the same
assign Outpacket[DstPos+DstWidth-1:DstPos] = reduction_table_entry[DstPos+DstWidth-1:DstPos];
assign Outpacket[ValidBitPos] = 1;
assign dataC = Outpacket[PayloadWidth-1:0];
assign valid_out = 1'b1;

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
  
		if (reductiontype && (reduction_table[packetIndex][ValidBitPos] ==0 ))begin //if slot is empty
			reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]<=children_count+1;
			reduction_table[packetIndex][ValidBitPos]<=1;
			reduction_table[packetIndex][ReductionBitPos:0] <= packetA[ReductionBitPos:0];
			
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
					reduction_table[packetIndex][ValidBitPos]<=1;
					reduction_table[packetIndex][ReductionBitPos:0] <= packetA[ReductionBitPos:0];
					
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
				  
				  if((reductiontype) && (reduction_table[packetIndex][ValidBitPos]))	begin
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
      4'b1111: reduction_table[i][PayloadWidth-1:0] <= sum;
      endcase
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

