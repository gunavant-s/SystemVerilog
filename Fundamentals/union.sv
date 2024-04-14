// The structure members have different memory locations, but the union members share same memory location. (Size of union = size of the largest member of the union)
// Unions allow a single storage space to represent multiple storage formats. SystemVerilog has three types of unions: a simple union,packed union, and a tagged union. 
// Only packed unions are synthesizable. All members within a packed union are the same size.
// It is legal to write to one member (format) of the union, and read back the data from a different member.
// Have to mention keyword "packed" after "union"/"struct".

module tb;
  union packed {
	struct packed {
      logic [31:0] data;
      logic [31:0] address;
    } data_packet;
    
    struct packed {
      logic [31:0] data;
      logic [31:0] operation;
    } instruction_packet; 
  } packet_u;
  
  initial begin
    packet_u.data_packet = '{2521, 12345678}; // Here the data is written in struct data_packet
    $display("%0p",packet_u.instruction_packet); // But instruction_data is read. The output will be same
    //  2521 12345678
    packet_u.instruction_packet = '{12521, 987654};
    $display("%0p",packet_u.data_packet); 
    // 12521 987654
  end
endmodule

// Synopsys Design Compiler - DC does not support assigning value lists to structures containing union members
