`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:37:41 08/29/2016
// Design Name:   vga_test
// Module Name:   C:/Users/Sebastian/Documents/GitHub/Proyecto1Taller/MonitorVGA/test.v
// Project Name:  MonitorVGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga_test
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg CLK_50MHZ;
	reg reset;
	reg [2:0] sw;

	// Outputs
	wire hsync;
	wire vsync;
	wire [2:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	vga_test uut (
		.CLK_50MHZ(CLK_50MHZ), 
		.reset(reset), 
		.sw(sw), 
		.hsync(hsync), 
		.vsync(vsync), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		CLK_50MHZ = 0;
		reset = 0;
		sw = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

