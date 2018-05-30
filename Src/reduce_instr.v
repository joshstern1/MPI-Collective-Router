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

module reduce_instr(packetOut, packetIn, clk, rst);

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

parameter ChildrenPos=73;
parameter ChildrenWidth=3;

parameter lg_numprocs = 3;
parameter num_procs = 1 << lg_numprocs;

input [FlitWidth-1:0] packetIn;
input clk, rst;
output [FlitWidth+ChildrenWidth-1:0] packetOut;


reg [PayloadWidth-1:0]payload;
reg [opWidth-1:0]op;
reg [AlgTypeWidth-1:0] algtype;
reg [TagWidth-1:0]tag;
reg [ContextIdWidth-1:0]contextId;
reg [Src_XPos-1:0] src_x, src_y, src_z;
reg [Dst_XPos-1:0] dst_x, dst_y, dst_z;
reg valid;
reg [ChildrenWidth-1:0]children;

reg [num_procs-1:0] rank_table [SrcWidth-1:0];	//rank table matches ranks to physical address
always @(posedge rst) begin
 rank_table[0] <= {3'b001, 3'b001, 3'b001};
 rank_table[1] <= {3'b001, 3'b001, 3'b000};
 rank_table[2] <= {3'b001, 3'b000, 3'b001};
 rank_table[3] <= {3'b001, 3'b000, 3'b000};
 rank_table[4] <= {3'b000, 3'b001, 3'b001};
 rank_table[5] <= {3'b000, 3'b001, 3'b000};
 rank_table[6] <= {3'b000, 3'b000, 3'b001};
 rank_table[7] <= {3'b000, 3'b000, 3'b000};
 /*
 rank_table[8] <= {3'b001, 3'b001, 3'b010};
 rank_table[9] <= {3'b001, 3'b001, 3'b011};
 rank_table[10] <= {3'b001, 3'b000, 3'b010};
 rank_table[11] <= {3'b001, 3'b000, 3'b011};
 rank_table[12] <= {3'b000, 3'b001, 3'b010};
 rank_table[13] <= {3'b000, 3'b001, 3'b011};
 rank_table[14] <= {3'b000, 3'b000, 3'b010};
 rank_table[15] <= {3'b000, 3'b000, 3'b011};
 rank_table[16] <= {3'b001, 3'b010, 3'b001};
 rank_table[17] <= {3'b001, 3'b010, 3'b000};
 rank_table[18] <= {3'b001, 3'b011, 3'b001};
 rank_table[19] <= {3'b001, 3'b011, 3'b000};
 rank_table[20] <= {3'b000, 3'b010, 3'b001};
 rank_table[21] <= {3'b000, 3'b010, 3'b000};
 rank_table[22] <= {3'b000, 3'b011, 3'b001};
 rank_table[23] <= {3'b000, 3'b011, 3'b000};
 rank_table[24] <= {3'b001, 3'b010, 3'b010};
 rank_table[25] <= {3'b001, 3'b010, 3'b011};
 rank_table[26] <= {3'b001, 3'b011, 3'b010};
 rank_table[27] <= {3'b001, 3'b011, 3'b011};
 rank_table[28] <= {3'b000, 3'b010, 3'b010};
 rank_table[29] <= {3'b000, 3'b010, 3'b011};
 rank_table[30] <= {3'b000, 3'b011, 3'b010};
 rank_table[31] <= {3'b000, 3'b011, 3'b011};
 */
end


//communicator table
parameter CommTableWidth = 27;
parameter CommTableSize = 4;
reg [CommTableSize-1:0]i;

//reduce, recursive halving, recursive doubling, ring, bcast 
reg[CommTableWidth-1:0] comm_table[CommTableSize-1:0];

wire [Dst_XPos-1:0] dst_x_uptree, dst_y_uptree, dst_z_uptree;
wire [Dst_XPos-1:0] dst_x_halving, dst_y_halving, dst_z_halving;
wire [Dst_XPos-1:0] dst_x_doubling, dst_y_doubling, dst_z_doubling;

reg [3:0] send_again;

//leftmost rank is first guy you would send to in recursive halving
assign {dst_x_uptree, dst_y_uptree, dst_x_uptree} = (rank == root)? root : rank_table[comm_table[packetIn[ContextIdPos+ContextIdWidth-1:ContextIdPos]][26:18]];
assign {dst_z_halving, dst_y_halving, dst_x_halving} = rank_table[comm_table[packetIn[ContextIdPos+ContextIdWidth-1:ContextIdPos]][26:18]];
assign {dst_z_doubling, dst_y_doubling, dst_x_doubling} = rank_table[comm_table[packetIn[ContextIdPos+ContextIdWidth-1:ContextIdPos]][8:0]];

always @(posedge clk) begin
  
 if (rst) begin //if rst, set everything to 0
  for(i=0;i<CommTableSize;i=i+1)begin
	comm_table[i]<=27'b0;
  end	
  payload<=0;
  op<=0;
  algtype<=0;
  tag<=0;
  contextId<=0;
  src_x<=0;
  src_y<=0;
  src_z<=0;
  dst_x<=0;
  dst_y<=0;
  dst_z<=0;
  valid<=0;
  children <= num_procs-1;
 end
 
 else begin
 
  children <= lg_numprocs;
  dst_x <= root_x;
  dst_y <= root_y;
  dst_z <= root_z;

 
  payload<=packetIn[PayloadWidth-1:0];
  op<=packetIn[opPos+opWidth-1:opPos];
  algtype<=packetIn[AlgTypePos+AlgTypeWidth-1:AlgTypePos];
  tag<=packetIn[TagPos+TagWidth-1:TagPos];
  contextId<=packetIn[ContextIdPos+ContextIdWidth-1:ContextIdPos];
  src_x<=packetIn[Src_XPos+Src_XWidth-1:Src_XPos];
  src_y<=packetIn[Src_YPos+Src_YWidth-1:Src_YPos];
  src_z<=packetIn[Src_ZPos+Src_ZWidth-1:Src_ZPos];
  valid<=packetIn[ValidBitPos];
  
 end //end else not rst

end //end always

//set the output packet contents to the register values
assign packetOut[PayloadWidth-1:0] = payload;
assign packetOut[opPos+opWidth-1:opPos] = op;
assign packetOut[AlgTypePos+AlgTypeWidth-1:AlgTypePos] = algtype;
assign packetOut[TagPos+TagWidth-1:TagPos] = tag;
assign packetOut[ContextIdPos+ContextIdWidth-1:ContextIdPos] = contextId;
assign packetOut[Src_XPos+Src_XWidth-1:Src_XPos] = src_x;
assign packetOut[Src_YPos+Src_YWidth-1:Src_YPos] = src_y;
assign packetOut[Src_ZPos+Src_ZWidth-1:Src_ZPos] = src_z;
assign packetOut[Dst_XPos+Dst_XWidth-1:Dst_XPos] = dst_x;
assign packetOut[Dst_YPos+Dst_YWidth-1:Dst_YPos] = dst_y;
assign packetOut[Dst_ZPos+Dst_ZWidth-1:Dst_ZPos] = dst_z;
assign packetOut[ValidBitPos] = valid;
assign packetOut[ChildrenPos+ChildrenWidth-1:ChildrenPos] = children;

endmodule



