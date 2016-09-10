`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:57 09/10/2016 
// Design Name: 
// Module Name:    VgaPainter 
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
module VgaPainter(
	input wire [3:0] mDecimal ,
	input wire [3:0] mUnit,
	input wire [3:0] sUnit,
	input wire [3:0] sDecimal,
	input wire clk,
   output wire hsync, vsync,
   output wire [2:0] rgb
    );

   wire [9:0] pixel_x, pixel_y;
   wire video_on;
	//
   wire [3:0]  text_on=0;
   wire [10:0] rom_addr;
	wire [7:0]  font_word;


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


endmodule
