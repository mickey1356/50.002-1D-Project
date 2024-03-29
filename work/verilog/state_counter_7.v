/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     DIV = 22
*/
module state_counter_7 (
    input clk,
    input rst,
    output reg out
  );
  
  localparam DIV = 5'h16;
  
  
  reg [21:0] M_counter_d, M_counter_q = 1'h0;
  
  always @* begin
    M_counter_d = M_counter_q;
    
    out = M_counter_q[21+0-:1];
    M_counter_d = M_counter_q + 1'h1;
    if (M_counter_q[21+0-:1] == 1'h1) begin
      M_counter_d[21+0-:1] = 1'h0;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
endmodule
