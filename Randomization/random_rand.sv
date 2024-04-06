//1. Add the suitable modifier rand or randc
//2. Call the randomize method

class generator;
  
  rand bit [3:0] a, b; ///rand or randc for generating random variables for inputs
endclass
 
//rand keyword -> repetition of value. Useful when working with memory to observe repetition of address.
//Whenever you want to see prediction of a value

//randc keyword -> no repetiton

module tb;
  generator g; //handler
  int i = 0; 
  
  initial begin
    g = new(); //Creating object
    
    for(i=0;i<10;i++) begin
      g.randomize();
      $display("Value of a :%0d and b: %0d", g.a,g.b);
      #10;
    end
    
/*
  # KERNEL: Value of a :6 and b: 5
	# KERNEL: Value of a :3 and b: 4
	# KERNEL: Value of a :15 and b: 13
	# KERNEL: Value of a :11 and b: 8
	# KERNEL: Value of a :7 and b: 8
	# KERNEL: Value of a :10 and b: 10
	# KERNEL: Value of a :11 and b: 13
	# KERNEL: Value of a :13 and b: 4
	# KERNEL: Value of a :9 and b: 9
	# KERNEL: Value of a :1 and b: 11
*/
    
  end
    
endmodule
