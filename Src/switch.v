`timescale 1ns / 1ns

module switch#(
    parameter M_IN = PORT_NUM,				//6
	 parameter ValidBitPos = 81
)
(
    input clk,
    input rst,
    input [2*FlitChildWidth-1:0] in,	//////////////////remember to change this
    input [M_IN * ROUTE_LEN - 1 : 0] route_in,
    input [M_IN - 1 : 0] in_valid,
	 input [M_IN - 1 : 0] out_avail,
	 
    output [M_IN - 1 : 0] in_avail,
    output [M_IN - 1 : 0] out_valid,
    output [2*FlitChildWidth-1:0] out    //////////////////remember to change this
);

	 parameter lg_numprocs = 3;
	 parameter num_procs = 1 << lg_numprocs;

	 parameter FlitWidth = ValidBitPos + 1;
	 parameter ChildrenWidth=lg_numprocs;
	 parameter FlitChildWidth = FlitWidth+ChildrenWidth;

	 parameter ROUTE_LEN = 3;
	 parameter PORT_NUM = 6;
	 
	 parameter DIR_XPOS=3'd1;
	 parameter DIR_YPOS=3'd2;
	 parameter DIR_ZPOS=3'd3;
	 parameter DIR_XNEG=3'd4;
	 parameter DIR_YNEG=3'd5;
	 parameter DIR_ZNEG=3'd6;

    wire [M_IN - 1 : 0] xpos_in_valid;
    wire [M_IN - 1 : 0] ypos_in_valid;
    wire [M_IN - 1 : 0] zpos_in_valid;
    wire [M_IN - 1 : 0] xneg_in_valid;
    wire [M_IN - 1 : 0] yneg_in_valid;
    wire [M_IN - 1 : 0] zneg_in_valid;

    wire [M_IN - 1 : 0] xpos_in_avail;
    wire [M_IN - 1 : 0] ypos_in_avail;
    wire [M_IN - 1 : 0] zpos_in_avail;
    wire [M_IN - 1 : 0] xneg_in_avail;
    wire [M_IN - 1 : 0] yneg_in_avail;
    wire [M_IN - 1 : 0] zneg_in_avail;

    genvar i;
    generate 
        for(i = 0; i < M_IN; i = i + 1) begin: dst_checker
            assign xpos_in_valid[i] = route_in[i * ROUTE_LEN + ROUTE_LEN - 1 : i * ROUTE_LEN] == DIR_XPOS;
            assign ypos_in_valid[i] = route_in[i * ROUTE_LEN + ROUTE_LEN - 1 : i * ROUTE_LEN] == DIR_YPOS;
            assign zpos_in_valid[i] = route_in[i * ROUTE_LEN + ROUTE_LEN - 1 : i * ROUTE_LEN] == DIR_ZPOS;
            assign xneg_in_valid[i] = route_in[i * ROUTE_LEN + ROUTE_LEN - 1 : i * ROUTE_LEN] == DIR_XNEG;
            assign yneg_in_valid[i] = route_in[i * ROUTE_LEN + ROUTE_LEN - 1 : i * ROUTE_LEN] == DIR_YNEG;
            assign zneg_in_valid[i] = route_in[i * ROUTE_LEN + ROUTE_LEN - 1 : i * ROUTE_LEN] == DIR_ZNEG;
        end
    endgenerate


    reduction_tree#(
        .FAN_IN(M_IN),
		  .ValidBitPos(ValidBitPos)
    )xpos_reduction(
        .clk(clk),
        .rst(rst),
        .in(in),
        .in_valid(in_valid & xpos_in_valid),
		  
        .in_avail(xpos_in_avail),	
        .out_valid(out_valid[0]),
        .out(out[FlitChildWidth-1:0])
    );
	 
     
    reduction_tree#(
        .FAN_IN(M_IN),
		  .ValidBitPos(ValidBitPos)
    )ypos_reduction(
        .clk(clk),
        .rst(rst),
        .in(in),
        .in_valid(in_valid & ypos_in_valid),
		  
        .in_avail(ypos_in_avail),	
        .out_valid(out_valid[1]),
        .out(out[2*FlitChildWidth-1:FlitChildWidth])
    );	  
	 
	 
	 assign in_avail[0] = !(((xpos_in_avail==0)&&(out_valid[0]))||(out_avail[0]));
	 assign in_avail[1] = !(((ypos_in_avail==1)&&(out_valid[1]))||(out_avail[1]));
	 
	 assign in_avail[5:2] = 0;
	 assign out_valid[5:2] = 0;
	  
   
endmodule
 
