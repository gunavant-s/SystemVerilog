`timescale 1ns / 1ps
 
module tb();
 
  
  reg clk; //initial value = X
  
  reg clk50;
  reg clk25 = 0;  ///initialize variable
  
 
  initial begin
    clk = 1'b0;
    clk50 = 0; 
  end
 
 
  
  always #5 clk = ~clk;
  
  always begin
  #5;
   clk50 = 1;
  #10;
   clk50 = 0; 
   #5; 
  end
  
  always begin
    #5;
    clk25 = 1;
    #20;
    clk25 = 0;
    #15;  
  end
 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
 
 
  initial begin
    #200;
    $finish();
  end
  
endmodule
