`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Boston University Computer Architecture and Automated Design Lab
// Engineer: Joshua Stern
//
// Create Date:	18:43:35 06/19/2017
// Design Name:  MPI_FPGA Reduction
// Module Name:	top_mod
// Project Name:  Offloading MPI to FPGAs 
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//

//inside the router, packeter, and reduce_instruction core
/*
	*|63   	|62       	| 61-59  |58-56   |55-52  	|51-50   |49-46|45-43   |42-40|39-37|36-32|31-0   |
	*|valid bit|reduction bit|src node|dst node|packet type|alg type|index|commsize|root |rank |op   |payload|
 
inside the fifo
	*|66-64   |63   	|62       	| 61-59  |58-56   |55-52  	|51-50     	|49-46|45-43   |42-40|39-37|36-32|31-0   |
	*|children|valid bit|reduction bit|src node|dst node|packet type|algorithm type|index|commsize|root |rank |op   |payload|

//reduction table entry format
 
	*|72  |71       	|70-67 	|66-64         	|63   	|62       	| 61-59  |58-56   |55-52  	|51-50   |49-46|45-43   |42-40|39-37|36-32|31-0   |
	*|leaf|counting down|wait count|children remaining|valid bit|reduction bit|src node|dst node|packet type|alg type|index|commsize|root |rank |op   |payload|
//leaf bit is for if the operation's children count == 0, because then the input is also the output 
//extra bit/counting down is 1 if the wait count was ever set to the proper latency
/////////////////////////////////////////////////////////////////////////////////*/
module top_mod(dataIn, clk, rst, Outpacket, src, dst, rank, root, op, commsize, algtype, index, done);
input [31:0]dataIn;
input clk;
input rst;
input [4:0] op;
input [3:0] index;
input [2:0] src;
input [2:0] dst;
input [2:0] rank;
input [2:0] root;
input [1:0] algtype;
input [3:0] commsize;
output done;
output[63:0]Outpacket;

parameter DataWidth = 64;
parameter ReductionTableWidth = 73;
parameter ReductionTableSize = 10;
parameter AdderLatency = 14;
parameter PayloadLen=32;
parameter opPos = 32;
parameter opWidth = 5;
parameter RankPos = 37;
parameter RankWidth = 3;
parameter IndexPos=46;
parameter IndexWidth = 4;
parameter PacketTypePos = 52;
parameter PacketTypeWidth = 4;
parameter DstPos = 56;
parameter DstWidth = 3;
parameter SrcPos = 59;
parameter SrcWidth = 3;
parameter ReductionBitPos=62;
parameter ValidBitPos = 63;
parameter ChildrenPos=64;
parameter ChildrenWidth=3;
parameter WaitPos = 67;
parameter WaitWidth = 4;
parameter ExtraWaitPos=71;
parameter LeafBitPos=72;
reg [8:0]counter;
reg done;
reg done_index;
wire [DataWidth+ChildrenWidth-1:0]packetA;
wire [DataWidth-1:0]packeterOut;
wire [ChildrenWidth-1:0]children_count;
reg[ReductionTableWidth-1:0] reduction_table[ReductionTableSize-1:0];
wire[ReductionTableWidth-1:0] reduction_table_entry;
wire reductiontype;
reg [IndexWidth-1:0] reduction_table_index;
wire [PayloadLen-1:0] dataC;//used for simulation and analysis
wire [PayloadLen-1:0] sum;
wire [PayloadLen-1:0] product;
wire [PayloadLen-1:0] finalmax;
wire [PayloadLen-1:0] finalmin;
wire [31:0] logic_or_out;
wire [31:0] logic_and_out;
wire [31:0] bit_or_out;
wire [31:0] bit_and_out;
wire [31:0] l_or_out;
wire [31:0] l_and_out;
wire [31:0] b_or_out;
wire [31:0] b_and_out;
wire maxresult ;
wire buf_empty;
wire buf_full;
wire [4:0]fifo_counter;
wire [WaitWidth-1:0]lock;
wire [WaitWidth-1:0]spy_lock;
wire rd_en;
wire wr_en;
wire [DataWidth+ChildrenWidth-1:0]nextPacket;
wire [DataWidth+ChildrenWidth-1:0]instr_out;
wire spec_lock;
wire [IndexWidth-1:0]packetIndex;
wire [SrcWidth-1:0]packetSrc;
wire [IndexWidth-1:0]nextIndex;
wire [WaitWidth-1:0]WaitCount;
reg [ReductionTableSize-1:0]i;
reg [ReductionTableSize-1:0]j;
reg [ReductionTableSize-1:0]k;
/*
these locks determine read enable signal.  They look at the incoming packet and see if the reduction table
is ready to accept it
*/
assign lock = WaitCount;
assign spy_lock = (nextPacket==0)? lock: ((nextIndex == packetIndex)? lock : ((reduction_table[nextIndex][WaitPos+WaitWidth-1:WaitPos]==0)? 0: 1));
assign spec_lock = ((children_count == 0) && ((nextIndex==packetIndex)||(nextPacket==0))
       &&(packetA[DataWidth-1:0]!=0)&&  !((WaitCount==0)&&
       (reduction_table[packetIndex][ValidBitPos]==1)))||(done && (done_index==packetIndex)) ;
assign rd_en = (spec_lock==1)?0:((spy_lock>0)? 0:1);

//write enable signal just needs to wait for a small startup period
assign wr_en = (counter<(AdderLatency+3))?1:0;

/*
packeter module that is just used for simulation and testing
it just packets the inputs together, but this will be done in software
in the final design
*/
packeter P1 (
 .packeterOut(packeterOut),
 .dataIn(dataIn),
 .op(op),
 .commsize(commsize),
 .rank(rank),
 .root(root),
 .index(index),
 .algtype(algtype),
 .src(src),
 .dst(dst)
);

 
/*
reduce_instr module makes the algorithmic decisions for the reduction.
it determines the number of children for each reduction and where to
send the final result
*/ 
reduce_instr R1 (
 .packetOut(instr_out),
 .packetIn(packeterOut),
 .clk(clk),
 .rst(rst)
);

/*
this fifo is just used to buffer inputs before they go to the reduction table.
the outputs of the reduce_instr module are sent directly into the fifo.
*/
fifo F1 (
 .clk(clk),
 .rst(rst),
 .buf_in(instr_out),
 .buf_out(packetA),
 .wr_en(wr_en),
 .rd_en(rd_en),
 .buf_empty(buf_empty),
 .buf_full(buf_full),
 .fifo_counter(fifo_counter),
 .nextPacket(nextPacket)
);
/*
the following assingment statements are responsible for preparing temporary
wires that will be used to reduce the amount of unnecessary syntax
*/
assign packetIndex = packetA[IndexPos+IndexWidth-1:IndexPos];
assign packetSrc = packetA[SrcWidth+SrcPos-1:SrcPos];
assign children_count = packetA[ChildrenPos+ChildrenWidth-1:ChildrenPos];
assign reductiontype = packetA[ReductionBitPos];
assign nextIndex = nextPacket[IndexPos+IndexWidth-1:IndexPos];
assign WaitCount = reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos];

/*
altera ip core that performs floating point single precision addition.
fully pipelined
*/
add A1(
  .a(reduction_table[packetIndex][PayloadLen-1:0]),
  .b(packetA[PayloadLen-1:0]),
  .clk(clk),
  .s(sum)
);

/*
altera ip core that performs floating point single precision multiplicaton
fully pipelined
*/
multiply M1(
  .a(reduction_table[packetIndex][PayloadLen-1:0]),
  .b(packetA[PayloadLen-1:0]),
  .clk(clk),
  .p(product)
);
/*wire [31:0]temp;
wire [31:0]temp2;
assign temp2 = (packetA[PayloadLen-1:0]==6)? 31'b01000000100000000000000000000000:31'b0;
assign temp = (packetA[PayloadLen-1:0]==6)? 31'b01000001100000000000000000000000:31'b0;
max MA1(
  .a(temp),
  .b(temp2),
  .clk(clk),
  .result(maxresult)
);
*/

/*
altera ip core that performs max and min operations.  the results are passed to a shift register
in order to create a pipeline with the same length as the other ip cores
*/
max MA1(
  .a(reduction_table[packetIndex][PayloadLen-1:0]),
  .b(packetA[PayloadLen-1:0]),
  .clk(clk),
  .result(maxresult)
);

/*
the shift module is just a shift register for the outputs of the max/min ip core.
it takes the inputs and results of the max/min ip core and outputs the max and min.
essentially creates a pipeline to hold the results until the other operations in the
other ip cores have completed
*/
shift S1(
 .max(finalmax),
 .min(finalmin),
 .A(reduction_table[packetIndex][PayloadLen-1:0]),
 .B(packetA[PayloadLen-1:0]),
 .C(maxresult),
 .clk(clk),
 .rst(rst)
);

/*
the following ip core performs a logic or-ing of the two inputs.
the results are passed to a pipeline shifter.
*/
logical_or LO1(
 .C(l_or_out),
 .A(reduction_table[packetIndex][PayloadLen-1:0]),
 .B(packetA[PayloadLen-1:0]),
 .clk(clk),
 .rst(rst)
);

/*
the following ip core performs a logic and-ing of the two inputs.
the results are passed to a pipeline shifter.
*/
logical_and LA1(
 .C(l_and_out),
 .A(reduction_table[packetIndex][PayloadLen-1:0]),
 .B(packetA[PayloadLen-1:0]),
 .clk(clk),
 .rst(rst)
);

/*
the following ip core performs a bitwise or-ing of the two inputs.
the results are passed to a pipeline shifter.
*/
bitwise_or BO1(
 .C(b_or_out),
 .A(reduction_table[packetIndex][PayloadLen-1:0]),
 .B(packetA[PayloadLen-1:0]),
 .clk(clk),
 .rst(rst)
);

/*
the following ip core performs a bitwise and-ing of the two inputs.
the results are passed to a pipeline shifter.
*/
bitwise_and BA1(
 .C(b_and_out),
 .A(reduction_table[packetIndex][PayloadLen-1:0]),
 .B(packetA[PayloadLen-1:0]),
 .clk(clk),
 .rst(rst)
);

/*
the following four pipeline shifters correspond to the previous logical/bitwise
or-ers/adders.  The results of those modules are passed into these shifters which
create a pipeline to hold onto the results until the operations with longer pipelines
can be completed.
*/
pipeline_shift PSLO1(
 .C(logic_or_out),
 .A(l_or_out),
 .clk(clk),
 .rst(rst)
);
pipeline_shift PSLA1(
 .C(logic_and_out),
 .A(l_and_out),
 .clk(clk),
 .rst(rst)
);
pipeline_shift PSBO1(
 .C(bit_or_out),
 .A(b_or_out),
 .clk(clk),
 .rst(rst)
);
pipeline_shift PSBA1(
 .C(bit_and_out),
 .A(b_and_out),
 .clk(clk),
 .rst(rst)
);

/*
the following assignment statements are responsible for creating the output packet.
they combine the results of the reduction table such as the payload, destination, etc.
dataC is just used for simulation and analysis.  It is not needed in the final design.
*/
assign reduction_table_entry= reduction_table[done_index];
assign Outpacket[ValidBitPos] = 1;
assign Outpacket[ReductionBitPos] = 1;
assign Outpacket[DstPos+DstWidth-1:0] = reduction_table_entry[DstPos+DstWidth-1:0];
assign Outpacket[SrcPos+SrcWidth-1:SrcPos] = reduction_table_entry[RankPos+RankWidth-1:RankPos];
assign dataC = Outpacket[PayloadLen-1:0];

/*
below is the logic for the reduction table.  every instruction is nonblocking and
changes on the positive edge of the clock.
*/


always@(posedge clk) begin
  /*
  if the rst is set, set everything in the reduction table to 0.
  the rst must always be set and then turned off before any reductions
  can take place.
  */
   if (rst)begin
     for(k=0;k<ReductionTableSize;k=k+1)
   begin
   reduction_table[k]<=0;
   end
   counter<=0;
   done<=0;
   done_index<=0;
   end
   else //else if the rst is not set
   begin
  //counter is just used for startup period and is used by write enable signal to fifo
   if((counter>=0)&&(counter<=AdderLatency+2))
   begin
   counter<=counter+1;
   end
     
  
   /*
  if the incoming packet is to be placed in a reduction table slot that is either empty or invalid,
  the parameters of the incoming packet (packetA) are placed in its table slot.
   */
  
   if (reductiontype && (reduction_table[packetIndex][ValidBitPos] ==0 ))
   begin
   reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]<=children_count+1;
   reduction_table[packetIndex][ValidBitPos]<=1;
   reduction_table[packetIndex][ReductionBitPos:0] <= packetA[ReductionBitPos:0];
   if(children_count == 0)
   begin
    /*
    if the reduction requires 0 children, then we set the LeafBit to 1 which indicates a special
    case (that being 0 children).  this leafbit will be used later
    */
    reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] <= AdderLatency-1;
    reduction_table[packetIndex][ExtraWaitPos]<=1;
    reduction_table[packetIndex][LeafBitPos]<=1;
   end
  end
  
  /*
  if a reduction was just completed, then that reduction's corresponding reduction table slot must
  be cleared. 
  */
   if (done)begin
   reduction_table[done_index][ValidBitPos]<=0;
   if (reductiontype)
   begin
    /*
    if the incoming packet needs to be placed in the same reduction table slot as the reduction
    operation that was just completed, then the valid bit is set and the contents of the incoming
    packet are copied into the reduction table.
    */
    if (done_index==packetIndex)
    begin
      reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]<=children_count+1;
      reduction_table[packetIndex][ValidBitPos]<=1;
      reduction_table[packetIndex][ReductionBitPos:0] <= packetA[ReductionBitPos:0];
      if(children_count == 0)
      begin
      /*
      if the reduction requires 0 children, then we set the LeafBit to 1 which indicates a special
      case (that being 0 children).  this leafbit will be used later
      */
       reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] <= AdderLatency-1;
       reduction_table[packetIndex][ExtraWaitPos]<=1;
       reduction_table[packetIndex][LeafBitPos]<=1;
      end
    end
   
   
    //if the incoming packet needs to be placed in a different slot than the reduction that was just completed
    else if (done_index!=packetIndex) 
    begin
     reduction_table[done_index]<=0;
     
     /*
     check to make sure that the incoming packet to the reduction table was not already received.  if the incoming
     packet has the same index and src, then it should not be copied into the table.  if it is a new packet, copy its
     contents into the reduction table
     */
     if(reductiontype && !((reduction_table[packetIndex][SrcPos+SrcWidth-1:SrcPos] == packetSrc) &&
     (reduction_table_index==packetIndex))  && (reduction_table[packetIndex][ValidBitPos] ==1))
     begin
       reduction_table[packetIndex][SrcPos+SrcWidth-1:SrcPos] <= packetSrc;
       reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos] <= reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]-1;
     end
     
     /*
     the WaitCount is used as a countdown.  each reduction table slot has a WaitCount.  Because the ip core operations
     take several cycles, the reduction table entries must wait out these cycles until their outputs are ready.
     the wait count is initially set to the latency of these ip cores.  The extrawait bit is used to tell
     if the waitcount was ever used.
     */
     
     if(WaitCount==0)
     begin
       reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] <= AdderLatency-1;
       reduction_table[packetIndex][ExtraWaitPos]<=1;
     end
    end
   end
   done<=0; //turn off the ready signal
  end   
   
   
  /*
  else if the incoming packet is not going into an empty/invalid table index and a reduction operation
  was not just completed and the incoming packet is not a repeat, copy the parameters of the incoming packet
  into the reduction table
  */
   
   else if(reductiontype && !((reduction_table[packetIndex][SrcPos+SrcWidth-1:SrcPos] == packetSrc) &&
   (reduction_table_index==packetIndex))  && (reduction_table[packetIndex][ValidBitPos] ==1))
   begin
   	reduction_table[packetIndex][SrcPos+SrcWidth-1:SrcPos] <= packetSrc;
 	reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos] <= reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]-1;
   reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos] <= AdderLatency-1;
   reduction_table[packetIndex][ExtraWaitPos]<=1;
  end
  
  
  reduction_table_index<=packetIndex;
  
  
  /*
  the following logic is used for a special case.  When a reduction table entry receives its first packet
  in a reduction operation, the waitcount must be set to 1 so that is not immediately overwritten by
  the next incoming packet.
  */
  
  if(reductiontype)
  begin
  if(((packetA[DataWidth-1:0] != 0)&&(reduction_table[packetIndex][DataWidth-1:0]==0))||
   ((WaitCount==0)&&(packetA[ValidBitPos]==1))||
   ((WaitCount==0) && (reduction_table[packetIndex][ExtraWaitPos]==1)))
   begin
    if(!((children_count==0)||(reduction_table[packetIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]==1)))
    begin
     reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos]<=1;
    end
  end
  end
  
  
  /*
  the following logic is a continuation of the previous special case logic.  If a reduction
  table index receives its first packet but it still under threat to be overwritten, the
  wait count must be set to 1.
  */
  
  if(nextPacket[ReductionBitPos])
  begin
  if(nextIndex!=packetIndex)
  begin
   if((nextPacket[DataWidth-1:0]!=0)&&(reduction_table[nextIndex][ValidBitPos]==1)&&
   (reduction_table[nextIndex][WaitPos+WaitWidth-1:WaitPos]==0))
   begin
    if(!((nextPacket[ChildrenPos+ChildrenWidth-1:ChildrenPos]==0)||(reduction_table[nextIndex][ChildrenPos+ChildrenWidth-1:ChildrenPos]==1)))
    begin
     reduction_table[nextIndex][WaitPos+WaitWidth-1:WaitPos]<=1;
    end
   end
  end
  end
  
  
  /*
  the following loop checks all reduction table entry to see if their wait count has fallen to 0,
  meaning the reduction table entry's corresponding ip core output is ready to be copied into
  the reduction table.  A mux is used with the op input serving as the select variable.
  so far, this module supports addition, multiplication, maximum, minimum, logical or,
  logical and, bitwise and, bitwise or.  every ip core produces a result, but only one
  is copied into the reduction table.
  */
  
  for(i=0;i<ReductionTableSize;i=i+1)
  begin  
   if ((reduction_table[i][WaitPos+WaitWidth-1:WaitPos]==0)&&(reduction_table[i][ValidBitPos]==1))
   begin
    if((reduction_table[i][ExtraWaitPos]==1)&&(counter>AdderLatency))
    begin
     if(reduction_table[i][LeafBitPos]==0)
     begin
      case(reduction_table[i][opPos+opWidth-1:opPos])
      5'b00000: reduction_table[i][PayloadLen-1:0] <= sum;
      5'b00001: reduction_table[i][PayloadLen-1:0] <= product;
      5'b00010: reduction_table[i][PayloadLen-1:0] <= finalmax;
      5'b00011: reduction_table[i][PayloadLen-1:0] <= finalmin;
      5'b00100: reduction_table[i][PayloadLen-1:0] <= logic_or_out;
      5'b00101: reduction_table[i][PayloadLen-1:0] <= logic_and_out;
      5'b00110: reduction_table[i][PayloadLen-1:0] <= bit_or_out;
      5'b00111: reduction_table[i][PayloadLen-1:0] <= bit_and_out;
      endcase
     end
     reduction_table[i][ExtraWaitPos]<=0;
     reduction_table[i][LeafBitPos]<=0;
    end
    
    /*
    if any of the reduction table entries has received data from all of their children,
    once they have their alu output, the reduction is completed and ready to be sent
    to the next node, or to the host.  The done_index signal is used to record which
    reduction table entry is completed.  On any given cycle, only one reduction
    table entry can be ready to be sent out.
    */
    
    if(((reduction_table[i][ChildrenPos+ChildrenWidth-1:ChildrenPos] == 1))&&!(done && done_index==i))
    begin
     done<=1;
     done_index<=i;
    end
   end   
  end
  
  /*
  the following for loop is used to decrementing the wait counts in all of the reduction table entries.
  if the wait count is greater than 0, decrement it by 1.  We have a special case for the reduction
  table entry that is currently receiving a packet, because we only want to decrement its wait count
  after it is properly set.
  */
 
  for(j=0;j<ReductionTableSize;j=j+1)
  begin
   if((reduction_table[j][WaitWidth+WaitPos-1:WaitPos]>0) && (j != packetIndex)) begin
    reduction_table[j][WaitWidth+WaitPos-1:WaitPos] <= reduction_table[j][WaitWidth+WaitPos-1:WaitPos] - 1;
   end
  end
  
  
  if (!((reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos]==1) && (reduction_table[packetIndex][ExtraWaitPos]==0))) begin
   if(reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos]>0) begin
    reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos]<=reduction_table[packetIndex][WaitPos+WaitWidth-1:WaitPos]-1;
   end
  end 
  
  
 end //end if !rst
 
end  //end always

endmodule

