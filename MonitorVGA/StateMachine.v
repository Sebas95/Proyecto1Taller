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
	 
	     always @(state, cnt)
      case(state)
      0:  // Color Rojo
        if (cnt == 100) nextState = 1;
        else nextState = 0;
      1:  // Color Ambar
        if (cnt == 120) nextState = 2;
        else nextState = 1;
      2:  // Color Verde
        if (cnt == 200) nextState = 0;
        else nextState = 2;
      default: nextState = 0;
      endcase


endmodule
