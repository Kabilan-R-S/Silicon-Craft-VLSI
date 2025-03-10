module SU;

 struct packed {bit [7:0] intr; //packed struct
 				logic [23:0] addr;
 				} SUR;


	initial begin
		 SUR.intr = 'hFF;
		 $display($stime,,, "SUR = %h",SUR);
		 $display($stime,,, "SUR Intr = %h",SUR.intr);

		 //Assign by position
		 SUR = '{'h00,'hFF_FF_FF};
		 $display($stime,,, "SUR = %h",SUR);

		 //Assign by name
		 SUR = '{intr:'h01, addr:'hf0f0f0};
		 $display($stime,,, "SUR = %h",SUR);

		 //Assign default
		 SUR = '{default:'h123456};
		 $display($stime,,, "SUR = %h",SUR);

		 //Assign default
		 SUR = '{default:'h78};
		 $display($stime,,, "SUR = %h",SUR);

		 SUR = 0;
		 SUR = SUR+'h12; //Arithmetic operation.
		 // packed structure can be used as a vector
		 $display($stime,,, "SUR = %h",SUR);

	 end
 endmodule

// # KERNEL:          0  SUR = ffxxxxxx
// # KERNEL:          0  SUR Intr = ff
// # KERNEL:          0  SUR = 00ffffff
// # KERNEL:          0  SUR = 01f0f0f0
// # KERNEL:          0  SUR = 56123456
// # KERNEL:          0  SUR = 78000078
// # KERNEL:          0  SUR = 00000012
