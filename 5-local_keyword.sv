class first;
  
 local int data = 34; //restrict scope only to this class. Even by inheritance this value can't be accessed
  
  task set(input int data);
    this.data = data; // set the value by independent methods
  endtask
  
  function int get();
  return data;   // get the local value
  endfunction
  
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
    s.f1.set(123);
    $display("Value of data : %0d", s.f1.get());
    
  end
  
  
  
endmodule
