`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:14:41 09/13/2016 
// Design Name: 
// Module Name:    vgaColorConfig 
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
module vgaColorConfig(
    input wire [2:0] nextRGB,
    input wire video_on,
	 input wire [3:0] txt_on,
    output wire [2:0] rgb
    );
	 
	 //registro para asignar color de salida
	reg [2:0] rgbAux = 0;
	always@*
	begin
	//Mientras la señal no este en pantalla
		if(~video_on)
			rgbAux = "000";
		else	//Si alguno de los elementos que despliego esta en estos momentos encima
			if (txt_on[0] || txt_on[1]) 
				rgbAux = nextRGB; //asigno en color que proviene del modulo anterior
			else //Si no asigno cero 
				rgbAux = 3'b000;
	end
	assign rgb = rgbAux;


endmodule
