//Pass by value : Variables x and y are passed as an argument in the function call sum, changes to the argument x within the function is not visible outside.
//Pass by ref : pass by reference, a reference to the original argument is passed to the subroutine.
//As the argument within a subroutine is pointing to an original argument, any changes to the argument within subroutine will be visible outside.
//To indicate argument pass by reference, the argument declaration is preceded by keyword ref
//Refer : https://verificationguide.com/systemverilog/systemverilog-task-function-argument-passing/

module tb;
  
  //////pass by value  
  task swap1 ( input bit [1:0] a, [1:0] b); 
    bit [1:0] temp;
    temp = a;
    a = b;
    b = temp;   
    $display("Value of a : %0d and b : %0d", a,b); //Changes here but not in initial block
    //Value of a : 2 and b : 1
  endtask
  
  
  //////pass by reference  
  task automatic swap2(ref bit [1:0] a, ref bit [1:0] b); /// function automatic bit [1:0] add (arguments);
    bit [1:0] temp;
    temp = a;
    a = b;
    b = temp;
    
     $display("Value of a : %0d and b : %0d", a,b); //Changes in initial begin bloack too
    //Value of a : 2 and b : 1
  endtask
 
  
  ////restrict access to variables
  task automatic swap3 (const ref bit [1:0] a, ref bit [1:0] b); /// function automatic bit [1:0] add (arguments);
    bit [1:0] temp;
    
    temp = a;
  //  a = b;
    b = temp;
    
    $display("Value of a : %0d and b : %0d", a,b);
    //Value of a : 2 and b : 2
  endtask
  
  bit [1:0] a;
  bit [1:0] b;
  
  initial begin
    a = 1;
    b = 2;
    
    swap1(a,b);
    $display("Value of a : %0d and b : %0d", a,b);
    //Value of a : 1 and b : 2 No change
    
    swap2(a,b);
    $display("Value of a : %0d and b : %0d", a,b);
    //Value of a : 2 and b : 1 Changed
    swap3(a,b);
    $display("Value of a : %0d and b : %0d", a,b);
    //Value of a : 2 and b : 2
  end
endmodule
