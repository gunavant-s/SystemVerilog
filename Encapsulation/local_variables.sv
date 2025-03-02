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
endclass;

// Implementation of the display method
function void Packet::display();
  $display("Packet data: %0h", data);
endfunction

// Implementation of the minus task
task Packet::minus();
  $display("The packed data - 1 : %0h", data - 1);
endtask

// Implementation of the process task
task Packet::process();
  #10 data = data + 1;
  $display("Processed data: %0h", data);
endtask

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
    Packet pkt = new(32'hABCD1234); // Allocate a new object

    pkt.display();   // Call display method
    pkt.process();   // Call process task
    pkt.minus();     // Call minus task

    pkt = null;      // Deallocate the object
    $finish;         // End simulation
  end
endmodule
