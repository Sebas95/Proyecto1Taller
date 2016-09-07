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
module SixBitCounter(
	
	input enable  ,  // enable for counter
 	input clk     ,  // clock Input
 	input reset   ,  // reset Input
	input forward , //forward input
	input increment,
	
	output reg [5:0]out =0    ,  // Output of the counter
	output reg finish
 );
 
	reg [5:0]out2=0;

	
	

 //-------------Code Starts Here-------
 	always @(posedge clk)
	begin
		if(enable && forward)
			out<=out2;
			
		if (enable && ~forward)
		begin
		// si se resetea se pone en cero
			if (reset) 	
				out <= 6'b0 ; 
			
			else if (out== 6'b0) //si llega a cero se pone en 59
			begin
				finish<=1;
				out<= 6'b111011;
			end
			
			else 
			begin
				finish<=0;
				out <= out - 1;
			end
			
		
			
		end //end del if
	end //end del always
	
	//-----------------------------------------------------
	always @(posedge increment)
	begin
		if(enable && ~forward)
			out2<=6'b0;
	
		if(enable && forward)
		begin
			// si se resetea se pone en cero
			if (reset) 
					out2 <= 6'b0 ; 		
			
			//si llega a 59 se pone en cero			
			else if (out2== 6'b111011) 
				out2<= 6'b000000;
				
			else
				out2 <= out2 + 1;
		end
	end
	
	//--------------------------------------------------------------

		
	

endmodule


