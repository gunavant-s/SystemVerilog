//The constructor can be used for initializing the class properties. By creating function in class with name "new".

class first;
  int data; // first we have to declare the variable
  
  function new(input int datain = 0); //default value is given as 0
    data = datain; //no return type required
  endfunction
endclass

module tb;
  first f;//handler
  
  initial begin
    f = new(45);//initializing
    $display("%0d",f.data);
  end
endmodule
    
