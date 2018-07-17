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

	*|	52  |51-43|	 42-34   | 33-31  |   30-27   |26-18| 17-9 | 8-0 |     	
	*|valid|root |local_rank|children|lg_commsize|third|second|first|
	
	//incoming communicator packet 
	
	*|	60  |  59-52  |51-43|  42-34   | 33-31  |   30-27   |26-18| 17-9 | 8-0 |     	
	*|valid|contextid|root |local_rank|children|lg_commsize|third|second|first|
	

/////////////////////////////////////////////////////////////////////////////////*/
module reduce_instr#(
	parameter rank_z = 3'b0,
	parameter rank_y = 3'b0,
	parameter rank_x = 3'b0,
	parameter lg_numprocs = 3,
	parameter PayloadWidth = 32
)
(
	input [FlitWidth-1:0] packetIn,
	input [NewCommWidth-1:0] new_comm,
	input clk,
	input rst,
	output rd_en,
	output [FlitChildWidth-1:0] packetOut
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

localparam FlitChildWidth = FlitWidth+ChildrenWidth;
 
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

reg rd_en_reg;
assign rd_en = ((t_op==ShortAllReduce)&&(send_home_doubling==0))? 0 : rd_en_reg;

/////////////////////////////////////////////////////////////////////////////////
//rank table

reg [SrcWidth-1:0] rank_table [num_procs-1:0];	//rank table matches ranks to physical address

always @(posedge clk) begin


	 rank_table[0] <= {3'b0, 3'b0, 3'b0};
	 rank_table[1] <= {3'b0, 3'b0, 3'b01};
	 rank_table[2] <= {3'b0, 3'b01, 3'b0};
	 rank_table[3] <= {3'b0, 3'b1, 3'b1};	 
	 rank_table[4] <= {3'b1, 3'b0, 3'b0};
	 rank_table[5] <= {3'b01, 3'b0, 3'b01};
	 rank_table[6] <= {3'b01, 3'b01, 3'b0};
	 rank_table[7] <= {3'b01, 3'b01, 3'b01};

							//x      y       z
	 /*rank_table[0] <= {3'b001, 3'b001, 3'b001};
	 rank_table[1] <= {3'b001, 3'b001, 3'b000};
	 rank_table[2] <= {3'b001, 3'b000, 3'b001};
	 rank_table[3] <= {3'b001, 3'b000, 3'b000};
	 rank_table[4] <= {3'b000, 3'b001, 3'b001};
	 rank_table[5] <= {3'b000, 3'b001, 3'b000};
	 rank_table[6] <= {3'b000, 3'b000, 3'b001};
	 rank_table[7] <= {3'b000, 3'b000, 3'b000};
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
	 rank_table[31] <= {3'b000, 3'b011, 3'b011};*/
	 

end

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//communicator table
reg[CommTableWidth-1:0] comm_table[CommTableSize-1:0];
reg [CommTableSize-1:0]i;
wire [ContextIdWidth-1:0]new_comm_context = new_comm[NewCommWidth-2:NewCommWidth-1-ContextIdWidth];

always @(posedge clk) begin
 if (rst) begin //if rst, set everything to 0
  for(i=1;i<CommTableSize;i=i+1)begin
	comm_table[i]<=0;
  end	
 end 
 
 else if(new_comm[NewCommWidth-1]==1'b1)begin
		comm_table[new_comm_context][CommTableWidth-2:0] <= new_comm[CommTableWidth-2:0];	
		comm_table[new_comm_context][CommTableWidth-1] <= 1'b1;
 end
 
 	//|  52 |51-43|  42-34   | 33-31  |   30-27   |26-18| 17-9 | 8-0 |     	
	//|valid|root |local_rank|children|lg_commsize|third|second|first|
 
 //comm_table[0] <= {1'b1, 9'b0, 9'b0, 3'b011, 4'b0011, 9'b01, 9'b10, 9'b100};
 //comm_table[0] <= {1'b1, 9'b0, 9'b000000100, 3'b010, 4'b0011, 9'b000000101, 9'b000000110, 9'b000};
 //comm_table[0] <= {1'b1, 9'b0, 9'b000000010, 3'b001, 4'b0011, 9'b000000011, 9'b0, 9'b000000110};
 //comm_table[0] <= {1'b1, 9'b0, 9'b000000011, 3'b000, 4'b0011, 9'b000000010, 9'b000000001, 9'b000000111};
end 

wire [ContextIdWidth-1:0]context = packetIn[ContextIdPos+ContextIdWidth-1:ContextIdPos];
wire [lg_numprocs-1:0]lg_commsize = comm_table[context][lgCommSizePos+lg_numprocs-1:lgCommSizePos];
wire [num_procs-1:0]commsize = 1 << lg_commsize;
wire [lg_numprocs-1:0]communicator_children = comm_table[context][CommChildrenPos+ChildrenWidth-1:CommChildrenPos];
wire [DstWidth-1:0]local_rank = comm_table[context][LocalRankPos+DstWidth-1:LocalRankPos];
wire [DstWidth-1:0]t_root = 9'b0;//comm_table[context][RootPos+DstWidth-1:RootPos];

wire [TagWidth-1:0]t_tag = (packetIn[TagPos+TagWidth-1:TagPos])%commsize;
wire [DstWidth-1:0]t_rank = packetIn[RankPos+RankWidth-1:RankPos];
wire [opWidth-1:0]t_op = packetIn[opPos+opWidth-1:opPos];

wire from_guest = ({rank_z, rank_y, rank_x}!=packetIn[SrcPos+SrcWidth-1:SrcPos]);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//ring (long allgather)

reg [Dst_XWidth-1:0] dst_x_ring, dst_y_ring, dst_z_ring;
reg home_ring;
wire [DstWidth-1:0] ring_offset = DstWidth*(lg_commsize-1);

always @(posedge clk) begin
	if(rst) begin
		home_ring = 0;
		{dst_x_ring, dst_y_ring, dst_z_ring} = 0;
	end
	else if (packetIn[ValidBitPos])begin
	
		{dst_x_ring, dst_y_ring, dst_z_ring} = (home_ring)? {rank_x, rank_y, rank_z} : (local_rank == (num_procs-1))? t_root : comm_table[context][ring_offset+:DstWidth];  

		home_ring = ((from_guest) && (!home_ring) && (t_op==LargeAllGather));
		
	end
	else begin
		{dst_x_ring, dst_y_ring, dst_z_ring} = 0;
	end
	
end


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//uptree

wire [Dst_XWidth-1:0] dst_x_uptree, dst_y_uptree, dst_z_uptree;
wire [DstWidth:0]uptree_offset = (lg_commsize-communicator_children-1)*DstWidth;	
assign {dst_x_uptree, dst_y_uptree, dst_z_uptree} = (local_rank == 0)? {rank_z, rank_y, rank_x} : rank_table[comm_table[context][uptree_offset+:DstWidth]]; //short reduction, gather, barrier


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//short bcast

reg [Dst_XWidth-1:0] dst_x_bcast, dst_y_bcast, dst_z_bcast;
reg [lg_numprocs:0] send_again_bcast;
reg home_bcast, send_home_bcast, one_child;
wire valid_bcast = (t_op == ShortBcast);
wire [DstWidth:0]bcast_offset = ((lg_commsize - communicator_children)+send_again_bcast)*DstWidth;
wire [DstWidth:0]bcast_threshold = (lg_commsize-2)*DstWidth;

always @(posedge clk) begin	
	if(rst) begin
		{dst_x_bcast, dst_y_bcast, dst_z_bcast} = 0;
		send_again_bcast = 0;
		home_bcast = 0;
		one_child = 0;
	end
	
	else if (packetIn[ValidBitPos])begin	
	
		if(send_again_bcast == communicator_children-1) begin
			send_again_bcast=0;
			home_bcast = (local_rank!=0);
		end		
		else begin
			send_again_bcast = ((!home_bcast)&&(valid_bcast))? send_again_bcast+1 : send_again_bcast;
			home_bcast = 0;
		end
		
		case(communicator_children)
			3'b000: {dst_x_bcast, dst_y_bcast, dst_z_bcast} = {rank_x, rank_y, rank_z};
			3'b001: {dst_x_bcast, dst_y_bcast, dst_z_bcast} = ((one_child)? {rank_x, rank_y, rank_z} : comm_table[context][(DstWidth*(lg_numprocs-1))+:DstWidth]);
			default: {dst_x_bcast, dst_y_bcast, dst_z_bcast} = (send_home_bcast)? {rank_x, rank_y, rank_z} : comm_table[context][bcast_offset+:DstWidth]; 
		endcase
				
		one_child = ((communicator_children==1) && (!one_child) && (t_op==ShortBcast));
		
	end
end

always @(posedge clk)begin
	if(rst) begin
		send_home_bcast <= 0;
	end
	else begin
		send_home_bcast <= home_bcast;
	end
end

///////////////////////////////////////////////////////////////////////////////////////////////////////////
//recursive halving

reg [Dst_XWidth-1:0] dst_x_halving, dst_y_halving, dst_z_halving;
reg [lg_numprocs-1:0]bitmask;
reg [lg_numprocs-1:0]bitmarker[lg_numprocs-2:0];
reg [DstWidth:0]halving_offset;
reg [lg_numprocs:0]k, p, f, w, y;

reg home_halving;
reg [DstWidth-1:0]new_gather_dst;
wire start_gather = ((t_tag == local_rank)&&(t_op == LargeBcast));

always @(posedge clk)begin	//recursive halving for long reduce, long allreduce, scatter (scatter also used in medium and long broadcast)


	for(f=1; f<lg_numprocs; f=f+1)begin
		bitmarker[f-1] = 0;
		for(y=0; y<f; y=y+1) begin
			bitmarker[f-1][y] =  (t_tag[lg_numprocs-1-y] != local_rank[lg_numprocs-1-y]);
		end
		bitmask[f] = ((t_tag[lg_numprocs-1-f] != local_rank[lg_numprocs-1-f])&&(!bitmarker[f-1]));
	end
	
	bitmask[0] = (t_tag[lg_numprocs-1] != local_rank[lg_numprocs-1]);
	
	
	halving_offset=0;
	for(p=0; 2**p<=bitmask; p=p+1) begin
		halving_offset = p*DstWidth;
	end
	
	new_gather_dst =  ((local_rank == (commsize-1))? t_root : comm_table[context][(DstWidth*(lg_commsize-1))+:DstWidth]);
	
	if (rst) begin
		home_halving = 0;
		{dst_x_halving, dst_y_halving, dst_z_halving} = 0;
	end
	else if (packetIn[ValidBitPos])begin
		case(t_op)
			LargeBcast: {dst_x_halving, dst_y_halving, dst_z_halving} = (home_halving)? {rank_x, rank_y, rank_z} : (start_gather)? new_gather_dst :	
																							(t_tag == local_rank)? {rank_z, rank_y, rank_z} : comm_table[context][halving_offset+:DstWidth];
																							
			LargeReduce:{dst_x_halving, dst_y_halving, dst_z_halving} =	((t_tag == local_rank)&&(t_op == LargeReduce))? {dst_x_uptree, dst_y_uptree, dst_z_uptree} :
																							(t_tag == local_rank)? {rank_z, rank_y, rank_z} : comm_table[context][halving_offset+:DstWidth];
																							
			default: 	{dst_x_halving, dst_y_halving, dst_z_halving} = (t_tag == local_rank)? {rank_z, rank_y, rank_z} : rank_table[comm_table[context][halving_offset+:DstWidth]];//////////////
		endcase													

		home_halving = ((t_tag == local_rank)&&(t_op == LargeBcast)&&(!home_halving));

	end
	
end

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//recursive doubling

reg [Dst_XWidth-1:0]dst_x_doubling, dst_y_doubling, dst_z_doubling;
reg [lg_numprocs:0]send_again_doubling;
reg [lg_numprocs:0]base2;
reg home_doubling;
reg send_home_doubling;
reg [lg_numprocs-1:0]a;

wire valid_doubling = ((t_op == ShortAllGather) || (t_op == ShortAllReduce));
wire [DstWidth-1:0]diff  = (t_rank > local_rank)? t_rank - local_rank : local_rank - t_rank;


wire [DstWidth:0]doubling_offset = (((lg_commsize - 1) - (send_again_doubling+base2)) * DstWidth);


always @(posedge clk)begin

	base2 = (diff>0);
	for(a=1; 2**a<=diff; a=a+1) begin
		base2 = a+1;
	end	

	if(rst) begin
		{dst_x_doubling, dst_y_doubling, dst_z_doubling} = 0;
		send_again_doubling = 0;
		home_doubling = 0;
	end
	
	else if(packetIn[ValidBitPos])begin		
		
		if((send_again_doubling == (lg_commsize-base2-1))&&(!home_doubling))begin
			send_again_doubling = 0;
			home_doubling = from_guest;
		end		
		else begin
			if(valid_doubling) begin
				send_again_doubling = ((!home_doubling)&&(valid_doubling))? send_again_doubling+1 : send_again_doubling;
			end
			
			home_doubling = 0;	
		end

		{dst_x_doubling, dst_y_doubling, dst_z_doubling} = ((send_home_doubling)||(diff==(commsize/2)))? {rank_x[2:0], rank_y[2:0], rank_z[2:0]} : rank_table[comm_table[context][doubling_offset+:DstWidth]];
		
		
		
	end	
	
end

always @(posedge clk) begin
	if(rst) begin
		send_home_doubling <= 0;
	end
	else begin
		send_home_doubling <= home_doubling;
	end
end

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//mux

wire meant_for_me = ((packetIn[DstPos+DstWidth-1:DstPos]=={rank_z, rank_y, rank_x})&&(comm_table[context][CommTableWidth-1]));
reg [Dst_XWidth-1:0] dst1, dst2, dst3; //used for testing
reg [opWidth-1:0]op;
reg [AlgTypeWidth-1:0]algtype;
reg [ChildrenWidth-1:0]children;


always @(posedge clk) begin
	if(rst) begin
		{dst1, dst2, dst3} <= 0;
		rd_en_reg <= 1'b1;
		op <= 0;
		algtype <= 0;
		children <= 0;
	end
	else if((meant_for_me)&&(t_op>4'b0)) begin
		case(t_op)
			LargeBcast: 	begin
									op <= (!home_halving)? LargeBcast : LargeAllGather;
									algtype <= 0;
									children <= 0;
									rd_en_reg <= ((home_halving)||(!start_gather));
									{dst1, dst2, dst3} <= {dst_x_halving, dst_y_halving, dst_z_halving};
								end
			MediumBcast: 	begin
									op <= t_op; 
									algtype <= 0;
									children <= 0;
									rd_en_reg <= 1;
									{dst1, dst2, dst3} <= {dst_x_halving, dst_y_halving, dst_z_halving};
								end
			ShortBcast: 	begin
									op <= ShortBcast;
									algtype <= 0;
									children <= 0;
									rd_en_reg <= (!valid_bcast)? 1 : (local_rank==0)? (bcast_offset == bcast_threshold) : (communicator_children == 1)? one_child : ((home_bcast)||(local_rank[0]));
									{dst1, dst2, dst3} <= {dst_x_bcast, dst_y_bcast, dst_z_bcast};
								end
			Scatter: 		begin
									op <= Scatter;
									algtype <= 0;
									children <= 0;
									rd_en_reg <= 1'b1;
									{dst1, dst2, dst3} <= {dst_x_halving, dst_y_halving, dst_z_halving};
								end
			LargeAllGather:begin
									op <= LargeAllGather;
									algtype <= 0;
									children <= 0;
									rd_en_reg <= ((home_ring) || (!from_guest)||(t_op != LargeAllGather));
									{dst1, dst2, dst3} <= {dst_x_ring, dst_y_ring, dst_z_ring};
								end
			ShortAllGather:begin 
									op <= ShortAllGather;
									algtype <= 0;
									children <= 0;
									rd_en_reg <= (!valid_doubling)? 1 :(from_guest)? ((home_doubling)||(diff==(commsize/2))) : (doubling_offset == DstWidth);
									{dst1, dst2, dst3} <= {dst_x_doubling, dst_y_doubling, dst_z_doubling};
								end
			Gather: 			begin
									op <= Gather;
									algtype <= 0;
									children <= 0;
									rd_en_reg <= 1'b1;
									{dst1, dst2, dst3} <= {dst_x_uptree, dst_y_uptree, dst_z_uptree};
								end
			ShortReduce: 	begin
									op <= ShortReduce;
									algtype <= 0;
									children <= communicator_children;
									rd_en_reg <= 1'b1;
									{dst1, dst2, dst3} <= {dst_x_uptree, dst_y_uptree, dst_z_uptree};
								end
			LargeReduce: 	begin
									op <= (!home_halving)? LargeReduce : Gather; 
									algtype <= (t_tag == local_rank)? 1 :0;
									children <= (t_tag == local_rank)? lg_commsize : (halving_offset/DstWidth);
									rd_en_reg <= 1;
									{dst1, dst2, dst3} <= {dst_x_halving, dst_y_halving, dst_z_halving};
								end
			ShortAllReduce:begin
									op <= ShortAllReduce;
									algtype <= 0;
									children <= ((send_home_doubling)||(diff==(commsize/2)))? lg_commsize : ((lg_commsize-1)-(doubling_offset/DstWidth));
									rd_en_reg <= (!valid_doubling)? 1 :(from_guest)? ((home_doubling)||(diff==(commsize/2))) : (doubling_offset == DstWidth);
									{dst1, dst2, dst3} <= {dst_x_doubling, dst_y_doubling, dst_z_doubling};
								end
			LargeAllReduce:begin 	
									op <= t_op; 
									algtype <= 0;
									children <= (t_tag == local_rank)? lg_commsize : (halving_offset/DstWidth);
									rd_en_reg <= 1;
									{dst1, dst2, dst3} <= {dst_x_halving, dst_y_halving, dst_z_halving};
								end
			default: 		begin
									op <= t_op;
									algtype <= 0;
									children <= 0;
									rd_en_reg <= 1'b1;
									{dst1, dst2, dst3} <= packetIn[DstPos+DstWidth-1:DstPos];
								end
		endcase

	end
	else begin
			op <= t_op;
			algtype <= packetIn[AlgTypePos+AlgTypeWidth-1:AlgTypePos];
			children <= 0;
			rd_en_reg <= 1'b1;
		  {dst3, dst2, dst1} <= packetIn[DstPos+DstWidth-1:DstPos];
	end
end

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//keep rest of packet

reg [PayloadWidth-1:0]payload;
reg [TagWidth-1:0]tag;
reg [ContextIdWidth-1:0]contextId;
reg [RankWidth-1:0]rank;
reg [Src_XWidth-1:0] src_x, src_y, src_z;
reg valid;
reg ok_meant_for_me;
reg loc_rank;

always @(posedge clk) begin
  
 if ((rst) || (!packetIn[ValidBitPos])) begin //if rst, set everything to 0
  payload<=0;
  tag<=0;
  contextId<=0;
  rank<=0;
  {src_z, src_y, src_x}<=0;
  valid<=0;
  ok_meant_for_me <= 0;
  loc_rank <= 0;
 end
 
 else begin

  payload<=packetIn[PayloadWidth-1:0];
  tag<=packetIn[TagPos+TagWidth-1:TagPos];
  contextId<=context;
  rank<= t_rank;
  {src_x, src_y, src_x}<= packetIn[SrcPos+SrcWidth-1:SrcPos];
  valid<=packetIn[ValidBitPos];
  ok_meant_for_me <= meant_for_me;
  loc_rank <= local_rank;
  
 end //end else !rst and valid
 
end //end always

//set the output packet contents to the register values
assign packetOut[PayloadWidth-1:0] = payload;
assign packetOut[opPos+opWidth-1:opPos] = op;
assign packetOut[AlgTypePos+AlgTypeWidth-1:AlgTypePos] = algtype;
assign packetOut[TagPos+TagWidth-1:TagPos] = tag;
assign packetOut[ContextIdPos+ContextIdWidth-1:ContextIdPos] = contextId;
assign packetOut[DstPos+DstWidth-1:DstPos] = {dst3, dst2, dst1};
/* 1. only change src and rank if the packet was initially meant for me, but I am now forwarding it somewhere else
	2. if it is not meant for me, then dont change it
	3. if it is meant for me but I am keeping it, then keep the original sender	*/
assign packetOut[RankPos+RankWidth-1:RankPos] = ((ok_meant_for_me)&&({dst3, dst2, dst1}!={rank_z, rank_y, rank_x}))? loc_rank : rank;
assign packetOut[SrcPos+SrcWidth-1:SrcPos] = ((ok_meant_for_me)&&({dst3, dst2, dst1}!={rank_z, rank_y, rank_x}))? {rank_z, rank_y, rank_x} : {src_z, src_y, src_x};
assign packetOut[ValidBitPos] = valid;
assign packetOut[ChildrenPos+ChildrenWidth-1:ChildrenPos] = children;


endmodule



