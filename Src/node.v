`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
module node
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
	 /*input [FLIT_SIZE : 0]inject_zpos,
	 input [FLIT_SIZE : 0]inject_xneg,
	 input [FLIT_SIZE : 0]inject_yneg,
	 input [FLIT_SIZE : 0]inject_zneg,*/
	 
	 input [FLIT_SIZE - 1 : 0] in_xpos_ser,	
	 input [FLIT_SIZE - 1 : 0] in_ypos_ser,	
	 /*input [FLIT_SIZE -1 : 0] in_zpos_ser,
	 input [FLIT_SIZE - 1 : 0] in_xneg_ser,
	 input [FLIT_SIZE - 1 : 0] in_yneg_ser,
	 input [FLIT_SIZE -1 : 0] in_zneg_ser,	*/
	 
    output [FLIT_SIZE - 1 : 0] out_xpos_ser,
    output [FLIT_SIZE - 1 : 0] out_ypos_ser,	
	 /*output [FLIT_SIZE - 1 : 0] out_zpos_ser,
    output [FLIT_SIZE - 1 : 0] out_xneg_ser,	    	
    output [FLIT_SIZE - 1 : 0] out_yneg_ser,
    output [FLIT_SIZE - 1 : 0] out_zneg_ser*/
	 
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

	 localparam CommTableWidth = (lg_numprocs+2)*DstWidth + lg_numprocs*2+2;
	 localparam NewCommWidth = CommTableWidth+ContextIdWidth;
	
	 localparam FLIT_SIZE = FlitWidth;
	 localparam LinkDelay = 6;

	
    wire [FLIT_SIZE - 1 : 0] in_xpos;
    wire [FLIT_SIZE - 1 : 0] in_ypos;
    /*wire [FLIT_SIZE - 1 : 0] in_zpos;
    wire [FLIT_SIZE - 1 : 0] in_xneg;
    wire [FLIT_SIZE - 1 : 0] in_yneg;
    wire [FLIT_SIZE - 1 : 0] in_zneg;*/
    
    wire in_xpos_valid;
    wire in_ypos_valid;
    wire in_zpos_valid;
    wire in_xneg_valid;
    wire in_yneg_valid;
    wire in_zneg_valid;

    wire [FLIT_SIZE - 1 : 0] out_xpos;
    wire [FLIT_SIZE - 1 : 0] out_ypos;
    /*wire [FLIT_SIZE - 1 : 0] out_zpos;
    wire [FLIT_SIZE - 1 : 0] out_xneg;
    wire [FLIT_SIZE - 1 : 0] out_yneg;
    wire [FLIT_SIZE - 1 : 0] out_zneg;*/
    
    wire out_xpos_valid;
    wire out_ypos_valid;
    /*wire out_zpos_valid;
    wire out_xneg_valid;
    wire out_yneg_valid;
    wire out_zneg_valid;*/
   
    wire inject_xpos_valid = inject_xpos[ValidBitPos];
    wire inject_ypos_valid = inject_ypos[ValidBitPos];
    /*wire inject_zpos_valid = inject_zpos[ValidBitPos];
    wire inject_xneg_valid = inject_xneg[ValidBitPos];
    wire inject_yneg_valid = inject_yneg[ValidBitPos]; 
    wire inject_zneg_valid = inject_zneg[ValidBitPos];*/
 
    wire [FlitChildWidth - 1 : 0] eject_xpos;
    wire [FlitChildWidth - 1 : 0] eject_ypos;
    /*wire [FlitChildWidth - 1 : 0] eject_zpos;
    wire [FlitChildWidth - 1 : 0] eject_xneg;
    wire [FlitChildWidth - 1 : 0] eject_yneg;
    wire [FlitChildWidth - 1 : 0] eject_zneg;*/
    
    wire eject_xpos_valid;
    wire eject_ypos_valid;
    /*wire eject_zpos_valid;
    wire eject_xneg_valid;
    wire eject_yneg_valid;
    wire eject_zneg_valid;*/

    
    router#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z),
		  .lg_numprocs(lg_numprocs),
		  .PayloadWidth(PayloadWidth)
    )
    switch_inst(
        .clk(clk),
        .rst(rst),

    //interface from 6 MGTs
        .in_xpos(in_xpos),
        .in_ypos(in_ypos),
        /*.in_zpos(in_zpos),
        .in_xneg(in_xneg),
        .in_yneg(in_yneg),
        .in_zneg(in_zneg),*/
        .in_xpos_valid(in_xpos_valid),
        .in_ypos_valid(in_ypos_valid),
        /*.in_zpos_valid(in_zpos_valid),
        .in_xneg_valid(in_xneg_valid),
        .in_yneg_valid(in_yneg_valid),
        .in_zneg_valid(in_zneg_valid),*/
    //interface to 6 MGTs
        .out_xpos(out_xpos),
        .out_ypos(out_ypos),
        /*.out_zpos(out_zpos),
        .out_xneg(out_xneg),
        .out_yneg(out_yneg),
        .out_zneg(out_zneg),*/
        .out_xpos_valid(out_xpos_valid),
        .out_ypos_valid(out_ypos_valid),
        /*.out_zpos_valid(out_zpos_valid),
        .out_xneg_valid(out_xneg_valid),
        .out_yneg_valid(out_yneg_valid),
        .out_zneg_valid(out_zneg_valid),*/
		  
    //interface to application kernel
    //inputs 
        .eject_xpos(eject_xpos),
        .eject_ypos(eject_ypos),
        /*.eject_zpos(eject_zpos),
        .eject_xneg(eject_xneg),
        .eject_yneg(eject_yneg),
        .eject_zneg(eject_zneg),*/
        .eject_xpos_valid(eject_xpos_valid),
        .eject_ypos_valid(eject_ypos_valid),
        /*.eject_zpos_valid(eject_zpos_valid),
        .eject_xneg_valid(eject_xneg_valid),
        .eject_yneg_valid(eject_yneg_valid),
        .eject_zneg_valid(eject_zneg_valid),*/
        .inject_xpos(inject_xpos),
        .inject_ypos(inject_ypos),
        /*.inject_zpos(inject_zpos),
        .inject_xneg(inject_xneg),
        .inject_yneg(inject_yneg),
        .inject_zneg(inject_zneg),*/
        .inject_xpos_valid(inject_xpos_valid),
        .inject_ypos_valid(inject_ypos_valid),
        /*.inject_zpos_valid(inject_zpos_valid),
        .inject_xneg_valid(inject_xneg_valid),
        .inject_yneg_valid(inject_yneg_valid),
        .inject_zneg_valid(inject_zneg_valid),*/
		  
		  .newcomm(newcomm)
    );
	 
	 wire [FlitChildWidth-1:0]xpos_reduce_special = ((eject_xpos[35:34] == 2'b11)&&(eject_xpos[ValidBitPos]))? eject_xpos : 0;
	 wire [FlitChildWidth-1:0]ypos_reduce_special = ((eject_ypos[35:34] == 2'b11)&&(eject_ypos[ValidBitPos]))? eject_ypos : 0;
	 /*wire [FlitChildWidth-1:0]zpos_reduce_special = ((eject_zpos[35:34] == 2'b11)&&(eject_zpos[ValidBitPos]))? eject_zpos : 0;
	 wire [FlitChildWidth-1:0]xneg_reduce_special = ((eject_xneg[35:34] == 2'b11)&&(eject_xneg[ValidBitPos]))? eject_xneg : 0;
	 wire [FlitChildWidth-1:0]yneg_reduce_special = ((eject_yneg[35:34] == 2'b11)&&(eject_yneg[ValidBitPos]))? eject_yneg : 0;
	 wire [FlitChildWidth-1:0]zneg_reduce_special = ((eject_zneg[35:34] == 2'b11)&&(eject_zneg[ValidBitPos]))? eject_zneg : 0;*/
	
	 wire [FlitChildWidth-1:0] in_xpos_reduce;
	 wire [FlitChildWidth-1:0] in_ypos_reduce;
	 /*wire [FlitChildWidth-1:0] in_zpos_reduce;
	 wire [FlitChildWidth-1:0] in_xneg_reduce;
	 wire [FlitChildWidth-1:0] in_yneg_reduce;
	 wire [FlitChildWidth-1:0] in_zneg_reduce;*/
	 
	 wire [FlitWidth - 1 : 0] out_xpos_reduce;
	 wire [FlitWidth - 1 : 0] out_ypos_reduce;
	 /*wire [FlitWidth - 1 : 0] out_zpos_reduce;
	 wire [FlitWidth - 1 : 0] out_xneg_reduce;
	 wire [FlitWidth - 1 : 0] out_yneg_reduce;
	 wire [FlitWidth - 1 : 0] out_zneg_reduce;*/
	
	 wire xpos_rd_en;
	 wire ypos_rd_en;
	 /*wire zpos_rd_en;
	 wire xneg_rd_en;
	 wire yneg_rd_en;
	 wire zneg_rd_en;*/
	 
	 wire xpos_reduce_done;
	 wire ypos_reduce_done;
	 /*wire zpos_reduce_done;
	 wire xneg_reduce_done;
	 wire yneg_reduce_done;
	 wire zneg_reduce_done;*/
	 
	 wire xpos_reduce_valid_out;
	 wire ypos_reduce_valid_out;
	 /*wire zpos_reduce_valid_out;
	 wire xneg_reduce_valid_out;
	 wire yneg_reduce_valid_out;
	 wire zneg_reduce_valid_out;*/
	 
	fifo#(
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	 )	 
	xpos_reduce_fifo (
	 .clk(clk),
	 .rst(rst),
	 .buf_in(xpos_reduce_special),
	 .buf_out(in_xpos_reduce),
	 .wr_en(xpos_reduce_special[ValidBitPos]),
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
		.PayloadWidth(PayloadWidth)
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
	
	
	fifo#(
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	 )	 
	ypos_reduce_fifo (
	 .clk(clk),
	 .rst(rst),
	 .buf_in(ypos_reduce_special),
	 .buf_out(in_ypos_reduce),
	 .wr_en(ypos_reduce_special[ValidBitPos]),
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
		.PayloadWidth(PayloadWidth)
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
	
	
	/*fifo#(
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	 )	 
	zpos_reduce_fifo (
	 .clk(clk),
	 .rst(rst),
	 .buf_in(zpos_reduce_special),
	 .buf_out(in_zpos_reduce),
	 .wr_en(zpos_reduce_special[ValidBitPos]),
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
		.PayloadWidth(PayloadWidth)
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
	
	
	fifo#(
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	 )	 
	xneg_reduce_fifo (
	 .clk(clk),
	 .rst(rst),
	 .buf_in(xneg_reduce_special),
	 .buf_out(in_xneg_reduce),
	 .wr_en(xneg_reduce_special[ValidBitPos]),
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
		.PayloadWidth(PayloadWidth)
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
	
	
	fifo#(
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	 )	 
	yneg_reduce_fifo (
	 .clk(clk),
	 .rst(rst),
	 .buf_in(yneg_reduce_special),
	 .buf_out(in_yneg_reduce),
	 .wr_en(yneg_reduce_special[ValidBitPos]),
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
		.PayloadWidth(PayloadWidth)
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
	
	
	fifo#(
		.lg_numprocs(lg_numprocs),
		.PayloadWidth(PayloadWidth)
	 )	 
	zneg_reduce_fifo (
	 .clk(clk),
	 .rst(rst),
	 .buf_in(zneg_reduce_special),
	 .buf_out(in_zneg_reduce),
	 .wr_en(zneg_reduce_special[ValidBitPos]),
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
		.PayloadWidth(PayloadWidth)
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
	);*/

        
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
	 
/*
    //zpos link
    internode_link#(
        .DELAY(LinkDelay),
		  .FLIT_SIZE(FLIT_SIZE)
    )
    zpos_link_inst(
        .rst(rst),
        .clk(clk),
        .tx_par_data_valid(out_zpos_valid),
        .tx_par_data(out_zpos),
        .tx_ser_data(out_zpos_ser),
        .tx_ready(),
        .rx_par_data(in_zpos),
        .rx_par_data_valid(in_zpos_valid),
        .rx_ser_data(in_zpos_ser),
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
//zneg link
    internode_link#(
        .DELAY(LinkDelay),
		  .FLIT_SIZE(FLIT_SIZE)
    )
    zneg_link_inst(
        .rst(rst),
        .clk(clk),
        .tx_par_data_valid(out_zneg_valid),
        .tx_par_data(out_zneg),
        .tx_ser_data(out_zneg_ser),
        .tx_ready(),
        .rx_par_data(in_zneg),
        .rx_par_data_valid(in_zneg_valid),
        .rx_ser_data(in_zneg_ser),
        .rx_ready()
    );*/



    

endmodule
