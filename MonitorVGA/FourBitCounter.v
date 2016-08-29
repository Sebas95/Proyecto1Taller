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
 	reset      // reset Input
 );
 //----------Output Ports--------------
   output [5:0] out; 
 //------------Input Ports--------------
   input enable, clk, reset;
 //------------Internal Variables--------
   reg [5:0] out;
 //-------------Code Starts Here-------
 	always @(posedge clk)
 	if (reset) // si se resetea se pone en cero
	begin
   		out <= 6'b0 ; 
 	end 
	
	else if (out== 6'b0) //
	begin
		out<= 6'b111011;
	end
	
	else if (enable) 
	begin
  		out <= out - 1;
 	end
	

endmodule
