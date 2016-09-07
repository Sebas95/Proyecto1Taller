`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:19:09 09/05/2016
// Design Name:   SixBitCounter
// Module Name:   C:/Users/Sebastian/Documents/GitHub/Proyecto1Taller/MonitorVGA/SixBitCounter_test.v
// Project Name:  MonitorVGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SixBitCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SixBitCounter_test;

	// Inputs
	reg enable=1;
	reg clk=0;
	reg reset=0;
	reg forward=1;

	// Outputs
	wire [5:0] out;
	wire finish;

	// Instantiate the Unit Under Test (UUT)
	SixBitCounter uut (
		.out(out), 
		.enable(enable), 
		.clk(clk),  
		.reset(reset), 
		.forward(forward), 
		.finish(finish)
	);

	always #5 clk=~clk;
	
	initial begin

	end
      
endmodule

