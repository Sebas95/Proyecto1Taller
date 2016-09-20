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
		 
	
	wire	[5:0]minutes6bit;// minutos del temporizador
	wire	[5:0]seconds6bit;// segundos del temporizador
	wire clk_1Hz;
	
	//divisor de frecunecia de 100MHZ a 1HZ para contar segundos
	FrecuencyDivider fd (
		.clk_100MHz(clk), //entrada
		.clk_1Hz(clk_1Hz), //salida
		.counter()
	);
	
	//contador desegundos
	SixBitCounter seconds (
	.out(seconds6bit)    , 
	.enable(enable)  ,  
 	.clk(clk_1Hz)     ,  
 	.reset(reset)   ,  
	.forward(forward) , 
	.finish(finish),  //bandera deentrada
	.increment(incrementSeconds)
	);
	
	//contador de minutos
	SixBitCounter_M minutes (
	.out(minutes6bit)    , 
	.enable(enable)  ,  
 	.clk_1Hz(clk_1Hz), // el clock del contador de minutes es el finish de los segundos 
 	.reset(reset)   ,  
	.forward(forward) ,
	.increment(incrementMinutes),
	.seconds(seconds6bit),
	.finish(finish) //bandera desalida
	);
	
	//decodificador para lasalida delos segundos de 6 bits a 4 y 4 bits
	TwoDigitDeco decoSeconds(
		.clk(clk),
		.number(seconds6bit),
		.decimals(secondsDecimals),
		.units(secondsUnits)
	);
	
	//decodificador para lasalida delos minutos de 6 bits a 4 y 4 bits
	TwoDigitDeco decoMinutes(
		.clk(clk),
		.number(minutes6bit),
		.decimals(minutesDecimals),
		.units(minutesUnits)
	);
		

endmodule
