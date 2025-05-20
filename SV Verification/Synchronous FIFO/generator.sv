class generator;
  
  mailbox gen2drv;
  virtual intf vif;
  event boom;
  
  function new(mailbox gen2drv,virtual intf vif);
    
    this.gen2drv = gen2drv;
    this.vif = vif;
    
  endfunction
  
  task main();
    
    transaction trans;
    trans = new();
    
    for(int i = 0 ; i < 100 ; i++) begin
      
      trans.count = vif.count ;
      trans.randomize();
      gen2drv.put(trans);
      $display("****************************************");
   //   trans.display("DATA FROM GENERATOR");
      
      @boom;
      
    end
    
  endtask
  
endclass
