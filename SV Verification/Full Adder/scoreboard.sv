class scoreboard;
  
  mailbox mon2scr;
  
  function new(mailbox mon2scr);
    
    this.mon2scr = mon2scr;
    
  endfunction
  
  task main();
    
    transaction trans;
    int i;
    
    for(i=0 ;i<8 ;++i )  begin 
      
      trans = new();
      mon2scr.get(trans);
      $display("RESULT FROM SCOREBOARD");
      
      if(
      
        ( (trans.a^trans.b^trans.c) == trans.sum )&&
        ( ((trans.a&trans.b)|(trans.b&trans.c)|(trans.a&trans.c)) == trans.carry )
        
      ) $display("PASS");
   //   $display("time = %0t",$time);
      else
        $display("FAIL");
   //   $display("time = %0t",$time);
    end
    
  endtask
  
endclass
