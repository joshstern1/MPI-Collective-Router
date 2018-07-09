`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
    module network(
    input clk,
    input rst,
	 input [FLIT_SIZE : 0] in_xpos_ser_0_0_0,
	 input [FLIT_SIZE : 0] in_ypos_ser_0_0_0,
	 output [FLIT_SIZE : 0]out_xpos_ser_0_0_0,
	 output [FLIT_SIZE : 0]out_ypos_ser_0_0_0
);

	parameter FLIT_SIZE = 82;


	//wire[FLIT_SIZE : 0] in_xpos_ser_0_0_0, out_xpos_ser_0_0_0;
	//wire[FLIT_SIZE : 0] in_xneg_ser_0_0_0, out_xneg_ser_0_0_0;
	//wire[FLIT_SIZE : 0] in_ypos_ser_0_0_0, out_ypos_ser_0_0_0;
	//wire[FLIT_SIZE : 0] in_yneg_ser_0_0_0, out_yneg_ser_0_0_0;
	//wire[FLIT_SIZE : 0] in_zpos_ser_0_0_0, out_zpos_ser_0_0_0;
	//wire[FLIT_SIZE : 0] in_zneg_ser_0_0_0, out_zneg_ser_0_0_0;


	/*wire[FLIT_SIZE : 0] in_xpos_ser_0_0_1, out_xpos_ser_0_0_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_0_1, out_xneg_ser_0_0_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_0_1, out_ypos_ser_0_0_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_0_1, out_yneg_ser_0_0_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_0_1, out_zpos_ser_0_0_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_0_1, out_zneg_ser_0_0_1;


	wire[FLIT_SIZE : 0] in_xpos_ser_0_1_0, out_xpos_ser_0_1_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_1_0, out_xneg_ser_0_1_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_1_0, out_ypos_ser_0_1_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_1_0, out_yneg_ser_0_1_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_1_0, out_zpos_ser_0_1_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_1_0, out_zneg_ser_0_1_0;


	wire[FLIT_SIZE : 0] in_xpos_ser_0_1_1, out_xpos_ser_0_1_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_0_1_1, out_xneg_ser_0_1_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_0_1_1, out_ypos_ser_0_1_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_0_1_1, out_yneg_ser_0_1_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_0_1_1, out_zpos_ser_0_1_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_0_1_1, out_zneg_ser_0_1_1;


	wire[FLIT_SIZE : 0] in_xpos_ser_1_0_0, out_xpos_ser_1_0_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_0_0, out_xneg_ser_1_0_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_0_0, out_ypos_ser_1_0_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_0_0, out_yneg_ser_1_0_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_0_0, out_zpos_ser_1_0_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_0_0, out_zneg_ser_1_0_0;


	wire[FLIT_SIZE : 0] in_xpos_ser_1_0_1, out_xpos_ser_1_0_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_0_1, out_xneg_ser_1_0_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_0_1, out_ypos_ser_1_0_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_0_1, out_yneg_ser_1_0_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_0_1, out_zpos_ser_1_0_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_0_1, out_zneg_ser_1_0_1;


	wire[FLIT_SIZE : 0] in_xpos_ser_1_1_0, out_xpos_ser_1_1_0;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_1_0, out_xneg_ser_1_1_0;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_1_0, out_ypos_ser_1_1_0;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_1_0, out_yneg_ser_1_1_0;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_1_0, out_zpos_ser_1_1_0;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_1_0, out_zneg_ser_1_1_0;


	wire[FLIT_SIZE : 0] in_xpos_ser_1_1_1, out_xpos_ser_1_1_1;
	wire[FLIT_SIZE : 0] in_xneg_ser_1_1_1, out_xneg_ser_1_1_1;
	wire[FLIT_SIZE : 0] in_ypos_ser_1_1_1, out_ypos_ser_1_1_1;
	wire[FLIT_SIZE : 0] in_yneg_ser_1_1_1, out_yneg_ser_1_1_1;
	wire[FLIT_SIZE : 0] in_zpos_ser_1_1_1, out_zpos_ser_1_1_1;
	wire[FLIT_SIZE : 0] in_zneg_ser_1_1_1, out_zneg_ser_1_1_1;*/


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
        .cur_z(0)
        )n_0_0_0(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_0_0),
        .out_xpos_ser(out_xpos_ser_0_0_0),
        //.in_xneg_ser(in_xneg_ser_0_0_0),
        //.out_xneg_ser(out_xneg_ser_0_0_0),
        .in_ypos_ser(in_ypos_ser_0_0_0),
        .out_ypos_ser(out_ypos_ser_0_0_0)/*,
        .in_yneg_ser(in_yneg_ser_0_0_0),
        .out_yneg_ser(out_yneg_ser_0_0_0),
        .in_zpos_ser(in_zpos_ser_0_0_0),
        .out_zpos_ser(out_zpos_ser_0_0_0),
        .in_zneg_ser(in_zneg_ser_0_0_0),
        .out_zneg_ser(out_zneg_ser_0_0_0)*/
      );
    node#(
        .cur_x(0),
        .cur_y(0),
        .cur_z(1)
        )n_0_0_1(
        .clk(clk),
        .rst(rst),
        .in_xpos_ser(in_xpos_ser_0_0_1),
        .out_xpos_ser(out_xpos_ser_0_0_1),
        //.in_xneg_ser(in_xneg_ser_0_0_1),
       // .out_xneg_ser(out_xneg_ser_0_0_1),
        .in_ypos_ser(in_ypos_ser_0_0_1),
        .out_ypos_ser(out_ypos_ser_0_0_1)/*,
        .in_yneg_ser(in_yneg_ser_0_0_1),
        .out_yneg_ser(out_yneg_ser_0_0_1),
        .in_zpos_ser(in_zpos_ser_0_0_1),
        .out_zpos_ser(out_zpos_ser_0_0_1),
        .in_zneg_ser(in_zneg_ser_0_0_1),
        .out_zneg_ser(out_zneg_ser_0_0_1)*/
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
        .out_zneg_ser(out_zneg_ser_0_1_0)
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
        .out_zneg_ser(out_zneg_ser_0_1_1)
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
