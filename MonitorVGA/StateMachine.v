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
	reg forward = 1;
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
					  if (start) nextState = 1;
					  else nextState = 0;
					1:  // Color Ambar	
						begin
						  enable = 1;
						  forward = 1;
						  if (finish) nextState = 2;
						  else nextState = 1;
						end
					2: 
						begin
						  enable = 1;
						  forward = 0;
						  if (finish) nextState = 3;
						  else nextState = 2;
						end					
					3:  // Color Verde
					  if (progressive || regressive)
							begin
								if(progressive) nextState = 1;
								else nextState = 2;
							end
					  else nextState = 3;
					4: 
						begin
							enable = 1;
							forward = 0;
							if (finish) nextState = 4;
							else nextState = 1;	
						end
					default: nextState = 0;
			endcase


endmodule
