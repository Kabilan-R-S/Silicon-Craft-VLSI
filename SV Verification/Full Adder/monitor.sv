class monitor;
  
  virtual intf vif;
  mailbox mon2scr;
  
  function new(virtual intf vif,mailbox mon2scr);
    
    this.vif = vif;
    this.mon2scr = mon2scr;
    
  endfunction
  
  task main();
    
    transaction trans;
    int i;
    
    for(i=0 ;i<8 ;++i ) #1 begin 
      
      trans = new();
      trans.a = vif.a;
      trans.b = vif.b;
      trans.c = vif.c;
      trans.sum = vif.sum;
      trans.carry = vif.carry;
      mon2scr.put(trans);
      trans.display("DATA FROM MONITOR");
      $display("time = %0t",$time);
    end
    
  endtask
  
endclass
