// enum — variables or nets with an enumerated list of legal values
// Enumerated types have a base data type, which, by default, is int (a 2-state, 32-bit type). The variable size and the size of the label values must be the same
// By default, the first label in the list has a logic value of 0, and each subsequent label is incremented by one
// An entire structure can be copied to another structure, provided the two structures come from the same definition. This requires using typedef.
// Using typedef to define a structure type also makes it possible to pass entire structures through module ports or to tasks and functions.

typedef enum logic [2:0]{ // By default the type is int 
  WR ADDR = 0,
  WR_DATA = 1,
  WR_RESP = 2,
  RD_ADDR = 3,
  RD_DATA = 4
}axi_channel_t;

module my_dut1 ();
  axi_channel_t ch1;
  always_comb begin
    case (ch1) // Like a switch block in C
    WR_ADDR: begin ... end
    WR_DATA : begin ... end
    WR_RESP : begin ... end
    RD_ADDR : begin ... end
    RD_DATA : begin ... end
    endcase
  end
  
endmodule: my_dut1

module my_dut2();
  axi_channel_t ch2;
  always_comb begin
    case (ch2)
    WR_ADDR: begin ... end
    WR_DATA : begin ... end
    WR_RESP : begin ... end
    RD_ADDR : begin ... end
    RD_DATA : begin ... end
    endcase
  end
