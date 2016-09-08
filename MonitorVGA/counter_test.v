`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:05:04 09/06/2016
// Design Name:   SixBitCounter
// Module Name:   C:/Users/Sebastian/Documents/GitHub/Proyecto1Taller/MonitorVGA/counter_test.v
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

module counter_test;

	// Inputs
	reg enable=0;
	reg clk=0;
	reg reset=0;
	reg forward=0;
	reg increment=0;

	// Outputs
	wire [5:0] out;
	wire finish;

	// Instantiate the Unit Under Test (UUT)
	SixBitCounter uut (
		.enable(enable), 
		.clk(clk), 
		.reset(reset), 
		.forward(forward), 
		.increment(increment), 
		.out(out), 
		.finish(finish)
	);
	
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		enable = 1;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		forward = 1;
		#10;
		increment=1;
		#10;
		increment=0;
		#10;
		increment=1;
		#10;
		increment=0;
		#10;
		forward=0;
		#100;
		//increment=1;
		#200;
		
		
		forward = 1;
		#10;
		increment=1;
		#10;
		increment=0;
		#10;
		increment=1;
		#10;
		increment=0;
		#10;
		increment=1;
		#10;
		increment=0;
		#10;
		forward=0;
		#100;
		
	end
      
endmodule

