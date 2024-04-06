//in shallow copy we access to a handler. To restrict it we shall use deep copy.

//construcor in each class
class first;
  int data = 12;
  
  function first copy();
    copy = new();
    copy.data = data;
  endfunction
endclass

//when u call this class then the function the data is copied.
class second;
  int ds = 34;
  first f1;
  
  function new();
    f1 = new();  //another constructor
  endfunction
  
  function second copy();
    copy = new();
    copy.ds = ds;
    copy.f1 = f1.copy;    // to avoid the changes reflected due to handler copy unlike in Shallow Copy
  endfunction
endclass


module tb;
  
  second s1, s2;
  
  initial begin
    s1 = new();
    s2 = new();
    
    s1.ds = 45;
    
    s2 = s1.copy();
    $display("Value of s2 : %0d", s2.ds);
    
    s2.ds = 78;
    $display("Value of s1 : %0d", s1.ds); // 45
    
    s2.f1.data = 98;
    //changes in handler copy of "s2" won't be affecting handler copy of "s1". This is advantage of Deep Copy
    $display("Value of s1 : %0d", s1.f1.data); // 12 
  end
endmodule
