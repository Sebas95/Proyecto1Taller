// Listing 14.10
module pong_top
   (
    input wire CLK_50MHZ, reset,
    output wire hsync, vsync,
    output wire [2:0] rgb
   );
	
	reg clk;
	always @(posedge CLK_50MHZ)
		clk <= ~clk;



   // signal declaration
	wire [6:0] t_reg;
   wire [9:0] pixel_x, pixel_y;
   wire video_on;
	//
   wire [3:0]text_on=0;
   wire [3:0] dig0, dig1;
   reg [1:0] ball_reg=0;

   //=======================================================
   // instantiation
   //=======================================================
   // instantiate video synchronization unit
   vga_sync vsync_unit
      (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
       .video_on(video_on), .p_tick(pixel_tick),
       .pixel_x(pixel_x), .pixel_y(pixel_y));
   // instantiate text module
   pong_text text_unit
      (.clk(clk),
       .pix_x(pixel_x), .pix_y(pixel_y),
       .dig0(dig0), .dig1(dig1), .ball(ball_reg),
       .timer(t_reg),.text_on(text_on), .text_rgb(rgb));
		 
  
endmodule
