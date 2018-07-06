`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////

//the packet format:
//head flit   |type|VC class|dst|cmp|payload| 
//body flits  |type|                 payload|
//tail flit   |type|                 payload|
//
//the |cmp| field will be the priority field for the switch allocation
//if the SA policy is farthest first, this will be the distance from the destination node to the current node, if the SA policy is the oldest first, this will be the time stamp when this packet is sent
//in order to prevent deadlock, there are 6 turns should be forbidden if it is not xyz routing
//zneg -> xpos
//zneg -> xneg
//zneg -> ypos
//zneg -> yneg
//yneg -> xpos
//yneg -> xneg
`define FARTHEST_FIRST
//`define OLDEST_FIRST


`define DOR_XYZ
module route_comp
#(
    parameter cur_x = 0,
    parameter cur_y = 0,
    parameter cur_z = 0,
	 parameter DstPos = 72,
	 parameter DstWidth = 9,
	 parameter Dst_XWidth = 3
)(
    input clk,
    input rst,
    input flit_valid_in,
    input [FlitChildWidth-1:0] flit_before_RC, 
    input [2 : 0] dir_in,
    output reg [FlitChildWidth-1:0] flit_after_RC,
    output flit_valid_out,
    output reg [2 : 0] dir_out, //this is going to hold until next head
    output eject_enable
);

	 parameter lg_numprocs = 3;
	 parameter num_procs = 1 << lg_numprocs;

	 parameter ValidBitPos = 81;
	 parameter FlitWidth = ValidBitPos + 1;

	 parameter ChildrenPos=ValidBitPos+1;
	 parameter ChildrenWidth=lg_numprocs;
	 
	 parameter FlitChildWidth = FlitWidth+ChildrenWidth;


	 parameter XSIZE=4'd4;  
	 parameter YSIZE=4'd4;  
	 parameter ZSIZE=4'd4;   
	 parameter DIR_INJECT=3'd0;
	 parameter DIR_XPOS=3'd1;
	 parameter DIR_YPOS=3'd2;
	 parameter DIR_ZPOS=3'd3;
	 parameter DIR_XNEG=3'd4;
	 parameter DIR_YNEG=3'd5;
	 parameter DIR_ZNEG=3'd6;
	 parameter DIR_EJECT=3'd7;

	 parameter ROUTE_LEN = 3;
	 parameter PORT_NUM = 6;

    wire [Dst_XWidth - 1 : 0] dst_x;
    wire [Dst_XWidth - 1 : 0] dst_y;
    wire [Dst_XWidth - 1 : 0] dst_z;
    reg [ROUTE_LEN - 1:0] dir;

	 assign {dst_z, dst_y, dst_x} = flit_before_RC[DstPos+DstWidth-1:DstPos];
	  
	 
	 wire ejecting = ((flit_valid_in) && (dir == DIR_EJECT));
	 reg ejecting_delay;
	 reg flit_valid_in_reg;
	 
    always@(posedge clk) begin
        ejecting_delay <= ejecting;
    end
	 
    assign eject_enable = ejecting_delay && flit_valid_in_reg;

    always@(posedge clk) begin
        flit_valid_in_reg <= flit_valid_in;
    end

    assign flit_valid_out = flit_valid_in_reg && ~eject_enable;

    always@(posedge clk) begin
        if(rst) begin
            dir_out<=0;
        end
        else if(~ejecting) begin
//FARTHEST_FIRST
				flit_after_RC <= flit_before_RC;//[FlitWidth - 1 : FlitWidth - HEADER_LEN], new_VC_class, flit_before_RC[DST_ZPOS : CMP_POS + 1], nxt_priority_field, flit_before_RC[CMP_POS - CMP_LEN : 0]};
            dir_out<=dir;
        end
        else begin //dir equals to eject port
            flit_after_RC <= flit_before_RC;//[FlitWidth - 1 : FlitWidth - HEADER_LEN], new_VC_class, flit_before_RC[FlitWidth - HEADER_LEN - 2  : 0]};
            dir_out <= DIR_EJECT;
        end
    end



// DOR_XYZ
    //for simplicity start with xyz routing first
    always@(*) begin
        if(cur_x != dst_x) begin
            if(cur_x > dst_x) begin
                dir = (cur_x - dst_x >= XSIZE/2)? DIR_XPOS : DIR_XNEG;
            end
            else begin
                dir = (dst_x - cur_x <= XSIZE/2)? DIR_XPOS : DIR_XNEG;
            end
        end
        else if(cur_y != dst_y) begin
            if(cur_y > dst_y) begin
                dir = (cur_y - dst_y >= YSIZE/2)? DIR_YPOS : DIR_YNEG;
            end
            else begin
                dir = (dst_y - cur_y <= YSIZE/2)? DIR_YPOS : DIR_YNEG;
            end
        end
        else if(cur_z != dst_z) begin
            if(cur_z > dst_z) begin
                dir = (cur_z - dst_z >= ZSIZE/2)? DIR_ZPOS : DIR_ZNEG;
            end
            else begin
                dir = (dst_z - cur_z <= ZSIZE/2)? DIR_ZPOS : DIR_ZNEG;
            end
        end
        else begin
            dir = DIR_EJECT;
        end
    end

endmodule
 
