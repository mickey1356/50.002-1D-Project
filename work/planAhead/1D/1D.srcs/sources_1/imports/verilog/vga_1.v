module vga_1 (
    input clk,  // clock
    input rst,  // reset
    output reg[9:0] x,
    output reg[9:0] y,
    output valid,
    output hsync,
    output vsync,
    output reg newframe,
    output reg newline
  );
  
  reg clk25;
  
  assign hsync = x < (640 + 16) || x >= (640 + 16 + 96);
  assign vsync = y < (480 + 10) || y >= (480 + 10 + 2);
  assign valid = (x < 640) && (y < 480);
  
  always @(posedge clk) begin
    newframe <= 0;
    newline <= 0;
    if (rst) begin
      x <= 10'b0;
      y <= 10'b0;
      clk25 <= 1'b0;
      newframe <= 1;
      newline <= 1;
    end else begin
      clk25 <= ~clk25;
      if (clk25 == 1) begin
        if (x < 10'd799) begin
          x <= x + 1'b1;
        end else begin
          x <= 10'b0;
          newline <= 1;
          if (y < 10'd524) begin
            y <= y + 1'b1;
          end else begin
            y <= 10'b0;
            newframe <= 1;
          end
        end
      end
    end
  end
  
endmodule