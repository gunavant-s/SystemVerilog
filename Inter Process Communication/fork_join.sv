// In initial begin block, the statements present are executed sequentially.
// The fork-join allows parallel exectution of multiple process. So using fork-join we called the tasks and made use of wait(<event>.triggered) within the tasks.

module tb;
  int data1,data2;
  event done, next;
  int i = 0;
  
  //generator
  task generator();
    for(i=0;i<10;i++) begin
      data1 = $urandom(); // 32 bit signed integer
      $display("Data sent : %0d",data1);
      #10;
      wait(next.triggered);
    end
    ->done; // after the sending of all values event is triggered
  endtask
  
  //driver
  task received();
    forever begin // runs till end of simulation
      #10;
      data2 = data1;
      $display("Data recieved : %0d",data2);
      ->next;
    end
  endtask
  
  //independent task which waits till end of process
  task wait_event();
    wait(done.triggered);
    $finish(); // after the trigger the whole simulation is finished
  endtask
	
  initial begin
    fork
      generator();
      received();
      wait_event();
    join
  end
  
endmodule

/*
# KERNEL: Data sent : 1594364839
# KERNEL: Data recieved : 1594364839
# KERNEL: Data sent : 1741242332
# KERNEL: Data recieved : 1741242332
# KERNEL: Data sent : -511861256
# KERNEL: Data recieved : -511861256
# KERNEL: Data sent : 1800621137
# KERNEL: Data recieved : 1800621137
# KERNEL: Data sent : 275669598
# KERNEL: Data recieved : 275669598
# KERNEL: Data sent : 1695691877
# KERNEL: Data recieved : 1695691877
# KERNEL: Data sent : 118069172
# KERNEL: Data recieved : 118069172
# KERNEL: Data sent : 491853261
# KERNEL: Data recieved : 491853261
# KERNEL: Data sent : -1463746589
# KERNEL: Data recieved : -1463746589
# KERNEL: Data sent : -1137303657
# KERNEL: Data recieved : -1137303657
*/
