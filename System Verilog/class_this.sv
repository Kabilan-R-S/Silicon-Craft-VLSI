class packet;

	bit [31:0] addr;
	bit [31:0] data;
	bit write;
	string pkt_type;

	function new (bit [31:0] addr,data,bit write,string pkt_type);
		this.addr = addr;
		this.data = data;
		this.write = write;
		this.pkt_type=pkt_type;
	endfunction 

	function void display();

		$display("------------------------------------------------");
		$display("\t addr=%0d",addr);
		$display("\t data=%0d",data);
		$display("\t write=%0d",write);
		$display("\t pkt_type=%0s",pkt_type);
		$display("------------------------------------------------");
	endfunction 

endclass 

	module class_this;
		packet pkt;		//object
	initial
	begin
		pkt = new(32'h10,32'hFF,1,"Good_Packet"); //handle is the name of the new
		pkt.display();
	end
	
	endmodule

	//OUTPUT

// # ------------------------------------------------
// #        addr=16
// #        data=255
// #        write=1
// #        pkt_type=Good_Packet
// # ------------------------------------------------
