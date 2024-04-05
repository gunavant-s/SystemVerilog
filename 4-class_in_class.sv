class first;
  int data = 34;
  
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
