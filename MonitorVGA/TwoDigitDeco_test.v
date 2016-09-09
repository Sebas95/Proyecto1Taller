`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:57:34 09/09/2016
// Design Name:   TwoDigitDeco
// Module Name:   C:/Users/Sebastian/Documents/GitHub/Proyecto1Taller/MonitorVGA/TwoDigitDeco_test.v
// Project Name:  MonitorVGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TwoDigitDeco
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TwoDigitDeco_test;

	// Inputs
	reg clk=0;
	reg [5:0] number=0;

	// Outputs
	wire [3:0] decimals;
	wire [3:0] units;

	// Instantiate the Unit Under Test (UUT)
	TwoDigitDeco uut (
		.clk(clk), 
		.number(number), 
		.decimals(decimals), 
		.units(units)
	);

		always #5 clk=~clk;
	initial begin
		// Initialize I
		

		// Wait 100 ns for global reset to finish
		#10;
		number= 6'b000101;
		#10;
		number= 6'b000101;
		#10;
		number=	6'b000000; //00
		#10;
      number=   6'b000001; //01
		#10;
		number=	6'b000010; //02
		#10;	
		number=	6'b000011; //03
		#10;
		number=	6'b000100; //04
		#10;
		number=	6'b000101; //05
		#10;
		number=	6'b000110; //06
		#10;
		number=	6'b000111; //07
		#10;
		number=	6'b001000; //08
		#10;
		number=	6'b001001; //09
	#10;
		number=	6'b001010; //10
	#10;
		number=	6'b001011; //11
		#10;
		number=	6'b001100; //12
		#10;
		number=	6'b001101; //13
	#10;
		number=	6'b001110; //14
		#10;
		number=	6'b001111; //15
#10;
		number=	6'b010000; //16
	#10;
      number=   6'b010000; //17
#10;
		number=	6'b010010; //18
		#10;	
		number=	6'b010011; //19
		#10;
		number=	6'b010100; //20
#10;
		number=	6'b010101; //21
#10;
		number=	6'b010110; //22
	#10;
		number=	6'b010111; //23
	#10;
		number=	6'b011000; //24
#10;
		number=	6'b011001; //25
#10;
		number=	6'b011010; //26
		#10;
		number=	6'b011011; //27
#10;
		number=	6'b011100; //28
#10;
		number=	6'b011101; //29
#10;
		number=	6'b011110; //30
#10;
		number=	6'b011111; //31
#10;
		number=	6'b100000; //32
#10;
      number=   6'b100000; //33
#10;
		number=	6'b100010;//34
	#10;
		number=	6'b100011; //35
#10;
		number=	6'b100100; //36
#10;
		number=	6'b100101; //37
#10;
		number=	6'b100110; //38
#10;
		number=	6'b100111; //39
#10;
		number=	6'b101000; //40
#10;
		number=	6'b101001; //41
#10;
		number=	6'b101010; //42
#10;
		number=	6'b101011; //43
	#10;
		number=	6'b101100; //44
#10;
		number=	6'b101101; //45
#10;
		number=	6'b101110; //46
#10;
		number=	6'b101111; //47
#10;
		number=	6'b110000; //48
#10;
      number=   6'b110001; //49
	#10;
		number=	6'b110010;//50
		#10;
		number=	6'b110011; //51
		#10;
		number=	6'b110100; //52
		#10;
		number=	6'b110101; //53
		#10;
		number=	6'b110110; //54
	#10;
		number=	6'b110111; //55
	#10;
		number=	6'b111000; //56
		#10;
		number=	6'b111001; //57
		#10;
		number=	6'b111010; //58
		#10;
		number=	6'b111011; //59

        
		// Add stimulus here

	end
      
endmodule

