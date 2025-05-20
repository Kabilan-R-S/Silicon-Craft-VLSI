class generator;
  
  mailbox gen2drv;
  event main_ev;
  
  function new(mailbox gen2drv);
    
    this.gen2drv = gen2drv;
    
  endfunction
  
  task main();
    
    transaction trans;
    trans = new();
      
    repeat(4) begin
        
      	trans.randomize();
        gen2drv.put(trans);
      	trans.display("DATA FROM GENERATOR");
        @main_ev;
       
      end   
    
    
  endtask
  
endclass
