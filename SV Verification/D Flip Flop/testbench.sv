`include "interface.sv"
`include "test.sv"

module testbench;
  
  intf intff();
  
  test tst(intff);
  
  dflipflop uut (
    .d(intff.d),
    .q(intff.q),
    .reset(intff.reset)
  );
  
  
endmodule
