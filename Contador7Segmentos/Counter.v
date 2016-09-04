`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:55:45 09/03/2016 
// Design Name: 
// Module Name:    Counter 
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
module Counter(
	input enable, clk_100MHz, reset, forward,
	output a, b, c, d, e, f, g, dp, //the individual LED output for the seven segment along with the digital point
	output [3:0] an,
   output finish   // the 4 bit enable signal
   );
	
	wire clk_1Hz;
	wire [3:0]num; //number that is goint to be showed in the 7seg
	
	FrecuencyDivider frecuency_divider(
		.clk_100MHz(clk_100MHz),
		.clk_1Hz(clk_1Hz),
		.counter()
	);
	FourBitCounter counter(
		.out(num)     ,  // Output of the counter
		.enable(enable)  ,  // enable for counter
		.clk(clk_1Hz)     ,  // clock Input
		.reset(reset)   ,  // reset Input
		.forward(forward), //forward input
		.finish(finish)
	);
	SevenSegDeco deco(
		.clock(clk_100MHz), 
		.reset(reset),
		.in(num),  //the 4 inputs for each display
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.e(e), 
		.f(f), 
		.g(g), 
		.dp(dp), //the individual LED output for the seven segment along with the digital point
		.an(an)   // the 4 bit enable signal
	);

endmodule
