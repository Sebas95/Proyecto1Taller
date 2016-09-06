`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:03:01 09/05/2016 
// Design Name: 
// Module Name:    GlobalDebouncer 
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
module GlobalDebouncer(
	 input  	clk, reset,
    input 	progressive_btn,
    output  progressive,
	 input  	regressive_btn,
    output  regressive,
	 input  	start_btn,
    output  start
    );

	
	
	Debouncer db1 (
		.clk(clk), 
		.reset(reset), 
		.sw(start_btn), 
		.db(start)
	);
	
	Debouncer db2 (
		.clk(clk), 
		.reset(reset), 
		.sw(progressive_btn), 
		.db(progressive)
	);
	
	Debouncer db3 (
		.clk(clk), 
		.reset(reset), 
		.sw(regressive_btn), 
		.db(regressive)
	);

endmodule
