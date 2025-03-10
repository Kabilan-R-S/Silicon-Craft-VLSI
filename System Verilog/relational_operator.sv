module OP;
 integer a, b, c, d;
 initial begin
		 a = 3; b = 2;
		 $display("3 > 2 = boolean %0d", a > b);
		 $display("3 < 2 = boolean %0d", a < b);
		 $display("3 >= 2 = boolean %0d", a >= b);
		 $display("3 <= 2 = boolean %0d", a <= b);
		 a = 1'bx; b=2; //OR a = 1'bz;
		 $display("\nRelational operation with 'x' results in 'x'\n");
		 $display(" 'x > 2 = boolean %0d", a > b);
		 $display(" 'x < 2 = boolean %0d", a < b);
		 $display(" 'x >= 2 = boolean %0d", a >= b);
		 $display(" 'x <= 2 = boolean %0d", a <= b);
		 $display("\n");
		 a = -1; b = -2;
		 $display("'-1 > -2 = boolean %0d", a > b);
		 $display("\n");
		 a=2; b=3;
		 $display("Following two are the same");
		 $display("a=2 b=3 : a < b - 1 = %0d", a < b-1);
		 $display("a=2 b=3 : a < (b - 1) = %0d", a < (b-1));
		 $display("\n");
		 $display("Following two are NOT the same");
		 $display("a=2 b=3 : b - (1 < a) = %0d", b - (1 < a));
		 $display("a=2 b=3 : b - 1 < a = %0d", b - 1 < a);
 end
endmodule

// # KERNEL: 3 > 2 = boolean 1
// # KERNEL: 3 < 2 = boolean 0
// # KERNEL: 3 >= 2 = boolean 1
// # KERNEL: 3 <= 2 = boolean 0
// # KERNEL: 
// # KERNEL: Relational operation with 'x' results in 'x'
// # KERNEL: 
// # KERNEL:  'x > 2 = boolean x
// # KERNEL:  'x < 2 = boolean x
// # KERNEL:  'x >= 2 = boolean x
// # KERNEL:  'x <= 2 = boolean x
// # KERNEL: 
// # KERNEL: '-1 > -2 = boolean 1
// # KERNEL: 
// # KERNEL: Following two are the same
// # KERNEL: a=2 b=3 : a < b - 1 = 0
// # KERNEL: a=2 b=3 : a < (b - 1) = 0
// # KERNEL: 
// # KERNEL: 
// # KERNEL: Following two are NOT the same
// # KERNEL: a=2 b=3 : b - (1 < a) = 2
// # KERNEL: a=2 b=3 : b - 1 < a = 0
