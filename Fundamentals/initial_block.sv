// Assume System Consist of two global signals resetn and clk. Use an initial block to initialize clk to 1'b0 and resetn to 1'b0.
// User must keep resetn in an active low state for 60 nSec at the start of the simulation and then make active high. Assume `timescale 1ns/1ps

`timescale 1ns/1ps

module tb();
  reg clk;
  reg resetn;
  
  initial begin  
    clk = 1'b0;  
    resetn = 1'b0;  
    #60; 
    resetn = 1'b'1;
  end
endmodule
