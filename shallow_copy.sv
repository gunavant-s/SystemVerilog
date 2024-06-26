// A shallow copy creates a new object which stores the reference of the original elements.
// So, a shallow copy doesn't create a copy of nested objects, instead it just copies the reference of nested objects. 
// This means, a copy process does not recurse or create copies of nested objects itself.
// If change is made in handler, changes are reflected in copied object

class first;
  int data = 12; // actual defualt data is present here
endclass
 
class second;
  int ds = 34;
  first f1;   // from first class
  
  function new();
    f1 = new();  //custom constructor calling the first class
  endfunction
  //And whenever you try to use other class in a class, in that case, you try to use a custom constructor.
endclass
 
module tb; 
  second s1, s2;
  
  initial begin
    s1 = new();   // second class then first class
    s1.ds = 45;
    s1.f1.data = 45;
    
    s2 = new s1; // Shallow copy
    $display("Value of ds: %0d", s2.ds); //45
    
    s2.ds = 78;     
    $display("Value of ds: %0d", s1.ds); // 45
    // changing the data members of s2 won't effect s1
    
    s2.f1.data = 56;
    // But in shallow copy when we access the handler and change the data members of the handler f1 using s2 even the data of s1 is effected.
    // To avoid this we go for Deep Copy  
    $display("Value of data in f1: %0d", s1.f1.data); //56 the data is altered as we used the reference of the object "tb->s2->f1->data"
    
  end
endmodule
