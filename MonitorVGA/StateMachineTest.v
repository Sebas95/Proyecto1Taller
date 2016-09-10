`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:26:46 09/10/2016
// Design Name:   TimerStateMachine
// Module Name:   C:/Users/Giovanni/Documents/GitHub/Proyecto1Taller/MonitorVGA/StateMachineTest.v
// Project Name:  MonitorVGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TimerStateMachine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module StateMachineTest;

	// Inputs
	reg clk = 0;
	reg start;
	reg stop;
	reg delete;
	reg segDemand;
	reg minDemand;

	// Outputs
	wire enableCounter;
	wire forward;
	wire resetTimer;

	// Instantiate the Unit Under Test (UUT)
	TimerStateMachine uut (
		.clk(clk), 
		.start(start), 
		.stop(stop), 
		.delete(delete), 
		.segDemand(segDemand), 
		.minDemand(minDemand), 
		.enableCounter(enableCounter), 
		.forward(forward), 
		.resetTimer(resetTimer)
	);

	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		start = 0;
		stop = 0;
		delete = 0;
		segDemand = 0;
		minDemand = 0;

		/* //Prueba para iniciar sin establecer
		#2;
		start = 1;
		stop = 0;
		delete = 0;
		segDemand = 0;
		minDemand = 0;		
		*/
		
		//Prueba para iniciar en establecer
		#2;
		start = 0;
		stop = 0;
		delete = 0;
		segDemand = 1;
		minDemand = 0;		

		#5;
		start = 0;
		stop = 0;
		delete = 1;
		segDemand = 0;
		minDemand = 0;			
		

	end
      
endmodule

