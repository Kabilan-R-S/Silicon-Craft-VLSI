module top_module (
    input clk,
    input in, 
    output out);
    
    wire d1;
    
    assign d1= in^out;
    
    always@(posedge clk)
       begin
           out<=d1;
       end
endmodule
