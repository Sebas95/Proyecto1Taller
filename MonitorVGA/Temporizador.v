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
	input wire forward,
	input wire incrementSeconds,
	input wire incrementMinutes,
	input wire reset,
	input wire start,
	input wire stop,
	input wire delete,
   output wire hsync, vsync,
   output wire [2:0] rgb
   );
	
	wire [3:0] mDecimal ;
	wire [3:0] mUnit;
	wire [3:0] sUnit;
	wire [3:0] sDecimal;
	
	reg clk;
	reg enable = 1;
	always @(posedge CLK_50MHZ)
		clk <= ~clk;

   // signal declaration
   wire [9:0] pixel_x, pixel_y;
   wire video_on;
	//
   wire [3:0]text_on=0;
   wire [3:0] dig0, dig1;
	wire [3:0]num;
   wire [10:0] rom_addr;
	wire [7:0] font_word;

	//number that is goint to be showed in the 7seg
   //=======================================================
   // instantiation
   //=======================================================
	
   font_rom font_unit
      (.clk(clk), .addr(rom_addr), .data(font_word));	
		
   // instantiate video synchronization unit
   vga_sync vsync_unit
      (.clk(clk), 
		.reset(reset), 
		.hsync(hsync), 
		.vsync(vsync),
      .video_on(video_on), 
		.p_tick(pixel_tick),
      .pixel_x(pixel_x),
		.pixel_y(pixel_y)		
	);
	
   // instantiate text module
   vgaWritter text_unit
      (.clk(clk),
       .pix_x(pixel_x), 
		 .pix_y(pixel_y),
       .dig0(mDecimal), 
		 .dig1(mUnit),
		 .dig2(sDecimal),
		 .dig3(sUnit), 
		 .text_on(text_on),
		 .text_rgb(rgb),
		 .rom_addr(rom_addr),
		 .font_word(font_word)
	);
		
	 MinutesCounter mc (	
			.enable(enable)  ,  // enable for counter
			.clk(CLK_50MHZ)     ,  // clock Input
			.reset(reset)   ,  // reset Input
			.forward(forward), //forward input
			.incrementSeconds(incrementSeconds),
			.incrementMinutes(incrementMinutes),
			.secondsDecimals(sDecimal)     ,  // Output of the counter
			.secondsUnits(sUnit)     ,  // Output of the counter
			.minutesDecimals(mDecimal)     ,  // Output of the counter
			.minutesUnits(mUnit)     ,  // Output of the counter	
			.finish()
    );
	 
	 wire enableCounter;
	 wire resetTimer;
/*
	TimerStateMachine tsm (
		.clk(clk), 
		.start(start), 
		.stop(stop), 
		.delete(delete), 
		.segDemand(incrementSeconds), 
		.minDemand(incrementMinutes), 
		.enableCounter(enableCounter), 
		.forward(forward), 
		.resetTimer(resetTimer)
	);
*/
endmodule
