// If the definition of the method written outside the body of the class then the method is called an external method.
// The extern qualifier indicates that the body of the method (its implementation) is to be found outside the class declaration
// Before the method name, the class name should be specified with a class resolution operator to specify to which class the method corresponds to.

class generator;
  randc bit [4:0] a,b;
  
  extern constraint data;  
  extern function void display();

endclass

// :: -> Scope operator
constraint generator::data { //To refer to the data in generator class
  a inside {[1:15]};
  b inside {[16:31]};
}

function void generator::display(); //Class name :: Specific_method
  $display("Data a: %0d, b: %0d",a,b);
endfunction
    
module tb;
  generator g;
  
  initial begin
    g = new();
    
    for(int i=0;i<12;i++) begin
      g.randomize();
      g.display();
    end
  end
endmodule
