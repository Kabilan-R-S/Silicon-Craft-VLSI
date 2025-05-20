 class transaction;
  
  // #(parameter WIDTH = 8,ADDRESS = 8 )
  
  localparam int WIDTH = 4;
  localparam int ADDRESS = 4;
  static bit first_time = 1;
   
  rand bit [1:0]mem;
  rand bit [WIDTH-1:0]din_mem;
  
  bit clk;
  bit reset;
  bit r_en;
  bit w_en;
  bit [WIDTH-1:0]din;
  bit [WIDTH-1:0]dout;
  bit full;
  bit empty;
  bit [$clog2(ADDRESS+1):0]count;
  bit [$clog2(ADDRESS)-1:0]r_ptr,w_ptr;

  
   constraint fullread{
    if(count == 4)
       mem[1] ==1;
   }  
   
  constraint mem_dist {
    mem dist {
      3'b100 := 5,   
      [3'b001:3'b111] := 95  
    };
  }
   
   constraint readwrite {
     mem[1] != mem[0] ;
   }
   
   constraint not0din {
     din_mem inside { [1:20] };
   }
  
   
  
  function void post_randomize();
    
    if(first_time) begin
      	reset = 1;
      	r_en  = 0;
    	w_en  = 0;
      	first_time = 0;
      
    end
    
    else begin
    	reset = 0 ;
    	r_en = mem[1];
    	w_en = mem[0];
    end
      
    din = din_mem;
    
  endfunction
  
  function display( string name );
    
    $display("%s", name);
    $display( " rst =%d r =%d w =%d cnt = %d rpt =%d wpt =%d " , reset , r_en , w_en , count , r_ptr , w_ptr);
    $display( " din = %d , dout = %d , full = %d , empty = %d" , din , dout , full , empty);
    
  endfunction
  
  
  
endclass
