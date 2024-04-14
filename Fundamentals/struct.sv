// A structure can contain elements of different data types which can be referenced as a whole or individually by their names. This is quite different from arrays.
// All the variables can be displayed at once using format specifier "%0p".
// Individual members of a structure can be accessed using a dot operator ( . ).
// Structures can be read or written as a whole. An entire structure can be copied to another structure, provided the two structures come from the same definition.
// A packed structure stores all members contiguously, with the first member being the left-most (most significant bits) of the storage.


module tb; 
  
  struct {
   logic [31:0] source_address;
   logic [31:0] destination_address;
   logic [63:0] data;
   logic [3:0] ecc;
  } packet;
  
  initial begin
    packet = '{default : 0};  
    $display("%0p",packet);
    #10;
    
    packet.source_address = 32'd16;
    packet.destination_address = 32'd32;
    packet.data = 63'd123456;
    $display("%0p",packet);
    #10;

    packet = '{32, 64, 96, 4};
    $display("%0p",packet);

    packet.ecc = 8;
  end
  
endmodule
