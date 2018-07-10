`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
module node
#(
    parameter cur_x = 0,
    parameter cur_y = 0,
    parameter cur_z = 0,
	 parameter lg_numprocs = 3
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

	localparam FLIT_SIZE = 82;
	localparam LinkDelay = 6;

	localparam ValidBitPos = 81;
	localparam FlitWidth = ValidBitPos + 1;
	localparam ChildrenWidth=lg_numprocs;	 
	localparam FlitChildWidth = FlitWidth+ChildrenWidth;
	localparam DstWidth = 9;
	localparam CommTableWidth = (lg_numprocs+2)*DstWidth + lg_numprocs*2+2;
	localparam ContextIdWidth = 8;
	localparam NewCommWidth = CommTableWidth+ContextIdWidth;
	

	
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
		  .lg_numprocs(lg_numprocs)
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
        
//xpos link
    internode_link#(
        .DELAY(LinkDelay)
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
        .DELAY(LinkDelay)
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
        .DELAY(LinkDelay)
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
        .DELAY(LinkDelay)
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
        .DELAY(LinkDelay)
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
        .DELAY(LinkDelay)
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
