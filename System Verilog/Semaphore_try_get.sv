module semaphore_ex;
  semaphore sema;
  initial begin
    sema = new(4);
    fork 
      display(2);
      display(3);
    join
  end
  
  task automatic display(int key);
    sema.try_get(key);
    $display($time,"\tcurrent simulation time, got %0d keys",key);
    sema.put(key);
    endtask
endmodule
