`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:06:03 09/10/2016
// Design Name:   Temporizador
// Module Name:   C:/Users/Giovanni/Documents/GitHub/Proyecto1Taller/MonitorVGA/TimerTest.v
// Project Name:  MonitorVGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Temporizador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TimerTest;

	// Inputs
	reg CLK_50MHZ = 0;
	reg incrementSeconds;
	reg incrementMinutes;
	reg reset;
	reg start;
	reg stop;
	reg delete;

	// Outputs
	wire hsync;
	wire vsync;
	wire [2:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	Temporizador uut (
		.CLK_50MHZ(CLK_50MHZ), 
		.incrementSeconds(incrementSeconds), 
		.incrementMinutes(incrementMinutes), 
		.reset(reset), 
		.start(start), 
		.stop(stop), 
		.delete(delete), 
		.hsync(hsync), 
		.vsync(vsync), 
		.rgb(rgb)
	);
	always #5 CLK_50MHZ = ~CLK_50MHZ;
	initial begin
		// Initialize Inputs
		CLK_50MHZ = 0;
		incrementSeconds = 0;
		incrementMinutes = 0;
		reset = 0;
		start = 0;
		stop = 0;
		delete = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

