`timescale 1ns / 1ns

module router_4#(
    parameter cur_x = 0,
    parameter cur_y = 0,
    parameter cur_z = 0,
	 parameter lg_numprocs = 3,
	 parameter PayloadWidth = 32,
	 parameter ReductionTableSize = 140,
	 parameter input_Q_size = 10
)(
    input clk,
    input rst,

    //interface from 6 MGTs
    input [FlitWidth - 1 : 0] in_xpos,
    input [FlitWidth - 1 : 0] in_ypos,
    input [FlitWidth - 1 : 0] in_xneg,
    input [FlitWidth - 1 : 0] in_yneg,
    input in_xpos_valid,
    input in_ypos_valid,
    input in_xneg_valid,
    input in_yneg_valid,
    //interface to 6 MGTs
    output [FlitWidth - 1 : 0] out_xpos,
    output [FlitWidth - 1 : 0] out_ypos,
    output [FlitWidth - 1 : 0] out_xneg,
    output [FlitWidth - 1 : 0] out_yneg,
    output out_xpos_valid,
    output out_ypos_valid,
    output out_xneg_valid,
    output out_yneg_valid,
	 
    //interface to application kernel
    //inputs */
    output [FlitChildWidth-1:0] eject_xpos,
    output [FlitChildWidth-1:0] eject_ypos,
    output [FlitChildWidth-1:0] eject_xneg,
    output [FlitChildWidth-1:0] eject_yneg,
    output eject_xpos_valid,
    output eject_ypos_valid,
    output eject_xneg_valid,
    output eject_yneg_valid,
    input [FlitChildWidth-1:0] inject_xpos,
    input [FlitChildWidth-1:0] inject_ypos,
    input [FlitChildWidth-1:0] inject_xneg,
    input [FlitChildWidth-1:0] inject_yneg,
    input inject_xpos_valid,
    input inject_ypos_valid,
    input inject_xneg_valid,
    input inject_yneg_valid,
	 
	 input [NewCommWidth-1:0]newcomm
	 
    );
	 
	 localparam ROUTE_LEN = 3;
	 localparam PORT_NUM = 6;
	 
	 localparam DIR_XPOS=3'd1;
	 localparam DIR_YPOS=3'd2;
	 localparam DIR_ZPOS=3'd3;
	 localparam DIR_XNEG=3'd4;
	 localparam DIR_YNEG=3'd5;
	 localparam DIR_ZNEG=3'd6;
	 
	 localparam num_procs = 1 << lg_numprocs;
	 
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
	 
	 localparam ChildrenPos=ValidBitPos+1;
	 localparam ChildrenWidth=lg_numprocs;
	 localparam FlitChildWidth = FlitWidth+ChildrenWidth;

	 localparam CommTableWidth = (lg_numprocs+2)*DstWidth + lg_numprocs*2+2;
	 localparam NewCommWidth = CommTableWidth+ContextIdWidth;
	 
	 localparam ReductionBitPos=opPos+opWidth-1;
	 
//buffer output and IR input
	 wire [FlitWidth - 1 : 0]in_xpos_IR;
	 wire [FlitWidth - 1 : 0]in_ypos_IR;
	 wire [FlitWidth - 1 : 0]in_xneg_IR;
	 wire [FlitWidth - 1 : 0]in_yneg_IR;
	 
	 wire [ChildrenWidth-1:0]eject_xpos_children;
	 wire [ChildrenWidth-1:0]eject_ypos_children;
	 wire [ChildrenWidth-1:0]eject_xneg_children;
	 wire [ChildrenWidth-1:0]eject_yneg_children;
	 

//IR output and buffer input
	 wire xpos_IR_consume;
	 wire ypos_IR_consume;
	 wire xneg_IR_consume;
	 wire yneg_IR_consume;

//IR output and RC input
    wire [FlitChildWidth-1:0] in_xpos_RC;
    wire [FlitChildWidth-1:0] in_ypos_RC;
    wire [FlitChildWidth-1:0] in_xneg_RC;
    wire [FlitChildWidth-1:0] in_yneg_RC;
	 
//RC output and VC input
	 wire [FlitChildWidth-1:0] flit_xpos_VA;
    wire [FlitChildWidth-1:0] flit_ypos_VA;
    wire [FlitChildWidth-1:0] flit_xneg_VA;
    wire [FlitChildWidth-1:0] flit_yneg_VA;

    wire [ROUTE_LEN - 1 : 0] flit_xpos_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_ypos_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_xneg_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_yneg_VA_route;
	 
	 
///////////////////////////////////////////////////////////////////////////////////////////
//router input buffers	 
	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitWidth)
    )
    xpos_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_xpos),
        .produce(in_xpos_valid),
        .consume(xpos_IR_consume),
        .full(),
        .empty(),
        .out(in_xpos_IR)
    );
	 
	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitWidth)
    )
    ypos_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_ypos),
        .produce(in_ypos_valid),
        .consume(ypos_IR_consume),
        .full(),
        .empty(),
        .out(in_ypos_IR)
    );
	 
	 
	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitWidth)
    )
    xneg_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_xneg),
        .produce(in_xneg_valid),
        .consume(xneg_IR_consume),
        .full(),
        .empty(),
        .out(in_xneg_IR)
    );
	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitWidth)
    )
    yneg_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_yneg),
        .produce(in_yneg_valid),
        .consume(yneg_IR_consume),
        .full(),
        .empty(),
        .out(in_yneg_IR)
    );
	 
	
///////////////////////////////////////////////////////////////////////////////////////
//reduce instr
	reduce_instr#(
		.rank_x(cur_x),
		.rank_y(cur_y),
		.rank_z(cur_z),
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	)
	xpos_IR(
	 .packetOut(in_xpos_RC),
	 .new_comm(newcomm),
	 .packetIn(in_xpos_IR),
	 .clk(clk),
	 .rst(rst),
	 .rd_en(xpos_IR_consume),
	 .eject_enable(eject_xpos_valid),
	 .eject_children(eject_xpos_children)
	);
	
	assign eject_xpos = {eject_xpos_children[lg_numprocs-1:0], eject_xpos_valid ,cur_z[Dst_ZWidth-1:0], cur_y[Dst_YWidth-1:0], cur_z[Dst_XWidth-1:0], in_xpos_RC[DstPos-1:0]};

	reduce_instr#(
		.rank_x(cur_x),
		.rank_y(cur_y),
		.rank_z(cur_z),
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	)
	ypos_IR(
	 .packetOut(in_ypos_RC),
	 .new_comm(newcomm),
	 .packetIn(in_ypos_IR),
	 .clk(clk),
	 .rst(rst),
	 .rd_en(ypos_IR_consume),
	 .eject_enable(eject_ypos_valid),
	 .eject_children(eject_ypos_children)
	);
	
	assign eject_ypos = {eject_ypos_children[lg_numprocs-1:0],eject_ypos_valid,cur_z[Dst_ZWidth-1:0], cur_y[Dst_YWidth-1:0], cur_z[Dst_XWidth-1:0], in_ypos_RC[DstPos-1:0]};
	
	
	reduce_instr#(
		.rank_x(cur_x),
		.rank_y(cur_y),
		.rank_z(cur_z),
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	)
	xneg_IR(
	 .packetOut(in_xneg_RC),
	 .new_comm(newcomm),
	 .packetIn(in_xneg_IR),
	 .clk(clk),
	 .rst(rst),
	 .rd_en(xneg_IR_consume),
	 .eject_enable(eject_xneg_valid),
	 .eject_children(eject_xneg_children)
	);
	
	assign eject_xneg = {eject_xneg_children[lg_numprocs-1:0],eject_xneg_valid,cur_z[Dst_ZWidth-1:0], cur_y[Dst_YWidth-1:0], cur_z[Dst_XWidth-1:0], in_xneg_RC[DstPos-1:0]};
	
	reduce_instr#(
		.rank_x(cur_x),
		.rank_y(cur_y),
		.rank_z(cur_z),
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	)
	yneg_IR(
	 .packetOut(in_yneg_RC),
	 .new_comm(newcomm),
	 .packetIn(in_yneg_IR),
	 .clk(clk),
	 .rst(rst),
	 .rd_en(yneg_IR_consume),
	 .eject_enable(eject_yneg_valid),
	 .eject_children(eject_yneg_children)
	);
	
	assign eject_yneg = {eject_yneg_children[lg_numprocs-1:0],eject_yneg_valid,cur_z[Dst_ZWidth-1:0], cur_y[Dst_YWidth-1:0], cur_z[Dst_XWidth-1:0], in_yneg_RC[DstPos-1:0]};
	



///////////////////////////////////////////////////////////////////////////////////////
//route comp
    route_comp#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z),
		  .DstPos(DstPos),
		  .DstWidth(DstWidth),
		  .Dst_XWidth(Dst_XWidth),
		  .ValidBitPos(ValidBitPos),
		  .lg_numprocs(lg_numprocs)
    )xpos_route_comp(
        .clk(clk),
        .rst(rst),
        .flit_valid_in(in_xpos_RC[ValidBitPos]),	
        .flit_before_RC(in_xpos_RC),
        .dir_in(DIR_XPOS),
        .flit_after_RC(flit_xpos_VA),
        .flit_valid_out(),
        .dir_out(flit_xpos_VA_route),
        .eject_enable()
    );
	 
	 route_comp#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z),
		  .DstPos(DstPos),
		  .DstWidth(DstWidth),
		  .Dst_XWidth(Dst_XWidth),
		  .ValidBitPos(ValidBitPos),
		  .lg_numprocs(lg_numprocs)
    )ypos_route_comp(
        .clk(clk),
        .rst(rst),
        .flit_valid_in(in_ypos_RC[ValidBitPos]),	
        .flit_before_RC(in_ypos_RC),
        .dir_in(DIR_YPOS),
        .flit_after_RC(flit_ypos_VA),
        .flit_valid_out(),
        .dir_out(flit_ypos_VA_route),
        .eject_enable()
    );
	 
	 
	 route_comp#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z),
		  .DstPos(DstPos),
		  .DstWidth(DstWidth),
		  .Dst_XWidth(Dst_XWidth),
		  .ValidBitPos(ValidBitPos),
		  .lg_numprocs(lg_numprocs)
    )xneg_route_comp(
        .clk(clk),
        .rst(rst),
        .flit_valid_in(in_xneg_RC[ValidBitPos]),	
        .flit_before_RC(in_xneg_RC),
        .dir_in(DIR_XNEG),
        .flit_after_RC(flit_xneg_VA),
        .flit_valid_out(),
        .dir_out(flit_xneg_VA_route),
        .eject_enable()
    );
	 
	 route_comp#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z),
		  .DstPos(DstPos),
		  .DstWidth(DstWidth),
		  .Dst_XWidth(Dst_XWidth),
		  .ValidBitPos(ValidBitPos),
		  .lg_numprocs(lg_numprocs)
    )yneg_route_comp(
        .clk(clk),
        .rst(rst),
        .flit_valid_in(in_yneg_RC[ValidBitPos]),	
        .flit_before_RC(in_yneg_RC),
        .dir_in(DIR_YNEG),
        .flit_after_RC(flit_yneg_VA),
        .flit_valid_out(),
        .dir_out(flit_yneg_VA_route),
        .eject_enable()
    );

	 
	 
///////////////////////////////////////////////////////////////////////////////////////

//buffer output and switch input
	 wire [FlitChildWidth-1:0] flit_xpos_SA;
    wire [FlitChildWidth-1:0] flit_ypos_SA;
    wire [FlitChildWidth-1:0] flit_xneg_SA;
    wire [FlitChildWidth-1:0] flit_yneg_SA;
		 
	 wire [ROUTE_LEN - 1 : 0] flit_xpos_SA_route;
    wire [ROUTE_LEN - 1 : 0] flit_ypos_SA_route;
    wire [ROUTE_LEN - 1 : 0] flit_xneg_SA_route;
    wire [ROUTE_LEN - 1 : 0] flit_yneg_SA_route;

    wire flit_xpos_SA_valid = flit_xpos_SA[ValidBitPos];
    wire flit_ypos_SA_valid = flit_ypos_SA[ValidBitPos];
    wire flit_xneg_SA_valid = flit_xneg_SA[ValidBitPos];
    wire flit_yneg_SA_valid = flit_yneg_SA[ValidBitPos];

//switch output and buffer input
    wire flit_xpos_SA_grant;
    wire flit_ypos_SA_grant;
    wire flit_xneg_SA_grant;
    wire flit_yneg_SA_grant;

///////////////////////////////////////////////////////////////////
//pre switch buffers
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitChildWidth + ROUTE_LEN)
    )
    xpos_switch_queue(
        .clk(clk),
        .rst(rst),
        .in({flit_xpos_VA_route, flit_xpos_VA}),
        .produce(flit_xpos_VA[ValidBitPos]),
        .consume(flit_xpos_SA_grant),
        .full(),
        .empty(),
        .out({flit_xpos_SA_route, flit_xpos_SA})
    );
	 
	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitChildWidth + ROUTE_LEN)
    )
    ypos_switch_queue(
        .clk(clk),
        .rst(rst),
        .in({flit_ypos_VA_route, flit_ypos_VA}),
        .produce(flit_ypos_VA[ValidBitPos]),
        .consume(flit_ypos_SA_grant),
        .full(),
        .empty(),
        .out({flit_ypos_SA_route, flit_ypos_SA})
    );


	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitChildWidth + ROUTE_LEN)
    )
    xneg_switch_queue(
        .clk(clk),
        .rst(rst),
        .in({flit_xneg_VA_route, flit_xneg_VA}),
        .produce(flit_xneg_VA[ValidBitPos]),
        .consume(flit_xneg_SA_grant),
        .full(),
        .empty(),
        .out({flit_xneg_SA_route, flit_xneg_SA})
    );

	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitChildWidth + ROUTE_LEN)
    )
    yneg_switch_queue(
        .clk(clk),
        .rst(rst),
        .in({flit_yneg_VA_route, flit_yneg_VA}),
        .produce(flit_yneg_VA[ValidBitPos]),
        .consume(flit_yneg_SA_grant),
        .full(),
        .empty(),
        .out({flit_yneg_SA_route, flit_yneg_SA})
    );



    wire [PORT_NUM - 1 : 0] flit_valid_ST;
    wire [PORT_NUM * FlitChildWidth - 1 : 0] out_ST;
	 
	 wire zfun1,zfun2;
	 
/////////////////////////////////////////////////////////////////////
//switch

    switch#(
        .M_IN(PORT_NUM),	//6
		  .ValidBitPos(ValidBitPos),
		  .lg_numprocs(lg_numprocs)
    )sw_inst(
        .clk(clk),
        .rst(rst),
        .in({84'b0, flit_yneg_SA, flit_xneg_SA, 84'b0, flit_ypos_SA, flit_xpos_SA}),
        .route_in({3'b0, flit_yneg_SA_route, flit_xneg_SA_route, 3'b0, flit_ypos_SA_route, flit_xpos_SA_route}),
        .in_valid({1'b0, flit_yneg_SA_valid, flit_xneg_SA_valid, 1'b0, flit_ypos_SA_valid, flit_xpos_SA_valid}),
		  .out_avail({1'b0, inject_yneg_valid, inject_xneg_valid, 1'b0, inject_ypos_valid, inject_xpos_valid}),
		  
        .in_avail({zfun1, flit_yneg_SA_grant, flit_xneg_SA_grant, zfun2, flit_ypos_SA_grant, flit_xpos_SA_grant}),	//output        
        .out_valid(flit_valid_ST),
        .out(out_ST)
    );
	 
	 
	reg [FlitChildWidth-1:0]inject_xpos_hold;
	reg [FlitChildWidth-1:0]inject_ypos_hold;
	reg [FlitChildWidth-1:0]inject_xneg_hold;
	reg [FlitChildWidth-1:0]inject_yneg_hold;
	
	reg inject_xpos_valid_hold;
	reg inject_ypos_valid_hold;
	reg inject_xneg_valid_hold;
	reg inject_yneg_valid_hold;

	always @(posedge clk)begin
		inject_xpos_hold <= inject_xpos;
		inject_ypos_hold <= inject_ypos;
		inject_xneg_hold <= inject_xneg;
		inject_yneg_hold <= inject_yneg;
		inject_xpos_valid_hold <= inject_xpos_valid;
		inject_ypos_valid_hold <= inject_ypos_valid;
		inject_xneg_valid_hold <= inject_xneg_valid;
		inject_yneg_valid_hold <= inject_yneg_valid;
	end
	
	 wire [FlitChildWidth-1:0]out_xpos_switch = ((flit_valid_ST[0]) && (~inject_xpos_valid_hold))? out_ST[FlitChildWidth-1:0] : inject_xpos_hold;
    wire [FlitChildWidth-1:0]out_ypos_switch = ((flit_valid_ST[1]) && (~inject_ypos_valid))? out_ST[2 * FlitChildWidth - 1 : FlitChildWidth] : inject_ypos_hold;
    wire [FlitChildWidth-1:0]out_xneg_switch = ((flit_valid_ST[3]) && (~inject_xneg_valid))? out_ST[4 * FlitChildWidth - 1 : 3 * FlitChildWidth] : inject_xneg_hold;
    wire [FlitChildWidth-1:0]out_yneg_switch = ((flit_valid_ST[4]) && (~inject_yneg_valid))? out_ST[5 * FlitChildWidth - 1 : 4 * FlitChildWidth] : inject_yneg_hold;

	  

	wire xpos_reduce_special = ((out_xpos_switch[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(out_xpos_switch[ValidBitPos]));
	wire ypos_reduce_special = ((out_ypos_switch[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(out_ypos_switch[ValidBitPos]));
	wire xneg_reduce_special = ((out_xneg_switch[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(out_xneg_switch[ValidBitPos]));
	wire yneg_reduce_special = ((out_yneg_switch[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(out_yneg_switch[ValidBitPos]));
	 
	 
	 //reduction unit logic 	 
	 
	 wire [FlitChildWidth-1:0] in_xpos_reduce;
	 wire [FlitChildWidth-1:0] in_ypos_reduce;
	 wire [FlitChildWidth-1:0] in_xneg_reduce;
	 wire [FlitChildWidth-1:0] in_yneg_reduce;
	 
	 wire [FlitWidth - 1 : 0] out_xpos_reduce;
	 wire [FlitWidth - 1 : 0] out_ypos_reduce;
	 wire [FlitWidth - 1 : 0] out_xneg_reduce;
	 wire [FlitWidth - 1 : 0] out_yneg_reduce;
	 
	 wire xpos_rd_en;
	 wire ypos_rd_en;
	 wire xneg_rd_en;
	 wire yneg_rd_en;
	 
	 wire xpos_reduce_done;
	 wire ypos_reduce_done;
	 wire xneg_reduce_done;
	 wire yneg_reduce_done;
	 
	 wire xpos_reduce_valid_out;
	 wire ypos_reduce_valid_out;
	 wire xneg_reduce_valid_out;
	 wire yneg_reduce_valid_out;

	 wire [FlitWidth - 1 : 0]out_xpos_noreduce;
	 wire [FlitWidth - 1 : 0]out_ypos_noreduce;
	 wire [FlitWidth - 1 : 0]out_xneg_noreduce;
	 wire [FlitWidth - 1 : 0]out_yneg_noreduce;

////////////////////////////////////////////////////////////
//reduce unit
	
	 fifo#(
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	 )	 
	 xpos_reduce_fifo (
	 .clk(clk),
	 .rst(rst),
	 .buf_in(out_xpos_switch),
	 .buf_out(in_xpos_reduce),
	 .wr_en(xpos_reduce_special),
	 .rd_en(xpos_rd_en),
	 .buf_empty(),
	 .buf_full(),
	 .fifo_counter()
	);


	reduce_unit#(
		.rank_x(cur_x),
		.rank_y(cur_y),
		.rank_z(cur_z),
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth),
		.ReductionTableSize(ReductionTableSize)
	)
	xpos_reduce_unit(
	 .Outpacket(out_xpos_reduce),
	 .done(xpos_reduce_done),
	 .valid_out(xpos_reduce_valid_out),
	 .clk(clk),
	 .rst(rst),
	 .packetA(in_xpos_reduce),
	 .rd_en(xpos_rd_en),
	 .wr_en(),
	 .fifo_counter(),
	 .buf_empty(),
	 .buf_full()
	);
	
	
	large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitWidth)
    )
    xpos_postswitch_fifo(
        .clk(clk),
        .rst(rst),
        .in(out_xpos_switch[FlitWidth-1:0]),
        .produce((out_xpos_switch[ValidBitPos])&&(out_xpos_switch[ReductionBitPos:ReductionBitPos-1]!=2'b11)),
        .consume(!xpos_reduce_done),
        .full(),
        .empty(),
        .out(out_xpos_noreduce)
    );
	 
	 
	 fifo#(
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	 )	 
	 ypos_reduce_fifo (
	 .clk(clk),
	 .rst(rst),
	 .buf_in(out_ypos_switch),
	 .buf_out(in_ypos_reduce),
	 .wr_en(ypos_reduce_special),
	 .rd_en(ypos_rd_en),
	 .buf_empty(),
	 .buf_full(),
	 .fifo_counter()
	);
	

	reduce_unit#(
		.rank_x(cur_x),
		.rank_y(cur_y),
		.rank_z(cur_z),
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth),
		.ReductionTableSize(ReductionTableSize)
	)
	ypos_reduce_unit(
	 .Outpacket(out_ypos_reduce),
	 .done(ypos_reduce_done),
	 .valid_out(ypos_reduce_valid_out),
	 .clk(clk),
	 .rst(rst),
	 .packetA(in_ypos_reduce),
	 .rd_en(ypos_rd_en),
	 .wr_en(),
	 .fifo_counter(),
	 .buf_empty(),
	 .buf_full()
	);
	
	
	large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitWidth)
    )
    ypos_postswitch_fifo(
        .clk(clk),
        .rst(rst),
        .in(out_ypos_switch[FlitWidth-1:0]),
        .produce((out_ypos_switch[ValidBitPos])&&(out_ypos_switch[ReductionBitPos:ReductionBitPos-1]!=2'b11)),
        .consume(!ypos_reduce_done),
        .full(),
        .empty(),
        .out(out_ypos_noreduce)
    );
	
	

	 

	 fifo#(
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	 )	 
	 xneg_reduce_fifo (
	 .clk(clk),
	 .rst(rst),
	 .buf_in(out_xneg_switch),
	 .buf_out(in_xneg_reduce),
	 .wr_en(xneg_reduce_special),
	 .rd_en(xneg_rd_en),
	 .buf_empty(),
	 .buf_full(),
	 .fifo_counter()
	);
	

	reduce_unit#(
		.rank_x(cur_x),
		.rank_y(cur_y),
		.rank_z(cur_z),
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth),
		.ReductionTableSize(ReductionTableSize)
	)
	xneg_reduce_unit(
	 .Outpacket(out_xneg_reduce),
	 .done(xneg_reduce_done),
	 .valid_out(xneg_reduce_valid_out),
	 .clk(clk),
	 .rst(rst),
	 .packetA(in_xneg_reduce),
	 .rd_en(xneg_rd_en),
	 .wr_en(),
	 .fifo_counter(),
	 .buf_empty(),
	 .buf_full()
	);
	
	
	large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitWidth)
    )
    xneg_postswitch_fifo(
        .clk(clk),
        .rst(rst),
        .in(out_xneg_switch[FlitWidth-1:0]),
        .produce((out_xneg_switch[ValidBitPos])&&(out_xneg_switch[ReductionBitPos:ReductionBitPos-1]!=2'b11)),
        .consume(!xneg_reduce_done),
        .full(),
        .empty(),
        .out(out_xneg_noreduce)
    );
	 

	 fifo#(
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	 )	 
	 yneg_reduce_fifo (
	 .clk(clk),
	 .rst(rst),
	 .buf_in(out_yneg_switch),
	 .buf_out(in_yneg_reduce),
	 .wr_en(yneg_reduce_special),
	 .rd_en(yneg_rd_en),
	 .buf_empty(),
	 .buf_full(),
	 .fifo_counter()
	);
	

	reduce_unit#(
		.rank_x(cur_x),
		.rank_y(cur_y),
		.rank_z(cur_z),
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth),
		.ReductionTableSize(ReductionTableSize)
	)
	yneg_reduce_unit(
	 .Outpacket(out_yneg_reduce),
	 .done(yneg_reduce_done),
	 .valid_out(yneg_reduce_valid_out),
	 .clk(clk),
	 .rst(rst),
	 .packetA(in_yneg_reduce),
	 .rd_en(yneg_rd_en),
	 .wr_en(),
	 .fifo_counter(),
	 .buf_empty(),
	 .buf_full()
	);
	
	
	large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitWidth)
    )
    yneg_postswitch_fifo(
        .clk(clk),
        .rst(rst),
        .in(out_yneg_switch[FlitWidth-1:0]),
        .produce((out_yneg_switch[ValidBitPos])&&(out_yneg_switch[ReductionBitPos:ReductionBitPos-1]!=2'b11)),
        .consume(!yneg_reduce_done),
        .full(),
        .empty(),
        .out(out_yneg_noreduce)
    );
	 
	 

///////////////////////////////////////////////////////////////////////////////
//outputs
	
	assign out_xpos = (xpos_reduce_done)? out_xpos_reduce : out_xpos_noreduce;
	assign out_ypos = (ypos_reduce_done)? out_ypos_reduce : out_ypos_noreduce;
	assign out_xneg = (xneg_reduce_done)? out_xneg_reduce : out_xneg_noreduce;
	assign out_yneg = (yneg_reduce_done)? out_yneg_reduce : out_yneg_noreduce;

	assign out_xpos_valid = ((xpos_reduce_done)&&(xpos_reduce_valid_out))||(out_xpos_noreduce[ValidBitPos]);
	assign out_ypos_valid = ((ypos_reduce_done)&&(ypos_reduce_valid_out))||(out_ypos_noreduce[ValidBitPos]);
	assign out_xneg_valid = ((xneg_reduce_done)&&(xneg_reduce_valid_out))||(out_xneg_noreduce[ValidBitPos]);
	assign out_yneg_valid = ((yneg_reduce_done)&&(yneg_reduce_valid_out))||(out_yneg_noreduce[ValidBitPos]);


endmodule
 
