module tb;
 
  int data1,data2;
  event done;
  
  int i = 0;
  
  //generator
  initial begin
    for(i=0;i<10;i++) begin
      data1 = $urandom(); // 32 bit signed integer
      $display("Data sent : %0d",data1);
      #10;
    end
    ->done; // after the sending of all values event is triggered
  end
  
  //driver
  initial begin
    forever begin // runs till end of simulation
      #10;
      data2 = data1;
      $display("Data recieved : %0d",data2);
    end
  end
  
  //independent task which waits till end of process
  initial begin
    wait(done.triggered);
    $finish(); // after the trigger the whole simulation is finished
  end
  
      
  
endmodule

/*
# KERNEL: Data sent : -1866196019
# KERNEL: Data sent : 1497363586
# KERNEL: Data recieved : 1497363586
# KERNEL: Data sent : -323839875
# KERNEL: Data recieved : -323839875
# KERNEL: Data sent : 484274802
# KERNEL: Data recieved : 484274802
# KERNEL: Data sent : 1697558877
# KERNEL: Data recieved : 1697558877
# KERNEL: Data sent : -1150633903
# KERNEL: Data recieved : -1150633903
# KERNEL: Data sent : -1621255588
# KERNEL: Data recieved : -1621255588
# KERNEL: Data sent : 200096136
# KERNEL: Data recieved : 200096136
# KERNEL: Data sent : -1608882576
# KERNEL: Data recieved : -1608882576
# KERNEL: Data sent : -491775510
# KERNEL: Data recieved : -491775510
# KERNEL: Data recieved : -491775510
*/
