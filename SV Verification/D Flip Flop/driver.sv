class driver;
  
  mailbox gen2drv;
  virtual intf vif;
  
  function new(virtual intf vif , mailbox gen2drv);
    
    this.vif = vif ;
    this.gen2drv = gen2drv ;
    
  endfunction
  
  task main();
    
    transaction trans;
    trans = new();
    repeat(10) begin
      
      gen2drv.get(trans);
      vif.d = trans.d;
      vif.reset = trans.reset;
      trans.display("DATA FROM DRIVER");
      
    end
    
  endtask
  
endclass
