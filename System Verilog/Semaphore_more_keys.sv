module semaphore_ex;
  semaphore sema;
  initial begin
    sema = new(4);
    fork
      display(2);
      display(3);
      display(2);
      display(1);
    join
  end
  
  task automatic display(int key);
    sema.get(key);
    $display($time,"\tcurrent simulation time, got %0d keys",key);
    #30;
    sema.put(key);
  endtask
endmodule
