//Assume class consists of three data members a, b, and c each of size 4-bit.
// Create a task inside the class that returns the result of the addition of data members. 
// The task must also be capable of sending the value of a, b, c, and result to the console. Verify code for a = 1, b = 2, and c = 4.

class test;
  bit [3:0] a=0,b=0,c=0;
  
  task add(input bit [3:0] a,b,c);
    $display("%0d",a+b+c);
  endtask  
endclass

module tb;
  
  test t;//handler
  
  initial begin
    t = new(); 
    t.add(1,2,4); //7
  end
endmodule
