//  very similar to always_comb, except that it documents the designer’s intent to represent latch behavior.
// Consider d-latch with en-enable, d-data, rst - active low reset
// In verilog we have to specify reg for output used in sequential circuits. In SV, we can use logic for both reg and wire types.

module d_latch
  (input en, d, rst,
   output logic q);
  
  always_latch
    if (!rst) 
      q <= 1'b0; //non-blocking 
    else
      if (en)
        q <= d;
  
endmodule: d_latch
