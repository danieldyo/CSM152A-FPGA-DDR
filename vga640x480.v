`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:38 03/19/2013 
// Design Name: 
// Module Name:    vga640x480 
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
module vga640x480(
	input dclk,			//pixel clock: 25MHz
	input aclk,
	input reset,
	input slow,
	input normal,
	input fast,
	input up,
	input down,
	input left,
	input right,
	input kek,
	output hsync,		//horizontal sync out
	output vsync,		//vertical sync out
	output reg [2:0] red,	//red vga output
	output reg [2:0] green, //green vga output
	output reg [1:0] blue,	//blue vga output
	output reg score0,
	output reg score1,
	output reg score2,
	output reg score3,
	output reg score4,
	output reg score5,
	output reg score6,
	output reg score7,
	output reg score8,
	output reg score9,
	output reg score10,
	output reg score11,
	output reg score12,
	output reg score13,
	output reg score14
	);

// video structure constants
parameter hpixels = 800;// horizontal pixels per line
parameter vlines = 521; // vertical lines per frame
parameter hpulse = 96; 	// hsync pulse length
parameter vpulse = 2; 	// vsync pulse length
parameter hbp = 144; 	// end of horizontal back porch
parameter hfp = 784; 	// beginning of horizontal front porch
parameter vbp = 31; 		// end of vertical back porch
parameter vfp = 511; 	// beginning of vertical front porch
// active horizontal video is therefore: 784 - 144 = 640
// active vertical video is therefore: 511 - 31 = 480

// registers for storing the horizontal & vertical counters
reg [9:0] hc;
reg [9:0] vc;

reg[8:0] counter;
reg[8:0] counter2;
reg[8:0] counter3;
reg[8:0] counter4;

reg[4:0] speed;
reg[3:0] pressed;
reg [14:0] score;
reg [10:00] multiplier;
integer rand;
reg line1;
reg line2;
reg line3;
reg line4;

reg [1:0] is_hit1;
reg [1:0] is_hit2;
reg [1:0] is_hit3;
reg [1:0] is_hit4;

// Horizontal & vertical counters --
// this is how we keep track of where we are on the screen.
// ------------------------
// Sequential "always block", which is a block that is
// only triggered on signal transitions or "edges".
// posedge = rising edge  &  negedge = falling edge
// Assignment statements can only be used on type "reg" and need to be of the "non-blocking" type: <=

always @(posedge dclk)
begin
		if (fast == 1)
			speed <= 20;
		else if (normal == 1)
			speed <= 10;
		else if (slow == 1)
			speed <= 5;
		else 
			speed <= 1;
			
			
		// keep counting until the end of the line
		if (hc < hpixels - 1)
			hc <= hc + 1;
		else
		// When we hit the end of the line, reset the horizontal
		// counter and increment the vertical counter.
		// If vertical counter is at the end of the frame, then
		// reset that one too.
		begin
			hc <= 0;
			if (vc < vlines - 1)
				vc <= vc + 1;
			else
				vc <= 0;
		end

end

// generate sync pulses (active low)
// ----------------
// "assign" statements are a quick way to
// give values to variables of type: wire
assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

	

//Line Logic
//line is at 440 <= x <= 450
always @ (posedge aclk or posedge reset)
begin
	if (reset == 1)
		begin		
			counter <= 0;
			counter2 <= 0;
			counter3 <= 0;
			counter4 <= 0;
			score <= 0;
            multiplier <= 1;
            pressed <= 0;
            line1 <= 1;
            line2 <= 0;
            line3 <= 0;
            line4 <= 0;
			is_hit1 <= 0;
			is_hit2 <= 0;
			is_hit3 <= 0;
			is_hit4 <= 0;
			

		end
	else
	begin

		if (line1 == 1)
		begin
			counter <= counter + speed;
            if ((up || left || down || right) && (counter < 430 || counter > 460))
            begin
                multiplier <= 1;
            end
			if (counter >= 430 && counter <= 460 && pressed[0] == 0)
			begin
                if (left == 1 && counter >= 430 && counter < 440)
                begin
                        score <= score + multiplier;
                        multiplier <= multiplier + 1;
                        pressed[0] <= 1;
						is_hit1 <= 1;
                end
                else if (left == 1 && counter >= 440 && counter <= 450)
                begin
                   score <= score + (multiplier*2);
                   multiplier <= multiplier + 1;
                    pressed[0] <= 1;
					is_hit1 <= 2;

                end
                else if (left == 1 && counter > 450 && counter <= 460)
                begin
                   score <= score + multiplier;
                   multiplier <= multiplier + 1;
                    pressed[0] <= 1;
					is_hit1 <= 1;

                end
			end
			if (counter >= 480)
            begin
               if (pressed[0] == 0)
                   multiplier <= 1;
				counter <= 0;	
                pressed[0] <= 0;
                line1 <= 0;
                line2 <= 1;
				is_hit1 <= 0;
            end
		end
		if (line2 == 1)
		begin
			counter2 <= counter2 + speed;
	
            if ((up || left || down || right) && (counter2 < 430 || counter2 > 460))
            begin
                multiplier <= 1;
            end
			if (counter2 >= 430 && counter2 <= 460 && pressed[1] == 0)
			begin
                if (down == 1 && counter2 >= 430 && counter2 < 440)
                begin
                        score <= score + multiplier;
                        multiplier <= multiplier + 1;
                
                        pressed[1] <= 1;
						is_hit2 <= 1;
                end
                else if (down == 1 && counter2 >= 440 && counter2 <= 450)
                begin
                   score <= score + (multiplier*2);
                   multiplier <= multiplier + 1;
                   is_hit2 <= 2;
                    pressed[1] <= 1;
                end
                else if (down == 1 && counter2 > 450 && counter2 <= 460)
                begin
                   score <= score + multiplier;
                   multiplier <= multiplier + 1;
               
                    pressed[1] <= 1;
					is_hit2 <= 1;
                end
			end
			if (counter2 >= 480)
            begin
               if (pressed[1] == 0)
                   multiplier <= 1;
				counter2 <= 0;	
                pressed[1] <= 0;
                  line2 <= 0;
                  line4<= 1;
				  is_hit2 <= 0;
  
            end
		end
		if (line3 == 1)
		begin
			counter3 <= counter3 + speed;

            if ((up || left || down || right) && (counter3 < 430 || counter3 > 460))
            begin
                multiplier <= 1;
            end
			if (counter3 >= 430 && counter3 <= 460 && pressed[2] == 0)
			begin
                if (up == 1 && counter3 >= 430 && counter3 < 440)
                begin
                        score <= score + multiplier;
                        multiplier <= multiplier + 1;
						is_hit3 <= 1;
                        pressed[2] <= 1;
                end
                else if (up == 1 && counter3 >= 440 && counter3 <= 450)
                begin
                   score <= score + (multiplier*2);
                   multiplier <= multiplier + 1;
					is_hit3 <= 2;
                    pressed[2] <= 1;
                end
                else if (up == 1 && counter3 > 450 && counter3 <= 460)
                begin
                   score <= score + multiplier;
                   multiplier <= multiplier + 1;
					is_hit3 <= 1;
                    pressed[2] <= 1;
                end
			end
			if (counter3 >= 480)
            begin
               if (pressed[2] == 0)
                   multiplier <= 1;
				counter3 <= 0;	
                pressed[2] <= 0;
                  line3 <= 0;
                  line1 <= 1;
				  is_hit3 <= 0;

            end
		end
		if (line4 == 1)
		begin
			counter4 <= counter4 + speed;
            if ((up || left || down || right) && (counter4 < 430 || counter4 > 460))
            begin
                multiplier <= 1;
            end
			if (counter4 >= 430 && counter4 <= 460 && pressed[3] == 0)
			begin
                if (right == 1 && counter4 >= 430 && counter4 < 440)
                begin
                        score <= score + multiplier;
                        multiplier <= multiplier + 1;
                        pressed[3] <= 1;
						is_hit4 <= 1;
                end
                else if (right == 1 && counter4 >= 440 && counter4 <= 450)
                begin
                   score <= score + (multiplier*2);
                   multiplier <= multiplier + 1;
                    pressed[3] <= 1;
					is_hit4 <= 2;
                end
                else if (right == 1 && counter4 > 450 && counter4 <= 460)
                begin
                   score <= score + multiplier;
                   multiplier <= multiplier + 1;
                    pressed[3] <= 1;
					is_hit4 <= 1;
                end
			end
			if (counter4 >= 480)
            begin
               if (pressed[3] == 0)
                   multiplier <= 1;
				counter4 <= 0;	
                pressed[3] <= 0;
                  line4 <= 0;
                  line3 <= 1;
				  is_hit4 <= 0;
    
            end
		end
		score0 <= score[0];
		score1 <= score[1];
		score2 <= score[2];
		score3 <= score[3];
		score4 <= score[4];
		score5 <= score[5];
		score6 <= score[6];
		score7 <= score[7];
		score8 <= score[8];
		score9 <= score[9];
		score10 <= score[10];
		score11 <= score[11];
		score12 <= score[12];
		score13 <= score[13];
		score14 <= score[14];
        rand = $unsigned($random)%4 ; 
			
	end		

end

// display 100% saturation colorbars
// ------------------------
// Combinational "always block", which is a block that is
// triggered when anything in the "sensitivity list" changes.
// The asterisk implies that everything that is capable of triggering the block
// is automatically included in the sensitivty list.  In this case, it would be
// equivalent to the following: always @(hc, vc)
// Assignment statements can only be used on type "reg" and should be of the "blocking" type: =
always @(*)
begin
	// first check if we're within vertical active video range
	
	if (vc >= vbp && vc < vfp)
	begin
		// now display different colors every 80 pixels
		// while we're within the active horizontal range
		// -----------------
		// display white bar
		if (hc >= hbp && hc < (hbp+20))
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b11;
		end
		//line 1
		else if (hc >= (hbp+20) && hc < (hbp + 160))
		begin
			if (vc >= (vbp - 20 + counter)  && vc < (vfp - 480 - 10 + counter) )
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b00;
			end
			//stationary bar
			else if (vc >= vbp + 480 - 40 && vc < vfp - 30)
				begin
					red = 3'b111;
					green = 3'b000;
					blue = 2'b00;
				end
			else if (is_hit1 == 2)
				begin
					red = 3'b000;
					green = 3'b111;
					blue = 2'b00;
				end
			else if (is_hit1 == 1)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
			else
			begin
				red = 0;
				green = 0;
				blue = 0;
			end
		end
		else if (hc >= (hbp+160) && hc < (hbp+170))
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b11;
				
		end
		else if (hc >= (hbp+170) && hc < (hbp + 310))
		begin
			
			if (vc >= (vbp - 20 + counter2)  && vc < (vfp - 480 - 10 + counter2) )
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b00;
			end
			else if (vc >= vbp + 480 - 40 && vc < vfp - 30)
				begin
					red = 3'b111;
					green = 3'b000;
					blue = 2'b00;
				end
			else if (is_hit2 == 2)
				begin
					red = 3'b000;
					green = 3'b111;
					blue = 2'b00;
				end
			else if (is_hit2 == 1)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
			else
			begin
				red = 0;
				green = 0;
				blue = 0;
			end
		end
		else if (hc >= (hbp+310) && hc < (hbp + 330))
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b11;
		end
		else if (hc >= (hbp+330) && hc < (hbp + 470))
		begin
			
			if (vc >= (vbp - 20 + counter3)  && vc < (vfp - 480 - 10 + counter3) )
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b00;
			end
			else if (vc >= vbp + 480 - 40 && vc < vfp - 30)
				begin
					red = 3'b111;
					green = 3'b000;
					blue = 2'b00;
				end
			else if (is_hit3 == 2)
				begin
					red = 3'b000;
					green = 3'b111;
					blue = 2'b00;
				end
			else if (is_hit3 == 1)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
			else
			begin
				red = 0;
				green = 0;
				blue = 0;
			end
		end
		else if (hc >= (hbp+470) && hc < (hbp + 480))
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b11;
		end
		else if (hc >= (hbp+480) && hc < (hbp+620))
		begin
			if (vc >= (vbp - 20 + counter4)  && vc < (vfp - 480 - 10  + counter4) )
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b00;
			end
			else if (vc >= vbp + 480 - 40 && vc < vfp - 30)
				begin
					red = 3'b111;
					green = 3'b000;
					blue = 2'b00;
				end
			else if (is_hit4 == 2)
				begin
					red = 3'b000;
					green = 3'b111;
					blue = 2'b00;
				end
			else if (is_hit4 == 1)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
			else
			begin
				red = 0;
				green = 0;
				blue = 0;
			end
		end
	
		else if (hc >= (hbp+620) && hc < (hbp + 640))
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b11;
		end
	end
	// we're outside active vertical range so display black
	else
	begin
		red = 0;
		green = 0;
		blue = 0;
	end
end







endmodule
