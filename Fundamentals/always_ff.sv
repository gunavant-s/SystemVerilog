// Different from always_comb. Designer need to specify the sensitivity list. 
// Because software tools cannot infer the clock name and clock edge from the body of the procedural block.
// Nor can a tool infer whether the engineer intended to have synchronous or asynchronous reset behavior.

module d_ff 
  (input clk, rst, d,
   output logic q);

  always_ff @(posedge clk or negedge rst) begin // active-low reset
    if (!rst)
      q <= 1'b0;
    else
      q <= din;
  end
endmodule: d_ff
