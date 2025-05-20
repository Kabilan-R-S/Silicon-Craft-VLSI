class transaction;
  
  randc bit  [1:0]ab;
  
  bit a;
  bit b;
  bit sum;
  bit carry;
  
  function void post_randomize();
    a = ab[1];
    b = ab[0];
    
  endfunction
  
  function void display(string name);
    
    $display(name);
    $display( " a = %0b , b = %0b , sum = %b , carry = %b " , a, b, sum, carry  );
    
    
  endfunction
  
  
endclass
