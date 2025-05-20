class driver;
  
  mailbox gen2drv;
  virtual intf vif;
  
  function new(virtual intf vif ,mailbox gen2drv);
    
    this.vif = vif;
    this.gen2drv = gen2drv;
    
  endfunction
  
  task main();
    
    transaction trans;
    int i;
    trans = new(); 
    repeat(10)  begin 
      

      gen2drv.get(trans);
      vif.en <= trans.en ;
      vif.din <= trans.din;
      vif.addr <= trans.addr;
      
      trans.display("DATA FROM DRIVER");
      $display("time = %0t",$time);

    end
    
  endtask
  
  
endclass
