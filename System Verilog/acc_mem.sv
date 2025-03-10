module top();
	class animal;
		int age;
		string name;

		function new();
		endfunction

		task print();
			$display("animal: %s", name);
		endtask
	endclass

	animal a_h;


	initial begin
		a_h=new();
		a_h.name="fluffy";
		a_h.print();
	end
endmodule
	
