// Listing 14.6
module textPainter
   (
    input wire  clk, 
    input wire  [3:0] dig0, dig1, dig2, dig3,
	 input wire [2:0] actualState,
    input wire  [9:0] pix_x, pix_y,
    output wire [3:0] text_on,
    output reg  [2:0] text_rgb,
	 output wire [10:0] rom_addr,
	 input wire [7:0] font_word
   );

   // signal declaration
   reg  [6:0] char_addr, char_addr_s, char_addr_st;
   reg  [3:0] row_addr;
   wire [3:0] row_addr_s, row_addr_st;
   reg  [2:0] bit_addr;
   wire [2:0] bit_addr_s, bit_addr_st;
   wire font_bit, score_on;
	reg state_on = 0;
	reg [2:0] nextRGB;

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
   // State region
   //  - display two-digit score, ball on top left
   //  - scale to 16-by-32 font
   //  - line 1, 16 chars: "Score:DD Ball:D"
   //-------------------------------------------
   assign row_addr_st = pix_y[4:1];
   assign bit_addr_st = pix_x[3:1];
   always @*
	begin
		state_on = (pix_y[9:5]==1) && (pix_x[9:4]<16);
		if(actualState == 3'b000)
			begin
				case (pix_x[7:4])
					4'h0: char_addr_st = 7'h45; // E
					4'h1: char_addr_st = 7'h53; // s
					4'h2: char_addr_st = 7'h54; // t
					4'h3: char_addr_st = 7'h41; // a
					4'h4: char_addr_st = 7'h44; // d
					4'h5: char_addr_st = 7'h4f; // o
					4'h6: char_addr_st = 7'h3a; // :
					4'h7: char_addr_st = 7'h49; // I
					4'h8: char_addr_st = 7'h6e; // n
					4'h9: char_addr_st = 7'h69; // i
					4'ha: char_addr_st = 7'h63; // c
					4'hb: char_addr_st = 7'h69; // i
					4'hc: char_addr_st = 7'h61; // a
					4'hd: char_addr_st = 7'h6c; // l
					4'he: char_addr_st = 7'h00; // 
					4'hf: char_addr_st = 7'h00;
					default : char_addr_st = 7'h00;
				endcase				
			end
			
		else if(actualState == 3'b001)		
			begin
			 state_on = (pix_y[9:5]==1) && (pix_x[9:4]<22);
				case (pix_x[8:4])
					5'h0: char_addr_st = 7'h45; // E
					5'h1: char_addr_st = 7'h53; // s
					5'h2: char_addr_st = 7'h54; // t
					5'h3: char_addr_st = 7'h41; // a
					5'h4: char_addr_st = 7'h44; // d
					5'h5: char_addr_st = 7'h4f; // o
					5'h6: char_addr_st = 7'h3a; // :
					5'h7: char_addr_st = 7'h45; // E
					5'h8: char_addr_st = 7'h73; // s
					5'h9: char_addr_st = 7'h74; // t
					5'ha: char_addr_st = 7'h61; // a
					5'hb: char_addr_st = 7'h62; // b
					5'hc: char_addr_st = 7'h6c; // l
					5'hd: char_addr_st = 7'h65; // e
					5'he: char_addr_st = 7'h63; // c
					5'hf: char_addr_st = 7'h69; // i
					5'h10: char_addr_st = 7'h65; //e
					5'h11: char_addr_st = 7'h6e; //n
					5'h12: char_addr_st = 7'h64; //d
					5'h13: char_addr_st = 7'h6f; //o
					default : char_addr_st = 7'h00;
				endcase				
			end		
			
		else if(actualState == 3'b010)
			begin
				case (pix_x[7:4])
					4'h0: char_addr_st = 7'h45; // E
					4'h1: char_addr_st = 7'h53; // s
					4'h2: char_addr_st = 7'h54; // t
					4'h3: char_addr_st = 7'h41; // a
					4'h4: char_addr_st = 7'h44; // d
					4'h5: char_addr_st = 7'h4f; // o
					4'h6: char_addr_st = 7'h3a; // :
					4'h7: char_addr_st = 7'h43; // C
					4'h8: char_addr_st = 7'h6f; // o
					4'h9: char_addr_st = 7'h6e; // n
					4'ha: char_addr_st = 7'h74; // t
					4'hb: char_addr_st = 7'h61; // a
					4'hc: char_addr_st = 7'h6e; // n
					4'hd: char_addr_st = 7'h64; // d
					4'he: char_addr_st = 7'h6f; // 0
					4'hf: char_addr_st = 7'h00; //
					default : char_addr_st = 7'h00;
				endcase				
			end	

		else if(actualState == 3'b011)
			begin
				case (pix_x[7:4])
					4'h0: char_addr_st = 7'h45; // E
					4'h1: char_addr_st = 7'h53; // s
					4'h2: char_addr_st = 7'h54; // t
					4'h3: char_addr_st = 7'h41; // a
					4'h4: char_addr_st = 7'h44; // d
					4'h5: char_addr_st = 7'h4f; // o
					4'h6: char_addr_st = 7'h3a; // :
					4'h7: char_addr_st = 7'h44; // D
					4'h8: char_addr_st = 7'h65; // e
					4'h9: char_addr_st = 7'h74; // t
					4'ha: char_addr_st = 7'h65; // e
					4'hb: char_addr_st = 7'h6e; // n
					4'hc: char_addr_st = 7'h69; // i
					4'hd: char_addr_st = 7'h64; // d
					4'he: char_addr_st = 7'h6f; // 0 
					4'hf: char_addr_st = 7'h00; //
					default : char_addr_st = 7'h00;
				endcase				
			end				
	end	
   //-------------------------------------------
   // mux for font ROM addresses and rgb
   //-------------------------------------------
   always @*
   begin
      nextRGB = 3'b110;  // background, yellow
      if (score_on)
         begin
            char_addr = char_addr_s;
            row_addr = row_addr_s;
            bit_addr = bit_addr_s;
            if (font_bit)
               nextRGB = 3'b001;
         end
      else if (state_on)
         begin
            char_addr = char_addr_st;
            row_addr = row_addr_st;
            bit_addr = bit_addr_st;
            if (font_bit)
               nextRGB = 3'b111;
         end		

   end
	
	always@(posedge clk)
		begin
			text_rgb <= nextRGB;						
		end

   assign text_on = {score_on,state_on};
   //-------------------------------------------
   // font rom interface
   //-------------------------------------------
   assign rom_addr = {char_addr, row_addr};
   assign font_bit = font_word[~bit_addr];

endmodule
