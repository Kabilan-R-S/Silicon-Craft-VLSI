module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (~c&~b) | (c&d&a) | (~a&b&c) | (c&~d&~a) | (~a&b&~d);
endmodule
