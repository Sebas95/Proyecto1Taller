`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:57:46 09/19/2016
// Design Name:   VgaPainter
// Module Name:   C:/Users/Giovanni/Documents/GitHub/Proyecto1Taller/MonitorVGA/vgaPainterTest2.v
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

module vgaPainterTest2;

	// Inputs
	reg [3:0] mDecimal;
	reg [3:0] mUnit;
	reg [3:0] sUnit;
	reg [3:0] sDecimal;
	reg [2:0] actualState;
	reg clk_100MHz = 0;
	reg finish;

	// Outputs
	wire hsync;
	wire vsync;
	wire [2:0] rgb;
	wire video_on;
	wire [3:0] text_on;

	// Instantiate the Unit Under Test (UUT)
	VgaPainter uut (
		.mDecimal(mDecimal), 
		.mUnit(mUnit), 
		.sUnit(sUnit), 
		.sDecimal(sDecimal), 
		.actualState(actualState), 
		.clk_100MHz(clk_100MHz), 
		.finish(finish), 
		.hsync(hsync), 
		.vsync(vsync), 
		.rgb(rgb), 
		.video_on(video_on), 
		.text_on(text_on)
	);
	always #5 clk_100MHz = ~clk_100MHz;
	initial begin
		// Initialize Inputs
		mDecimal = 0;
		mUnit = 0;
		sUnit = 0;
		sDecimal = 0;
		actualState = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

