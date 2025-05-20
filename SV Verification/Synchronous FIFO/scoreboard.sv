class scoreboard;
  
  localparam int WIDTH = 4;
  localparam int ADDRESS = 4;
  
  mailbox mon2scr;
  event boom;
  int count;
  bit full,empty;
  
  bit [WIDTH-1:0] temp[$] ;
  bit [WIDTH-1:0] ch ;

  function new(mailbox mon2scr);
    
    this.mon2scr = mon2scr;
    
  endfunction
  
  task main();
    
    transaction trans;
    trans = new();
    
    for(int i = 0 ; i < 100 ; i++) begin
      
      mon2scr.get(trans);
      trans.display(" DATA FROM SCOREBOARD ");
      
      $display("scr data - full - %d empty - %d",full,empty);
      
      if(trans.w_en && !full) begin
        temp.push_back(trans.din);
        count = count + 1;
      end
      if( trans.r_en && !empty ) begin
        
        if (temp.size() > 0) begin
    		ch = temp.pop_front();
        	count = count - 1 ;
        end
  		else begin
    		ch = 0;
        end
        
      	if( trans.dout  == ch) begin
                
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
      
      full = (count == 4);
      empty = (count == 0);
      
      $display("mem =%p ",temp );

      ->boom;
      
    end
    
  endtask
  
endclass
