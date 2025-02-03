module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    assign out_and=in[1]&in[2]&in[3]&in[0];
    assign out_or=in[1]|in[2]|in[3]|in[0];
    assign out_xor=in[1]^in[2]^in[3]^in[0];

endmodule
