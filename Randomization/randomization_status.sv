//1. Add the suitable modifier rand or randc
//2. Call the randomize method
//3. Check status of randomization

class generator;
  
  randc bit [3:0] a, b; ///rand or randc for generating random variables for inputs
endclass
 
//randc keyword -> no repetiton

module tb;
  generator g; //handler
  int i = 0; 
  int status;
  
  initial begin
    g = new(); //Creating object
    
    for(i=0;i<10;i++) begin
      status = g.randomize(); //Assigning status
      $display("Values : %0d %0d, Status : %0d", g.a, g.b, status);
      #10;
    end
  end
endmodule

/*
# KERNEL: Values : 1 8, Status : 1
# KERNEL: Values : 15 5, Status : 1
# KERNEL: Values : 3 0, Status : 1
# KERNEL: Values : 0 15, Status : 1
# KERNEL: Values : 13 13, Status : 1
# KERNEL: Values : 7 2, Status : 1
# KERNEL: Values : 9 9, Status : 1
# KERNEL: Values : 5 10, Status : 1
# KERNEL: Values : 12 11, Status : 1
# KERNEL: Values : 8 6, Status : 1
*/
