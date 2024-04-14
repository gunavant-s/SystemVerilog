// Assume `timescale 1ps/1ps. Generate a 25 MHz square wave waveform for the Signal clk.
// Half time period = (1 / (25MHz))/2 = 20ns

// In verilog we have used always @(*) to code combinational logic. 
// SystemVerilog defines four forms of always procedures: always, always_comb, always_ff, always_latch. 
// Refer : https://www.verilogpro.com/systemverilog-always_comb-always_ff/


`timescale 1ps/1ps

module ex();
  reg clk;
  
  initial clk = 1'b0;
  always #20 clk = ~clk;

  /*
  The always block triggers whenever there is change in variable specified
  always @ (input1) begin
    case (input1)
      1 : output1 = 1;
      2 : output1 = 2;
      .......
    endcase
  end
  */
  
  #500 $finish;
endmodule
