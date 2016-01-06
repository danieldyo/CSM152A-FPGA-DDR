`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:42:45 12/02/2015
// Design Name:   segdisplay
// Module Name:   C:/Users/152/Desktop/lelv2/a/asdf.v
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

module asdf;

	// Inputs
	reg segclk;
	reg clr;
	reg score0;
	reg score1;
	reg score2;
	reg score3;
	reg score4;
	reg score5;
	reg score6;
	reg score7;
	reg score8;
	reg score9;
	reg score10;
	reg score11;
	reg score12;
	reg score13;
	reg score14;

	// Outputs
	wire [6:0] seg;
	wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	segdisplay uut (
		.segclk(segclk), 
		.clr(clr), 
		.seg(seg), 
		.an(an), 
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
		segclk = 0;
		clr = 0;
		score0 <= 1;
		score1 <=0;
		score2 <=1;
		score3<= 0;
		score4<= 1;
		score5 <=0;
		score6 <=1;
		score7 <=0;
		score8 <=1;
		score9 <=0;
		score10<= 1;
		score11 <=0;
		score12 <=0;
		score13<= 0;
		score14 <=0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #1 segclk = ~segclk;
      
endmodule

