// Within an interface to declare port directions for signals modport is used. The modport also put some restrictions on interface access.
// Modport put access restriction by specifying port directions that avoid driving of the same signal by design and testbench.
// Directions can also be specified inside the module.
// Modport provide input, inout, output, and ref as port directions
// Multiple modports can be declared for different directions for monitor and drive

interface add_if;
  logic [3:0] a;
  logic [3:0] b;
  logic clk;
  logic [4:0] sum;
  
  modport DRV (output a,b, input sum,clk);
  
endinterface

class driver;
  
  virtual add_if.DRV inf;
  
  task run();
    forever begin
      @(posedge inf.clk);  
      inf.a <= $random();
      inf.b <= $random();
      $display("a : %0d, b : %0d, Sum : %0d | Time : %0d",inf.a,inf.b,inf.sum,$time()); 
      $display("[DRV] : Interface Trigger");
    end
  endtask
    
endclass

module tb;
  add_if inf(); //Unlike handler in class, interface requires ()
  driver drv;
  
  add dut (inf.a,inf.b,inf.clk,inf.sum);
  
  always #5 inf.clk = ~inf.clk;
  
  initial begin 
    inf.clk <= 0;
  end
  
  initial begin
    drv = new();
    drv.inf = inf;
    drv.run();
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;  
    #100;
    $finish();
  end
endmodule
