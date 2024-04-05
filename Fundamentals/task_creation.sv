//A Task can contain a declaration of parameters, input arguments, output arguments, in-out arguments, registers, events, and zero or more behavioral statements.
//If not specified, default direction is input. 
//We can add a timing control which is not possible in function.
//No return type. Supports multiple output ports.
//More info : https://verificationguide.com/systemverilog/systemverilog-tasks/
//SystemVerilog task executes a number of sequential statements but doesn't return a value. Instead, the task can have an unlimited number of outputs .


//1. When the variables are declared after task, then they should be given as arguments for task
/*
  task add (input bit [3:0] a, input bit [3:0] b, output bit [4:0] y);
    y = a + b;
  endtask
  
    bit [3:0] a,b;
    bit [4:0] y;
  
  initial begin
    a = 7;
    b= 7;
    add(a,b,y);
    $display("value of y :%0d",y);
  end
*/


//2. But when the variables are declared prior task, then no arguments are required.
/*
    bit [3:0] a,b;
    bit [4:0] y;
    
  task add ();
    y = a + b;
  endtask
  
  initial begin
    a = 7;
    b= 7;
    add(a,b,y);
    $display("value of y :%0d",y);
  end
*/


module tb;
  bit [3:0] a,b;
  bit [4:0] y;
  
  task add();
    y = a+b;
  endtask
  
  task stimuli();
    a = 1;
    b = 2;
    add();
    #10;
    
    a = 2;
    b = 2;
    add();
    #10;
    
    a = 3;
    b = 4;
    add();
    #10;
  endtask
  
  initial begin
    $monitor("a = %0d, b = %0d, c = %0d",a,b,y);
    stimuli();
  end
endmodule
// a = 1, b = 2, c = 3
// a = 2, b = 2, c = 4
// a = 3, b = 4, c = 7
