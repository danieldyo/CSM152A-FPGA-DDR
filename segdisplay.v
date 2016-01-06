`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:56:56 03/19/2013 
// Design Name: 
// Module Name:    segdisplay 
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
module segdisplay(
	input wire segclk,		//7-segment clock
	input wire clr,			//asynchronous reset
	output reg [6:0] seg,	//7-segment display LEDs
	output reg [3:0] an,		//7-segment display anode enable
	input score0,
	input score1,
	input score2,
	input score3,
	input score4,
	input score5,
	input score6,
	input score7,
	input score8,
	input score9,
	input score10,
	input score11,
	input score12,
	input score13,
	input score14
	);


parameter NINE 	= 7'b0011000;
parameter EIGHT = 7'b0000000;
parameter SEVEN = 7'b1111000;
parameter SIX 	= 7'b0000010;
parameter FIVE 	= 7'b0010010;
parameter FOUR 	= 7'b0011001;
parameter THREE = 7'b0110000;
parameter TWO 	= 7'b0100100;
parameter ONE 	= 7'b1111001;
parameter ZERO 	= 7'b1000000;

reg [14:0] score;

reg [3:0] digit0;
reg [3:0] digit1;
reg [3:0] digit2;
reg [3:0] digit3;

reg [2:0] display_clk;

initial
begin
	//counter <= score;
	score <= 0;
	display_clk <= 0;

end





// FSM which cycles though every digit of the display every 2.62ms.
// This should be fast enough to trick our eyes into seeing that
// all four digits are on display at the same time.
always @(posedge segclk or posedge clr)
begin
	if (clr == 1)
	begin
		an <= 4'b0000;
		seg <= ZERO;
		score <= 0;
	end
	
	// reset condition
	else 
	begin
		score[0] <= score0;
		score[1] <= score1;
		score[2] <= score2;
		score[3] <= score3;
		score[4] <= score4;
		score[5] <= score5;
		score[6] <= score6;
		score[7] <= score7;
		score[8] <= score8;
		score[9] <= score9;
		score[10] <= score10;
		score[11] <= score11;
		score[12] <= score12;
		score[13] <= score13;
		score[14] <= score14;
		
		digit0 <= (score % 10);
		digit1 <= (score/10 % 10);
		digit2 <= (score/100 % 10);
		digit3 <= (score/1000);
	
		//counter <= counter + 1;
		
		if (score >= 9999)
			score <= 9999;
			
	// display the character for the current position
	// and then move to the next state
		if (display_clk == 0)
		begin
			an <= 'b1110;
			case(digit0)
				0: seg <= ZERO;
				1: seg <= ONE;
				2: seg <= TWO;
				3: seg <= THREE;
				4: seg <= FOUR;
				5: seg <= FIVE;
				6: seg <= SIX;
				7: seg <= SEVEN;
				8: seg <= EIGHT;
				9: seg <= NINE;
			endcase
		end
		else if (display_clk == 1)
		begin
			an <= 'b1101;
			case(digit1)
				0: seg <= ZERO;
				1: seg <= ONE;
				2: seg <= TWO;
				3: seg <= THREE;
				4: seg <= FOUR;
				5: seg <= FIVE;
				6: seg <= SIX;
				7: seg <= SEVEN;
				8: seg <= EIGHT;
				9: seg <= NINE;
			endcase
		end
		else if (display_clk == 2)
		begin
			an <= 'b1011;
			case(digit2)
				0: seg <= ZERO;
				1: seg <= ONE;
				2: seg <= TWO;
				3: seg <= THREE;
				4: seg <= FOUR;
				5: seg <= FIVE;
				6: seg <= SIX;
				7: seg <= SEVEN;
				8: seg <= EIGHT;
				9: seg <= NINE;
			endcase
		end
		else if (display_clk == 3)
		begin
			an <= 'b0111;
			case(digit3)
				0: seg <= ZERO;
				1: seg <= ONE;
				2: seg <= TWO;
				3: seg <= THREE;
				4: seg <= FOUR;
				5: seg <= FIVE;
				6: seg <= SIX;
				7: seg <= SEVEN;
				8: seg <= EIGHT;
				9: seg <= NINE;
			endcase
		end
			

		display_clk <= display_clk + 1;
		if (display_clk == 4)
			display_clk <= 0;
	end
end

endmodule
