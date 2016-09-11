`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:59:30 09/10/2016
// Design Name:   VgaPainter
// Module Name:   C:/Users/Giovanni/Documents/GitHub/Proyecto1Taller/MonitorVGA/vgaPainterTest.v
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

module vgaPainterTest;

	// Inputs
	reg [3:0] mDecimal;
	reg [3:0] mUnit;
	reg [3:0] sUnit;
	reg [3:0] sDecimal;
	reg [2:0] actualState;
	reg clk = 0;
	reg clk2 = 0;

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
		.actualState(actualState), 
		.clk(clk), 
		.clk2(clk2), 
		.hsync(hsync), 
		.vsync(vsync), 
		.rgb(rgb)
	);
	
	always #5 clk = ~clk;
	always #20 clk2 = ~clk2;

	initial begin
		// Initialize Inputs
		mDecimal = 0;
		mUnit = 0;
		sUnit = 0;
		sDecimal = 0;
		actualState = 0;
		clk = 0;
		clk2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

