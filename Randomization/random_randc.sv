//1. Add the suitable modifier rand or randc
//2. Call the randomize method

class generator;
  
  randc bit [3:0] a, b; ///rand or randc for generating random variables for inputs
endclass
 
//randc keyword -> no repetiton

module tb;
  generator g; //handler
  int i = 0; 
  
  initial begin
    g = new(); //Creating object
    
    for(i=0;i<10;i++) begin
      g.randomize();
      $display("%0d %0d", g.a,g.b);
      #10;
    end
  end
endmodule
    
/*
# KERNEL: 1 8
# KERNEL: 15 5
# KERNEL: 3 0
# KERNEL: 0 15
# KERNEL: 13 13
# KERNEL: 7 2
# KERNEL: 9 9
# KERNEL: 5 10
# KERNEL: 12 11
# KERNEL: 8 6
# KERNEL: 10 3
# KERNEL: 14 12
*/
    
  end
    
endmodule
