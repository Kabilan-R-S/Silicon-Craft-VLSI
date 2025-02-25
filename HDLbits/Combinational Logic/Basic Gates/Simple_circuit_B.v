module top_module ( input x, input y, output z );
  assign z = ~(x^y);  //exnor function in the test bench
endmodule
