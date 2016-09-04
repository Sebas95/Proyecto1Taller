`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:37:47 09/03/2016
// Design Name:   FrecuencyDivider
// Module Name:   C:/Users/Sebastian/Documents/workspace/Contador7Segmentos/DividerTest.v
// Project Name:  Contador7Segmentos
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FrecuencyDivider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DividerTest;

	// Inputs
	reg clk_100MHz=0;
	
	// Outputs
	wire clk_1Hz;
	wire [26:0]counter ;

	// Instantiate the Unit Under Test (UUT)
	FrecuencyDivider uut (
		.clk_100MHz(clk_100MHz), 
		.clk_1Hz(clk_1Hz), 
		.counter(counter)
		
	);
	always #5 clk_100MHz=~clk_100MHz;
	initial begin
	
	end
      
endmodule

