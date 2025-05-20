`include "interface.sv"
`include "test.sv"

module testbench;
  
 // intf.dut intff();
  intf intff();
  
  test tst(intff);
  
//   fulladder uut(
//     .a(intff.a),
//     .b(intff.b),
//     .c(intff.c),
//     .sum(intff.sum),
//     .carry(intff.carry)
//   );
  
  fulladder uut(
    intff
  );
  
endmodule
