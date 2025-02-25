module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0]w1,w2,w3;
    my_dff8 dff1(.clk(clk),.d(d),.q(w1));
    my_dff8 dff2(.clk(clk),.d(w1),.q(w2));
    my_dff8 dff3(.clk(clk),.d(w2),.q(w3));
    
    
    assign q = sel[1] ? (sel[0] ? w3 : w2) : (sel[0] ? w1 : d);


endmodule
