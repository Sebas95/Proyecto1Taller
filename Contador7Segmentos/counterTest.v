`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:38:30 09/03/2016
// Design Name:   Counter
// Module Name:   C:/Users/Giovanni/Documents/GitHub/Proyecto1Taller/Contador7Segmentos/counterTest.v
// Project Name:  Contador7Segmentos
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counterTest;

	// Inputs
	reg enable;
	reg clk_100MHz;
	reg reset;
	reg forward;

	// Outputs
	wire a;
	wire b;
	wire c;
	wire d;
	wire e;
	wire f;
	wire g;
	wire dp;
	wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	Counter uut (
		.enable(enable), 
		.clk_100MHz(clk_100MHz), 
		.reset(reset), 
		.forward(forward), 
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.e(e), 
		.f(f), 
		.g(g), 
		.dp(dp), 
		.an(an)
	);

	initial begin
		// Initialize Inputs
		enable = 0;
		clk_100MHz = 0;
		reset = 0;
		forward = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

