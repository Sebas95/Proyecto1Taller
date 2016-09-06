`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:55:15 09/03/2016 
// Design Name: 
// Module Name:    Chip 
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
module Chip(
	input clk_100MHz,
   input wire start,
   input wire progressive,
   input wire regressive,
	output a, b, c, d, e, f, g, dp, wire finish, 
	output [3:0] an   // the 4 bit enable signal
);


	wire en;
	wire forward;
	wire rst=0;
	
	StateMachine Fsm(
		.clk(clk_100MHz),
		.start(start), 
		.progressive(progressive),
		.finish(finish),
		.regressive(regressive),
		.forward(forward),
		.enable(en)
	);

	Counter count(
		.enable(en), 
		.clk_100MHz(clk_100MHz), 
		.reset(rst), 
		.forward(forward),
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.e(e), 
		.f(f), 
		.g(g), 
		.dp(dp), //the individual LED output for the seven segment along with the digital point
		.an(an),   // the 4 bit enable signal
		.finish(finish)
	);


endmodule
