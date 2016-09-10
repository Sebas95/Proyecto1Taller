`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:38 09/09/2016 
// Design Name: 
// Module Name:    Temporizador 
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
module Temporizador(
	input wire CLK_50MHZ,
	input wire incrementSeconds,
	input wire incrementMinutes,
	input wire reset,
	input wire start,
	input wire stop,
	input wire delete,
   output wire hsync, vsync,
   output wire [2:0] rgb
   );
   
	wire enableCounter;
   wire resetTimer;	
	wire forward;
	wire [3:0] mDecimal ;
	wire [3:0] mUnit;
	wire [3:0] sUnit;
	wire [3:0] sDecimal;
	
	reg clk;
	//reg enable = 1;
	always @(posedge CLK_50MHZ)
		clk <= ~clk;


	//number that is goint to be showed in the 7seg
   //=======================================================
   // instantiation
   //=======================================================
	
	
	VgaPainter vgap (
		.mDecimal(mDecimal), 
		.mUnit(mUnit), 
		.sUnit(sUnit), 
		.sDecimal(sDecimal), 
		.clk(clk), 
		.hsync(hsync), 
		.vsync(vsync), 
		.rgb(rgb)
	);	

		
	 MinutesCounter mc (	
			.enable(enableCounter)  ,  // enable for counter
			.clk(CLK_50MHZ)     ,  // clock Input
			.reset(resetTimer)   ,  // reset Input
			.forward(forward), //forward input
			.incrementSeconds(incrementSeconds),
			.incrementMinutes(incrementMinutes),
			.secondsDecimals(sDecimal)     ,  // Output of the counter
			.secondsUnits(sUnit)     ,  // Output of the counter
			.minutesDecimals(mDecimal)     ,  // Output of the counter
			.minutesUnits(mUnit)     ,  // Output of the counter	
			.finish()
    );
	 


	TimerStateMachine tsm (
		.clk(CLK_50MHZ), 
		.start(start), 
		.stop(stop), 
		.delete(delete), 
		.segDemand(incrementSeconds), 
		.minDemand(incrementMinutes), 
		.enableCounter(enableCounter), 
		.forward(forward), 
		.resetTimer(resetTimer)
	);
endmodule
