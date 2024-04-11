interface add_if;
  logic clk;
  logic [3:0] a;
  logic [3:0] b;
  logic [7:0] mul;
  
endinterface


class transaction;
 randc bit [3:0] a;
 randc bit [3:0] b;
  bit clk;
  bit [7:0] mul;
  
  function void display();
    $display("a : %0d \t b: %0d",a,b);
  endfunction
  
  function transaction copy();
    copy = new();
    copy.a = this.a;
    copy.b = this.b;
    copy.clk = this.clk;
    copy.mul = this.mul;
  endfunction
  
endclass
 
 
class generator; // Sends the data
  transaction trans;
  mailbox #(transaction) mbx;
  event done;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
    trans = new();
  endfunction
  
  task run();
    for(int i = 0; i<10; i++) begin
      trans.randomize();
      mbx.put(trans.copy);
      $display("[GEN] : DATA SENT TO DRIVER");
      trans.display();
      #20;
    end
   -> done;
  endtask
  
endclass
 
 
class driver; //Receives the data
  virtual add_if aif;
  mailbox #(transaction) mbx;
  transaction data;
  event next;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction 
  
  task run();
    forever begin
      mbx.get(data);
      @(posedge aif.clk);  
      aif.a <= data.a;
      aif.b <= data.b;
      $display("[DRV] : Interface Trigger");
      data.display();
      #20;
    end
  endtask
  
endclass
 
 
module tb; //
 add_if aif();
 driver drv;
 generator gen;
 event done;
 
  mailbox #(transaction) mbx;
  
  top dut (aif.clk,aif.a, aif.b, aif.mul);
 
  initial begin
    aif.clk <= 0;
  end
  
  always #10 aif.clk <= ~aif.clk;
 
   initial begin
     mbx = new();
     drv = new(mbx);
     gen = new(mbx);
     drv.aif = aif;
     done = gen.done;
   end
  
  initial begin
  fork
    gen.run();
    drv.run();
  join_none
    wait(done.triggered);
    $finish();
  end
  
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;  
  end
  
endmodule
