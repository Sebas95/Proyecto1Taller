`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:29:02 09/11/2016 
// Design Name: 
// Module Name:    TotalDebouncer 
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
module TotalDebouncer(
		input button0,
		input button1,
		input button2,
		input button3,
		input button4,
		input clk,
		input reset,
		
		output db0,
		output db1,
		output db2,
		output db3,
		output db4
    );



	Debouncer debouncer0(
		.clk(clk), 
		.reset(reset),
		.sw(button0),
		.db(db0)
	);
	
		Debouncer debouncer1(
		.clk(clk), 
		.reset(reset),
		.sw(button1),
		.db(db1)
	);
		Debouncer debouncer2(
		.clk(clk), 
		.reset(reset),
		.sw(button2),
		.db(db2)
	);
		Debouncer debouncer3(
		.clk(clk), 
		.reset(reset),
		.sw(button3),
		.db(db3)
	);
		Debouncer debouncer4(
		.clk(clk), 
		.reset(reset),
		.sw(button4),
		.db(db4)
	);

endmodule
