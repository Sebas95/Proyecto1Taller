`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:56:47 09/09/2016
// Design Name:   MinutesCounter
// Module Name:   C:/Users/Sebastian/Documents/GitHub/Proyecto1Taller/MonitorVGA/total_counter_test.v
// Project Name:  MonitorVGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MinutesCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module total_counter_test;

	// Inputs
	reg enable;
	reg clk;
	reg reset;
	reg forward;
	reg incrementSeconds;
	reg incrementMinutes;

	// Outputs
	wire [3:0] secondsDecimals=0;
	wire [3:0] secondsUnits=0;
	wire [3:0] minutesDecimals=0;
	wire [3:0] minutesUnits=0;
	wire finish=0;

	// Instantiate the Unit Under Test (UUT)
	MinutesCounter uut (
		.enable(enable), 
		.clk(clk), 
		.reset(reset), 
		.forward(forward), 
		.incrementSeconds(incrementSeconds), 
		.incrementMinutes(incrementMinutes), 
		.secondsDecimals(secondsDecimals), 
		.secondsUnits(secondsUnits), 
		.minutesDecimals(minutesDecimals), 
		.minutesUnits(minutesUnits), 
		.finish(finish)
	);
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		enable = 0;
		clk = 0;
		reset = 0;
		forward = 0;
		incrementSeconds = 0;
		incrementMinutes = 0;

		// Wait 100 ns for global reset to finish
		#100;
		enable = 1;
		reset = 0;
		forward = 0;
		incrementSeconds = 0;
		incrementMinutes = 0;
		
		#100;
		enable = 0;
		reset = 0;
		forward = 0;
		incrementSeconds = 0;
		incrementMinutes = 0;
        
		// Add stimulus here

	end
      
endmodule

