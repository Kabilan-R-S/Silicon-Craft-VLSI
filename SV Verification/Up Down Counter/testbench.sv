`include "interface.sv"
`include "test.sv"

module testbench;
  
  intf intff();
  
  test tst(intff);
  
  initial begin
    intff.clk = 0;
    forever #2 intff.clk = ~intff.clk;
  end
  
   updown uut(
     .clk(intff.clk),
     .reset(intff.reset),
     .up(intff.up),
     .down(intff.down),
     .count(intff.count)
    );
  

endmodule
