module halfadder (input a,b, output c,s);
	xor xor1(s,a,b);
	and and1(c,a,b);
endmodule

module fulladder (input a,b,cin, output sum,carryout);
	wire w1,w2,w3;
	
		halfadder halfadder1(.a(a),.b(b),.s(w1),.c(w2));
		halfadder halfadder2(.a(w1),.b(cin),.s(sum),.c(w3));
		or (carryout,w2,w3);
	
endmodule
