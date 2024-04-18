// In verilog the casez and casex are used to treat masked bits z and x as don't cares respectively. 
// SV allows mask bits to be used in the case items. The don’t care bits are specified, using X, Z or ?, as with casex.
// The wildcard character "?" in a case pattern signifies that any value (0, 1, X, or Z) in that specific bit position is acceptable for a match.

module priority_encoder(
  input [3:0] din,
  output reg [1:0] encode
);

  always_comb begin
    case (din[3:0]) inside
      4'b1xxx: encode = 2'd3;  // Highest priority (any value in MSB)
      4'b01xx: encode = 2'd2;  // 1 in second MSB, don't care in lower 2 bits
      4'b001x: encode = 2'd1;  // 1 in third MSB, don't care in lowest bit
      4'b0001: encode = 2'd0; // only 1 in LSB
      default: encode = 2'd0;
      
    endcase
  end
  
endmodule
