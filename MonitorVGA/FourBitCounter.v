`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:59:52 08/29/2016 
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
 );
 //----------Output Ports--------------
   output [3:0] out; 
 //------------Input Ports--------------
   input enable, clk, reset, forward;
 //------------Internal Variables--------
   reg [3:0] out;
 //-------------Code Starts Here-------
 	always @(posedge clk)
 	if (reset) // si se resetea se pone en cero
	begin
   		out <= 4'b0 ; 
 	end 
	
	else if (out== 4'b0 && ~forward ) //si llega a cero se pone en 15
	begin
		out<= 4'b1111;
	end
	
	else if (out== 4'b1111 && forward) //si llega a 15 se pone en cero
	begin
		out<= 4'b0000;
	end
	
	else if (enable) 
	begin
		if (forward)
			out <= out + 1;
		else out <= out - 1;
 	end
	

endmodule
