`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:05 09/19/2016 
// Design Name: 
// Module Name:    VGAPainterColorConfig 
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
module VGAPainterColorConfig(
	input wire [3:0] mDecimal ,
	input wire [3:0] mUnit,
	input wire [3:0] sUnit,
	input wire [3:0] sDecimal,
	input wire [2:0] actualState,
	input wire clk_100MHz,
	input wire finish,
   output wire hsync, vsync,
   output wire [2:0] rgb
	);
	wire [2:0] nextRGB;
	wire [2:0] txt_on;
	wire [2:0] video_on;
	
		//Instanciacion para la sincronización con vga
	 
	 	VgaPainter vgap (
		.mDecimal(mDecimal), 
		.mUnit(mUnit), 
		.sUnit(sUnit), 
		.sDecimal(sDecimal),  
		.clk_100MHz(clk_100MHz), 
		.actualState(actualState),
		.hsync(hsync), 
		.vsync(vsync), 
		.rgb(nextRGB),
		.video_on(video_on),
		.text_on(txt_on),
		.finish(stateFinish)
	);	
	
	//Instanciación para la configuración de colores
		vgaColorConfig colorConfg (
		.nextRGB(nextRGB), 
		.video_on(video_on), 
		.rgb(rgb),
		.txt_on(txt_on)
	);


endmodule
