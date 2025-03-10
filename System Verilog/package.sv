package mypack;
	typedef struct {
		int i;
		int j;
		} 
		cstruct;
		function cstruct add (cstruct a,b);
			add.i = a.i + b.i;
			add.j = a.j + b.j;
		endfunction
	endpackage


import mypack::*;

module top (
	output cstruct cout,
	input cstruct a,b
	);

	assign cout = add(a,b);
	endmodule

	


