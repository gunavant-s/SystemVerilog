module add(input [3:0] a,
           input [3:0] b,
           input clk,
           output reg [4:0] sum // Reg is used as here we made use of "always" block else internal problem occurs
          );
  
  always @(posedge clk) begin
    sum <= a + b;
  end
endmodule
