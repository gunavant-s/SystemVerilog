//modify functionality of base class by extending base class
// to execute methon in extended class use define method in base class as "virutal" method

class first;  ///parent class
  
  int data = 12;
  
  virtual function void display();
     $display("FIRST : Value of data : %0d", data);
  endfunction
   
endclass
 
 
class second extends first; //child class
  
  int temp = 34;
  
  function void add();
    $display("secomd:Value after process : %0d", temp+4);
  endfunction
  
 
  function void display();
    $display("SECOND : Value of data : %0d", data);
  endfunction
  //if no function is present in extended class then the base class method executes
  
endclass
 
 
module tb;
  
  first f;
  second s;
  
  initial begin
    f = new();
    s = new();
    
    f = s;
    f.display();  
  end
     
endmodule
