module tagged_union_example;
	 logic [31:0] x;
	 typedef union tagged {
	 int a;
	 byte b;
	 bit [15:0] c;
	 } data;
	 data d1;

 initial begin
	 d1 = tagged a 32'hffff_ffff; //write to 'a'
	 d1 = tagged b 8'h10; //write to 'b'
	 //read from 'b' – since 'b' was written last, this is OK
	 x = d1.b;
	 $display("x = %h",x);
 end
 endmodule

 
// Simulation log:
// x = 00000010
//  V C S S i m u l a t i o n R e p o r t
