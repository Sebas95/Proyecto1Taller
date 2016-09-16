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
	input wire CLK_100MHZ,
	input wire incrementSeconds,
	input wire incrementMinutes,
	input wire reset,
	input wire start,
	input wire stop,
	input wire [2:0] sw,
	input wire delete,
   output wire hsync, vsync,
   output wire [2:0] rgb,
	output finish
   );
  
	//ground
	reg gnd = 0;
	//declaration of wires
	wire enableCounter;
   wire resetTimer;	
	wire forward;
	wire video_on;
	wire [1:0] txt_on;
	wire [2:0] nextRGB;	
	wire [2:0] actualState;
	wire [3:0] mDecimal ;
	wire [3:0] mUnit;
	wire [3:0] sUnit;
	wire [3:0] sDecimal;
	// debounced inputs
	wire start_db;
	wire stop_db;
	wire delete_db;
	wire incrementSeconds_db;
	wire incrementMinutes_db;
	
	wire incrementSeg;
	wire incrementMin;
	
	

	//-------------------Debouncer-----------------------------
	TotalDebouncer dbounce (	
		.button0(start),
		.button1(stop),
		.button2(delete),
		.button3(incrementSeconds),
		.button4(incrementMinutes),
		.clk(CLK_100MHZ),
		.reset(gnd),
		.db0(start_db),
		.db1(stop_db),
		.db2(delete_db),
		.db3(incrementSeconds_db),
		.db4(incrementMinutes_db)
	);
	



	//number that is goint to be showed in the 7seg
   //=======================================================
   // instantiation
   //=======================================================
	
	
	
	
	VgaPainter vgap (
		.mDecimal(mDecimal), 
		.mUnit(mUnit), 
		.sUnit(sUnit), 
		.sDecimal(sDecimal),  
		.clk_100MHz(CLK_100MHZ), 
		.actualState(actualState),
		.hsync(hsync), 
		.vsync(vsync), 
		.rgb(nextRGB),
		.video_on(video_on),
		.text_on(txt_on),
		.finish(stateFinish)
	);	
	
		
	 MinutesCounter mc (	
			.enable(enableCounter)  ,  // enable for counter
			.clk(CLK_100MHZ)     ,  // clock Input
			.reset(resetTimer)   ,  // reset Input
			.forward(forward), //forward input
			.incrementSeconds(incrementSeg),
			.incrementMinutes(incrementMin),
			.secondsDecimals(sDecimal)     ,  // Output of the counter
			.secondsUnits(sUnit)     ,  // Output of the counter
			.minutesDecimals(mDecimal)     ,  // Output of the counter
			.minutesUnits(mUnit)     ,  // Output of the counter	
			.finish(finish)
    );
	 


	TimerStateMachine tsm (
		.clk(CLK_100MHZ), 
		.start(start_db), 
		.stop(stop_db), 
		.delete(delete_db), 
		.segDemand(incrementSeconds_db), 
		.minDemand(incrementMinutes_db), 
		.finish(finish),
		.enableCounter(enableCounter), 
		.forward(forward), 
		.resetTimer(resetTimer),
		.actualState(actualState),
		.incrementSeg(incrementSeg),
		.incrementMin(incrementMin),
		.stateFinish(stateFinish)
	);
	
	
	vgaColorConfig colorConfg (
		.nextRGB(nextRGB), 
		.video_on(video_on), 
		.rgb(rgb),
		.txt_on(txt_on)
	);
	

endmodule
