`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:20:24 11/24/2015 
// Design Name: 
// Module Name:    top 
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
module top(
	input wire clk,			//master clock = 50MHz
	output wire [6:0] seg,	//7-segment display LEDs
	output wire [3:0] an,	//7-segment display anode enable
	output wire dp,			//7-segment display decimal point
	output wire [2:0] red,	//red vga output - 3 bits
	output wire [2:0] green,//green vga output - 3 bits
	output wire [1:0] blue,	//blue vga output - 2 bits
	output wire hsync,		//horizontal sync out
	output wire vsync,			//vertical sync out
	input slow,
	input normal,
	input fast,
	input reset,
	input UP,
	input DOWN,
	input LEFT,
	input RIGHT,
	input KEK,
    output wire JA
	);

// 7-segment clock interconnect
wire segclk;

// VGA display clock interconnect
wire dclk;

//Clock for arrow speeds
wire aclk;

// disable the 7-segment decimal points
assign dp = 1;

wire score;
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


wire numerator;
wire quotient;
wire remainder;

wire address;
wire note;
wire speaker;
// generate 7-segment clock & display clock
clockdiv U1(
	.clk(clk),
	.clr(reset),
	.aclk(aclk),
	.segclk(segclk),
	.dclk(dclk)
	);

music U4(
    .clk(dclk),
    .speaker(JA)
    );



// VGA controller
vga640x480 U3(
	.dclk(dclk),
	.reset(reset),
	.aclk(aclk),
	.slow(slow),
	.normal(normal),
	.fast(fast),
	.hsync(hsync),
	.vsync(vsync),
	.red(red),
	.green(green),
	.blue(blue),
	.up(UP),
	.down(DOWN),
	.left(LEFT),
	.right(RIGHT),
	.kek(KEK),
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
	
// 7-segment display controller
segdisplay U2(
	.segclk(segclk),
	.clr(reset),
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

endmodule
