`include "interface.sv"
`include "test.sv"

module testbench;
  
  intf intff();
  
  test tst(intff);
  
  halfadder uut(
    .a(intff.a),
    .b(intff.b),
    .sum(intff.sum),
    .carry(intff.carry)
  );
  
endmodule
