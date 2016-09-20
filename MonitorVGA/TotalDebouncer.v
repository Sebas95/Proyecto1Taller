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
		//botones con entradas con efecto rebote
		input button0,
		input button1,
		input button2,
		input button3,
		input button4,
		//reloj de la nexys
		input clk,
		input reset,
		
		//salidas de los botones sin efecto rebote
		output db0,
		output db1,
		output db2,
		output db3,
		output db4
    );


	// debpuncer para señal 0
	Debouncer debouncer0(
		.clk(clk), 
		.reset(reset),
		.sw(button0),
		.db(db0)
	);
	// debpuncer para señal 1
		Debouncer debouncer1(
		.clk(clk), 
		.reset(reset),
		.sw(button1),
		.db(db1)
	);
	// debpuncer para señal 2
		Debouncer debouncer2(
		.clk(clk), 
		.reset(reset),
		.sw(button2),
		.db(db2)
	);
	// debpuncer para señal 3
		Debouncer debouncer3(
		.clk(clk), 
		.reset(reset),
		.sw(button3),
		.db(db3)
	);
	// debpuncer para señal 4
		Debouncer debouncer4(
		.clk(clk), 
		.reset(reset),
		.sw(button4),
		.db(db4)
	);

endmodule
