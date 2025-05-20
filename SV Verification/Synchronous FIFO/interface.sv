interface intf#(parameter WIDTH = 4,ADDRESS = 4 );
  
  logic clk;
  logic reset;
  logic r_en;
  logic w_en;
  logic [WIDTH-1:0]din;
  logic [WIDTH-1:0]dout;
  logic full;
  logic empty;
  logic [$clog2(ADDRESS+1):0]count;
  logic [$clog2(ADDRESS)-1:0]r_ptr,w_ptr;
  
  
endinterface
