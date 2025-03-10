
class my_class ;

	int x;
	

	task set(integer i);
		x=i;
		$display("x = %d",x);
	endtask : set

	function int get();
		return x;
	endfunction 

endclass 
	

module class_declaration;
	my_class cls_2;
initial begin
	my_class cls_1=new();
	cls_2 = new();
	cls_2.set(15);
	cls_1.set(12);
	#5;
	$display("\t class1 :: value of cls1=%0d ",cls_1.get());
	$display("\t class2 :: value of cls2=%0d ",cls_2.get());
end

endmodule
