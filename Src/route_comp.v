`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////

`define FARTHEST_FIRST
`define DOR_XYZ

module route_comp
#(
    parameter cur_x = 0,
    parameter cur_y = 0,
    parameter cur_z = 0,
	 parameter DstPos = 72,
	 parameter DstWidth = 9,
	 parameter Dst_XWidth = 3,
	 parameter ValidBitPos = 81
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

	 localparam lg_numprocs = 3;
	 localparam num_procs = 1 << lg_numprocs;

	 localparam FlitWidth = ValidBitPos + 1;

	 localparam ChildrenPos=ValidBitPos+1;
	 localparam ChildrenWidth=lg_numprocs;
	 
	 localparam FlitChildWidth = FlitWidth+ChildrenWidth;


	 localparam XSIZE=4'd4;  
	 localparam YSIZE=4'd4;  
	 localparam ZSIZE=4'd4;   
	 localparam DIR_INJECT=3'd0;
	 localparam DIR_XPOS=3'd1;
	 localparam DIR_YPOS=3'd2;
	 localparam DIR_ZPOS=3'd3;
	 localparam DIR_XNEG=3'd4;
	 localparam DIR_YNEG=3'd5;
	 localparam DIR_ZNEG=3'd6;
	 localparam DIR_EJECT=3'd7;

	 localparam ROUTE_LEN = 3;
	 localparam PORT_NUM = 6;

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
 
