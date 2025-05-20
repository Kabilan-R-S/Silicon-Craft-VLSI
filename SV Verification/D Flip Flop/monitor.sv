class monitor;
  
  mailbox mon2scr;
  virtual intf vif;
  
  function new(virtual intf vif , mailbox mon2scr);
    
    this.mon2scr = mon2scr;
    this.vif = vif;    
    
  endfunction
  
  task main();
    
    transaction trans;
    trans = new();
    repeat(10) begin
      
      #3;
      trans.d = vif.d;
      trans.q = vif.q;
      trans.reset = vif.reset;
      mon2scr.put(trans);
      trans.display("DATA FROM MONITOR");
    end    
    
  endtask
  
endclass
