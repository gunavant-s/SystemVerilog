// The super keyword is used from within a sub-class to refer to properties and methods of the base class. 
// It is mandatory to use the super keyword to access properties and methods if they have been overridden by the sub-class.

class first; ////////////parent class
  int data;
  
  function new(input int data);
    this.data = data;  
  endfunction
  //this keyword is used to refer to class properties, parameters and methods of the current instance
  //basically a pre-defined object handle that refers to the object that was used to invoke the method in which this is used
endclass
 
class second extends first; //child class
  int temp;
  
  function new(int data, int temp);
    super.new(data);
    this.temp = temp; 
  endfunction
endclass
 
module tb;
  second s;
  
  initial begin
    s = new(67, 45);
    $display("Value of data : %0d and Temp : %0d", s.data, s.temp);
  end
endmodule
