`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"


class environment;
  
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scr;
  
  event main_ev;
  
  mailbox gen2drv;
  mailbox mon2scr;  
  
  virtual intf vif;
  
  function new(virtual intf vif);
    
    this.vif = vif;
    
    gen2drv = new();
    mon2scr = new();
    
    gen = new(gen2drv);
    drv = new(gen2drv,vif);
    mon = new(mon2scr,vif);
    scr = new(mon2scr);
    
    gen.main_ev = main_ev;
    scr.main_ev = main_ev;
    
    
  endfunction
  
  task test_run();
    
    fork 
      
      gen.main();
      drv.main();
      mon.main();
      scr.main();      
      
    join
    
  endtask  
  
endclass
