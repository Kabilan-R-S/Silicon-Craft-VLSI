module halfadder_tb;
    reg a, b;
    wire s, c;

    halfadder uut (.a(a), .b(b), .s(s), .c(c));

    initial begin
        $dumpfile("halfadder_waveform.vcd");
        $dumpvars(0, halfadder_tb);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

    initial begin
        $monitor("Time: %0t | a = %b, b = %b | s = %b, c = %b", $time, a, b, s, c);
    end
endmodule
