//Assume generator class consists of three 8-bit data members (x,y, and z). 
//Write a code to generate 20 random values for all the data members at an interval of 20 ns.

class generator;
  
  randc bit [7:0] x, y, z; 
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
