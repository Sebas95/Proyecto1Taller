`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:50 08/31/2016 
// Design Name: 
// Module Name:    FrecuencyDivider 
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
module FrecuencyDivider(
   input clk_100MHz,
	output clk_1Hz,
	reg counter[15]
	);

	always @(posedge clk_100MHz)
	begin

		
		if(counter==16'd10000)
		begin
			counter<=16'd0;
		end
		
		
		
		if (counter<16'd5000)
		begin
			clk_1Hz<=1'b0;
		end
		
		
		if(counter < 16'd5000 )
		begin
			clk_1Hz<=1'b1;
		end
		
		
		counter<=counter + 1;
	end

	assign clk_1Hz = counter[15];

endmodule
