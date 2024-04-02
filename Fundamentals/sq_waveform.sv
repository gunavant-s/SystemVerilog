// Write a function capable of generating a square waveform with the help of period(in nSec) and duty cycle(0 to 1).
// The phase difference is assumed to be 0 for the entire system operation. 
// Verify function behavior by generating waveform for the signal clk with period: 40 nsec and duty cycle: 0.4

`timescale 1ns/1ps


module tb();
  reg clk = 0;
  real phase_diff = 0;
  real timeperiod = 40;
  real duty_cycle = 0.4;
  real freq_hz = 1/timeperiod;
  
  always #20 clk = ~clk;
 
  task calc(input real freq_hz, input real duty_cycle, output real ton, output real toff);
    ton = (1.0 / freq_hz) * duty_cycle * 1000_000_000;
    toff = (1000_000_000 / freq_hz) - ton;
  endtask
  
  task clkgen(input real phase_diff,input real ton,input real toff);
    @(posedge clk);
    #phase_diff;
    
    while(1) begin
      clk = 1;
      #ton;
      clk = 0;
      #toff;
    end
  endtask
  
  real ton;
  real toff;

  
  initial begin
    calc(freq_hz, duty_cycle,ton,toff);
    clkgen(phase_diff,ton, toff);
  end
    
  
   initial begin
    #200;
    $finish();
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
endmodule
