class generator;
  
  mailbox gen2drv;
  
  function new(mailbox gen2drv);
    
    this.gen2drv = gen2drv;
    
  endfunction
  
  task main();
    
    transaction trans;
    int i;
    
    for(i=0 ;i<8 ;++i )  begin 
      
      trans = new();
      trans.randomize();
      gen2drv.put(trans);
      #1
      trans.display("DATA FROM GENERATOR");
      $display("time = %0t",$time);
      
    end
    
  endtask
  
endclass
