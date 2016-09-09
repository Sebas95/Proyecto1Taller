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
   output wire hsync, vsync,
   output wire [2:0] rgb
   );
	
	wire [3:0] mDecimal ;
	wire [3:0] mUnit;
	wire [3:0] sUnit;
	wire [3:0] sDecimal;
	
	reg clk;
	always @(posedge CLK_50MHZ)
		clk <= ~clk;



   // signal declaration
	wire [6:0] t_reg;
   wire [9:0] pixel_x, pixel_y;
   wire video_on;
	//
   wire [3:0]text_on=0;
   wire [3:0] dig0, dig1;
   reg [1:0] ball_reg=0;
	wire [3:0]num; //number that is goint to be showed in the 7seg
   //=======================================================
   // instantiation
   //=======================================================
   // instantiate video synchronization unit
   vga_sync vsync_unit
      (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
       .video_on(video_on), .p_tick(pixel_tick),
       .pixel_x(pixel_x), .pixel_y(pixel_y));
   // instantiate text module
   pong_text text_unit
      (.clk(clk),
       .pix_x(pixel_x), .pix_y(pixel_y),
       .dig0(mDecimal), .dig1(mUnit),.dig2(sDecimal),.dig3(sUnit), .ball(ball_reg),
       .out(num),.text_on(text_on), .text_rgb(rgb));
	
	reg enable = 1;
		
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


endmodule
