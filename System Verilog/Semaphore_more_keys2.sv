module semaphore_more;
  semaphore sema;
  initial begin
    sema = new(1);
    fork
      display(1);
      display(2);
      display(3);
    join
  end
  
  task automatic display(int key);
    sema.get(key);
    $display($time,"\t Current simulation time\t got %0d keys",key);
    #30;
    sema.put(key+1);
  endtask
endmodule
