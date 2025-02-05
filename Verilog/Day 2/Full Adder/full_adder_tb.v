module fulladder_tb;
	reg a;
	reg b;
	reg cin;
	wire sum;
	wire carryout;
		fulladder  uut(.a(a),.b(b),.cin(cin),.sum(sum),.carryout(carryout));
			initial begin
				$dumpfile("fulladder_tb.vcd");
				$dumpvars(0);
				
				a = 0; b = 0; cin = 0; #10; 
				a = 0; b = 0; cin = 1; #10; 
				a = 0; b = 1; cin = 0; #10; 
				a = 0; b = 1; cin = 1; #10; 
				a = 1; b = 0; cin = 0; #10; 
				a = 1; b = 0; cin = 1; #10; 
				a = 1; b = 1; cin = 0; #10; 
				a = 1; b = 1; cin = 1; #10; 
        $finish; 
    end
endmodule	
