class scoreboard;
  
  localparam WIDTH=4 ;
  localparam ADDR=2 ;
  
  mailbox mon2scr;
  event main_ev;
  
  bit [WIDTH-1:0] temp [(2**ADDR)-1:0];
  
  function new(mailbox mon2scr);
    
    this.mon2scr = mon2scr;
    
  endfunction
  
  task main();
    
    transaction trans;
    int i;
    trans = new();
    repeat(10)  begin 
      
      
      mon2scr.get(trans);
    
      if( trans.en == 1 ) begin
        temp[trans.addr] = trans.din;
        trans.display("DATA FROM SCOREBOARD");
        
      end
      else begin
        
        if( temp[trans.addr] == trans.dout ) begin
          $display("*****************************************");
          $display("                PASS");
          $display("*****************************************");
        end
        else begin
          $display("*****************************************");
          $display("                FAIL");
          $display("*****************************************");
        end 
      end 
      
      
      ->main_ev;
    end

  endtask
  
endclass
