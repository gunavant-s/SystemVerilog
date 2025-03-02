class Packet;
  static int packet_count = 0;
  
  bit [31:0] data;
  
  function new(bit [31:0] data);
    this.data = data;
    packet_count++;
  endfunction
  
  static function void get_packet_count();
    $display("Total Packet count : %0d",packet_count);
  endfunction
  
  function void display();
    $display("Packet data :        %0h",this.data);
  endfunction
endclass

module test;
  
  initial begin
    Packet pkt1,pkt2; // If this is replaced with display then it won't work
    $display("No objects created yet!");
    Packet::get_packet_count();//• Does not require class instantiation to be called
    #10;
    
    $display("Packet 1 created");
    pkt1 = new(32'hABCD);
    Packet::get_packet_count();
    pkt1.display();
    #10;
    
    $display("Packet 2 created");
    pkt2 = new(32'h12345);
    Packet::get_packet_count();
    pkt2.display();
    #10;
    
    pkt1 = null;
    pkt2 = null;
    $finish();
  end
endmodule
