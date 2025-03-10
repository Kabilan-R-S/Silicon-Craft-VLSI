class parent_class;
	bit[31:0]addr;
endclass : parent_class

class child_class extends parent_class;
	bit[31:0]data;
endclass

module class_inheritance1;

	initial begin
		child_class c1= new();
		c1.addr=(1);
		c1.data=(10);
		$display("---------------------------------------------",);
		$display("value of addr=%0d \t value of data=%0d ",c1.addr,c1.data);
		$display("---------------------------------------------",);
	end
endmodule
