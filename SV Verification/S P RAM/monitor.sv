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
    trans = new();
    repeat(10) begin 
        
      #3;
      trans.en = vif.en;
      trans.din = vif.din;
      trans.addr = vif.addr;
      trans.dout = vif.dout;
      
      mon2scr.put(trans);
      
      trans.display("DATA FROM MONITOR");
      $display("time = %0t",$time);
      #1;

    end
    
  endtask
  
endclass
