`timescale 1ns / 1ps

//testbench
////////////////////////////////////////////////////////////////////////////////

module london;

	// Inputs
	reg clk;
	reg rst;
	reg valid_in;
	reg [2:0] dst_z;
	reg [2:0] dst_y;
	reg [2:0] dst_x;
	reg [2:0] src_z;
	reg [2:0] src_y;
	reg [2:0] src_x;
	reg [7:0] contextId;
	reg [7:0] tag;
	reg [1:0] algtype;
	reg [3:0] op;
	reg [31:0] payload;

	// Outputs
	wire [72:0] Outpacket;
	wire done;
	wire valid_out;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.Outpacket(Outpacket), 
		.done(done), 
		.valid_out(valid_out), 
		.clk(clk), 
		.rst(rst), 
		.valid_in(valid_in), 
		.dst_z(dst_z), 
		.dst_y(dst_y), 
		.dst_x(dst_x), 
		.src_z(src_z), 
		.src_y(src_y), 
		.src_x(src_x), 
		.contextId(contextId), 
		.tag(tag), 
		.algtype(algtype), 
		.op(op), 
		.payload(payload)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		valid_in = 1;
		dst_z = 0;
		dst_y = 0;
		dst_x = 0;
		src_z = 0;
		src_y = 0;
		src_x = 0;
		contextId = 0;
		tag = 1;
		algtype = 0;
		op = 4'b1111;
		payload = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst=0;
      src_x = 1;
		payload=6;
 
		#10;
	   payload=5;
		tag=0;
	  
	   #10;
	   payload=4;
		tag=1;
	  
	   #10;
	   payload=3;
		tag=0;
	  
	   #10;
	   payload=2;  
		tag=1;
		
		#10;
	   payload=1;  
		tag=0;
		
		#10;
	   payload=6;  
		tag=1;
		
		#10;
	   payload=5;  
		tag=0;
		
		#10;
	   payload=4;  
		tag=1;
		
	end
	
	always begin
	#5 clk = !clk;
	end
      
endmodule
