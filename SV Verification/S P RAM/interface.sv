interface intf #(parameter WIDTH=4,ADDR=2) ;
  
  logic clk;
  logic en;
  logic [WIDTH-1:0]din;
  logic [ADDR-1:0]addr;
  logic [WIDTH-1:0]dout;
  
    
endinterface
