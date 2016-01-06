`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:48:15 12/02/2015
// Design Name:   vga640x480
// Module Name:   C:/Users/152/Desktop/lelv2/a/gfgfgfgfg.v
// Project Name:  a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga640x480
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gfgfgfgfg;

	// Inputs
	reg dclk;
	reg aclk;
	reg reset;
	reg line1;
	reg line2;
	reg line3;
	reg line4;
	reg slow;
	reg normal;
	reg fast;
	reg up;
	reg down;
	reg left;
	reg right;

	// Outputs
	wire hsync;
	wire vsync;
	wire [2:0] red;
	wire [2:0] green;
	wire [1:0] blue;
	wire score0;
	wire score1;
	wire score2;
	wire score3;
	wire score4;
	wire score5;
	wire score6;
	wire score7;
	wire score8;
	wire score9;
	wire score10;
	wire score11;
	wire score12;
	wire score13;
	wire score14;

	// Instantiate the Unit Under Test (UUT)
	vga640x480 uut (
		.dclk(dclk), 
		.aclk(aclk), 
		.reset(reset), 
		.line1(line1), 
		.line2(line2), 
		.line3(line3), 
		.line4(line4), 
		.slow(slow), 
		.normal(normal), 
		.fast(fast), 
		.up(up), 
		.down(down), 
		.left(left), 
		.right(right), 
		.hsync(hsync), 
		.vsync(vsync), 
		.red(red), 
		.green(green), 
		.blue(blue), 
		.score0(score0), 
		.score1(score1), 
		.score2(score2), 
		.score3(score3), 
		.score4(score4), 
		.score5(score5), 
		.score6(score6), 
		.score7(score7), 
		.score8(score8), 
		.score9(score9), 
		.score10(score10), 
		.score11(score11), 
		.score12(score12), 
		.score13(score13), 
		.score14(score14)
	);

	initial begin
		// Initialize Inputs
		dclk = 0;
		aclk = 0;
		reset = 0;
		line1 = 0;
		line2 = 0;
		line3 = 0;
		line4 = 0;
		slow = 0;
		normal = 0;
		fast = 0;
		up = 0;
		down = 0;
		left = 0;
		right = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		

	end
      
	  always #1 dclk=~dclk;
	always #2500 aclk = ~aclk;
	  
endmodule

