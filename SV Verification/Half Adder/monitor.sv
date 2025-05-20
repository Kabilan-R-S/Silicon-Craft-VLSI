class monitor;
  
  mailbox mon2scr;
  virtual intf vif;
  
  function new(mailbox mon2scr,virtual intf vif);
    
    this.mon2scr = mon2scr;
    this.vif = vif;
    
  endfunction
  
  task main();
    
    transaction trans;
    trans = new();
  
  
    repeat(4) begin 
       
        #1;
        trans.a = vif.a;
        trans.b = vif.b;
        trans.sum = vif.sum;
        trans.carry = vif.carry;
    
        mon2scr.put(trans);
        trans.display( " DATA FROM MONITOR " );
      
      end      
    
  endtask
  
  
endclass
