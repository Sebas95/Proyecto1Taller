`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:13:55 09/10/2016
// Design Name:   VgaPainter
// Module Name:   C:/Users/Giovanni/Documents/GitHub/Proyecto1Taller/MonitorVGA/VgaPainterTest.v
// Project Name:  MonitorVGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VgaPainter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VgaPainterTest;

	// Inputs
	reg [3:0] mDecimal;
	reg [3:0] mUnit;
	reg [3:0] sUnit;
	reg [3:0] sDecimal;
	reg clk;

	// Outputs
	wire hsync;
	wire vsync;
	wire [2:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	VgaPainter uut (
		.mDecimal(mDecimal), 
		.mUnit(mUnit), 
		.sUnit(sUnit), 
		.sDecimal(sDecimal), 
		.clk(clk), 
		.hsync(hsync), 
		.vsync(vsync), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		mDecimal = 0;
		mUnit = 0;
		sUnit = 0;
		sDecimal = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

