class scoreboard;
  
  mailbox mon2scr;
  event main_ev;
  
  function new(mailbox mon2scr);
  	
    this.mon2scr = mon2scr;
    
  endfunction
  
  task main();
    
    transaction trans;
    trans = new();
    
    repeat(4) begin
    
    	mon2scr.get(trans);
      trans.display("scoreboard");
    	
      if( ( (trans.a^trans.b) == trans.sum ) && ((trans.a & trans.b) == trans.carry) ) begin
         $display("*****************************************");
         $display("                PASS");
         $display("*****************************************");
      end
      else begin
         $display("*****************************************");
         $display("                FAIL");
         $display("*****************************************");
      end
      
      ->main_ev;
      
    end
    
  endtask
  
endclass
