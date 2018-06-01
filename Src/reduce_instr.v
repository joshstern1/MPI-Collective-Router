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

//communicator table

	*|  42-34   | 33-31  |   30-27   |26-18| 17-9 | 8-0 |     	
	*|local_rank|children|lg_commsize|third|second|first|

/////////////////////////////////////////////////////////////////////////////////*/

module reduce_instr(packetOut, packetIn, clk, rst);

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
reg [RankWidth-1:0]rank;
reg [Src_XPos-1:0] src_x, src_y, src_z;
reg [Dst_XPos-1:0] dst_x, dst_y, dst_z;
reg valid;
reg [ChildrenWidth-1:0]children;

//rank table
reg [num_procs-1:0] rank_table [SrcWidth-1:0];	//rank table matches ranks to physical address
reg [lg_numprocs:0]j;

always @(posedge clk) begin

 if (rst) begin //if rst, set everything to 0
  for(j=0;j<num_procs;j=j+1)begin
	rank_table[j]<=9'b0;
  end	
 end
 
 else begin
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
end

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//communicator table
parameter CommTableWidth = 43;
parameter CommTableSize = 4;
reg[CommTableWidth-1:0] comm_table[CommTableSize-1:0];
reg [CommTableSize-1:0]i;

always @(posedge clk) begin
 if (rst) begin //if rst, set everything to 0
  for(i=0;i<CommTableSize;i=i+1)begin
	comm_table[i]<=43'b0;
  end	
 end 
 else begin
	 comm_table[0] <= {9'b0, 3'b011, 4'b0011, 9'b01, 9'b10, 9'b100};
 end 
end

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//ring and uptree
wire [ContextIdWidth-1:0]context;
wire [lg_numprocs-1:0]lg_commsize;
wire [lg_numprocs-1:0]communicator_children;
wire [TagWidth-1:0]t_tag;
wire [DstWidth-1:0]t_rank;
wire [DstWidth-1:0]local_rank;
wire from_guest;

assign context = packetIn[ContextIdPos+ContextIdWidth-1:ContextIdPos];
assign lg_commsize = comm_table[context][30:27];
assign communicator_children = comm_table[context][33:31];
assign t_tag = packetIn[TagPos+TagWidth-1:TagPos];
assign t_rank = packetIn[RankPos+RankWidth-1:RankPos];
assign local_rank = comm_table[context][42:34];
assign from_guest = ({rank_z, rank_y, rank_x}!=packetIn[SrcPos+SrcWidth-1:SrcPos]);

wire [Dst_XWidth-1:0] dst_x_ring, dst_y_ring, dst_z_ring;
wire [Dst_XWidth-1:0] dst_x_uptree, dst_y_uptree, dst_z_uptree;

