`timescale 1ns / 1ps

module fifo
  #(parameter WIDTH = 4,ADDRESS = 4 )
(
  	input clk,
    input reset,
    input r_en,
    input w_en,
    input [WIDTH-1:0]din,
    output reg [WIDTH-1:0]dout,
    output full,empty,
  	output reg [$clog2(ADDRESS+1):0]count,
  	output reg [$clog2(ADDRESS)-1:0]r_ptr,w_ptr
    );
  
    
    reg [WIDTH-1:0] mem [ADDRESS-1:0];
    
    
    
    always @(posedge clk) begin
        if(reset) begin
            r_ptr <= 0;
            w_ptr <= 0;
            dout <= 0 ;
            count <= 0;
        end
    end
    
    always @(posedge clk) begin
        if(w_en & ~full) begin
            mem[w_ptr] <=din;
            w_ptr <= w_ptr + 1 ;
          	count <= count + 1 ;
        end
    end
    
    always @(posedge clk) begin
        if(r_en & ~empty) begin
            dout  <=mem[r_ptr];
            r_ptr <= r_ptr + 1;
            count <= count - 1;
            
        end
    end
    

   assign full = count == 4;
   assign empty = count == 0;
  
  
endmodule


