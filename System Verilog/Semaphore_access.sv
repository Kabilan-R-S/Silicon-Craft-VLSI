module semaphore_access;
  semaphore sema;
  initial begin
    sema=new(4);
    fork
      display(); //process 1
      display(); //process 2
      display(); //process 3
    join
  end
  
  task automatic display();
    sema.get(2);
    $display($time,"\tCurrent simulation time");
    #30
    sema.put(1);
  endtask
endmodule
