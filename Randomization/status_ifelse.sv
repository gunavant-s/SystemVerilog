//1. Add the suitable modifier rand or randc
//2. Call the randomize method
//3. Check status of randomization

class generator;
  
  randc bit [3:0] a, b; ///rand or randc for generating random variables for inputs
endclass
 
//randc keyword -> no repetiton

module tb;
  generator g; //handler
  int i = 0; 
  int status;
  
  initial begin
    g = new(); //Creating object
    if(g.randomize() == 1) begin
      for(i=0;i<10;i++) begin
        g.randomize(); 
        $display("Values : %0d %0d", g.a, g.b);
        #10;
      end
    end
    else
      $display("Randomization failed at %0t", $time);
  end
endmodule
