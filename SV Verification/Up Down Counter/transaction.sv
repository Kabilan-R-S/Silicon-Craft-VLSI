 class transaction;
  
  rand bit [2:0]mem ; 
  static bit first_time = 1;
   
  bit reset;
  bit up;
  bit down;
  bit [3:0]count;
   
  constraint mem_dist {
    mem dist {
      3'b100 := 5,   
      [3'b001:3'b111] := 95  
    };
  }
   
   constraint readwrite {
     mem[1] != mem[0] ;
   } 
   
  
  function void post_randomize();
    
    if(first_time) begin
      	reset = 1;
      	up    = 0;
    	down  = 0;
      	first_time = 0;    
    end  
    else begin
    	reset = 0 ;
    	up = mem[1];
    	down = mem[0];
    end
    
  endfunction
  
  function display( string name );
    
    $display("%s", name);
    $display( " reset = %d , up = %d , down = %d , count = %d " , reset , up , down , count);
    
  endfunction
  
  
  
endclass
