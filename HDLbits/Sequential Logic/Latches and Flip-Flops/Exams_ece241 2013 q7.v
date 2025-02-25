module top_module (
    input clk,
    input j,
    input k,
    output Q); 

    wire [2:0] sel;
    always@(posedge clk)
        Q=(j&~Q)|(~k&Q);
    
    
endmodule
