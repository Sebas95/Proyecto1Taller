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
	output  wire [3:0]secondsDecimals  ,  // Output of the counter
	output  wire [3:0]secondsUnits    ,  // Output of the counter
	output  wire [3:0]minutesDecimals   ,  // Output of the counter
	output  wire [3:0]minutesUnits   ,  // Output of the counter	
	output wire  finish 

    );
		 
	
	wire	[5:0]minutes6bit;
	wire	[5:0]seconds6bit;
	wire minutesClock;
	wire clk_1Hz;
	
	
	FrecuencyDivider fd (
		.clk_100MHz(clk),
		.clk_1Hz(clk_1Hz),
		.counter()
	);
	
	SixBitCounter seconds (
	.out(seconds6bit)    , 
	.enable(enable)  ,  
 	.clk(clk_1Hz)     ,  
 	.reset(reset)   ,  
	.forward(forward) , 
	.increment(incrementSeconds),
	.finish(minutesClock) // el clck de los minutos es el finish del contador de segundos
	//.finish(finish) // el clck de los minutos es el finish del contador de segundos
	
	);
	
	SixBitCounter minutes (
	.out(minutes6bit)    , 
	.enable(enable)  ,  
 	.clk(minutesClock), // el clock del contador de minutes es el finish de los segundos 
 	.reset(reset)   ,  
	.forward(forward) ,
	.increment(incrementMinutes),
	.finish(finish)
	);
	
	TwoDigitDeco decoSeconds(
		.clk(clk),
		.number(seconds6bit),
		.decimals(secondsDecimals),
		.units(secondsUnits)
	);
	
	
	TwoDigitDeco decoMinutes(
		.clk(clk),
		.number(minutes6bit),
		.decimals(minutesDecimals),
		.units(minutesUnits)
	);
		

endmodule
