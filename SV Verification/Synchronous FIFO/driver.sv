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
    
    for(int i = 0 ; i < 100 ; i++) begin
      
      gen2drv.get(trans);
      vif.reset = trans.reset;
      vif.w_en = trans.w_en;
      vif.r_en = trans.r_en;
      vif.din = trans.din;
      
    //  trans.display(" DATA FROM DRIVER ");
      
    end
    
  endtask
  
endclass
