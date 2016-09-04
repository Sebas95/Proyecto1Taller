`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:11:56 09/02/2016
// Design Name:   FrecuencyDivider
// Module Name:   C:/Users/Sebastian/Documents/workspace/Contador7Segmentos/Frecuency_divider_test.v
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

module Frecuency_divider_test;

	// Inputs
	reg clk_100MHz;

	// Outputs
	wire clk_1Hz;
	wire [15:0] ;

	// Instantiate the Unit Under Test (UUT)
	FrecuencyDivider uut (
		.clk_100MHz(clk_100MHz), 
		.clk_1Hz(clk_1Hz), 
		.()
	);

	always #5 clk_100MHz=~clk_100MHz; 
	initial begin
		// Initialize Inputs


		// Wait 100 ns for global reset to finish

        
		// Add stimulus here

	end
      
endmodule

