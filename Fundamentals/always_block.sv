// Assume `timescale 1ps/1ps. Generate a 25 MHz square wave waveform for the Signal clk.
// Half time period = (1 / (25MHz))/2 = 20ns

`timescale 1ps/1ps

module ex();
  reg clk;
  
  initial clk = 1'b0;
  always #20 clk = ~clk;
  #500 $finish;
endmodule
