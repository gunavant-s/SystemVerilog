// Only one variable was created in the example above, but if there's a need to create multiple structure variables with the same constituents, create a user defined data type of the structure by typedef
// Using typedef we can define the structure once outside the module, and can use it in module using <defined_structure_name> <variable_name>.
// We can copy an entire structure to another.

typedef struct {
   logic [31:0] source_address;
   logic [31:0] destination_address;
   logic [63:0] data;
   int ecc;
} packets;
  

module tb; 
  packets packet1, packet2, packet3;
  initial begin
    packet1 = '{default : 1};  
    $display("Packet1 : %0p",packet1);
    #10;
    
    packet1.source_address = 32'd16;
    packet1.destination_address = 32'd32;
    packet1.data = 63'd6400;
    packet1.ecc = 8;
    $display("Packet1 : %0p",packet1);
    #10;

    packet1 = '{32, 64, 96, 192};
    $display("Packet1 : %0p",packet1);
  end
  
  initial begin
    packet2 = '{default : 2};  
    $display("Packet2 : %0p",packet2);
    #10;
    
    packet2.source_address = 32'd25;
    packet2.destination_address = 32'd125;
    packet2.data = 63'd62500;
    packet2.ecc = 5;
    $display("Packet2 : %0p",packet2);
    #10;

    packet2 = '{125, 625, 15625, 500};
    $display("Packet2 : %0p",packet2);

    packet3 = packet2; // Copying structure
    $display("Packet3 : %0p",packet3);
  end
  
endmodule
