module dflipflop(input d , reset , output reg q);
  
  bit clk;
  
  initial begin
    
    forever begin
      
      clk = 0;
      #2 clk = ~clk;
      
    end
    
  end
  
  always @( posedge clk ) begin
    if(reset) begin
      q <= 0;
    end
    else begin
      q <= d;
    end
    
    
  end
  
  
endmodule

