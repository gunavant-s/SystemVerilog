class first;
  
  int data = 34;
  bit [7:0] temp = 8'h11;
  
  function first copy(); //custom function
    copy = new();
    copy.data = data;
    copy.temp = temp;
  endfunction


  
endclass
 
 
module tb;
  
  first f1;
  first f2;
  
  initial begin
    f1 = new();  
    // f2 = new();
    // Without creating an object we can copy f1 data using this methodolgy

    // "first f2;" declares a variable named f2 of type first. This means that f2 can store a handle to an object of the first class.
    
    f2 = f1.copy;  // calling the function better than "f2 = new f1"
    $display("Data : %0d and TEMP : %0x", f2.data, f2.temp); 
    f2.data = 45;
    $display("Data : %0d and TEMP : %0x", f2.data, f1.temp); 
  end

// In this any changes made in the copyed f2 is also effected in the f1
// # KERNEL: Data : 34 and TEMP : 11
// # KERNEL: Data : 45 and TEMP : 11

endmodule

// A copy constructor is a special type of constructor which initializes all the data members of the newly created object 
// by copying the contents of an existing object. 
// The compiler provides a default copy constructor.  
// Copy constructors have the disadvantage of not being inherited by child classes. Because of this, adding a field to a class is simple. 
// Only the copy constructor needs to be changed. If a parent class is used to reference a child class, the child class's copy constructor cannot be used.
