class scoreboard;
  
  mailbox mon2scr;
  event boom;
  bit [3:0]count ;
 
  function new(mailbox mon2scr);
    
    this.mon2scr = mon2scr;
    
  endfunction
  
  task main();
    
    transaction trans;
    trans = new();
    
    for(int i = 0 ; i < 30 ; i++) begin
      
      mon2scr.get(trans);
      trans.display(" DATA FROM SCOREBOARD ");
      
      $display("%d",count);
      
      if(trans.reset) begin
        count = 0 ;        
      end
      else if(trans.up) begin
        count = count + 1;
      end
      else if(trans.down) begin
        count = count - 1;
      end
       
      if(count == trans.count) begin
         		$display("*****************************************");
         		$display("                PASS");
         		$display("*****************************************"); 
      end
      else begin
         		$display("*****************************************");
         		$display("                FAIL");
         		$display("*****************************************");
      end

      ->boom;
      
    end
    
  endtask
  
endclass
