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
    
    for(int i = 0 ; i < 100 ; i++) begin
      
      @(posedge vif.clk)
      trans.reset  <= vif.reset ;
      trans.w_en   <= vif.w_en ;
      trans.r_en   <= vif.r_en ;
      trans.din    <= vif.din ;
      trans.dout   <= vif.dout ;
      trans.full   <= vif.full ;
      trans.empty  <= vif.empty ;
      trans.count  <= vif.count ;
      trans.r_ptr  <= vif.r_ptr;
      trans.w_ptr  <= vif.w_ptr;
      #1;
      mon2scr.put(trans);
      
   //   trans.display(" DATA FROM MONITOR ");
      
    end
    
  endtask
  
endclass
