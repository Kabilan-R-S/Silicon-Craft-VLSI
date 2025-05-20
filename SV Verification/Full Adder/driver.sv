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
    
    for(i=0 ;i<8 ;++i )  begin 
      
      trans = new();
      gen2drv.get(trans);
      vif.a <= trans.a;
      vif.b <= trans.b;
      vif.c <= trans.c;
      #1
      trans.display("DATA FROM DRIVER");
      $display("time = %0t",$time);
    end
    
  endtask
  
  
endclass
