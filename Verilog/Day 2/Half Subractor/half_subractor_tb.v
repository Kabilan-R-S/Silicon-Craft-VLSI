module halfsubtractor_tb;
    reg a, b;
    wire d, B;
    
    halfsubtractor uut(.a(a), .b(b), .d(d), .B(B));
    
    integer i;
    initial begin
        $dumpfile("halfsubtractor_tb.vcd");
        $dumpvars(0, halfsubtractor_tb);
        $monitor("%4t | a=%b | b=%b | d=%b | B=%b", $time, a, b, d, B);
        
        for(i = 0; i < 4; i = i + 1) begin
            {a, b} = i;
            #10;
        end
        #1 $finish;
    end
endmodule
