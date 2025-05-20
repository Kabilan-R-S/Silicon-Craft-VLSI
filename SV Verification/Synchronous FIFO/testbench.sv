`include "interface.sv"
`include "test.sv"

module testbench;
  
  intf intff();
  
  test tst(intff);
  
  initial begin
    intff.clk = 0;
    forever #2 intff.clk = ~intff.clk;
  end
  
   fifo uut(
     .clk(intff.clk),
     .reset(intff.reset),
     .r_en(intff.r_en),
     .w_en(intff.w_en),
     .din(intff.din),
     .dout(intff.dout),
     .full(intff.full),
     .empty(intff.empty),
     .count(intff.count),
     .r_ptr(intff.r_ptr),
     .w_ptr(intff.w_ptr)
    );
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
