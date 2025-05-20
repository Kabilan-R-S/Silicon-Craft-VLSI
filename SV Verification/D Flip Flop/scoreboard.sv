class scoreboard;
  
  mailbox mon2scr; 
  event main_frame;
  
  function new(mailbox mon2scr);
    
    this.mon2scr = mon2scr;
    
  endfunction
  
  task main();
    
    transaction trans;
    trans = new();
    repeat(10) begin
      
      mon2scr.get(trans);
      
      if( (( trans.reset == 1 )&(trans.q  == 0 )) | (  (trans.reset == 0)&(trans.d == trans.q  ) ) ) begin
         $display("*****************************************");
         $display("                PASS");
         $display("*****************************************");        
      end
      else begin
         $display("*****************************************");
         $display("                FAIL");
         $display("*****************************************");        
      end
      
      ->main_frame;
      
    end
    
  endtask
  
  
endclass
