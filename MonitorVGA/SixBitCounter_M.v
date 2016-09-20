`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:29:40 09/11/2016 
// Design Name: 
// Module Name:    SixBitCounter_M 
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


//cronómetro para minutos
module SixBitCounter_M(
  
	input enable  ,  // enable for counter
 	input clk_1Hz    ,  // clock Input
 	input reset   ,  // reset Input
	input forward , //forward input
	input increment,
	input [5:0]seconds,  //recibe los segundos actuales como entrada
	output reg [5:0]out =0,      // Output of the counter
	output reg finish =0 //bandera de finalizado
 );

	reg [5:0]out2=0; //contador progresivo
	reg [5:0]out3=0; //contado regresivo


	  
	always @(posedge clk_1Hz)
	begin 
	// si se resetea se pone en cero
		if (reset) 	
			out3 <= 6'b0 ; 
		//si esta habilitado
		if (enable)
		begin
			if (forward)
				out3<=out2; //se asigna el numero seteado
				
			if(seconds==6'b1 && out3== 6'b0 && ~forward)
				finish<= 1; //bandera de final
			//si llegó a cero segundos regresicamente	
			else if(seconds==6'b0 && ~forward)
			begin
				finish <= 0; //no ha terminado
				if ( out3 != 6'b0 ) //si los minutos no son cero
					out3 <= out3 - 1; //decrementa un minuto
			end
			else  // posedge
			begin
				finish <=0;//no ha terminado
			end
		end
	end		
	//----------------------------------------------------------------
	//cada puslo de increment
	always @(posedge increment)
	begin
		if(~forward )
			out2<= 6'b0;
		if(enable && forward )
		begin
			// si se resetea se pone en cero
			if (reset ) 
					out2 <= 6'b0 ; 		
			
			//si llega a 59 se pone en cero			
			else if (out2== 6'b111011) 
				out2<= 6'b000000;
				
			else
				out2 <= out2 + 1; //se aumentan los minutos
		end
	end
	
	//--------------------------------------------------------------
	always @*
	begin
			//si hay reset pone la salida en cero
			if(reset)
				out<=6'b0; 
			else if(forward) //si progresivopone la salida progresiva
				out<=out2;
			else if (~forward) //si regresivo asigna variable regresiva
				out<=out3;
	end
	
	

	
	
	
endmodule


