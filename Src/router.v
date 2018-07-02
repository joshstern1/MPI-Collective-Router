`timescale 1ns / 1ps

module router(

    input clk,
    input rst,

    //interface from 6 MGTs
    input [FLIT_SIZE - 1 : 0] in_xpos,
    /*input [FLIT_SIZE - 1 : 0] in_ypos,
    input [FLIT_SIZE - 1 : 0] in_zpos,
    input [FLIT_SIZE - 1 : 0] in_xneg,
    input [FLIT_SIZE - 1 : 0] in_yneg,
    input [FLIT_SIZE - 1 : 0] in_zneg,*/
    input in_xpos_valid,
    /*input in_ypos_valid,
    input in_zpos_valid,
    input in_xneg_valid,
    input in_yneg_valid,
    input in_zneg_valid,*/
    //interface to 6 MGTs
    output [FLIT_SIZE - 1 : 0] out_xpos,/*
    output [FLIT_SIZE - 1 : 0] out_ypos,
    output [FLIT_SIZE - 1 : 0] out_zpos,
    output [FLIT_SIZE - 1 : 0] out_xneg,
    output [FLIT_SIZE - 1 : 0] out_yneg,
    output [FLIT_SIZE - 1 : 0] out_zneg,
    output out_xpos_valid,
    output out_ypos_valid,
    output out_zpos_valid,
    output out_xneg_valid,
    output out_yneg_valid,
    output out_zneg_valid,
    //interface to application kernel
    //inputs */
    output [FLIT_SIZE - 1 : 0] eject_xpos,/*
    output [FLIT_SIZE - 1 : 0] eject_ypos,
    output [FLIT_SIZE - 1 : 0] eject_zpos,
    output [FLIT_SIZE - 1 : 0] eject_xneg,
    output [FLIT_SIZE - 1 : 0] eject_yneg,
    output [FLIT_SIZE - 1 : 0] eject_zneg,*/
    output eject_xpos_valid,/*
    output eject_ypos_valid,
    output eject_zpos_valid,
    output eject_xneg_valid,
    output eject_yneg_valid,
    output eject_zneg_valid,*/

    input [FLIT_SIZE - 1 : 0] inject_xpos,/*
    input [FLIT_SIZE - 1 : 0] inject_ypos,
    input [FLIT_SIZE - 1 : 0] inject_zpos,
    input [FLIT_SIZE - 1 : 0] inject_xneg,
    input [FLIT_SIZE - 1 : 0] inject_yneg,
    input [FLIT_SIZE - 1 : 0] inject_zneg,*/
    input inject_xpos_valid/*,
    input inject_ypos_valid,
    input inject_zpos_valid,
    input inject_xneg_valid,
    input inject_yneg_valid,
    input inject_zneg_valid,
    output inject_xpos_avail,
    output inject_ypos_avail,
    output inject_zpos_avail,
    output inject_xneg_avail,
    output inject_yneg_avail,
    output inject_zneg_avail*/
    );
	 
	 parameter FLIT_SIZE = 82;
	 parameter cur_x = 0;
	 parameter cur_y = 0;
	 parameter cur_z = 0;
	 parameter ROUTE_LEN = 3;
	 parameter input_Q_size = 5;
	 parameter credit_back_period = 100;
	 parameter credit_threshold = 160;
	 
	 parameter DIR_INJECT=3'd0;
	 parameter DIR_XPOS=3'd1;
	 parameter DIR_YPOS=3'd2;
	 parameter DIR_ZPOS=3'd3;
	 parameter DIR_XNEG=3'd4;
	 parameter DIR_YNEG=3'd5;
	 parameter DIR_ZNEG=3'd6;
	 parameter DIR_EJECT=3'd7;
	 
	 parameter PORT_NUM = 6;
	 parameter VC_NUM = 1;
	 //instantiate route computation components

    wire VA_stall_xpos = 0;
    /*wire VA_stall_ypos;
    wire VA_stall_zpos;
    wire VA_stall_xneg;
    wire VA_stall_yneg;
    wire VA_stall_zneg;*/
	 
	 //instantiate 6 big input buffers
	 
//buffer output and IR input
	 wire [81:0]in_xpos_IR;
	 /*wire [81:0]in_ypos_IR;
	 wire [81:0]in_zpos_IR;
	 wire [81:0]in_xneg_IR;
	 wire [81:0]in_yneg_IR;
	 wire [81:0]in_zneg_IR;*/
	 
//IR output and buffer input
	 wire xpos_IR_consume;
	 /*wire ypos_IR_consume;
	 wire zpos_IR_consume;
	 wire xneg_IR_consume;
	 wire yneg_IR_consume;
	 wire zneg_IR_consume;*/

//IR output and RC input
    wire [84 : 0] in_xpos_RC;
   /* wire [FLIT_SIZE - 1 : 0] in_ypos_RC;
    wire [FLIT_SIZE - 1 : 0] in_zpos_RC;
    wire [FLIT_SIZE - 1 : 0] in_xneg_RC;
    wire [FLIT_SIZE - 1 : 0] in_yneg_RC;
    wire [FLIT_SIZE - 1 : 0] in_zneg_RC;*/
	 
//RC output and VC input
	 wire [FLIT_SIZE - 1 : 0] flit_xpos_VA;
   /* wire [FLIT_SIZE - 1 : 0] flit_ypos_VA;
    wire [FLIT_SIZE - 1 : 0] flit_zpos_VA;
    wire [FLIT_SIZE - 1 : 0] flit_xneg_VA;
    wire [FLIT_SIZE - 1 : 0] flit_yneg_VA;
    wire [FLIT_SIZE - 1 : 0] flit_zneg_VA;*/

    wire [ROUTE_LEN - 1 : 0] flit_xpos_VA_route;
    /*wire [ROUTE_LEN - 1 : 0] flit_ypos_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_zpos_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_xneg_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_yneg_VA_route;
    wire [ROUTE_LEN - 1 : 0] flit_zneg_VA_route;*/
	 
	 
	 
	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FLIT_SIZE)
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
	

	reduce_instr R1 (
	 .packetOut(in_xpos_RC),
	 .new_comm(61'b0),
	 .packetIn(in_xpos_IR),
	 .clk(clk),
	 .rst(rst),
	 .rd_en(xpos_IR_consume)
	);



    route_comp#(
        .cur_x(cur_x),
        .cur_y(cur_y),
        .cur_z(cur_z)
    )xpos_route_comp(
        .clk(clk),
        .rst(rst),
        .flit_valid_in(in_xpos_RC[81]),	//ValidBitPos
        .flit_before_RC(in_xpos_RC[81:0]),
        .stall(VA_stall_xpos),
        .dir_in(DIR_XPOS),
        .flit_after_RC(flit_xpos_VA),
        .flit_valid_out(),
        .dir_out(flit_xpos_VA_route),
        .eject_enable(eject_xpos_valid)
    );
    assign eject_xpos = flit_xpos_VA;
	 
	 
	 //instantiate switch

//buffer output and switch input
	 wire [FLIT_SIZE - 1 : 0] flit_xpos_SA;
    /*wire [FLIT_SIZE - 1 : 0] flit_ypos_SA;
    wire [FLIT_SIZE - 1 : 0] flit_zpos_SA;
    wire [FLIT_SIZE - 1 : 0] flit_xneg_SA;
    wire [FLIT_SIZE - 1 : 0] flit_yneg_SA;
    wire [FLIT_SIZE - 1 : 0] flit_zneg_SA;*/
		 
	 wire [ROUTE_LEN - 1 : 0] flit_xpos_SA_route;
    /*wire [ROUTE_LEN - 1 : 0] flit_ypos_SA_route;
    wire [ROUTE_LEN - 1 : 0] flit_zpos_SA_route;
    wire [ROUTE_LEN - 1 : 0] flit_xneg_SA_route;
    wire [ROUTE_LEN - 1 : 0] flit_yneg_SA_route;
    wire [ROUTE_LEN - 1 : 0] flit_zneg_SA_route;*/

    wire flit_xpos_SA_valid = flit_xpos_SA[81];
    wire flit_ypos_SA_valid;
    wire flit_zpos_SA_valid;
    wire flit_xneg_SA_valid;
    wire flit_yneg_SA_valid;
    wire flit_zneg_SA_valid;

//switch output and buffer input
    wire flit_xpos_SA_grant;
    wire flit_ypos_SA_grant;
    wire flit_zpos_SA_grant;
    wire flit_xneg_SA_grant;
    wire flit_yneg_SA_grant;
    wire flit_zneg_SA_grant;

	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FLIT_SIZE)
    )
    xpos_switch_queue(
        .clk(clk),
        .rst(rst),
        .in(flit_xpos_VA),
        .produce(flit_xpos_VA[81]),
        .consume(flit_xpos_SA_grant),
        .full(),
        .empty(),
        .out(flit_xpos_SA),
        .usedw()
    );

	 large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(ROUTE_LEN)
    )
    xpos_route_queue(
        .clk(clk),
        .rst(rst),
        .in(flit_xpos_VA_route),
        .produce(flit_xpos_VA[81]),
        .consume(flit_xpos_SA_grant),
        .full(),
        .empty(),
        .out(flit_xpos_SA_route),
        .usedw()
    );


    wire [PORT_NUM - 1 : 0] flit_valid_ST;
    wire [PORT_NUM * FLIT_SIZE - 1 : 0] out_ST;


    switch#(
        .M_IN(PORT_NUM),	//6
        .N_OUT(PORT_NUM)	//6
    )sw_inst(
        .clk(clk),
        .rst(rst),
        .in({410'b0, flit_xpos_SA}),
        .route_in({15'b0, flit_xpos_SA_route}),
        .in_valid({flit_zneg_SA_valid, flit_yneg_SA_valid, flit_xneg_SA_valid, flit_zpos_SA_valid, flit_ypos_SA_valid, flit_xpos_SA_valid}),
        .in_avail({flit_zneg_SA_grant, flit_yneg_SA_grant, flit_xneg_SA_grant, flit_zpos_SA_grant, flit_ypos_SA_grant, flit_xpos_SA_grant}),	//output
        
        .out_valid(flit_valid_ST),
        .out_avail(6'b0),	//input
        .out(out_ST)
    );


	 
	 assign out_xpos = ((flit_valid_ST[0]) && (~inject_xpos_valid))? out_ST[FLIT_SIZE - 1 : 0] : inject_xpos;
    /*assign out_ypos = ((flit_valid_ST[1]) && (~inject_ypos_valid))? out_ST[2 * FLIT_SIZE - 1 : FLIT_SIZE] : inject_ypos;
    assign out_zpos = ((flit_valid_ST[2]) && (~inject_zpos_valid))? out_ST[3 * FLIT_SIZE - 1 : 2 * FLIT_SIZE] : inject_zpos;
    assign out_xneg = ((flit_valid_ST[3]) && (~inject_xneg_valid))? out_ST[4 * FLIT_SIZE - 1 : 3 * FLIT_SIZE] : inject_xneg;
    assign out_yneg = ((flit_valid_ST[4]) && (~inject_yneg_valid))? out_ST[5 * FLIT_SIZE - 1 : 4 * FLIT_SIZE] : inject_yneg;
    assign out_zneg = ((flit_valid_ST[5]) && (~inject_zneg_valid))? out_ST[6 * FLIT_SIZE - 1 : 5 * FLIT_SIZE] : inject_zneg;*/
	 
	 
	 assign out_xpos_valid = flit_valid_ST[0] || inject_xpos_valid;
    /*assign out_ypos_valid = flit_valid_ST[1] || inject_ypos_valid;
    assign out_zpos_valid = flit_valid_ST[2] || inject_zpos_valid;
    assign out_xneg_valid = flit_valid_ST[3] || inject_xneg_valid;
    assign out_yneg_valid = flit_valid_ST[4] || inject_yneg_valid;
    assign out_zneg_valid = flit_valid_ST[5] || inject_zneg_valid;*/

	
	//need to add reduce_unit


    /*large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FLIT_SIZE)
    )
    ypos_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_ypos),
        .produce(in_ypos_valid && (~in_ypos_is_credit)),
        .consume(ypos_IR_consume),
        .full(),
        .empty(),
        .out(in_ypos_IR),
        .usedw()
    );



    large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FLIT_SIZE)
    )
    zpos_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_zpos),
        .produce(in_zpos_valid && (~in_zpos_is_credit)),
        .consume(zpos_IR_consume),
        .full(),
        .empty(),
        .out(in_zpos_IR),
        .usedw()
    );


 
    large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FLIT_SIZE)
    )
    xneg_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_xneg),
        .produce(in_xneg_valid && (~in_xneg_is_credit)),
        .consume(xneg_IR_consume),
        .full(),
        .empty(),
        .out(in_xneg_IR),
        .usedw()
    );



    large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FLIT_SIZE)
    )
    yneg_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_yneg),
        .produce(in_yneg_valid && (~in_yneg_is_credit)),
        .consume(yneg_IR_consume),
        .full(),
        .empty(),
        .out(in_yneg_IR),
        .usedw()
    );



    large_buffer#(
        .buffer_depth(input_Q_size),
        .buffer_width(FLIT_SIZE)
    )
    zneg_input_queue(
        .clk(clk),
        .rst(rst),
        .in(in_zneg),
        .produce(in_zneg_valid && (~in_zneg_is_credit)),
        .consume(zneg_IR_consume),
        .full(),
        .empty(),
        .out(in_zneg_IR),
        .usedw()
    );


*/





endmodule
