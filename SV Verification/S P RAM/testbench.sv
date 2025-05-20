`include "interface.sv"
`include "test.sv"

module testbench;
  
  intf intff();
  
  test tst(intff);
  
  
  initial begin
    
    intff.clk = 0;
    forever #2 intff.clk = ~intff.clk;
    
  end
  
  sp_ram uut (
    .clk(intff.clk),
    .en(intff.en),
    .din(intff.din),
    .addr(intff.addr),
    .dout(intff.dout)
  );

  
endmodule
