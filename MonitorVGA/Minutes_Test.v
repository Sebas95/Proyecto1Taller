`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:21:00 09/05/2016
// Design Name:   MinutesCounter
// Module Name:   C:/Users/Sebastian/Documents/GitHub/Proyecto1Taller/MonitorVGA/Minutes_Test.v
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

module Minutes_Test;

	// Inputs
	reg enable=1;
	reg clk=0;
	reg reset=0;
	reg forward=1;

	// Outputs
	wire [5:0] outSeconds;
	wire [5:0] outMinutes;
	wire finish;
	wire minutesClock;
	wire clk_1Hz;

	// Instantiate the Unit Under Test (UUT)
	MinutesCounter uut (
		.outSeconds(outSeconds), 
		.outMinutes(outMinutes), 
		.enable(enable), 
		.clk(clk), 
		.reset(reset), 
		.forward(forward), 
		.finish(finish), 
		.minutesClock(minutesClock), 
		.clk_1Hz(clk_1Hz)
	);

	always #5 clk=~clk;
	initial begin
	

	end
      
endmodule

