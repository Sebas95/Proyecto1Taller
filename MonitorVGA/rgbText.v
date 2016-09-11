`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:10:29 09/10/2016
// Design Name:   textPainter
// Module Name:   C:/Users/Giovanni/Documents/GitHub/Proyecto1Taller/MonitorVGA/rgbText.v
// Project Name:  MonitorVGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: textPainter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rgbText;

	// Inputs
	reg clk = 0;
	reg [3:0] dig0;
	reg [3:0] dig1;
	reg [3:0] dig2;
	reg [3:0] dig3;
	reg [2:0] actualState;
	reg [9:0] pix_x;
	reg [9:0] pix_y;
	reg [7:0] font_word;

	// Outputs
	wire [3:0] text_on;
	wire [2:0] text_rgb;
	wire [10:0] rom_addr;

	// Instantiate the Unit Under Test (UUT)
	textPainter uut (
		.clk(clk), 
		.dig0(dig0), 
		.dig1(dig1), 
		.dig2(dig2), 
		.dig3(dig3), 
		.actualState(actualState), 
		.pix_x(pix_x), 
		.pix_y(pix_y), 
		.text_on(text_on), 
		.text_rgb(text_rgb), 
		.rom_addr(rom_addr), 
		.font_word(font_word)
	);

	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		dig0 = 0;
		dig1 = 0;
		dig2 = 0;
		dig3 = 0;
		actualState = 0;
		pix_x = 0;
		pix_y = 0;
		font_word = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

