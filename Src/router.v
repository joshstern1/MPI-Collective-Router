`timescale 1ns / 1ns

module router#(
    parameter cur_x = 0,
    parameter cur_y = 0,
    parameter cur_z = 0,
	 parameter lg_numprocs = 3,
	 parameter PayloadWidth = 32,
	 parameter ReductionTableSize = 2
)(
    input clk,
    input rst,

    //interface from 6 MGTs
    input [FlitWidth - 1 : 0] in_xpos,
    input [FlitWidth - 1 : 0] in_ypos,
    input [FlitWidth - 1 : 0] in_zpos,
    input [FlitWidth - 1 : 0] in_xneg,
    input [FlitWidth - 1 : 0] in_yneg,
    input [FlitWidth - 1 : 0] in_zneg,
    input in_xpos_valid,
    input in_ypos_valid,
    input in_zpos_valid,
    input in_xneg_valid,
    input in_yneg_valid,
    input in_zneg_valid,
    //interface to 6 MGTs
    output [FlitWidth - 1 : 0] out_xpos,
    output [FlitWidth - 1 : 0] out_ypos,
    output [FlitWidth - 1 : 0] out_zpos,
    output [FlitWidth - 1 : 0] out_xneg,
    output [FlitWidth - 1 : 0] out_yneg,
    output [FlitWidth - 1 : 0] out_zneg,
    output out_xpos_valid,
    output out_ypos_valid,
    output out_zpos_valid,
    output out_xneg_valid,
    output out_yneg_valid,
    output out_zneg_valid,
	 
    //interface to application kernel
    //inputs */
    output [FlitChildWidth-1:0] eject_xpos,
    output [FlitChildWidth-1:0] eject_ypos,
    output [FlitChildWidth-1:0] eject_zpos,
    output [FlitChildWidth-1:0] eject_xneg,
    output [FlitChildWidth-1:0] eject_yneg,
    output [FlitChildWidth-1:0] eject_zneg,
    output eject_xpos_valid,
    output eject_ypos_valid,
    output eject_zpos_valid,
    output eject_xneg_valid,
    output eject_yneg_valid,
    output eject_zneg_valid,
    input [FlitChildWidth-1:0] inject_xpos,
    input [FlitChildWidth-1:0] inject_ypos,
    input [FlitChildWidth-1:0] inject_zpos,
    input [FlitChildWidth-1:0] inject_xneg,
    input [FlitChildWidth-1:0] inject_yneg,
    input [FlitChildWidth-1:0] inject_zneg,
    input inject_xpos_valid,
    input inject_ypos_valid,
    input inject_zpos_valid,
    input inject_xneg_valid,
    input inject_yneg_valid,
    input inject_zneg_valid,
	 
	 input [NewCommWidth-1:0]newcomm
	 
    );
	 
	 localparam ROUTE_LEN = 3;
	 localparam input_Q_size = 10;
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
	 wire [FlitWidth - 1 : 0]in_zpos_IR;
	 wire [FlitWidth - 1 : 0]in_xneg_IR;
	 wire [FlitWidth - 1 : 0]in_yneg_IR;
	 wire [FlitWidth - 1 : 0]in_zneg_IR;
	 

//IR output and buffer input
	 wire xpos_IR_consume;
	 wire ypos_IR_consume;
	 wire zpos_IR_consume;
	 wire xneg_IR_consume;
	 wire yneg_IR_consume;
	 wire zneg_IR_consume;

//IR output and RC input
    wire [FlitChildWidth-1:0] in_xpos_RC;
    wire [FlitChildWidth-1:0] in_ypos_RC;
    wire [FlitChildWidth-1:0] in_zpos_RC;
    wire [FlitChildWidth-1:0] in_xneg_RC;
    wire [FlitChildWidth-1:0] in_yneg_RC;
    wire [FlitChildWidth-1:0] in_zneg_RC;
	 
//RC output and VC input
	 wire [FlitChildWidth-1:0] flit_xpos_VA;
    wire [FlitChildWidth-1:0] flit_ypos_VA;
    wire [FlitChildWidth-1:0] flit_zpos_VA;
    wire [FlitChildWidth-1:0] flit_xneg_VA;
    wire [FlitChildWidth-1:0] flit_yneg_VA;
    wire [FlitChildWidth-1:0] flit_zneg_VA;

    wire [ROUTE_LEN - 1 : 0] flit_xpos_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_ypos_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_zpos_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_xneg_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_yneg_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_zneg_VA_route;
	 
	 
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
        .out(in_xpos_IR),
        .usedw()
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
        .out(in_ypos_IR),
        .usedw()
    );
	 
	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitWidth)
    )
    zpos_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_zpos),
        .produce(in_zpos_valid),
        .consume(zpos_IR_consume),
        .full(),
        .empty(),
        .out(in_zpos_IR),
        .usedw()
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
        .out(in_xneg_IR),
        .usedw()
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
        .out(in_yneg_IR),
        .usedw()
    );
	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitWidth)
    )
    zneg_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_zneg),
        .produce(in_zneg_valid),
        .consume(zneg_IR_consume),
        .full(),
        .empty(),
        .out(in_zneg_IR),
        .usedw()
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
	 .rd_en(xpos_IR_consume)
	);

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
	 .rd_en(ypos_IR_consume)
	);
	
	reduce_instr#(
		.rank_x(cur_x),
		.rank_y(cur_y),
		.rank_z(cur_z),
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	)
	zpos_IR(
	 .packetOut(in_zpos_RC),
	 .new_comm(newcomm),
	 .packetIn(in_zpos_IR),
	 .clk(clk),
	 .rst(rst),
	 .rd_en(zpos_IR_consume)
	);
	
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
	 .rd_en(xneg_IR_consume)
	);
	
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
	 .rd_en(yneg_IR_consume)
	);
	
	reduce_instr#(
		.rank_x(cur_x),
		.rank_y(cur_y),
		.rank_z(cur_z),
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	)
	zneg_IR(
	 .packetOut(in_zneg_RC),
	 .new_comm(newcomm),
	 .packetIn(in_zneg_IR),
	 .clk(clk),
	 .rst(rst),
	 .rd_en(zneg_IR_consume)
	);


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
        .eject_enable(eject_xpos_valid)
    );
    assign eject_xpos = flit_xpos_VA;
	 
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
        .eject_enable(eject_ypos_valid)
    );
    assign eject_ypos = flit_ypos_VA;
	 
	 route_comp#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z),
		  .DstPos(DstPos),
		  .DstWidth(DstWidth),
		  .Dst_XWidth(Dst_XWidth),
		  .ValidBitPos(ValidBitPos),
		  .lg_numprocs(lg_numprocs)
    )zpos_route_comp(
        .clk(clk),
        .rst(rst),
        .flit_valid_in(in_zpos_RC[ValidBitPos]),	
        .flit_before_RC(in_zpos_RC),
        .dir_in(DIR_ZPOS),
        .flit_after_RC(flit_zpos_VA),
        .flit_valid_out(),
        .dir_out(flit_zpos_VA_route),
        .eject_enable(eject_zpos_valid)
    );
    assign eject_zpos = flit_zpos_VA;
	 
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
        .eject_enable(eject_xneg_valid)
    );
    assign eject_xneg = flit_xneg_VA;
	 
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
        .eject_enable(eject_yneg_valid)
    );
    assign eject_yneg = flit_yneg_VA;
	 
	 route_comp#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z),
		  .DstPos(DstPos),
		  .DstWidth(DstWidth),
		  .Dst_XWidth(Dst_XWidth),
		  .ValidBitPos(ValidBitPos),
		  .lg_numprocs(lg_numprocs)
    )zneg_route_comp(
        .clk(clk),
        .rst(rst),
        .flit_valid_in(in_zneg_RC[ValidBitPos]),	
        .flit_before_RC(in_zneg_RC),
        .dir_in(DIR_ZNEG),
        .flit_after_RC(flit_zneg_VA),
        .flit_valid_out(),
        .dir_out(flit_zneg_VA_route),
        .eject_enable(eject_zneg_valid)
    );
    assign eject_zneg = flit_zneg_VA;
	 
///////////////////////////////////////////////////////////////////////////////////////

//buffer output and switch input
	 wire [FlitChildWidth-1:0] flit_xpos_SA;
    wire [FlitChildWidth-1:0] flit_ypos_SA;
    wire [FlitChildWidth-1:0] flit_zpos_SA;
    wire [FlitChildWidth-1:0] flit_xneg_SA;
    wire [FlitChildWidth-1:0] flit_yneg_SA;
    wire [FlitChildWidth-1:0] flit_zneg_SA;
		 
	 wire [ROUTE_LEN - 1 : 0] flit_xpos_SA_route;
    wire [ROUTE_LEN - 1 : 0] flit_ypos_SA_route;
    wire [ROUTE_LEN - 1 : 0] flit_zpos_SA_route;
    wire [ROUTE_LEN - 1 : 0] flit_xneg_SA_route;
    wire [ROUTE_LEN - 1 : 0] flit_yneg_SA_route;
    wire [ROUTE_LEN - 1 : 0] flit_zneg_SA_route;

    wire flit_xpos_SA_valid = flit_xpos_SA[ValidBitPos];
    wire flit_ypos_SA_valid = flit_ypos_SA[ValidBitPos];
    wire flit_zpos_SA_valid = flit_zpos_SA[ValidBitPos];
    wire flit_xneg_SA_valid = flit_xneg_SA[ValidBitPos];
    wire flit_yneg_SA_valid = flit_yneg_SA[ValidBitPos];
    wire flit_zneg_SA_valid = flit_zneg_SA[ValidBitPos];

//switch output and buffer input
    wire flit_xpos_SA_grant;
    wire flit_ypos_SA_grant;
    wire flit_zpos_SA_grant;
    wire flit_xneg_SA_grant;
    wire flit_yneg_SA_grant;
    wire flit_zneg_SA_grant;

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
        .produce((flit_xpos_VA[ValidBitPos])&&(!eject_xpos_valid)),
        .consume(flit_xpos_SA_grant),
        .full(),
        .empty(),
        .out({flit_xpos_SA_route, flit_xpos_SA}),
        .usedw()
    );
	 
	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitChildWidth + ROUTE_LEN)
    )
    ypos_switch_queue(
        .clk(clk),
        .rst(rst),
        .in({flit_ypos_VA_route, flit_ypos_VA}),
        .produce((flit_ypos_VA[ValidBitPos])&&(!eject_ypos_valid)),
        .consume(flit_ypos_SA_grant),
        .full(),
        .empty(),
        .out({flit_ypos_SA_route, flit_ypos_SA}),
        .usedw()
    );

	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitChildWidth + ROUTE_LEN)
    )
    zpos_switch_queue(
        .clk(clk),
        .rst(rst),
        .in({flit_zpos_VA_route, flit_zpos_VA}),
        .produce((flit_zpos_VA[ValidBitPos])&&(!eject_zpos_valid)),
        .consume(flit_zpos_SA_grant),
        .full(),
        .empty(),
        .out({flit_zpos_SA_route, flit_zpos_SA}),
        .usedw()
    );

	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitChildWidth + ROUTE_LEN)
    )
    xneg_switch_queue(
        .clk(clk),
        .rst(rst),
        .in({flit_xneg_VA_route, flit_xneg_VA}),
        .produce((flit_xneg_VA[ValidBitPos])&&(!eject_xneg_valid)),
        .consume(flit_xneg_SA_grant),
        .full(),
        .empty(),
        .out({flit_xneg_SA_route, flit_xneg_SA}),
        .usedw()
    );

	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitChildWidth + ROUTE_LEN)
    )
    yneg_switch_queue(
        .clk(clk),
        .rst(rst),
        .in({flit_yneg_VA_route, flit_yneg_VA}),
        .produce((flit_yneg_VA[ValidBitPos])&&(!eject_yneg_valid)),
        .consume(flit_yneg_SA_grant),
        .full(),
        .empty(),
        .out({flit_yneg_SA_route, flit_yneg_SA}),
        .usedw()
    );

	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitChildWidth + ROUTE_LEN)
    )
    zneg_switch_queue(
        .clk(clk),
        .rst(rst),
        .in({flit_zneg_VA_route, flit_zneg_VA}),
        .produce((flit_zneg_VA[ValidBitPos])&&(!eject_zneg_valid)),
        .consume(flit_zneg_SA_grant),
        .full(),
        .empty(),
        .out({flit_zneg_SA_route, flit_zneg_SA}),
        .usedw()
    );


    wire [PORT_NUM - 1 : 0] flit_valid_ST;
    wire [PORT_NUM * FlitChildWidth - 1 : 0] out_ST;
	 
/////////////////////////////////////////////////////////////////////
//switch

    switch#(
        .M_IN(PORT_NUM),	//6
		  .ValidBitPos(ValidBitPos),
		  .lg_numprocs(lg_numprocs)
    )sw_inst(
        .clk(clk),
        .rst(rst),
        .in({flit_zneg_SA, flit_yneg_SA, flit_xneg_SA, flit_zpos_SA, flit_ypos_SA, flit_xpos_SA}),
        .route_in({flit_zneg_SA_route, flit_yneg_SA_route, flit_xneg_SA_route, flit_zpos_SA_route, flit_ypos_SA_route, flit_xpos_SA_route}),
        .in_valid({flit_zneg_SA_valid, flit_yneg_SA_valid, flit_xneg_SA_valid, flit_zpos_SA_valid, flit_ypos_SA_valid, flit_xpos_SA_valid}),
		  .out_avail({inject_zneg_valid, inject_yneg_valid, inject_xneg_valid, inject_zpos_valid, inject_ypos_valid, inject_xpos_valid}),
		  
        .in_avail({flit_zneg_SA_grant, flit_yneg_SA_grant, flit_xneg_SA_grant, flit_zpos_SA_grant, flit_ypos_SA_grant, flit_xpos_SA_grant}),	//output        
        .out_valid(flit_valid_ST),
        .out(out_ST)
    );
	 
	 
	reg [FlitChildWidth-1:0]inject_xpos_hold;
	reg [FlitChildWidth-1:0]inject_ypos_hold;
	reg [FlitChildWidth-1:0]inject_zpos_hold;
	reg [FlitChildWidth-1:0]inject_xneg_hold;
	reg [FlitChildWidth-1:0]inject_yneg_hold;
	reg [FlitChildWidth-1:0]inject_zneg_hold;
	
	reg inject_xpos_valid_hold;
	reg inject_ypos_valid_hold;
	reg inject_zpos_valid_hold;
	reg inject_xneg_valid_hold;
	reg inject_yneg_valid_hold;
	reg inject_zneg_valid_hold;

	always @(posedge clk)begin
		inject_xpos_hold <= inject_xpos;
		inject_ypos_hold <= inject_ypos;
		inject_zpos_hold <= inject_zpos;
		inject_xneg_hold <= inject_xneg;
		inject_yneg_hold <= inject_yneg;
		inject_zneg_hold <= inject_zneg;
		inject_xpos_valid_hold <= inject_xpos_valid;
		inject_ypos_valid_hold <= inject_ypos_valid;
		inject_zpos_valid_hold <= inject_zpos_valid;
		inject_xneg_valid_hold <= inject_xneg_valid;
		inject_yneg_valid_hold <= inject_yneg_valid;
		inject_zneg_valid_hold <= inject_zneg_valid;
	end
	
	 wire [FlitChildWidth-1:0]out_xpos_switch = ((flit_valid_ST[0]) && (~inject_xpos_valid_hold))? out_ST[FlitChildWidth-1:0] : inject_xpos_hold;
    wire [FlitChildWidth-1:0]out_ypos_switch = ((flit_valid_ST[1]) && (~inject_ypos_valid))? out_ST[2 * FlitChildWidth - 1 : FlitChildWidth] : inject_ypos_hold;
    wire [FlitChildWidth-1:0]out_zpos_switch = ((flit_valid_ST[2]) && (~inject_zpos_valid))? out_ST[3 * FlitChildWidth - 1 : 2 * FlitChildWidth] : inject_zpos_hold;
    wire [FlitChildWidth-1:0]out_xneg_switch = ((flit_valid_ST[3]) && (~inject_xneg_valid))? out_ST[4 * FlitChildWidth - 1 : 3 * FlitChildWidth] : inject_xneg_hold;
    wire [FlitChildWidth-1:0]out_yneg_switch = ((flit_valid_ST[4]) && (~inject_yneg_valid))? out_ST[5 * FlitChildWidth - 1 : 4 * FlitChildWidth] : inject_yneg_hold;
    wire [FlitChildWidth-1:0]out_zneg_switch = ((flit_valid_ST[5]) && (~inject_zneg_valid))? out_ST[6 * FlitChildWidth - 1 : 5 * FlitChildWidth] : inject_zneg_hold;
	  

	wire xpos_reduce_special = ((out_xpos_switch[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(out_xpos_switch[ValidBitPos]));
	wire ypos_reduce_special = ((out_ypos_switch[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(out_ypos_switch[ValidBitPos]));
	wire zpos_reduce_special = ((out_zpos_switch[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(out_zpos_switch[ValidBitPos]));
	wire xneg_reduce_special = ((out_xneg_switch[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(out_xneg_switch[ValidBitPos]));
	wire yneg_reduce_special = ((out_yneg_switch[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(out_yneg_switch[ValidBitPos]));
	wire zneg_reduce_special = ((out_zneg_switch[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(out_zneg_switch[ValidBitPos]));
	 
	 
	 //reduction unit logic 	 
	 
	 wire [FlitChildWidth-1:0] in_xpos_reduce;
	 wire [FlitChildWidth-1:0] in_ypos_reduce;
	 wire [FlitChildWidth-1:0] in_zpos_reduce;
	 wire [FlitChildWidth-1:0] in_xneg_reduce;
	 wire [FlitChildWidth-1:0] in_yneg_reduce;
	 wire [FlitChildWidth-1:0] in_zneg_reduce;
	 
	 wire [FlitWidth - 1 : 0] out_xpos_reduce;
	 wire [FlitWidth - 1 : 0] out_ypos_reduce;
	 wire [FlitWidth - 1 : 0] out_zpos_reduce;
	 wire [FlitWidth - 1 : 0] out_xneg_reduce;
	 wire [FlitWidth - 1 : 0] out_yneg_reduce;
	 wire [FlitWidth - 1 : 0] out_zneg_reduce;
	 
	 wire xpos_rd_en;
	 wire ypos_rd_en;
	 wire zpos_rd_en;
	 wire xneg_rd_en;
	 wire yneg_rd_en;
	 wire zneg_rd_en;
	 
	 wire xpos_reduce_done;
	 wire ypos_reduce_done;
	 wire zpos_reduce_done;
	 wire xneg_reduce_done;
	 wire yneg_reduce_done;
	 wire zneg_reduce_done;
	 
	 wire xpos_reduce_valid_out;
	 wire ypos_reduce_valid_out;
	 wire zpos_reduce_valid_out;
	 wire xneg_reduce_valid_out;
	 wire yneg_reduce_valid_out;
	 wire zneg_reduce_valid_out;

	 wire [FlitWidth - 1 : 0]out_xpos_noreduce;
	 wire [FlitWidth - 1 : 0]out_ypos_noreduce;
	 wire [FlitWidth - 1 : 0]out_zpos_noreduce;
	 wire [FlitWidth - 1 : 0]out_xneg_noreduce;
	 wire [FlitWidth - 1 : 0]out_yneg_noreduce;
	 wire [FlitWidth - 1 : 0]out_zneg_noreduce;

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
        .out(out_xpos_noreduce),
        .usedw()
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
        .out(out_ypos_noreduce),
        .usedw()
    );
	
	
	fifo#(
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	 )	 
	 zpos_reduce_fifo (
	 .clk(clk),
	 .rst(rst),
	 .buf_in(out_zpos_switch),
	 .buf_out(in_zpos_reduce),
	 .wr_en(zpos_reduce_special),
	 .rd_en(zpos_rd_en),
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
	zpos_reduce_unit(
	 .Outpacket(out_zpos_reduce),
	 .done(zpos_reduce_done),
	 .valid_out(zpos_reduce_valid_out),
	 .clk(clk),
	 .rst(rst),
	 .packetA(in_zpos_reduce),
	 .rd_en(zpos_rd_en),
	 .wr_en(),
	 .fifo_counter(),
	 .buf_empty(),
	 .buf_full()
	);
	
	
	large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitWidth)
    )
    zpos_postswitch_fifo(
        .clk(clk),
        .rst(rst),
        .in(out_zpos_switch[FlitWidth-1:0]),
        .produce((out_zpos_switch[ValidBitPos])&&(out_zpos_switch[ReductionBitPos:ReductionBitPos-1]!=2'b11)),
        .consume(!zpos_reduce_done),
        .full(),
        .empty(),
        .out(out_zpos_noreduce),
        .usedw()
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
        .out(out_xneg_noreduce),
        .usedw()
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
        .out(out_yneg_noreduce),
        .usedw()
    );
	 
	 fifo#(
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	 )	 
	 zneg_reduce_fifo (
	 .clk(clk),
	 .rst(rst),
	 .buf_in(out_zneg_switch),
	 .buf_out(in_zneg_reduce),
	 .wr_en(zneg_reduce_special),
	 .rd_en(zneg_rd_en),
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
	zneg_reduce_unit(
	 .Outpacket(out_zneg_reduce),
	 .done(zneg_reduce_done),
	 .valid_out(zneg_reduce_valid_out),
	 .clk(clk),
	 .rst(rst),
	 .packetA(in_zneg_reduce),
	 .rd_en(zneg_rd_en),
	 .wr_en(),
	 .fifo_counter(),
	 .buf_empty(),
	 .buf_full()
	);
	
	
	large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitWidth)
    )
    zneg_postswitch_fifo(
        .clk(clk),
        .rst(rst),
        .in(out_zneg_switch[FlitWidth-1:0]),
        .produce((out_zneg_switch[ValidBitPos])&&(out_zneg_switch[ReductionBitPos:ReductionBitPos-1]!=2'b11)),
        .consume(!zneg_reduce_done),
        .full(),
        .empty(),
        .out(out_zneg_noreduce),
        .usedw()
    );

///////////////////////////////////////////////////////////////////////////////
//outputs
	
	assign out_xpos = (xpos_reduce_done)? out_xpos_reduce : out_xpos_noreduce;
	assign out_ypos = (ypos_reduce_done)? out_ypos_reduce : out_ypos_noreduce;
	assign out_zpos = (zpos_reduce_done)? out_zpos_reduce : out_zpos_noreduce;
	assign out_xneg = (xneg_reduce_done)? out_xneg_reduce : out_xneg_noreduce;
	assign out_yneg = (yneg_reduce_done)? out_yneg_reduce : out_yneg_noreduce;
	assign out_zneg = (zneg_reduce_done)? out_zneg_reduce : out_zneg_noreduce;

	assign out_xpos_valid = ((xpos_reduce_done)&&(xpos_reduce_valid_out))||(out_xpos_noreduce[ValidBitPos]);
	assign out_ypos_valid = ((ypos_reduce_done)&&(ypos_reduce_valid_out))||(out_ypos_noreduce[ValidBitPos]);
	assign out_zpos_valid = ((zpos_reduce_done)&&(zpos_reduce_valid_out))||(out_zpos_noreduce[ValidBitPos]);
	assign out_xneg_valid = ((xneg_reduce_done)&&(xneg_reduce_valid_out))||(out_xneg_noreduce[ValidBitPos]);
	assign out_yneg_valid = ((yneg_reduce_done)&&(yneg_reduce_valid_out))||(out_yneg_noreduce[ValidBitPos]);
	assign out_zneg_valid = ((zneg_reduce_done)&&(zneg_reduce_valid_out))||(out_zneg_noreduce[ValidBitPos]);


endmodule
 
