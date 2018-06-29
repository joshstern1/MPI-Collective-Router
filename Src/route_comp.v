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
    parameter cur_z = 0
)(
    input clk,
    input rst,
    input flit_valid_in,
    input [FLIT_SIZE - 1 : 0] flit_before_RC, 
    input stall,
    input [2 : 0] dir_in,
    output reg [FLIT_SIZE - 1 : 0] flit_after_RC,
    output flit_valid_out,
    output reg [2 : 0] dir_out, //this is going to hold until next head
    output eject_enable
);

	parameter FLIT_SIZE = 82;
	parameter PHIT_SIZE=256;
	parameter IN_Q_SIZE=5;
//	parameter VC_SIZE=16; 
//	parameter VC_NUM=9;
	parameter XSIZE=4'd4;  
	parameter YSIZE=4'd4;  
	parameter ZSIZE=4'd4; 
	parameter XW=3;   
	parameter YW=3;   
	parameter ZW=3;   
	parameter DSTW=9; 
	parameter DIR_INJECT=3'd0;
	parameter DIR_XPOS=3'd1;
	parameter DIR_YPOS=3'd2;
	parameter DIR_ZPOS=3'd3;
	parameter DIR_XNEG=3'd4;
	parameter DIR_YNEG=3'd5;
	parameter DIR_ZNEG=3'd6;
	parameter DIR_EJECT=3'd7;

	parameter HEADER_LEN=3;
	parameter ROUTE_LEN = 3;
	parameter HEAD_FLIT=3'b000;
	parameter BODY_FLIT=3'b001;
	parameter TAIL_FLIT=3'b010;
	parameter SINGLE_FLIT=3'b011;
	parameter CREDIT_FLIT=3'b100;

	parameter VC_CLASS_POS = FLIT_SIZE - HEADER_LEN - 1;
	parameter PORT_NUM = 6;
	parameter DST_ZPOS = VC_CLASS_POS - 1;
	parameter DST_YPOS = DST_ZPOS - ZW;
	parameter DST_XPOS = DST_YPOS - YW;
	parameter CMP_POS = DST_XPOS - XW;
	parameter CMP_LEN = 4;


    wire [XW - 1 : 0] dst_x;
    wire [YW - 1 : 0] dst_y;
    wire [ZW - 1 : 0] dst_z;
    reg [2:0] dir;


    reg turn;

    reg flit_out_tmp;
    wire ejecting;


    assign dst_z = flit_before_RC[DST_ZPOS : DST_ZPOS - ZW + 1];
    assign dst_y = flit_before_RC[DST_YPOS : DST_YPOS - YW + 1];
    assign dst_x = flit_before_RC[DST_XPOS : DST_XPOS - XW + 1];


    reg ejecting_started;

    wire start_ejecting;

    wire single_ejecting;

    wire stop_ejecting;
    reg stop_ejecting_reg;

    reg ejecting_delay;

    assign start_ejecting = flit_valid_in && (flit_before_RC[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == HEAD_FLIT) && dir == DIR_EJECT;

    assign single_ejecting = flit_valid_in && (flit_before_RC[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == SINGLE_FLIT) && dir == DIR_EJECT;


    assign stop_ejecting = flit_valid_in && ((flit_before_RC[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == TAIL_FLIT));

    always@(posedge clk) begin
        stop_ejecting_reg <= stop_ejecting;
    end

    assign ejecting = single_ejecting || (start_ejecting || (ejecting_started && ~stop_ejecting_reg));

    always@(posedge clk) begin
        ejecting_delay <= ejecting;
    end
    reg flit_valid_in_reg;
    assign eject_enable = ejecting_delay && flit_valid_in_reg;


    always@(posedge clk) begin
        if(rst) begin 
            ejecting_started <= 0;
        end
        else begin
            if(start_ejecting) begin
                ejecting_started <= 1;
            end
            else begin
                if(ejecting_started) begin
                    if(stop_ejecting) begin
                        ejecting_started <= 0;
                    end
                end
            end
        end
    end



    always@(posedge clk) begin
        if(~stall) begin
            flit_valid_in_reg <= flit_valid_in;
        end
    end

    assign flit_valid_out = flit_valid_in_reg && ~eject_enable;


wire[CMP_LEN-1:0] trash_cmp = 1;
wire josh = 1'b1;

`ifdef FARTHEST_FIRST
    wire [CMP_LEN - 1 : 0] nxt_priority_field;
    assign nxt_priority_field = (flit_before_RC[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == HEAD_FLIT || flit_before_RC[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN]) ? trash_cmp : trash_cmp;
`endif
    

    always@(posedge clk) begin
        if(rst) begin
            dir_out<=0;
        end
        else if(~ejecting) begin
            if(~ stall) begin
`ifdef FARTHEST_FIRST
                flit_after_RC <= {flit_before_RC[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN], josh, flit_before_RC[DST_ZPOS : CMP_POS + 1], trash_cmp, flit_before_RC[CMP_POS - CMP_LEN : 0]};
`else
                flit_after_RC <= {flit_before_RC[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN], josh, flit_before_RC[FLIT_SIZE - HEADER_LEN - 2  : 0]};
`endif
                if((flit_before_RC[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == HEAD_FLIT) || (flit_before_RC[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN] == SINGLE_FLIT))begin
                    dir_out<=dir;
                end
            end
        end
        else begin //dir equals to eject port
            flit_after_RC <= {flit_before_RC[FLIT_SIZE - 1 : FLIT_SIZE - HEADER_LEN], josh, flit_before_RC[FLIT_SIZE - HEADER_LEN - 2  : 0]};
            dir_out <= DIR_EJECT;
        end
    end



`ifdef DOR_XYZ
    //for simplicity start with xyz routing first
    always@(*) begin
        if(cur_x != dst_x) begin
            if(cur_x > dst_x) begin
                if(cur_x - dst_x >= XSIZE/2) begin
                    dir = DIR_XPOS;
                end
                else begin
                    dir = DIR_XNEG;
                end
            end
            else begin
                if(dst_x - cur_x <= XSIZE/2) begin
                    dir = DIR_XPOS;
                end
                else begin
                    dir = DIR_XNEG;
                end
            end
        end
        else if(cur_y != dst_y) begin
            if(cur_y > dst_y) begin
                if(cur_y - dst_y >= YSIZE/2) begin
                    dir = DIR_YPOS;
                end
                else begin
                    dir = DIR_YNEG;
                end
            end
            else begin
                if(dst_y - cur_y <= YSIZE/2) begin
                    dir = DIR_YPOS;
                end
                else begin
                    dir = DIR_YNEG;
                end
            end
        end
        else if(cur_z != dst_z) begin
            if(cur_z > dst_z) begin
                if(cur_z - dst_z >= ZSIZE/2) begin
                    dir = DIR_ZPOS;
                end
                else begin
                    dir = DIR_ZNEG;
                end
            end
            else begin
                if(dst_z - cur_z <= ZSIZE/2) begin
                    dir = DIR_ZPOS;
                end 
                else begin
                    dir = DIR_ZNEG;
                end
            end
        end
        else begin
            dir = DIR_EJECT;
        end
    end
`endif
endmodule
