`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:22:01 12/02/2015
// Design Name:   segdisplay
// Module Name:   C:/Users/152/Desktop/lelv2/a/tost.v
// Project Name:  a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: segdisplay
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tost;

	// Inputs
	reg segclk;
	reg clr;
	reg [14:0] score;

	// Outputs
	wire [6:0] seg;
	wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	segdisplay uut (
		.segclk(segclk), 
		.clr(clr), 
		.seg(seg), 
		.an(an), 
		.score(score)
	);

	initial begin
		// Initialize Inputs
		segclk = 0;
		clr = 0;
		score = 2345;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #1 segclk = ~segclk;
      
endmodule

