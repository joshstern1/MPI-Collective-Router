`timescale 1ns / 1ns

module switch#(
    parameter M_IN = PORT_NUM,				//6
	 parameter ValidBitPos = 81,
	 parameter lg_numprocs = 3
)
(
    input clk,
    input rst,
    input [M_IN*FlitChildWidth-1:0] in,	
    input [M_IN * ROUTE_LEN - 1 : 0] route_in,
    input [M_IN - 1 : 0] in_valid,
	 input [M_IN - 1 : 0] out_avail,
	 
    output [M_IN - 1 : 0] in_avail,
    output [M_IN - 1 : 0] out_valid,
    output [M_IN*FlitChildWidth-1:0] out   
);

	 localparam num_procs = 1 << lg_numprocs;

	 localparam FlitWidth = ValidBitPos + 1;
	 localparam ChildrenWidth=lg_numprocs;
	 localparam FlitChildWidth = FlitWidth+ChildrenWidth;

	 localparam ROUTE_LEN = 3;
	 localparam PORT_NUM = 6;
	 
	 localparam DIR_XPOS=3'd1;
	 localparam DIR_YPOS=3'd2;
	 localparam DIR_ZPOS=3'd3;
	 localparam DIR_XNEG=3'd4;
	 localparam DIR_YNEG=3'd5;
	 localparam DIR_ZNEG=3'd6;

    wire [M_IN - 1 : 0] xpos_in_valid;
    wire [M_IN - 1 : 0] ypos_in_valid;
    wire [M_IN - 1 : 0] zpos_in_valid;
    wire [M_IN - 1 : 0] xneg_in_valid;
    wire [M_IN - 1 : 0] yneg_in_valid;
    wire [M_IN - 1 : 0] zneg_in_valid;

    wire [M_IN - 1 : 0] xpos_in_avail;
    wire [M_IN - 1 : 0] ypos_in_avail;
    wire [M_IN - 1 : 0] zpos_in_avail = 0;
    wire [M_IN - 1 : 0] xneg_in_avail = 0;
    wire [M_IN - 1 : 0] yneg_in_avail = 0;
    wire [M_IN - 1 : 0] zneg_in_avail = 0;

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

	wire [ROUTE_LEN - 1 : 0] out_xpos_selector;
	wire [ROUTE_LEN - 1 : 0] out_ypos_selector;
	wire [ROUTE_LEN - 1 : 0] out_zpos_selector;
	wire [ROUTE_LEN - 1 : 0] out_xneg_selector;
	wire [ROUTE_LEN - 1 : 0] out_yneg_selector;
	wire [ROUTE_LEN - 1 : 0] out_zneg_selector;

    reduction_tree#(
        .FAN_IN(M_IN),
		  .ValidBitPos(ValidBitPos),
		  .lg_numprocs(lg_numprocs)
    )xpos_reduction(
        .clk(clk),
        .rst(rst),
        .in(in),
        .in_valid(in_valid & xpos_in_valid),
		  	
        .out_valid(out_valid[0]),
        .out(out[FlitChildWidth-1:0]),
		  .selector(out_xpos_selector)
    );
	      
    reduction_tree#(
        .FAN_IN(M_IN),
		  .ValidBitPos(ValidBitPos),
		  .lg_numprocs(lg_numprocs)
    )ypos_reduction(
        .clk(clk),
        .rst(rst),
        .in(in),
        .in_valid(in_valid & ypos_in_valid),
		  	
        .out_valid(out_valid[1]),
        .out(out[2*FlitChildWidth-1:FlitChildWidth]),
		  .selector(out_ypos_selector)
    );	

    reduction_tree#(
        .FAN_IN(M_IN),
		  .ValidBitPos(ValidBitPos),
		  .lg_numprocs(lg_numprocs)
    )zpos_reduction(
        .clk(clk),
        .rst(rst),
        .in(in),
        .in_valid(in_valid & zpos_in_valid),
		  	
        .out_valid(out_valid[2]),
        .out(out[3*FlitChildWidth-1:2*FlitChildWidth]),
		  .selector(out_zpos_selector)
    );	 
	 
	 reduction_tree#(
        .FAN_IN(M_IN),
		  .ValidBitPos(ValidBitPos),
		  .lg_numprocs(lg_numprocs)
    )xneg_reduction(
        .clk(clk),
        .rst(rst),
        .in(in),
        .in_valid(in_valid & xneg_in_valid),
		  	
        .out_valid(out_valid[3]),
        .out(out[4*FlitChildWidth-1:3*FlitChildWidth]),
		  .selector(out_xneg_selector)
    );	

    reduction_tree#(
        .FAN_IN(M_IN),
		  .ValidBitPos(ValidBitPos),
		  .lg_numprocs(lg_numprocs)
    )yneg_reduction(
        .clk(clk),
        .rst(rst),
        .in(in),
        .in_valid(in_valid & yneg_in_valid),
		  	
        .out_valid(out_valid[4]),
        .out(out[5*FlitChildWidth-1:4*FlitChildWidth]),
		  .selector(out_yneg_selector)
    );	 	 
	 
    reduction_tree#(
        .FAN_IN(M_IN),
		  .ValidBitPos(ValidBitPos),
		  .lg_numprocs(lg_numprocs)
    )zneg_reduction(
        .clk(clk),
        .rst(rst),
        .in(in),
        .in_valid(in_valid & zneg_in_valid),
		  	
        .out_valid(out_valid[5]),
        .out(out[6*FlitChildWidth-1:5*FlitChildWidth]),
		  .selector(out_zneg_selector)
    );	
	 
	 reg [ROUTE_LEN - 1 : 0] in_xpos_selector;
    reg [ROUTE_LEN - 1 : 0] in_ypos_selector;
	 reg [ROUTE_LEN - 1 : 0] in_zpos_selector;
    reg [ROUTE_LEN - 1 : 0] in_xneg_selector;
	 reg [ROUTE_LEN - 1 : 0] in_yneg_selector;
    reg [ROUTE_LEN - 1 : 0] in_zneg_selector;
	 
	 
	 always @(*)begin
		case(route_in[ROUTE_LEN - 1 : 0])
			DIR_XPOS:	in_xpos_selector = out_xpos_selector;							
			DIR_YPOS:	in_xpos_selector = out_ypos_selector;		
			DIR_ZPOS:	in_xpos_selector = out_zpos_selector;
			DIR_XNEG:	in_xpos_selector = out_xneg_selector;		
			DIR_YNEG:	in_xpos_selector = out_yneg_selector;
			DIR_ZNEG:	in_xpos_selector = out_zneg_selector;		
		endcase
	 end
	 
	 always @(*)begin
		case(route_in[2*ROUTE_LEN - 1 : ROUTE_LEN])
			DIR_XPOS:	in_ypos_selector = out_xpos_selector;							
			DIR_YPOS:	in_ypos_selector = out_ypos_selector;		
			DIR_ZPOS:	in_ypos_selector = out_zpos_selector;
			DIR_XNEG:	in_ypos_selector = out_xneg_selector;		
			DIR_YNEG:	in_ypos_selector = out_yneg_selector;
			DIR_ZNEG:	in_ypos_selector = out_zneg_selector;									
		endcase
	 end
	 
	 always @(*)begin
		case(route_in[3*ROUTE_LEN - 1 : 2*ROUTE_LEN])
			DIR_XPOS:	in_zpos_selector = out_xpos_selector;							
			DIR_YPOS:	in_zpos_selector = out_ypos_selector;		
			DIR_ZPOS:	in_zpos_selector = out_zpos_selector;
			DIR_XNEG:	in_zpos_selector = out_xneg_selector;		
			DIR_YNEG:	in_zpos_selector = out_yneg_selector;
			DIR_ZNEG:	in_zpos_selector = out_zneg_selector;									
		endcase
	 end
	 
	 always @(*)begin
		case(route_in[4*ROUTE_LEN - 1 : 3*ROUTE_LEN])
			DIR_XPOS:	in_xneg_selector = out_xpos_selector;							
			DIR_YPOS:	in_xneg_selector = out_ypos_selector;		
			DIR_ZPOS:	in_xneg_selector = out_zpos_selector;
			DIR_XNEG:	in_xneg_selector = out_xneg_selector;		
			DIR_YNEG:	in_xneg_selector = out_yneg_selector;
			DIR_ZNEG:	in_xneg_selector = out_zneg_selector;									
		endcase
	 end
	 
	 always @(*)begin
		case(route_in[5*ROUTE_LEN - 1 : 4*ROUTE_LEN])
			DIR_XPOS:	in_yneg_selector = out_xpos_selector;							
			DIR_YPOS:	in_yneg_selector = out_ypos_selector;		
			DIR_ZPOS:	in_yneg_selector = out_zpos_selector;
			DIR_XNEG:	in_yneg_selector = out_xneg_selector;		
			DIR_YNEG:	in_yneg_selector = out_yneg_selector;
			DIR_ZNEG:	in_yneg_selector = out_zneg_selector;									
		endcase
	 end
	 
	 always @(*)begin
		case(route_in[6*ROUTE_LEN - 1 : 5*ROUTE_LEN])
			DIR_XPOS:	in_zneg_selector = out_xpos_selector;							
			DIR_YPOS:	in_zneg_selector = out_ypos_selector;		
			DIR_ZPOS:	in_zneg_selector = out_zpos_selector;
			DIR_XNEG:	in_zneg_selector = out_xneg_selector;		
			DIR_YNEG:	in_zneg_selector = out_yneg_selector;
			DIR_ZNEG:	in_zneg_selector = out_zneg_selector;									
		endcase
	 end
	 
	 	 
	 assign in_avail[0] = !(((in_xpos_selector!=0) && (in_valid[0]))||(out_avail[0]));
	 assign in_avail[1] = !(((in_ypos_selector!=1) && (in_valid[1]))||(out_avail[1]));
	 assign in_avail[2] = !(((in_zpos_selector!=2) && (in_valid[2]))||(out_avail[2]));
	 assign in_avail[3] = !(((in_xneg_selector!=3) && (in_valid[3]))||(out_avail[3]));
	 assign in_avail[4] = !(((in_yneg_selector!=4) && (in_valid[4]))||(out_avail[4]));
	 assign in_avail[5] = !(((in_zneg_selector!=5) && (in_valid[5]))||(out_avail[5]));
   
endmodule
 
