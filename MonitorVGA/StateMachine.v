`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:32:05 09/03/2016 
// Design Name: 
// Module Name:    StateMachine 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module StateMachine(
    input clk,
    input start,
    input progressive,
    input regressive
    );
	 
	// Instantiate the Unit Under Test (UUT)
	
	reg enable = 0;
	reg forward = 0;
	reg reset;
	wire [3:0] out;
	
	FourBitCounter uut (
		.out(out), 
		.enable(enable), 
		.clk(clk),  
		.reset(reset),
		.forward(forward)
	);
	 
	   always @(state, cnt)
			case(state)
					0:  // Color Rojo
					  if (1) nextState = 1;
					  else nextState = 0;
					1:  // Color Ambar	
					  //enable = 1;
					  if (1) nextState = 2;
					  else nextState = 1;
					2:  // Color Verde
					  if (progressive || regressive)
							begin
								if(progressive) nextState = 0;
								else nextState = 0;
							end
					  else nextState = 2;
					default: nextState = 0;
			endcase


endmodule
