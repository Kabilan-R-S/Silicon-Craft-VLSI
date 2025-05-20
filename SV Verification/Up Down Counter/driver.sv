class driver;
  
  mailbox gen2drv;
  virtual intf vif;
 
  function new(virtual intf vif,mailbox gen2drv);
    
    this.vif = vif;
    this.gen2drv = gen2drv;
    
  endfunction
  
  task main();
    
    transaction trans;
    trans = new();
    
    for(int i = 0 ; i < 30 ; i++) begin
      
      gen2drv.get(trans);
      vif.reset = trans.reset;
      vif.up = trans.up;
      vif.down = trans.down;
      
      trans.display(" DATA FROM DRIVER ");
      
    end
    
  endtask
  
endclass
