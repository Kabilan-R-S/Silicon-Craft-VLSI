class driver;
  
  mailbox gen2drv;
  virtual intf vif;
  
  function new(mailbox gen2drv,virtual intf vif);
    
    this.vif = vif;
    this.gen2drv = gen2drv;
    
  endfunction
  
  task main();
    
    transaction trans;
    trans = new();
    
      repeat(4) begin
       
        gen2drv.get(trans);
        vif.a = trans.a;
        vif.b = trans.b;
        trans.display( " DATA FROM DRIVER " );

       
      end      
    
  endtask
  
  
endclass
