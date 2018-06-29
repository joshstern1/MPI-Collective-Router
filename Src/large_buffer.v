`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:30:51 06/29/2018 
// Design Name: 
// Module Name:    large_buffer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module large_buffer(clk, rst, in, produce, consume, full, empty, out, usedw);
    
	 parameter FLIT_SIZE = 82;
	 parameter buffer_width = 82;
	 parameter buffer_depth = 5;
	 parameter cur_x = 0;
	 parameter cur_y = 0;
	 parameter cur_z = 0;
	 
	 input clk;
    input rst;
    input [buffer_width-1:0] in;
    input produce;
    input consume;
    output full;
    output empty;
    output reg [buffer_width-1:0] out;
    output [buffer_width-1:0] usedw;

    
    reg [buffer_depth/2:0] i;

    wire[buffer_depth-1:0] head_next;
	 wire[buffer_depth-1:0] tail_next;
	
    reg[buffer_depth-1:0] head;
	 reg[buffer_depth-1:0] tail;

	 reg[buffer_width-1:0] fifo[buffer_depth:0];  
 

    assign empty = (head == tail);
	 assign full = (tail == buffer_depth - 1) ? (head == 0) : (head == tail + 1);
	 assign head_next = (head == buffer_depth - 1) ? 0 : head + 1;
	 assign tail_next = (tail == buffer_depth - 1) ? 0 : tail + 1;


    always@(*) begin
        out = fifo[head];
    end

    always@(posedge clk) begin
		if(rst) begin
			for(i = 0; i <= buffer_depth; i = i + 1) begin
				fifo[i] = 0;
			end
		end
      else if(produce) begin
			fifo[tail] <= in;
		end
	end


    always@(posedge clk) begin
        if(rst) begin
            tail <= 0;
        end
        else begin
            if(produce && ~full)
                tail <= tail_next;
        end
    end

    always@(posedge clk) begin
        if(rst) begin
            head <= 0;
        end
        else begin
            if(consume && ~empty)
                head <= head_next;
        end
    end

    reg [buffer_width - 1 : 0] usedw_reg;
    assign usedw = usedw_reg;
    always@(*) begin
        if(tail >= head) begin
            usedw_reg = tail - head;
        end
        else begin
            usedw_reg = buffer_depth - head + tail;
        end
    end


endmodule
