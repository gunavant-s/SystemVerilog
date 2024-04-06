// Constraint blocks are class members like tasks, functions, and variables
// Constraint blocks will have a unique name within a class
// Constraint blocks consist of conditions or expressions to limit or control the values for a random variable
// Constraint blocks are enclosed within curly braces { }
// Constraint blocks can be defined inside the class or outside the class like extern methods, constraint block defined outside the class is called as extern constraint block/

//1. Add the suitable modifier rand or randc
//2. Call the randomize method
//3. Check status of randomization

class generator;
  
  randc bit [7:0] x, y, z;
  
  constraint data_x {x>10; x<100;} 
  constraint data_y {y>101; y<201;}
  constraint data_z {z>201; z<250;}
  
  // constraint data {x>10; x<100; y>101; y<201; z>201; z<250;}
  //works too
endclass
 
module tb;
  generator g;
  int ar[3];
  
  initial begin
    g = new();
    for(int i=0;i<20;i++) begin
      g.randomize();
      ar = '{g.x,g.y,g.z};  
      $display("Values are %0p", ar);
      #20;
    end
  end
endmodule
