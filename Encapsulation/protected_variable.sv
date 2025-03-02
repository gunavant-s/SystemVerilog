class Packet;
  protected bit [31:0] data;

  // Constructor
  function new(bit [31:0] data);
    this.data = data;  
  endfunction

  // Declare external methods and tasks
  extern function void display();
  extern task process();
  extern task minus();
endclass

// Implementation of the display method
function void Packet::display();
  $display("Packet data:         %0h", data);
endfunction

// Implementation of the minus task
task Packet::minus();
  $display("The packed data - 1: %0h", data - 1);
endtask

// Implementation of the process task
task Packet::process();
  #10 data = data + 1;
  $display("Processed data:      %0h", data);
endtask
    
class childPacket extends Packet;
  bit [31:0] child_data;

  // Constructor
  function new(bit [31:0] data);
    super.new(data); 
  endfunction

endclass

// Testbench module
module test;
  // Declare clock signal
  bit clk;

  // Generate clock signal
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle clock every 5 time units
  end

  initial begin
    Packet pkt          = new(32'hABCD1234); // Allocate a new object
    childPacket c_pkt   = new(32'hABCD4321);
    $display("------------------Parent/super class: ---------------------------");
    pkt.display();   // Call display method
    pkt.process();   // Call process task
    pkt.minus();     // Call minus task
    #10;
    $display("-----------------Extended/child class: --------------------------");
    c_pkt.display();   // Call display method
    c_pkt.process();   // Call process task
    c_pkt.minus();     // Call minus task

    pkt   = null;      // Deallocate the object
    c_pkt = null;
    $finish;         // End simulation
  end
endmodule
