module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0]bb;
    assign bb = b^{32{sub}};
    wire w1;
    add16 a1(.a(a[15:0]),.b(bb[15:0]),.sum(sum[15:0]),.cin(sub),.cout(w1)      );
    add16 a2(.a(a[31:16]),.b(bb[31:16]),.sum(sum[31:16]),.cin(w1)      );
    

endmodule
