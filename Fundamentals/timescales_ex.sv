// `timescale time_unit / time_precesion 
// 1ns / 1ns = 1 = 10^0. No digits after decimal
// 1ns / 1ps = 10^3. Upto 3 digits after decimal

// `timescale 1ns / 1ps   //10^3 -> 3
 
// module tb();
//   reg clk16 = 0;
//   reg clk8 = 0;  ///initialize variable
  
 
//    always #31.25 clk16 = ~clk16;
//    always #62.5 clk8 = ~clk8;
  
 
 
//   initial begin
//     $dumpfile("dump.vcd");
//     $dumpvars;
//   end
 
 
//   initial begin
//     #200;
//     $finish();
//   end
  
// endmodule


//Write a code to generate a 9MHz square waveform for the signal sclk. Assume timescale with 1nsec time-unit and 3 digit precision.

`timescale 1ns/1ps

module tb();
  reg clk = 0;

  always #55.555 clk = ~clk;
 
  initial begin
    #2000
    $finish;
  end
 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule


