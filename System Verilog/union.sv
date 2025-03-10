module union_a;
  
  typedef union{
    int a;
    logic [7:0] b;
  }course;
  initial begin
    course vlsi;
    
    vlsi.a='h25673490;
    $display("vlsi=%p",vlsi);
  end
  
endmodule

