module class_staic;
  
  class mem;
    	
    static int a;
    
    function void display();
      $display("mem a = %h",a); 
    endfunction
     
    function growmore();
        
      	a= a+1;
    endfunction
    
  endclass
  
  
  mem grow;
  mem grow1;
  
  	
  initial begin
    
    grow = new();
    grow1=new();
    
    grow.a=1;
    grow.growmore();
    grow.growmore();
    grow.growmore();
    grow.growmore();
    grow.display();
    grow1.display();
    
    
   end
  
endmodule
