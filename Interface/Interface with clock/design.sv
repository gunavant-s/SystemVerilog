module add(input [3:0] a,
           input [3:0] b,
           input clk,
           output reg [4:0] sum
          );
  
  always @(posedge clk) begin
    sum <= a + b;
  end
endmodule
