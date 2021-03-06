`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
module node_4
#(
    parameter cur_x = 0,
    parameter cur_y = 0,
    parameter cur_z = 0,
	 parameter lg_numprocs = 3,
	 parameter PayloadWidth = 32
)(
	 input clk,
    input rst,
	 
	 input [FlitChildWidth - 1 : 0]inject_xpos,
	 input [FlitChildWidth - 1 : 0]inject_ypos,
	 input [FlitChildWidth - 1 : 0]inject_xneg,
	 input [FlitChildWidth - 1 : 0]inject_yneg,
	 
	 input [FLIT_SIZE - 1 : 0] in_xpos_ser,	
	 input [FLIT_SIZE - 1 : 0] in_ypos_ser,	
	 input [FLIT_SIZE - 1 : 0] in_xneg_ser,
	 input [FLIT_SIZE - 1 : 0] in_yneg_ser,
	 
    output [FLIT_SIZE - 1 : 0] out_xpos_ser,
    output [FLIT_SIZE - 1 : 0] out_ypos_ser,	
    output [FLIT_SIZE - 1 : 0] out_xneg_ser,	    	
    output [FLIT_SIZE - 1 : 0] out_yneg_ser,
	 
	 input [FlitChildWidth - 1 : 0]reduce_me,	 
	 input [NewCommWidth-1:0]newcomm
);

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

	 localparam ChildrenWidth=lg_numprocs;	 
	 localparam FlitChildWidth = FlitWidth+ChildrenWidth;
	 
	 localparam ReductionBitPos=opPos+opWidth-1;
	 localparam ReductionTableSize = 140;

	 localparam CommTableWidth = (lg_numprocs+2)*DstWidth + lg_numprocs*2+2;
	 localparam NewCommWidth = CommTableWidth+ContextIdWidth;
	
	 localparam FLIT_SIZE = FlitWidth;
	 localparam LinkDelay = 24;
	 localparam input_Q_size = 140;

	
    wire [FLIT_SIZE - 1 : 0] in_xpos;
    wire [FLIT_SIZE - 1 : 0] in_ypos;
    wire [FLIT_SIZE - 1 : 0] in_xneg;
    wire [FLIT_SIZE - 1 : 0] in_yneg;
    
    wire in_xpos_valid;
    wire in_ypos_valid;
    wire in_xneg_valid;
    wire in_yneg_valid;

    wire [FLIT_SIZE - 1 : 0] out_xpos;
    wire [FLIT_SIZE - 1 : 0] out_ypos;
    wire [FLIT_SIZE - 1 : 0] out_xneg;
    wire [FLIT_SIZE - 1 : 0] out_yneg;
    
    wire out_xpos_valid;
    wire out_ypos_valid;
    wire out_xneg_valid;
    wire out_yneg_valid;
   
    wire inject_xpos_valid = inject_xpos[ValidBitPos];
    wire inject_ypos_valid = inject_ypos[ValidBitPos];
    wire inject_xneg_valid = inject_xneg[ValidBitPos];
    wire inject_yneg_valid = inject_yneg[ValidBitPos]; 
 
    wire [FlitChildWidth - 1 : 0] eject_xpos;
    wire [FlitChildWidth - 1 : 0] eject_ypos;
    wire [FlitChildWidth - 1 : 0] eject_xneg;
    wire [FlitChildWidth - 1 : 0] eject_yneg;
    
    wire eject_xpos_valid;
    wire eject_ypos_valid;
    wire eject_xneg_valid;
    wire eject_yneg_valid;

    
    router_4#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z),
		  .lg_numprocs(lg_numprocs),
		  .PayloadWidth(PayloadWidth),
		  .ReductionTableSize(ReductionTableSize),
		  .input_Q_size(input_Q_size)
    )
    switch_inst(
        .clk(clk),
        .rst(rst),

    //interface from 6 MGTs
        .in_xpos(in_xpos),
        .in_ypos(in_ypos),
        .in_xneg(in_xneg),
        .in_yneg(in_yneg),
        .in_xpos_valid(in_xpos_valid),
        .in_ypos_valid(in_ypos_valid),
        .in_xneg_valid(in_xneg_valid),
        .in_yneg_valid(in_yneg_valid),
    //interface to 6 MGTs
        .out_xpos(out_xpos),
        .out_ypos(out_ypos),
        .out_xneg(out_xneg),
        .out_yneg(out_yneg),
        .out_xpos_valid(out_xpos_valid),
        .out_ypos_valid(out_ypos_valid),
        .out_xneg_valid(out_xneg_valid),
        .out_yneg_valid(out_yneg_valid),
		  
    //interface to application kernel
    //inputs 
        .eject_xpos(eject_xpos),
        .eject_ypos(eject_ypos),
        .eject_xneg(eject_xneg),
        .eject_yneg(eject_yneg),
        .eject_xpos_valid(eject_xpos_valid),
        .eject_ypos_valid(eject_ypos_valid),
        .eject_xneg_valid(eject_xneg_valid),
        .eject_yneg_valid(eject_yneg_valid),
        .inject_xpos(inject_xpos),
        .inject_ypos(inject_ypos),
        .inject_xneg(inject_xneg),
        .inject_yneg(inject_yneg),
        .inject_xpos_valid(inject_xpos_valid),
        .inject_ypos_valid(inject_ypos_valid),
        .inject_xneg_valid(inject_xneg_valid),
        .inject_yneg_valid(inject_yneg_valid),
		 
		  .newcomm(newcomm)
    );
	 
	 wire xpos_reduce_special = ((eject_xpos[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(eject_xpos_valid));
	 wire ypos_reduce_special = ((eject_ypos[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(eject_ypos_valid));
	 wire xneg_reduce_special = ((eject_xneg[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(eject_xneg_valid));
	 wire yneg_reduce_special = ((eject_yneg[ReductionBitPos:ReductionBitPos-1] == 2'b11)&&(eject_yneg_valid));
	 
	 wire [2:0]selector;
	 
	 wire xpos_reduce_grant = ((selector==0)&&(valid_switch_out)&&(!reduce_me[ValidBitPos]));
	 wire ypos_reduce_grant = ((selector==1)&&(valid_switch_out)&&(!reduce_me[ValidBitPos]));
	 wire xneg_reduce_grant = ((selector==3)&&(valid_switch_out)&&(!reduce_me[ValidBitPos]));
	 wire yneg_reduce_grant = ((selector==4)&&(valid_switch_out)&&(!reduce_me[ValidBitPos]));
	 
	 wire xpos_reduce_empty;
	 wire ypos_reduce_empty;
	 wire xneg_reduce_empty;
	 wire yneg_reduce_empty;

	
	 wire [FlitChildWidth-1:0] xpos_reduce;
	 wire [FlitChildWidth-1:0] ypos_reduce;
	 wire [FlitChildWidth-1:0] xneg_reduce;
	 wire [FlitChildWidth-1:0] yneg_reduce;
	 
	 wire [FlitWidth - 1 : 0] out_reduce;
	 wire reduce_done;
	 wire reduce_valid_out;
	
	 wire rd_en;
	 wire valid_switch_out;
	 wire [FlitChildWidth-1:0]reduce_switch_out;
	 wire [FlitChildWidth-1:0]reduce_in;
	 
	

	 
	large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitChildWidth)
    )
    xpos_reduce_fifo(
        .clk(clk),
        .rst(rst),
        .in(eject_xpos),
        .produce(xpos_reduce_special),
        .consume(xpos_reduce_grant),
        .full(),
        .empty(xpos_reduce_empty),
        .out(xpos_reduce)
    ); 
	 
	large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitChildWidth)
    )
    ypos_reduce_fifo(
        .clk(clk),
        .rst(rst),
        .in(eject_ypos),
        .produce(ypos_reduce_special),
        .consume(ypos_reduce_grant),
        .full(),
        .empty(ypos_reduce_empty),
        .out(ypos_reduce)
    ); 
	 
	 
	large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitChildWidth)
    )
    xneg_reduce_fifo(
        .clk(clk),
        .rst(rst),
        .in(eject_xneg),
        .produce(xneg_reduce_special),
        .consume(xneg_reduce_grant),
        .full(),
        .empty(xneg_reduce_empty),
        .out(xneg_reduce)
    );

	large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FlitChildWidth)
    )
    yneg_reduce_fifo(
        .clk(clk),
        .rst(rst),
        .in(eject_yneg),
        .produce(yneg_reduce_special),
        .consume(yneg_reduce_grant),
        .full(),
        .empty(yneg_reduce_empty),
        .out(yneg_reduce)
    ); 	 
	 
	 
	 reduction_tree#(
	     .FAN_IN(6),
			.ValidBitPos(ValidBitPos),
			.lg_numprocs(lg_numprocs)
	 )
	 node_reduce_switch(
		.clk(clk),
		.rst(rst),
		.in({84'b0, yneg_reduce, xneg_reduce, 84'b0, ypos_reduce, xpos_reduce}),
		.in_valid({1'b0, (!yneg_reduce_empty), (!xneg_reduce_empty), 1'b0, (!ypos_reduce_empty), (!xpos_reduce_empty)}),
		.out(reduce_switch_out),
		.out_valid(valid_switch_out),
		.selector(selector)
	 );
	 
	 wire [FlitChildWidth - 1 : 0]reduce_fifo_in = (reduce_me[ValidBitPos])? reduce_me : reduce_switch_out;
	 
	fifo#(
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	 )	 
	reduce_fifo (
	 .clk(clk),
	 .rst(rst),
	 .buf_in(reduce_fifo_in),
	 .buf_out(reduce_in),
	 .wr_en((valid_switch_out)||(reduce_me[ValidBitPos])),
	 .rd_en(rd_en),
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
	node_reduce_unit(
	 .Outpacket(out_reduce),
	 .done(reduce_done),
	 .valid_out(xpos_reduce_valid_out),
	 .clk(clk),
	 .rst(rst),
	 .packetA(reduce_in),
	 .rd_en(rd_en),
	 .wr_en(),
	 .fifo_counter(),
	 .buf_empty(),
	 .buf_full()
	);
	
	


        
//xpos link
    internode_link#(
        .DELAY(LinkDelay),
		  .FLIT_SIZE(FLIT_SIZE)
    )
    xpos_link_inst(
        .rst(rst),
        .clk(clk),
        .tx_par_data_valid(out_xpos_valid),
        .tx_par_data(out_xpos),
        .tx_ser_data(out_xpos_ser),
        .tx_ready(),
        .rx_par_data(in_xpos),
        .rx_par_data_valid(in_xpos_valid),
        .rx_ser_data(in_xpos_ser),
        .rx_ready()
    );

//ypos link
    internode_link#(
        .DELAY(LinkDelay),
		  .FLIT_SIZE(FLIT_SIZE)
    )
    ypos_link_inst(
        .rst(rst),
        .clk(clk),
        .tx_par_data_valid(out_ypos_valid),
        .tx_par_data(out_ypos),
        .tx_ser_data(out_ypos_ser),
        .tx_ready(),
        .rx_par_data(in_ypos),
        .rx_par_data_valid(in_ypos_valid),
        .rx_ser_data(in_ypos_ser),
        .rx_ready()
    );
	 


//xneg link
    internode_link#(
        .DELAY(LinkDelay),
		  .FLIT_SIZE(FLIT_SIZE)
    )
    xneg_link_inst(
        .rst(rst),
        .clk(clk),
        .tx_par_data_valid(out_xneg_valid),
        .tx_par_data(out_xneg),
        .tx_ser_data(out_xneg_ser),
        .tx_ready(),
        .rx_par_data(in_xneg),
        .rx_par_data_valid(in_xneg_valid),
        .rx_ser_data(in_xneg_ser),
        .rx_ready()
    );
//yneg link
    internode_link#(
        .DELAY(LinkDelay),
		  .FLIT_SIZE(FLIT_SIZE)
    )
    yneg_link_inst(
        .rst(rst),
        .clk(clk),
        .tx_par_data_valid(out_yneg_valid),
        .tx_par_data(out_yneg),
        .tx_ser_data(out_yneg_ser),
        .tx_ready(),
        .rx_par_data(in_yneg),
        .rx_par_data_valid(in_yneg_valid),
        .rx_ser_data(in_yneg_ser),
        .rx_ready()
    );


    

endmodule
 
 
