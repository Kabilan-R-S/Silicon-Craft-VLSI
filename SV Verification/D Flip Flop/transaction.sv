class transaction;
  
  randc bit [1:0]dr;
    bit d; 
  	bit q;
  	bit reset;
  
  function post_randomize();
    
    d = dr[1];
    reset = dr[0];
    
  endfunction
  
  function void display(string name);
    
    $display("%s",name);
    $display("d = %d , q = %d , reset = %d", d,q,reset);
    
  endfunction
  
  
endclass
