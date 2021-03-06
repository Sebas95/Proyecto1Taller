`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:03:20 08/29/2016
// Design Name:   FourBitCounter
// Module Name:   C:/Users/Sebastian/Documents/GitHub/Proyecto1Taller/MonitorVGA/FourBitCounterTest.v
// Project Name:  MonitorVGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FourBitCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FourBitCounterTest;

	// Inputs
	reg enable;
	reg clk;
	reg reset;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	FourBitCounter uut (
		.out(out), 
		.enable(enable), 
		.clk(clk), 
		.reset(reset)
	);

	integer x=0;
	
	initial begin
		// Initialize Inputs
		enable = 1;
		clk = 0;
		reset = 1;
	
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	
		#10; clk=0; reset = 1;	
		#10; clk=1;
		#10; clk=1;reset = 0;
		#10; clk=0;
		
		for(x=0; x<20; x=x+1)
		begin
			#10; clk=0;
			#10; clk=1;
		end
		
		

	end
      
endmodule