assign {dst_x_ring, dst_y_ring, dst_z_ring} = (cur_rank == 3'b111)? root : rank_table[comm_table[context][26:18]];  //ring (long allgather)
assign {dst_x_uptree, dst_y_uptree, dst_z_uptree} = (cur_rank == root)? root : rank_table[comm_table[context][8:0]]; //short reduction, gather, barrier

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//short bcast

reg [Dst_XWidth-1:0] dst_x_bcast, dst_y_bcast, dst_z_bcast;
reg [Dst_XWidth-1:0] dst1, dst2, dst3; //used for testing
reg [lg_numprocs:0] send_again_bcast;
wire [DstWidth:0]bcast_offset;
reg rd_bcast, t_rd_bcast;
wire rd_en_bcast;
reg home_bcast;
reg bcast_need_it;
assign rd_en_bcast = rd_bcast;
assign bcast_offset = ((lg_commsize - communicator_children)+send_again_bcast)*DstWidth;

always @(posedge clk) begin	//bcast
	if(rst) begin
		send_again_bcast = 0;
		rd_bcast = 0;
		t_rd_bcast = 0;
		home_bcast = 0;
		{dst_x_bcast, dst_y_bcast, dst_z_bcast} = 9'b0;
		bcast_need_it <= 0;
	end
	else begin		
		if(send_again_bcast == comm_table[context][33:31]-1) begin
			t_rd_bcast=1;
			send_again_bcast=0;
			home_bcast = (local_rank!=0);
		end
		else begin
			if(packetIn[opPos+opWidth-1:opPos]==4'b1111) begin
				send_again_bcast = (!home_bcast)? send_again_bcast+1 : send_again_bcast;
			end
			home_bcast = 0;
			t_rd_bcast = 0;
		end
		
		bcast_need_it <= home_bcast;
		
		{dst_x_bcast, dst_y_bcast, dst_z_bcast} = (bcast_need_it)? {rank_x, rank_y, rank_z} : comm_table[context][bcast_offset+:DstWidth]; //short broadcast

		case(packetIn[opPos+opWidth-1:opPos])
			4'b1111: {dst1, dst2, dst3} <= {dst_x_bcast, dst_y_bcast, dst_z_bcast};
		endcase	

		rd_bcast <= (local_rank==0)? ({dst_x_bcast, dst_y_bcast, dst_z_bcast} == {rank_x, rank_y, rank_z}) : (t_rd_bcast)?1:local_rank[0];
		
	end
end

///////////////////////////////////////////////////////////////////////////////////////////////////////////
//recursive halving

reg [Dst_XWidth-1:0] dst_x_halving, dst_y_halving, dst_z_halving;
reg [Dst_XWidth-1:0] dst4, dst5, dst6; //used for testing
reg [lg_numprocs-1:0]bitmask;
reg [9:0]halving_offset;
reg [lg_numprocs-1:0]k;
reg [lg_numprocs-1:0]p;

always @(posedge clk)begin	//recursive halving for long reduce, long allreduce, scatter (scatter used in medium and long broadcast)
	for(k=1;k<lg_numprocs-1;k=k+1)begin
		if((t_tag >= ((1<<k)+comm_table[context][42:34])) && (t_tag < ((1<<(k+1))+comm_table[context][42:34])))begin
			bitmask[k] = 1'b1;
		end
		else begin
			bitmask[k] = 1'b0;
		end
	end
	if(t_tag >= (1<<(lg_numprocs-1)))begin
		bitmask[0] = 1'b1;
	end
	else begin
		bitmask[0] = 1'b0;
	end
	if(t_tag == 1)begin
		bitmask[lg_numprocs-1] = 1'b1;
	end
	else begin
		bitmask[lg_numprocs-1] = 1'b0;
	end
	
	halving_offset=0;
	for(p=0; 2**p<=bitmask; p=p+1) begin
		halving_offset = p*9;
	end
	
	{dst_x_halving, dst_y_halving, dst_z_halving} = (t_tag == cur_rank)? {rank_x, rank_y, rank_z} : comm_table[context][halving_offset+:DstWidth];
	
	case(packetIn[opPos+opWidth-1:opPos])
		4'b1111: {dst4, dst5, dst6} <= {dst_x_halving, dst_y_halving, dst_z_halving};
	endcase	
	
end

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//recursive doubling

reg [Dst_XWidth-1:0] dst_x_doubling, dst_y_doubling, dst_z_doubling;
reg [Dst_XWidth-1:0] dst7, dst8, dst9; //used for testing
wire [DstWidth:0]doubling_offset;
reg [lg_numprocs-1:0]a;
reg [lg_numprocs:0] send_again_doubling;
reg [lg_numprocs:0]base2;
reg rd_doubling;
wire rd_en_doubling;
wire [DstWidth-1:0]diff;
reg home_doubling;
reg t_rd_doubling;
reg doubling_need_it;

assign rd_en_doubling = rd_doubling;
assign diff = (t_rank > local_rank)? t_rank - local_rank : local_rank - t_rank;	//what if local rank is greater than t_rank
assign doubling_offset = (DstWidth * (lg_commsize - 1)) - ((send_again_doubling+base2) * DstWidth);

always @(posedge clk)begin

	if(rst) begin
		send_again_doubling = 0;
		rd_doubling = 0;
		{dst_x_doubling, dst_y_doubling, dst_z_doubling} = 9'b0;
		t_rd_doubling = 0;
		home_doubling = 0;
		doubling_need_it <= 0;
	end

	else begin
	
		base2 = (diff==0)? 0 : 1;
		for(a=1; 2**a<=diff; a=a+1) begin
			base2 = a+1;
		end
		
		if(send_again_doubling == (lg_commsize-base2-1))begin
			t_rd_doubling = 1;
			home_doubling = from_guest;
			send_again_doubling = 0;
		end
		
		else begin
			if(packetIn[opPos+opWidth-1:opPos]==4'b1111) begin
				send_again_doubling = (!home_doubling)? send_again_doubling+1 : send_again_doubling;
			end
			
			home_doubling = 0;
			t_rd_doubling = 0;
			
		end

		doubling_need_it <= home_doubling;

		{dst_x_doubling, dst_y_doubling, dst_z_doubling} = (doubling_need_it)? {rank_x, rank_y, rank_z} : comm_table[context][doubling_offset+:DstWidth];

		case(packetIn[opPos+opWidth-1:opPos])
			4'b1111: {dst7, dst8, dst9} <= {dst_x_doubling, dst_y_doubling, dst_z_doubling};
		endcase	
		
		rd_doubling <= (from_guest)? ({dst_x_doubling, dst_y_doubling, dst_z_doubling} == {rank_x, rank_y, rank_z}) : (t_rd_doubling)?1:0;
		
	end

end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

always @(posedge clk) begin
  
 if ((rst) || (!packetIn[ValidBitPos])) begin //if rst, set everything to 0
  payload<=0;
  op<=0;
  algtype<=0;
  tag<=0;
  contextId<=0;
  rank<=0;
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
 
	if(packetIn[DstPos+DstWidth-1:DstPos]==packetIn[SrcPos+SrcWidth-1:SrcPos]) begin
		children <= lg_numprocs;
		dst_x <= root_x;
		dst_y <= root_y;
		dst_z <= root_z;
	end
	
	else begin
	  children <= lg_numprocs;
	  dst_x <= packetIn[Dst_XPos+Dst_XWidth-1:Dst_XPos];
	  dst_y <= packetIn[Dst_YPos+Dst_YWidth-1:Dst_YPos];
	  dst_z <= packetIn[Dst_ZPos+Dst_ZWidth-1:Dst_ZPos];
	end
 
  payload<=packetIn[PayloadWidth-1:0];
  op<=packetIn[opPos+opWidth-1:opPos];
  algtype<=packetIn[AlgTypePos+AlgTypeWidth-1:AlgTypePos];
  tag<=packetIn[TagPos+TagWidth-1:TagPos];
  contextId<=packetIn[ContextIdPos+ContextIdWidth-1:ContextIdPos];
  rank<=(packetIn[DstPos+DstWidth-1:DstPos]==packetIn[SrcPos+SrcWidth-1:SrcPos])?comm_table[context][42:34]:packetIn[RankPos+RankWidth-1:RankPos];
  src_x<=packetIn[Src_XPos+Src_XWidth-1:Src_XPos];
  src_y<=packetIn[Src_YPos+Src_YWidth-1:Src_YPos];
  src_z<=packetIn[Src_ZPos+Src_ZWidth-1:Src_ZPos];
  valid<=packetIn[ValidBitPos];
  
 end //end else !rst and valid
 
end //end always

//set the output packet contents to the register values
assign packetOut[PayloadWidth-1:0] = payload;
assign packetOut[opPos+opWidth-1:opPos] = op;
assign packetOut[AlgTypePos+AlgTypeWidth-1:AlgTypePos] = algtype;
assign packetOut[TagPos+TagWidth-1:TagPos] = tag;
assign packetOut[ContextIdPos+ContextIdWidth-1:ContextIdPos] = contextId;
assign packetOut[RankPos+RankWidth-1:RankPos] = rank;
assign packetOut[Src_XPos+Src_XWidth-1:Src_XPos] = src_x;
assign packetOut[Src_YPos+Src_YWidth-1:Src_YPos] = src_y;
assign packetOut[Src_ZPos+Src_ZWidth-1:Src_ZPos] = src_z;
assign packetOut[Dst_XPos+Dst_XWidth-1:Dst_XPos] = dst_x;
assign packetOut[Dst_YPos+Dst_YWidth-1:Dst_YPos] = dst_y;
assign packetOut[Dst_ZPos+Dst_ZWidth-1:Dst_ZPos] = dst_z;
assign packetOut[ValidBitPos] = valid;
assign packetOut[ChildrenPos+ChildrenWidth-1:ChildrenPos] = children;

endmodule



