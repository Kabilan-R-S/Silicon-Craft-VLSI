class generator;
  
  mailbox gen2drv;
  event boom;
  
  function new(mailbox gen2drv);
    
    this.gen2drv = gen2drv;
    
  endfunction
  
  task main();
    
    transaction trans;
    trans = new();
    
    for(int i = 0 ; i < 30 ; i++) begin
      
      trans.randomize();
      gen2drv.put(trans);
      $display("****************************************");
      trans.display("DATA FROM GENERATOR");
      
      @boom;
      
    end
    
  endtask
  
endclass
