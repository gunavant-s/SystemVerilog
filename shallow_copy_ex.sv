/*
Create a deep copy of the Generator class. To verify the deep copy code assign value of the copy method to another instance of the generator class in TB top.
Print the value of data members in the generator class as well as copied class. Refer Instruction tab for Generator class code.

class generator;
  bit [3:0] a = 5,b =7;
  bit wr = 1;
  bit en = 1;
  bit [4:0] s = 12; 
endclass

*/


class generator;
  
  bit [3:0] a = 5,b =7;
  bit wr = 1;
  bit en = 1;
  bit [4:0] s = 12;
  
  function generator copy(); // don't forget the return type is class name i.e "generator"
    copy = new(); // always for copy function first create an object then copy all the data members
    copy.a = a;
    copy.b = b;
    copy.wr = wr;
    copy.en = en;
    copy.s = s;
  endfunction
  
  //copy of data members is done      
  
  function void display();
    $display("a:%0d b:%0d wr:%0b en:%0b s:%0d", a,b,wr,en,s);
  endfunction
 
endclass


class second; // this class for implementing deep copy
  
  generator g1;
  
  function new(); // first create a generator g1 object
    g1 = new(); 
  endfunction
  
  function second copy();  // don't forget the return type is class name i.e "second" lmao
    // always for copy function first create an object then copy all the data members
    copy = new();
    copy.g1 = g1.copy; // Here even the handler is copied
  endfunction
  
endclass



module tb;
  
  second s1,s2;
  
  initial begin
    s1 = new();
  	s2 = new();
  
  	s2 = s1.copy();
  	s2.g1.a = 6;
  
    $display("%0d, %0d",s1.g1.a,s2.g1.a); // 5, 6
    //So the change in handler doesnt affect the handler s1
  end
  
endmodule
  
  

