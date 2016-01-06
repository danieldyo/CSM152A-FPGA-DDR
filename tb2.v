`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:51:15 12/02/2015
// Design Name:   top
// Module Name:   C:/Users/152/Desktop/lelv2/a/tb2.v
// Project Name:  a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb2;

	// Inputs
	reg clk;
	reg slow;
	reg normal;
	reg fast;
	reg reset;
	reg UP;
	reg DOWN;
	reg LEFT;
	reg RIGHT;

	// Outputs
	wire [6:0] seg;
	wire [3:0] an;
	wire dp;
	wire [2:0] red;
	wire [2:0] green;
	wire [1:0] blue;
	wire hsync;
	wire vsync;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.seg(seg), 
		.an(an), 
		.dp(dp), 
		.red(red), 
		.green(green), 
		.blue(blue), 
		.hsync(hsync), 
		.vsync(vsync), 
		.slow(slow), 
		.normal(normal), 
		.fast(fast), 
		.reset(reset), 
		.UP(UP), 
		.DOWN(DOWN), 
		.LEFT(LEFT), 
		.RIGHT(RIGHT)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		slow = 0;
		normal = 0;
		fast = 0;
		reset = 0;
		UP = 0;
		DOWN = 0;
		LEFT = 0;
		RIGHT = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #1 clk = ~clk;
      
endmodule

