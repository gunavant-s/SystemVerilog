// Assume class consists of three data members a, b, and c each of size 4-bit. 
// Create a task inside the class that returns the result of the addition of data members. 
// The task must also be capable of sending the value of a, b, c, and result to the console. Verify code for a = 1, b = 2, and c = 4.


class first;
  
  bit[7:0] a,b,c;
  
  function new(input bit[7:0] a,b,c);
    this.a = a;
    this.b = b;
    this.c = c;
  endfunction
  
   task sum();
     $display("Value of Data1 : %0d , Data2 : %0d and Data3 : %0d", a,b,c);
     $display("The sum is %0d",a+b+c);
  endtask
      
endclass

module tb;
  
  first f;
  
  initial begin
    f = new(2,4,56);
    $display("a, b, c : %0d, %0d, %0d",f.a,f.b,f.c);
    f.sum();
  end
endmodule
  
