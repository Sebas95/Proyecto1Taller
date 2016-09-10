// Listing 14.6
module vgaWritter
   (
    input wire  clk, 
    input wire  [3:0] dig0, dig1, dig2, dig3,
    input wire  [9:0] pix_x, pix_y,
    output wire [3:0] text_on,
    output reg  [2:0] text_rgb,
	 output wire [10:0] rom_addr,
	 input wire [7:0] font_word
   );

   // signal declaration
   reg  [6:0] char_addr, char_addr_s, char_addr_l,
             char_addr_r, char_addr_o;
   reg  [3:0] row_addr;
   wire [3:0] row_addr_s, row_addr_l, row_addr_r, row_addr_o;
   reg  [2:0] bit_addr;
   wire [2:0] bit_addr_s, bit_addr_l,bit_addr_r, bit_addr_o;
   wire font_bit, score_on, logo_on, rule_on, over_on;
   wire [7:0] rule_rom_addr;

   //-------------------------------------------
   // score region
   //  - display two-digit score, ball on top left
   //  - scale to 16-by-32 font
   //  - line 1, 16 chars: "Score:DD Ball:D"
   //-------------------------------------------
   assign score_on = (pix_y[9:5]==7) && (pix_x[9:4]<32  && pix_x[9:4]>15);
   assign row_addr_s = pix_y[4:1];
   assign bit_addr_s = pix_x[3:1];
   always @*
      case (pix_x[7:4])	
			4'h0: char_addr_s = 7'h00; //		
			4'h1: char_addr_s = 7'h00; //			
         4'h2: char_addr_s = {3'b011,dig0};  // 
         4'h3: char_addr_s = {3'b011,dig1}; // 			
         4'h4: char_addr_s = 7'h3a; // :
         4'h5: char_addr_s = {3'b011,dig2}; 
         4'h6: char_addr_s = {3'b011,dig3}; 
			4'h7: char_addr_s = 7'h00; //
			4'h8: char_addr_s = 7'h00; //
			4'h9: char_addr_s = 7'h00; //
			4'ha: char_addr_s = 7'h00; //
			4'hb: char_addr_s = 7'h00; //
			4'hc: char_addr_s = 7'h00; //
			4'hd: char_addr_s = 7'h00; //
			4'he: char_addr_s = 7'h00; //
			4'hf: char_addr_s = 7'h00; //
			default : char_addr_s = 7'h00;			
      endcase
   //-------------------------------------------
   // mux for font ROM addresses and rgb
   //-------------------------------------------
   always @*
   begin
      text_rgb = 3'b110;  // background, yellow
      if (score_on)
         begin
            char_addr = char_addr_s;
            row_addr = row_addr_s;
            bit_addr = bit_addr_s;
            if (font_bit)
               text_rgb = 3'b001;
         end
     /* else // game over
         begin
            char_addr = char_addr_o;
            row_addr = row_addr_o;
            bit_addr = bit_addr_o;
            if (font_bit)
               text_rgb = 3'b001;
         end*/
   end

   assign text_on = {score_on};
   //-------------------------------------------
   // font rom interface
   //-------------------------------------------
   assign rom_addr = {char_addr, row_addr};
   assign font_bit = font_word[~bit_addr];

endmodule
