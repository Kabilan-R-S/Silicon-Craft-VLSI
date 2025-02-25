module top_module (input x, input y, output z);
    wire z1,z2,z3,z4,z5,z6;
    a isnt1(x,y,z1);
    b inst1(x,y,z2);
    or (z6,z1,z2);
    a isnt2(x,y,z3);
    b inst2(x,y,z4);
    and(z5,z3,z4);
    assign z = (z6 ^ z5);
    
endmodule
	module a (input x, input y, output z);
    assign z =( x ^ y) & x;
	endmodule
	module b ( input x, input y, output z );
    assign z = (x ~^ y);
	endmodule
