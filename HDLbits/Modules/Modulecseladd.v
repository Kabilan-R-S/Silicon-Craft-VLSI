module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire w1;
    wire [15:0]w2,w3;
    add16 a1 (.a(a[15:0]),.b(b[15:0]) ,.sum(sum[15:0]),.cout(w1)    );
    add16 a2 (.a(a[31:16]),.b(b[31:16]),.sum(w2),.cin(1'b0)    );
    add16 a3 (.a(a[31:16]),.b(b[31:16]),.sum(w3),.cin(1'b1)    );
    
    wire y ;
    
    assign sum[31:16] = (w1 ? w3 :w2 );
    
    
    
    

endmodule
