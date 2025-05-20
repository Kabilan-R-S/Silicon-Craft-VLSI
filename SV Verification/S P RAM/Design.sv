`timescale 1ns / 1ps

module sp_ram 
  #(parameter WIDTH=4,ADDR=2)(
    input clk,
    input en,
    input [WIDTH-1:0] din,
    input [ADDR-1:0] addr,
    output reg [WIDTH-1:0] dout
 );
    reg [WIDTH-1:0] mem [(2**ADDR)-1:0];
    
  always @(posedge clk) begin
      if(en)
            mem[addr]<=din;
        else
            dout <= mem[addr];
    end
endmodule
