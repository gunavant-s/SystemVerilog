// `timescale time_unit / time_precesion 
// 1ns / 1ns = 1 = 10^0. No digits after decimal
// 1ns / 1ps = 10^3. Upto 3 digits after decimal

`timescale 1ns / 1ps   //10^3 -> 3
 
module tb();
 
  
 
  
  reg clk16 = 0;
  reg clk8 = 0;  ///initialize variable
  
 
   always #31.25 clk16 = ~clk16;
   always #62.5 clk8 = ~clk8;
  
 
 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
 
 
  initial begin
    #200;
    $finish();
  end
  
endmodule
