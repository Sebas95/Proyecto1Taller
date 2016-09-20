`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:11:42 09/05/2016 
// Design Name: 
// Module Name:    SixBitCounter 
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

//cronómetro para segundos
module SixBitCounter(
	
	input enable  ,  // enable for counter
 	input clk     ,  // clock Input
 	input reset   ,  // reset Input
	input forward , //forward input
	input increment, //pulso de incrementar
	input finish, //bandera de finalización del cronómetro
	
	output reg [5:0]out =0     // Output of the counter

 );
 
	reg [5:0]out2=0; //contador progresivo
	reg [5:0]out3=0;//contador regresivo

	
	

 //-------------Code Starts Here-------
 	always @(posedge clk)
	begin
		if (enable && forward )
			out3<=out2;
		// si se resetea se pone en cero
		if (reset) 	
				out3 <= 6'b0 ; 	
		if (enable && ~forward  )
		begin
			if (out3== 6'b0) //si llega a cero se pone en 59
				out3<= 6'b111011;
			else 
				out3 <= out3 - 1;
				
		end //end del if	
	end //end del always
	
	//-----------------------------------------------------
	
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
				out2 <= out2 + 1; //aumento el contador progrsivo 1 seg
		end
	end
	
	//--------------------------------------------------------------
	always @*
	begin
		if(reset) //se resetea
			out<=6'b0;
		else if(forward) //modo rprogresivo
			out<=out2;
		else if(~forward) //regresivo
			out<=out3; 
	end
	
	

	

	
endmodule


