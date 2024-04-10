// Semaphore allows control over two threads accessing same resource. 
// It is a built-in class in SystemVerilog used for synchronization which is a container that contains a fixed number of keys.
// For example, the same memory location is accessed by two different cores.
// To avoid unexpected results when cores try to write or read from the same memory location, a semaphore can be used.
// 1. new() method - <semaphore> = new(<number_of_keys>); create the semaphore with a specified number of keys. 
// The new() method returns semaphore handle or null if it is not created.
// 2. get() method - <semaphore>.get(<number_of_keys>); used to obtain a specified number of keys. By default, one key is returned if no value is specified.
// The get() method is a blocking method and execution continues after successful key or keys are obtained.
// 3. put() method - <semaphore>.put(<number_of_keys>); used to return a specified number of keys to the semaphore container or bucket.
// 4. try_get() method - <semaphore>.try_get(<number_of_keys>); tries to obtain a specified number of keys. 
// The get() method is blocking whereas try_get() is a non-blocking method. The execution is not blocked even if the number of keys is not available. 
// The try_get() function returns 1 if keys are available otherwise, it returns 0 if no keys are available,

class first; 
  rand int data;
  constraint data_c {data < 10; data > 0;}
  
endclass

class second;
  rand int data;
  constraint data_c {data < 10; data > 0;}
  
endclass

class main;
  semaphore sem; //handler for semaphore created. Default is null
  first f;
  second s;
  int data; 
  
  task send_first();
    sem.get(1); // Obtains key-1 
    
    for(int i=0;i<10;i++) begin
      f.randomize();
      data = f.data;
      $display("First access Semaphore and Data sent : %0d",f.data); //This Loop executes, 2nd task can't run even if used under fork-join. As this uses semphore ke.y
      #10;
    end
    
    sem.put(1); // Returns key to semaphore container. Can be used by another task
    $display("End of task-1. Returned key to the semaphore container");
  endtask
  
  task send_second();
    sem.get(1); //This task obtains key.
    
    for(int i=0;i<10;i++) begin
      s.randomize();
      data = s.data;
      $display("Second access Semaphore and Data sent : %0d",s.data);
      #10;
    end
    
    sem.put(1); //Key is returned
    $display("End of task-2. Returned key to the semaphore container");
  endtask
  
  task run();
    sem = new(1); // The key-1 is created.
    f = new(); //Object of class first
    s = new(); //Object of class second
    fork
      send_first();
      send_second(); //Even though these should execute parallely, the second task only begins after obtaining the key-1
    join
    $display("End of all tasks");
  endtask
endclass


module tb;
  main m;
  
  initial begin
    m = new(); // Main class
    m.run();
  end
  
  initial begin
    #240;
    $finish();
  end
endmodule

/*
# KERNEL: First access Semaphore and Data sent : 4
# KERNEL: First access Semaphore and Data sent : 6
# KERNEL: First access Semaphore and Data sent : 1
# KERNEL: First access Semaphore and Data sent : 9
# KERNEL: First access Semaphore and Data sent : 2
# KERNEL: First access Semaphore and Data sent : 2
# KERNEL: First access Semaphore and Data sent : 3
# KERNEL: First access Semaphore and Data sent : 6
# KERNEL: First access Semaphore and Data sent : 1
# KERNEL: First access Semaphore and Data sent : 3
# KERNEL: End of task-1. Returned key to the semaphore container
# KERNEL: Second access Semaphore and Data sent : 5
# KERNEL: Second access Semaphore and Data sent : 3
# KERNEL: Second access Semaphore and Data sent : 3
# KERNEL: Second access Semaphore and Data sent : 3
# KERNEL: Second access Semaphore and Data sent : 8
# KERNEL: Second access Semaphore and Data sent : 7
# KERNEL: Second access Semaphore and Data sent : 9
# KERNEL: Second access Semaphore and Data sent : 8
# KERNEL: Second access Semaphore and Data sent : 5
# KERNEL: Second access Semaphore and Data sent : 8
# KERNEL: End of task-2. Returned key to the semaphore container
# KERNEL: End of all tasks
*/
