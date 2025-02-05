module halfsubtractor(input a, b, output d, B);
    wire w1;
    assign d = a ^ b;
    assign w1 = ~a;
    assign B = w1 & b;
endmodule
