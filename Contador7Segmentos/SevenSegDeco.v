`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:02 09/03/2016 
// Design Name: 
// Module Name:    SevenSegDeco 
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
module SevenSegDeco(
	input clock, reset,
	//input Cout,
	input [3:0]in,  //the 4 inputs for each display
	output a, b, c, d, e, f, g, dp, //the individual LED output for the seven segment along with the digital point
	output [3:0] an   // the 4 bit enable signal
);
 
localparam N = 18;  
 
reg [N-1:0]count; //the 18 bit counter which allows us to multiplex at 1000Hz
 
always @ (posedge clock or posedge reset)
	begin
	if (reset)
		count <= 0;
	else
		count <= count + 1;
	end
 
reg [6:0]sseg; //the 7 bit register to hold the data to output
reg [3:0]an_temp; //register for the 4 bit enable
 
always @ (*)
	begin
		an_temp = 4'b0111;
	end
assign an = an_temp; 
reg [6:0] sseg_temp; // 7 bit register to hold the binary value of each input given
 
always @ (*)
	begin
		case(in)
			4'b0000 : sseg_temp = 7'b1000000; //to display 0
			4'd1 : sseg_temp = 7'b1111001; //to display 1
			4'd2 : sseg_temp = 7'b0100100; //to display 2
			4'd3 : sseg_temp = 7'b0110000; //to display 3
			4'd4 : sseg_temp = 7'b0011001; //to display 4
			4'd5 : sseg_temp = 7'b0010010; //to display 5
			4'd6 : sseg_temp = 7'b0000010; //to display 6
			4'd7 : sseg_temp = 7'b1111000; //to display 7
			4'd8 : sseg_temp = 7'b0000000; //to display 8
			4'd9 : sseg_temp = 7'b0010000; //to display 9
	
			4'd10 : sseg_temp = 7'b0001000; //to display 10
			4'd11 : sseg_temp = 7'b0000011; //to display 11
			4'd12 : sseg_temp = 7'b1000110; //to display 12
			4'd13 : sseg_temp = 7'b0100001; //to display 13
			4'd14 : sseg_temp = 7'b0000110; //to display 14
			4'd15 : sseg_temp = 7'b0001110; //to display 15
	
			default : sseg_temp = 7'b0111111; //dash
		endcase
	end
assign {g, f, e, d, c, b, a} = sseg_temp; //concatenate the outputs to the register, this is just a more neat way of doing this.
// I could have done in the case statement: 4'd0 : {g, f, e, d, c, b, a} = 7'b1000000; 
// its the same thing.. write however you like it
 
assign dp = 1'b1; //since the decimal point is not needed, all 4 of them are turned off
 
 
endmodule