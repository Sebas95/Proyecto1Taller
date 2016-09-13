`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:18:10 09/13/2016
// Design Name:   vgaColorConfig
// Module Name:   C:/Users/Giovanni/Documents/GitHub/Proyecto1Taller/MonitorVGA/testVgaColor.v
// Project Name:  MonitorVGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vgaColorConfig
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testVgaColor;

	// Inputs
	reg nextRgb;
	reg video_on;

	// Outputs
	wire rgb;

	// Instantiate the Unit Under Test (UUT)
	vgaColorConfig uut (
		.nextRgb(nextRgb), 
		.video_on(video_on), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		nextRgb = 0;
		video_on = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

