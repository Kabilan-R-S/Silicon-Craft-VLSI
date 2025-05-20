class generator;
  
  mailbox gen2drv;
  event main_frame;
  
  function new(mailbox gen2drv);
    
    this.gen2drv = gen2drv;
    
  endfunction
  
  task main();
    
    transaction trans;
    trans = new();
    
    repeat(10) begin
      
      trans.randomize();
      trans.display(" DATA FROM GENERATOR ");
      gen2drv.put(trans);
      
      @main_frame;
      
    end    
    
  endtask
  
endclass
