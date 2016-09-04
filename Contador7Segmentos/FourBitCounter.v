`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:55:07 09/03/2016 
// Design Name: 
// Module Name:    FourBitCounter 
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
module FourBitCounter(
	out     ,  // Output of the counter
	enable  ,  // enable for counter
 	clk     ,  // clock Input
 	reset   ,  // reset Input
	forward , //forward input
	finish
 );
 //----------Output Ports--------------
   output [3:0] out;
	output finish;  
 //------------Input Ports--------------
   input enable, clk, reset, forward;
 //------------Internal Variables--------
   reg [3:0] out;
	reg finish;
 //-------------Code Starts Here-------
 	always @(posedge clk)
 	if (reset) // si se resetea se pone en cero
	begin
   		out <= 4'b0 ; 
			finish<=0;
 	end 
	
	else if (out== 4'b0 && ~forward &&enable ) //si llega a cero se pone en 15
	begin
		out<= 4'b1111;
		finish<=1;
	end
	
	else if (out== 4'b1111 && forward && enable) //si llega a 15 se pone en cero
	begin
		out<= 4'b0000;
		finish<=1;
	end
	
	else if (enable) 
	begin
	finish<=0;
		if (forward)
			out <= out + 1;
		else out <= out - 1;
 	end
	

endmodule

