`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:17:06 09/02/2016
// Design Name:   FrecuencyDivider
// Module Name:   C:/Users/Sebastian/Documents/workspace/Contador7Segmentos/Divider_test.v
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

module Divider_test;

	// Inputs
	reg clk_100MHz;

	// Outputs
	wire clk_1Hz;
	wire [15:0]counter ;
 
	// Instantiate the Unit Under Test (UUT)
	FrecuencyDivider uut (
		.clk_100MHz(clk_100MHz), 
		.clk_1Hz(clk_1Hz), 
		.counter(counter)
	);
	always #5 clk_100MHz=~clk_100MHz; 
	integer x=0;
	initial begin
		
	for(x=0 ; x<50;x=x+1)
	begin
		#1; clk_100MHz=0;
		#1; clk_100MHz=1;
	end
	end
      
endmodule

