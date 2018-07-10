`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
    module network(
    input clk,
    input rst,
	 input [FlitChildWidth - 1 : 0]in_xpos_inject_0_0_0,
	 /*input [FlitChildWidth - 1 : 0]in_ypos_inject_0_0_0,
	 input [FlitChildWidth - 1 : 0]in_zpos_inject_0_0_0,
	 input [FlitChildWidth - 1 : 0]in_xneg_inject_0_0_0,
	 input [FlitChildWidth - 1 : 0]in_yneg_inject_0_0_0,
	 input [FlitChildWidth - 1 : 0]in_zneg_inject_0_0_0*/
	 input [NewCommWidth - 1 : 0]newcomm_0_0_0,
	 input [FlitChildWidth - 1 : 0]in_xpos_inject_0_0_1,
	 /*input [FlitChildWidth - 1 : 0]in_ypos_inject_0_0_1,
	 input [FlitChildWidth - 1 : 0]in_zpos_inject_0_0_1,
	 input [FlitChildWidth - 1 : 0]in_xneg_inject_0_0_1,
	 input [FlitChildWidth - 1 : 0]in_yneg_inject_0_0_1,
	 input [FlitChildWidth - 1 : 0]in_zneg_inject_0_0_1,*/
	 input [NewCommWidth - 1 : 0]newcomm_0_0_1,
	 output valid
);

	localparam FLIT_SIZE = 82;
	localparam lg_numprocs = 3;
	localparam num_procs = 1 << lg_numprocs;
 
	localparam ValidBitPos = 81;
	localparam FlitWidth = ValidBitPos + 1;

	localparam ChildrenPos=ValidBitPos+1;
	localparam ChildrenWidth=lg_numprocs;
	 
	localparam FlitChildWidth = FlitWidth+ChildrenWidth;
   localparam DstWidth = 9;
	localparam CommTableWidth = (lg_numprocs+2)*DstWidth + lg_numprocs*2+2;
	localparam ContextIdWidth = 8;
	localparam NewCommWidth = CommTableWidth+ContextIdWidth;
	
	assign valid = 1'b1;

	wire[FLIT_SIZE - 1 : 0] in_xpos_ser_0_0_0, out_xpos_ser_0_0_0;
	/*wire[FLIT_SIZE - 1 : 0] in_ypos_ser_0_0_0, out_ypos_ser_0_0_0;
	wire[FLIT_SIZE - 1 : 0] in_zpos_ser_0_0_0, out_zpos_ser_0_0_0;
	wire[FLIT_SIZE - 1 : 0] in_xneg_ser_0_0_0, out_xneg_ser_0_0_0;
	wire[FLIT_SIZE - 1 : 0] in_yneg_ser_0_0_0, out_yneg_ser_0_0_0;
	wire[FLIT_SIZE - 1 : 0] in_zneg_ser_0_0_0, out_zneg_ser_0_0_0;*/


	wire[FLIT_SIZE - 1 : 0] in_xpos_ser_0_0_1, out_xpos_ser_0_0_1;
	/*wire[FLIT_SIZE  - 1 : 0] in_ypos_ser_0_0_1, out_ypos_ser_0_0_1;
	wire[FLIT_SIZE - 1 : 0] in_zpos_ser_0_0_1, out_zpos_ser_0_0_1;
	wire[FLIT_SIZE - 1 : 0] in_xneg_ser_0_0_1, out_xneg_ser_0_0_1;	
	wire[FLIT_SIZE - 1 : 0] in_yneg_ser_0_0_1, out_yneg_ser_0_0_1;	
	wire[FLIT_SIZE - 1 : 0] in_zneg_ser_0_0_1, out_zneg_ser_0_0_1;


	wire[FLIT_SIZE - 1 : 0] in_xpos_ser_0_1_0, out_xpos_ser_0_1_0;
	wire[FLIT_SIZE - 1 : 0] in_xneg_ser_0_1_0, out_xneg_ser_0_1_0;
	wire[FLIT_SIZE - 1 : 0] in_ypos_ser_0_1_0, out_ypos_ser_0_1_0;
	wire[FLIT_SIZE - 1 : 0] in_yneg_ser_0_1_0, out_yneg_ser_0_1_0;
	wire[FLIT_SIZE - 1 : 0] in_zpos_ser_0_1_0, out_zpos_ser_0_1_0;
	wire[FLIT_SIZE - 1 : 0] in_zneg_ser_0_1_0, out_zneg_ser_0_1_0;

 
	wire[FLIT_SIZE - 1 : 0] in_xpos_ser_0_1_1, out_xpos_ser_0_1_1;
	wire[FLIT_SIZE - 1 : 0] in_xneg_ser_0_1_1, out_xneg_ser_0_1_1;
	wire[FLIT_SIZE - 1 : 0] in_ypos_ser_0_1_1, out_ypos_ser_0_1_1;
	wire[FLIT_SIZE - 1 : 0] in_yneg_ser_0_1_1, out_yneg_ser_0_1_1;
	wire[FLIT_SIZE - 1 : 0] in_zpos_ser_0_1_1, out_zpos_ser_0_1_1;
	wire[FLIT_SIZE - 1 : 0] in_zneg_ser_0_1_1, out_zneg_ser_0_1_1;


	wire[FLIT_SIZE - 1 : 0] in_xpos_ser_1_0_0, out_xpos_ser_1_0_0;
	wire[FLIT_SIZE - 1 : 0] in_xneg_ser_1_0_0, out_xneg_ser_1_0_0;
	wire[FLIT_SIZE - 1 : 0] in_ypos_ser_1_0_0, out_ypos_ser_1_0_0;
	wire[FLIT_SIZE - 1 : 0] in_yneg_ser_1_0_0, out_yneg_ser_1_0_0;
	wire[FLIT_SIZE - 1 : 0] in_zpos_ser_1_0_0, out_zpos_ser_1_0_0;
	wire[FLIT_SIZE - 1 : 0] in_zneg_ser_1_0_0, out_zneg_ser_1_0_0;


	wire[FLIT_SIZE - 1 : 0] in_xpos_ser_1_0_1, out_xpos_ser_1_0_1;
	wire[FLIT_SIZE - 1 : 0] in_xneg_ser_1_0_1, out_xneg_ser_1_0_1;
	wire[FLIT_SIZE - 1 : 0] in_ypos_ser_1_0_1, out_ypos_ser_1_0_1;
	wire[FLIT_SIZE - 1 : 0] in_yneg_ser_1_0_1, out_yneg_ser_1_0_1;
	wire[FLIT_SIZE - 1 : 0] in_zpos_ser_1_0_1, out_zpos_ser_1_0_1;
	wire[FLIT_SIZE - 1 : 0] in_zneg_ser_1_0_1, out_zneg_ser_1_0_1;


	wire[FLIT_SIZE - 1 : 0] in_xpos_ser_1_1_0, out_xpos_ser_1_1_0;
	wire[FLIT_SIZE - 1 : 0] in_xneg_ser_1_1_0, out_xneg_ser_1_1_0;
	wire[FLIT_SIZE - 1 : 0] in_ypos_ser_1_1_0, out_ypos_ser_1_1_0;
	wire[FLIT_SIZE - 1 : 0] in_yneg_ser_1_1_0, out_yneg_ser_1_1_0;
	wire[FLIT_SIZE - 1 : 0] in_zpos_ser_1_1_0, out_zpos_ser_1_1_0;
	wire[FLIT_SIZE - 1 : 0] in_zneg_ser_1_1_0, out_zneg_ser_1_1_0;


	wire[FLIT_SIZE - 1 : 0] in_xpos_ser_1_1_1, out_xpos_ser_1_1_1;
	wire[FLIT_SIZE - 1 : 0] in_xneg_ser_1_1_1, out_xneg_ser_1_1_1;
	wire[FLIT_SIZE - 1 : 0] in_ypos_ser_1_1_1, out_ypos_ser_1_1_1;
	wire[FLIT_SIZE - 1 : 0] in_yneg_ser_1_1_1, out_yneg_ser_1_1_1;
	wire[FLIT_SIZE - 1 : 0] in_zpos_ser_1_1_1, out_zpos_ser_1_1_1;
	wire[FLIT_SIZE - 1 : 0] in_zneg_ser_1_1_1, out_zneg_ser_1_1_1;*/

	assign in_xpos_ser_0_0_1 = 0;
	assign in_xpos_ser_0_0_0 = out_xpos_ser_0_0_1;

	/*assign in_xpos_ser_0_0_0=out_xneg_ser_1_0_0;
	assign in_xneg_ser_0_0_0=out_xpos_ser_1_0_0;
	assign in_xpos_ser_0_0_1=out_xneg_ser_1_0_1;
	assign in_xneg_ser_0_0_1=out_xpos_ser_1_0_1;
	assign in_xpos_ser_0_1_0=out_xneg_ser_1_1_0;
	assign in_xneg_ser_0_1_0=out_xpos_ser_1_1_0;
	assign in_xpos_ser_0_1_1=out_xneg_ser_1_1_1;
	assign in_xneg_ser_0_1_1=out_xpos_ser_1_1_1;
	assign in_xpos_ser_1_0_0=out_xneg_ser_0_0_0;
	assign in_xneg_ser_1_0_0=out_xpos_ser_0_0_0;
	assign in_xpos_ser_1_0_1=out_xneg_ser_0_0_1;
	assign in_xneg_ser_1_0_1=out_xpos_ser_0_0_1;
	assign in_xpos_ser_1_1_0=out_xneg_ser_0_1_0;
	assign in_xneg_ser_1_1_0=out_xpos_ser_0_1_0;
	assign in_xpos_ser_1_1_1=out_xneg_ser_0_1_1;
	assign in_xneg_ser_1_1_1=out_xpos_ser_0_1_1;
	assign in_ypos_ser_0_0_0=out_yneg_ser_0_1_0;
	assign in_yneg_ser_0_0_0=out_ypos_ser_0_1_0;
	assign in_ypos_ser_0_0_1=out_yneg_ser_0_1_1;
	assign in_yneg_ser_0_0_1=out_ypos_ser_0_1_1;
	assign in_ypos_ser_0_1_0=out_yneg_ser_0_0_0;
	assign in_yneg_ser_0_1_0=out_ypos_ser_0_0_0;
	assign in_ypos_ser_0_1_1=out_yneg_ser_0_0_1;
	assign in_yneg_ser_0_1_1=out_ypos_ser_0_0_1;
	assign in_ypos_ser_1_0_0=out_yneg_ser_1_1_0;
	assign in_yneg_ser_1_0_0=out_ypos_ser_1_1_0;
	assign in_ypos_ser_1_0_1=out_yneg_ser_1_1_1;
	assign in_yneg_ser_1_0_1=out_ypos_ser_1_1_1;
	assign in_ypos_ser_1_1_0=out_yneg_ser_1_0_0;
	assign in_yneg_ser_1_1_0=out_ypos_ser_1_0_0;
	assign in_ypos_ser_1_1_1=out_yneg_ser_1_0_1;
	assign in_yneg_ser_1_1_1=out_ypos_ser_1_0_1;
	assign in_zpos_ser_0_0_0=out_zneg_ser_0_0_1;
	assign in_zneg_ser_0_0_0=out_zpos_ser_0_0_1;
	assign in_zpos_ser_0_0_1=out_zneg_ser_0_0_0;
	assign in_zneg_ser_0_0_1=out_zpos_ser_0_0_0;
	assign in_zpos_ser_0_1_0=out_zneg_ser_0_1_1;
	assign in_zneg_ser_0_1_0=out_zpos_ser_0_1_1;
	assign in_zpos_ser_0_1_1=out_zneg_ser_0_1_0;
	assign in_zneg_ser_0_1_1=out_zpos_ser_0_1_0;
	assign in_zpos_ser_1_0_0=out_zneg_ser_1_0_1;
	assign in_zneg_ser_1_0_0=out_zpos_ser_1_0_1;
	assign in_zpos_ser_1_0_1=out_zneg_ser_1_0_0;
	assign in_zneg_ser_1_0_1=out_zpos_ser_1_0_0;
	assign in_zpos_ser_1_1_0=out_zneg_ser_1_1_1;
	assign in_zneg_ser_1_1_0=out_zpos_ser_1_1_1;
	assign in_zpos_ser_1_1_1=out_zneg_ser_1_1_0;
	assign in_zneg_ser_1_1_1=out_zpos_ser_1_1_0;*/
	
    node#(
        .cur_x(0),
        .cur_y(0),
        .cur_z(0),
		  .lg_numprocs(lg_numprocs)
        )n_0_0_0(
        .clk(clk),
        .rst(rst),
		  .inject_xpos(in_xpos_inject_0_0_0),
		  /*.inject_ypos(in_ypos_inject_0_0_0),
		  .inject_zpos(in_zpos_inject_0_0_0),
		  .inject_xneg(in_xneg_inject_0_0_0),
		  .inject_yneg(in_yneg_inject_0_0_0),
		  .inject_zneg(in_zneg_inject_0_0_0),*/
        .in_xpos_ser(in_xpos_ser_0_0_0),
        .out_xpos_ser(out_xpos_ser_0_0_0),
        /*.in_xneg_ser(in_xneg_ser_0_0_0),
        .out_xneg_ser(out_xneg_ser_0_0_0),
        .in_ypos_ser(in_ypos_ser_0_0_0),
        .out_ypos_ser(out_ypos_ser_0_0_0),
        .in_yneg_ser(in_yneg_ser_0_0_0),
        .out_yneg_ser(out_yneg_ser_0_0_0),
        .in_zpos_ser(in_zpos_ser_0_0_0),
        .out_zpos_ser(out_zpos_ser_0_0_0),
        .in_zneg_ser(in_zneg_ser_0_0_0),
        .out_zneg_ser(out_zneg_ser_0_0_0)*/
		  .newcomm(newcomm_0_0_0)
      );
    node#(
        .cur_x(0),
        .cur_y(0),
        .cur_z(1)
        )n_0_0_1(
        .clk(clk),
        .rst(rst),
		  .inject_xpos(in_xpos_inject_0_0_1),
		  /*.inject_ypos(in_ypos_inject_0_0_1),
		  .inject_zpos(in_zpos_inject_0_0_1),
		  .inject_xneg(in_xneg_inject_0_0_1),
		  .inject_yneg(in_yneg_inject_0_0_1),
		  .inject_zneg(in_zneg_inject_0_0_1),*/
        .in_xpos_ser(in_xpos_ser_0_0_1),
        .out_xpos_ser(out_xpos_ser_0_0_1),
        /*.in_xneg_ser(in_xneg_ser_0_0_1),
        .out_xneg_ser(out_xneg_ser_0_0_1),
        .in_ypos_ser(in_ypos_ser_0_0_1),
        .out_ypos_ser(out_ypos_ser_0_0_1),
        .in_yneg_ser(in_yneg_ser_0_0_1),
        .out_yneg_ser(out_yneg_ser_0_0_1),
        .in_zpos_ser(in_zpos_ser_0_0_1),
        .out_zpos_ser(out_zpos_ser_0_0_1),
        .in_zneg_ser(in_zneg_ser_0_0_1),
        .out_zneg_ser(out_zneg_ser_0_0_1),*/
		  .newcomm(newcomm_0_0_1)
      );
    /*node#(
        .cur_x(0),
        .cur_y(1),
        .cur_z(0)
        )n_0_1_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_1_0),
        .out_xpos_ser(out_xpos_ser_0_1_0),
        .in_xneg_ser(in_xneg_ser_0_1_0),
        .out_xneg_ser(out_xneg_ser_0_1_0),
        .in_ypos_ser(in_ypos_ser_0_1_0),
        .out_ypos_ser(out_ypos_ser_0_1_0),
        .in_yneg_ser(in_yneg_ser_0_1_0),
        .out_yneg_ser(out_yneg_ser_0_1_0),
        .in_zpos_ser(in_zpos_ser_0_1_0),
        .out_zpos_ser(out_zpos_ser_0_1_0),
        .in_zneg_ser(in_zneg_ser_0_1_0),
        .out_zneg_ser(out_zneg_ser_0_1_0),
		  .newcomm(newcomm_0_1_0)
      );
    node#(
        .cur_x(0),
        .cur_y(1),
        .cur_z(1)
        )n_0_1_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_1_1),
        .out_xpos_ser(out_xpos_ser_0_1_1),
        .in_xneg_ser(in_xneg_ser_0_1_1),
        .out_xneg_ser(out_xneg_ser_0_1_1),
        .in_ypos_ser(in_ypos_ser_0_1_1),
        .out_ypos_ser(out_ypos_ser_0_1_1),
        .in_yneg_ser(in_yneg_ser_0_1_1),
        .out_yneg_ser(out_yneg_ser_0_1_1),
        .in_zpos_ser(in_zpos_ser_0_1_1),
        .out_zpos_ser(out_zpos_ser_0_1_1),
        .in_zneg_ser(in_zneg_ser_0_1_1),
        .out_zneg_ser(out_zneg_ser_0_1_1),
		  .newcomm(newcomm_0_1_1)
      );
    node#(
        .cur_x(1),
        .cur_y(0),
        .cur_z(0)
        )n_1_0_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_0_0),
        .out_xpos_ser(out_xpos_ser_1_0_0),
        .in_xneg_ser(in_xneg_ser_1_0_0),
        .out_xneg_ser(out_xneg_ser_1_0_0),
        .in_ypos_ser(in_ypos_ser_1_0_0),
        .out_ypos_ser(out_ypos_ser_1_0_0),
        .in_yneg_ser(in_yneg_ser_1_0_0),
        .out_yneg_ser(out_yneg_ser_1_0_0),
        .in_zpos_ser(in_zpos_ser_1_0_0),
        .out_zpos_ser(out_zpos_ser_1_0_0),
        .in_zneg_ser(in_zneg_ser_1_0_0),
        .out_zneg_ser(out_zneg_ser_1_0_0)
      );
    node#(
        .cur_x(1),
        .cur_y(0),
        .cur_z(1)
        )n_1_0_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_0_1),
        .out_xpos_ser(out_xpos_ser_1_0_1),
        .in_xneg_ser(in_xneg_ser_1_0_1),
        .out_xneg_ser(out_xneg_ser_1_0_1),
        .in_ypos_ser(in_ypos_ser_1_0_1),
        .out_ypos_ser(out_ypos_ser_1_0_1),
        .in_yneg_ser(in_yneg_ser_1_0_1),
        .out_yneg_ser(out_yneg_ser_1_0_1),
        .in_zpos_ser(in_zpos_ser_1_0_1),
        .out_zpos_ser(out_zpos_ser_1_0_1),
        .in_zneg_ser(in_zneg_ser_1_0_1),
        .out_zneg_ser(out_zneg_ser_1_0_1)
      );
    node#(
        .cur_x(1),
        .cur_y(1),
        .cur_z(0)
        )n_1_1_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_1_0),
        .out_xpos_ser(out_xpos_ser_1_1_0),
        .in_xneg_ser(in_xneg_ser_1_1_0),
        .out_xneg_ser(out_xneg_ser_1_1_0),
        .in_ypos_ser(in_ypos_ser_1_1_0),
        .out_ypos_ser(out_ypos_ser_1_1_0),
        .in_yneg_ser(in_yneg_ser_1_1_0),
        .out_yneg_ser(out_yneg_ser_1_1_0),
        .in_zpos_ser(in_zpos_ser_1_1_0),
        .out_zpos_ser(out_zpos_ser_1_1_0),
        .in_zneg_ser(in_zneg_ser_1_1_0),
        .out_zneg_ser(out_zneg_ser_1_1_0)
      );
    node#(
        .cur_x(1),
        .cur_y(1),
        .cur_z(1)
        )n_1_1_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_1_1_1),
        .out_xpos_ser(out_xpos_ser_1_1_1),
        .in_xneg_ser(in_xneg_ser_1_1_1),
        .out_xneg_ser(out_xneg_ser_1_1_1),
        .in_ypos_ser(in_ypos_ser_1_1_1),
        .out_ypos_ser(out_ypos_ser_1_1_1),
        .in_yneg_ser(in_yneg_ser_1_1_1),
        .out_yneg_ser(out_yneg_ser_1_1_1),
        .in_zpos_ser(in_zpos_ser_1_1_1),
        .out_zpos_ser(out_zpos_ser_1_1_1),
        .in_zneg_ser(in_zneg_ser_1_1_1),
        .out_zneg_ser(out_zneg_ser_1_1_1)
      );*/
endmodule
