class monitor;
  
  mailbox mon2scr;
  virtual intf vif;
 
  function new(virtual intf vif,mailbox mon2scr);
    
    this.vif = vif;
    this.mon2scr = mon2scr;
    
  endfunction
  
  task main();
    
    transaction trans;
    trans = new();
    
    for(int i = 0 ; i < 30 ; i++) begin
      
      @(posedge vif.clk or posedge vif.reset)
      trans.reset = vif.reset ;
      trans.up = vif.up ;
      trans.down = vif.down ;
      trans.count = vif.count ;
      
      mon2scr.put(trans);
      
      trans.display(" DATA FROM MONITOR ");
      
    end
    
  endtask
  
endclass
