/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module tile_led_5 (
    input clk,
    input rst,
    input [2:0] type,
    output reg led_p,
    output reg led_g
  );
  
  
  
  wire [1-1:0] M_lf_out;
  led_flasher_6 lf (
    .clk(clk),
    .rst(rst),
    .out(M_lf_out)
  );
  wire [1-1:0] M_lf2_out;
  led_flasher_7 lf2 (
    .clk(clk),
    .rst(rst),
    .out(M_lf2_out)
  );
  
  always @* begin
    
    case (type)
      1'h0: begin
        led_p = 1'h0;
        led_g = 1'h1;
      end
      1'h1: begin
        led_p = 1'h0;
        led_g = M_lf_out;
      end
      2'h2: begin
        led_p = 1'h0;
        led_g = 1'h0;
      end
      2'h3: begin
        led_p = 1'h1;
        led_g = 1'h0;
      end
      3'h4: begin
        led_p = M_lf2_out;
        led_g = 1'h0;
      end
      default: begin
        led_p = 1'h0;
        led_g = 1'h0;
      end
    endcase
  end
endmodule
