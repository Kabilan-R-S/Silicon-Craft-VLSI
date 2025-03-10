//welcome to system verilog
module class_top();

class pci;
	logic [3:0] command;
	logic [31:0] address;
	logic [31:0] data;
	logic [3:0] cycletype;

	function new();
		command=0;
		address=0;
		cycletype=4'hf;
		data=64'bz;
			$display("pci init: data=%h command=%b addr=%h cycletype=%b",data,command,address,cycletype);
	endfunction

	task pciwritecycle (clk);
		begin
		command = $urandom;
		address=$urandom;
		cycletype=$urandom;
		$display("pci write cycle: clk=%b data=%h command=%b addr=%h cycletype=%b",clk,data,command,address,cycletype);
		end
	endtask
endclass

bit clock;

pci pci1;

	initial begin
		pci1=new();
	end

	initial begin
		clock =0;
		forever begin
			#10; clock=~clock;
		end
	end

always @(posedge clock) begin
	pci1.data = $urandom;
	pci1.pciwritecycle(clock);
end

initial #60 $finish(2);

endmodule

