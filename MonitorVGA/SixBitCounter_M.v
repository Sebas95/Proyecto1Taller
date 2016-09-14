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
module SixBitCounter_M(
  
	input enable  ,  // enable for counter
 	input clk_1Hz    ,  // clock Input
 	input reset   ,  // reset Input
	input forward , //forward input
	input increment,
	input [5:0]seconds,
	output reg [5:0]out =0,      // Output of the counter
	output reg finish =0
 );

	reg [5:0]out2=0;
	reg [5:0]out3=0;


	  
	always @(posedge clk_1Hz)
	begin 
	// si se resetea se pone en cero
		if (reset) 	
			out3 <= 6'b0 ; 
		if (enable)
		begin
			if (forward)
				out3<=out2;
				
			if(seconds==6'b1 && out3== 6'b0 && ~forward)
				finish<= 1;
				
			else if(seconds==6'b0 && ~forward)
			begin
				finish <= 0;
				if ( out3 != 6'b0 )
					out3 <= out3 - 1;
			end
			else  // posedge
			begin
				finish <=0;
			end
		end
	end		
	//----------------------------------------------------------------
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
				out2 <= out2 + 1;
		end
	end
	
	//--------------------------------------------------------------
	always @*
	begin
			if(reset)
				out<=6'b0;
			else if(forward)
				out<=out2;
			else if (~forward)
				out<=out3;
	end
	
	

	
	
	
endmodule


