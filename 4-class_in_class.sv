class first;
  int data = 34;
  local int data_local; // can't be access outside the class
  // When tried we get the error: "Cannot access local/protected member ""f1.data"" from this scope.
  task display();
    $display("Value of data : %0d",data);
  endtask 
  
endclass
 
class second;  
  first f1;
  
  function new();
    f1 = new();
  endfunction
   
endclass


module tb;
  second s;
  
  initial begin
    s = new();
    $display("Value of Data : %0d",s.f1.data);
    s.f1.display();
    
    s.f1.data = 45;
    s.f1.display();  
  end
endmodule
