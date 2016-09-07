`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:45 09/05/2016 
// Design Name: 
// Module Name:    MinutesCounter 
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
module MinutesCounter(
	
	input enable  ,  // enable for counter
 	input clk     ,  // clock Input
 	input reset   ,  // reset Input
	input forward , //forward input
	input incrementSeconds,
	input incrementMinutes,
	output  [5:0]outSeconds     ,  // Output of the counter
	output  [5:0]outMinutes     ,  // Output of the counter
	output  finish

    );
	
	
	wire minutesClock;
	wire clk_1Hz;
	
	FrecuencyDivider fd (
		.clk_100MHz(clk),
		.clk_1Hz(clk_1Hz),
		.counter()
	);
	
	SixBitCounter seconds (
	.out(outSeconds)    , 
	.enable(enable)  ,  
 	.clk(clk_1Hz)     ,  
 	.reset(reset)   ,  
	.forward(forward) , 
	.increment(incrementSeconds),
	.finish(minutesClock) // el clck de los minutos es el finish del contador de segundos
	
	);
	
	SixBitCounter minutes (
	.out(outMinutes)    , 
	.enable(enable)  ,  
 	.clk(minutesClock), // el clock del contador de minutes es el finish de los segundos 
 	.reset(reset)   ,  
	.forward(forward) ,
	.increment(incrementMinutes),
	.finish(finish)
	
	);


endmodule
