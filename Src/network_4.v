`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
    module network_4(
    input clk,
    input rst,
	 
	 input [FlitChildWidth - 1 : 0]in_xpos_inject_0_0_0,
	 input [FlitChildWidth - 1 : 0]in_ypos_inject_0_0_0,
	 input [FlitChildWidth - 1 : 0]in_xneg_inject_0_0_0,
	 input [FlitChildWidth - 1 : 0]in_yneg_inject_0_0_0,
	 input [FlitChildWidth - 1 : 0]reduce_me_0_0_0,
	 input [NewCommWidth - 1 : 0]newcomm_0_0_0,
	 
	 input [FlitChildWidth - 1 : 0]in_xpos_inject_0_0_1,
	 input [FlitChildWidth - 1 : 0]in_ypos_inject_0_0_1,
	 input [FlitChildWidth - 1 : 0]in_xneg_inject_0_0_1,
	 input [FlitChildWidth - 1 : 0]in_yneg_inject_0_0_1,
	 input [FlitChildWidth - 1 : 0]reduce_me_0_0_1,
	 input [NewCommWidth - 1 : 0]newcomm_0_0_1,
	 
	 input [FlitChildWidth - 1 : 0]in_xpos_inject_0_1_0,
	 input [FlitChildWidth - 1 : 0]in_ypos_inject_0_1_0,
	 input [FlitChildWidth - 1 : 0]in_xneg_inject_0_1_0,
	 input [FlitChildWidth - 1 : 0]in_yneg_inject_0_1_0,
	 input [FlitChildWidth - 1 : 0]reduce_me_0_1_0,
	 input [NewCommWidth - 1 : 0]newcomm_0_1_0,
	 
 	 input [FlitChildWidth - 1 : 0]in_xpos_inject_0_1_1,
	 input [FlitChildWidth - 1 : 0]in_ypos_inject_0_1_1,
	 input [FlitChildWidth - 1 : 0]in_xneg_inject_0_1_1,
	 input [FlitChildWidth - 1 : 0]in_yneg_inject_0_1_1,
	 input [FlitChildWidth - 1 : 0]reduce_me_0_1_1,
	 input [NewCommWidth - 1 : 0]newcomm_0_1_1,
	 
	 
	 output valid
);

	localparam num_procs = 1 << lg_numprocs;
	localparam lg_numprocs = 2;

	//packet structure
	localparam PayloadWidth=32;
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
	
	localparam FLIT_SIZE = FlitWidth;
	
	assign valid = 1'b1;

	wire[FLIT_SIZE - 1 : 0] in_xpos_ser_0_0_0, out_xpos_ser_0_0_0;
	wire[FLIT_SIZE - 1 : 0] in_ypos_ser_0_0_0, out_ypos_ser_0_0_0;
	wire[FLIT_SIZE - 1 : 0] in_xneg_ser_0_0_0, out_xneg_ser_0_0_0;
	wire[FLIT_SIZE - 1 : 0] in_yneg_ser_0_0_0, out_yneg_ser_0_0_0;

	wire[FLIT_SIZE - 1 : 0] in_xpos_ser_0_0_1, out_xpos_ser_0_0_1;
	wire[FLIT_SIZE  - 1 : 0]in_ypos_ser_0_0_1, out_ypos_ser_0_0_1;
	wire[FLIT_SIZE - 1 : 0] in_xneg_ser_0_0_1, out_xneg_ser_0_0_1;	
	wire[FLIT_SIZE - 1 : 0] in_yneg_ser_0_0_1, out_yneg_ser_0_0_1;	

	wire[FLIT_SIZE - 1 : 0] in_xpos_ser_0_1_0, out_xpos_ser_0_1_0;
	wire[FLIT_SIZE - 1 : 0] in_xneg_ser_0_1_0, out_xneg_ser_0_1_0;
	wire[FLIT_SIZE - 1 : 0] in_ypos_ser_0_1_0, out_ypos_ser_0_1_0;
	wire[FLIT_SIZE - 1 : 0] in_yneg_ser_0_1_0, out_yneg_ser_0_1_0;	
 
	wire[FLIT_SIZE - 1 : 0] in_xpos_ser_0_1_1, out_xpos_ser_0_1_1;
	wire[FLIT_SIZE - 1 : 0] in_xneg_ser_0_1_1, out_xneg_ser_0_1_1;
	wire[FLIT_SIZE - 1 : 0] in_ypos_ser_0_1_1, out_ypos_ser_0_1_1;
	wire[FLIT_SIZE - 1 : 0] in_yneg_ser_0_1_1, out_yneg_ser_0_1_1;


	
	assign in_xpos_ser_0_0_0=out_xneg_ser_0_0_1;
	assign in_xneg_ser_0_0_0=out_xpos_ser_0_0_1;
	assign in_xpos_ser_0_0_1=out_xneg_ser_0_0_0;
	assign in_xneg_ser_0_0_1=out_xpos_ser_0_0_0;
	assign in_xpos_ser_0_1_0=out_xneg_ser_0_1_1;
	assign in_xneg_ser_0_1_0=out_xpos_ser_0_1_1;
	assign in_xpos_ser_0_1_1=out_xneg_ser_0_1_0;
	assign in_xneg_ser_0_1_1=out_xpos_ser_0_1_0;
	
	assign in_ypos_ser_0_0_0=out_yneg_ser_0_1_0;
	assign in_yneg_ser_0_0_0=out_ypos_ser_0_1_0;
	assign in_ypos_ser_0_0_1=out_yneg_ser_0_1_1;
	assign in_yneg_ser_0_0_1=out_ypos_ser_0_1_1;
	assign in_ypos_ser_0_1_0=out_yneg_ser_0_0_0;
	assign in_yneg_ser_0_1_0=out_ypos_ser_0_0_0;
	assign in_ypos_ser_0_1_1=out_yneg_ser_0_0_1;
	assign in_yneg_ser_0_1_1=out_ypos_ser_0_0_1;
	
	
    node_4#(
        .cur_z(0),
        .cur_y(0),
        .cur_x(0),
		  .lg_numprocs(lg_numprocs),
		  .PayloadWidth(PayloadWidth)
        )n_0_0_0(
        .clk(clk),
        .rst(rst),
		  .inject_xpos(in_xpos_inject_0_0_0),
		  .inject_ypos(in_ypos_inject_0_0_0),
		  .inject_xneg(in_xneg_inject_0_0_0),
		  .inject_yneg(in_yneg_inject_0_0_0),
        .in_xpos_ser(in_xpos_ser_0_0_0),
        .out_xpos_ser(out_xpos_ser_0_0_0),
        .in_xneg_ser(in_xneg_ser_0_0_0),
        .out_xneg_ser(out_xneg_ser_0_0_0),
        .in_ypos_ser(in_ypos_ser_0_0_0),
        .out_ypos_ser(out_ypos_ser_0_0_0),
        .in_yneg_ser(in_yneg_ser_0_0_0),
        .out_yneg_ser(out_yneg_ser_0_0_0),
		  .reduce_me(reduce_me_0_0_0),
		  .newcomm(newcomm_0_0_0)
      );
		
    node_4#(
        .cur_z(0),
        .cur_y(0),
        .cur_x(1),
		  .lg_numprocs(lg_numprocs),
		  .PayloadWidth(PayloadWidth)
        )n_0_0_1(
        .clk(clk),
        .rst(rst),
		  .inject_xpos(in_xpos_inject_0_0_1),
		  .inject_ypos(in_ypos_inject_0_0_1),
		  .inject_xneg(in_xneg_inject_0_0_1),
		  .inject_yneg(in_yneg_inject_0_0_1),
        .in_xpos_ser(in_xpos_ser_0_0_1),
        .out_xpos_ser(out_xpos_ser_0_0_1),
        .in_xneg_ser(in_xneg_ser_0_0_1),
        .out_xneg_ser(out_xneg_ser_0_0_1),
        .in_ypos_ser(in_ypos_ser_0_0_1),
        .out_ypos_ser(out_ypos_ser_0_0_1),
        .in_yneg_ser(in_yneg_ser_0_0_1),
        .out_yneg_ser(out_yneg_ser_0_0_1),
		  .reduce_me(reduce_me_0_0_1),
		  .newcomm(newcomm_0_0_1)
      );
		
    node_4#(
        .cur_z(0),
        .cur_y(1),
        .cur_x(0),
		  .lg_numprocs(lg_numprocs),
		  .PayloadWidth(PayloadWidth)
        )n_0_1_0(
        .clk(clk),
        .rst(rst),
		  .inject_xpos(in_xpos_inject_0_1_0),
		  .inject_ypos(in_ypos_inject_0_1_0),
		  .inject_xneg(in_xneg_inject_0_1_0),
		  .inject_yneg(in_yneg_inject_0_1_0),
        .in_xpos_ser(in_xpos_ser_0_1_0),
        .out_xpos_ser(out_xpos_ser_0_1_0),
        .in_xneg_ser(in_xneg_ser_0_1_0),
        .out_xneg_ser(out_xneg_ser_0_1_0),
        .in_ypos_ser(in_ypos_ser_0_1_0),
        .out_ypos_ser(out_ypos_ser_0_1_0),
        .in_yneg_ser(in_yneg_ser_0_1_0),
        .out_yneg_ser(out_yneg_ser_0_1_0),
		  .reduce_me(reduce_me_0_1_0),
		  .newcomm(newcomm_0_1_0)
      );
	
    node_4#(
        .cur_z(0),
        .cur_y(1),
        .cur_x(1),
		  .lg_numprocs(lg_numprocs),
		  .PayloadWidth(PayloadWidth)
        )n_0_1_1(
        .clk(clk),
        .rst(rst),
		  .inject_xpos(in_xpos_inject_0_1_1),
		  .inject_ypos(in_ypos_inject_0_1_1),
		  .inject_xneg(in_xneg_inject_0_1_1),
		  .inject_yneg(in_yneg_inject_0_1_1),
        .in_xpos_ser(in_xpos_ser_0_1_1),
        .out_xpos_ser(out_xpos_ser_0_1_1),
        .in_xneg_ser(in_xneg_ser_0_1_1),
        .out_xneg_ser(out_xneg_ser_0_1_1),
        .in_ypos_ser(in_ypos_ser_0_1_1),
        .out_ypos_ser(out_ypos_ser_0_1_1),
        .in_yneg_ser(in_yneg_ser_0_1_1),
        .out_yneg_ser(out_yneg_ser_0_1_1),
		  .reduce_me(reduce_me_0_1_1),
		  .newcomm(newcomm_0_1_1)
      );

endmodule
