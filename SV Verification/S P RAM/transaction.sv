
class transaction;
  
  localparam WIDTH=4 ;
  localparam ADDR=2 ;
  
  rand bit en;
  rand bit [WIDTH-1:0]din;
  randc bit [ADDR-1:0]addr;
  bit  [WIDTH-1:0] dout;

  function void display(string name);
    $display("%s", name);
    $display("time = %0t, en=%0b, din=%0d, addr=%0d, dout=%0d ",$time, en, din, addr, dout);
    
  endfunction
  
endclass
