
class transaction;
  
  rand bit [2:0] abc; 
  bit a, b, c;
  bit sum, carry;
  
  static int inputdata = 0;
  
  constraint unique_data{ abc == inputdata ; } 
  
  function void post_randomize();
    a = abc[2]; 
	b = abc[1]; 
	c = abc[0];
   inputdata = inputdata + 1;
  endfunction

  function void display(string name);
    $display("%s", name);
    $display("time = %0t, a=%0b, b=%0b, c=%0b, sum=%0b, carry=%0b",$time, a, b, c, sum, carry);
    
  endfunction
  
endclass
