//The extent class will inherit the property as well as the data member of the class which we are extending.
//We could refer to the original class. It's a pattern class and extended class has the child class.

class first; //parent or super class
  int data = 12;
  
  function void add();
    $display("Data after process is %0d",data+4);
  endfunction
endclass

class second extends first; //child or derived class
  int temp = 34;
endclass

module tb;  // testbench
  second s1;
  
  initial begin
    s1 = new();
    $display("Value of data : %0d",s1.data); 
    $display("Value of temp : %0d",s1.temp); 
    s1.add();
    // # KERNEL: Value of data : 12
    // # KERNEL: Value of temp : 34
    // # KERNEL: Data after process is 16
  end
endmodule
