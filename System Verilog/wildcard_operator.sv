module OP;
 logic [15:0] A1, A2;
 initial begin
	 A1='hff; A2='hxx;
	 $display("A1='hff A2='hxx : A1==? A2 = boolean %0d",
	 A1==? A2);
	 $display("A1='hff A2='hxx : A1!=? A2 = boolean %0d",
	 A1!=? A2);
	 A1='hxx; A2='hff;
	 $display("A1='hxx A2='hff : A1==? A2 = boolean %0d",
	 A1==? A2);
	 $display("A1='hxx A2='hff : A1!=? A2 = boolean %0d",
	 A1!=? A2);
 end
endmodule

// # KERNEL: A1='hff A2='hxx : A1==? A2 = boolean 1
// # KERNEL: A1='hff A2='hxx : A1!=? A2 = boolean 0
// # KERNEL: A1='hxx A2='hff : A1==? A2 = boolean x
// # KERNEL: A1='hxx A2='hff : A1!=? A2 = boolean x
