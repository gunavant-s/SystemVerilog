interface top_if;
  logic clk;
  logic [3:0] a, b;
  logic [7:0] mul;
  
endinterface
 
class transaction;
  randc bit [3:0] a,b;
  bit [7:0] mul;
 bit clk;
  
 function void display();
   $display("a : %0d \t b: %0d \t mul : %0d",a,b,mul);
 endfunction
  
endclass

class monitor;
  virtual top_if vif;
  transaction trans;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    trans = new();
    forever begin
      repeat (2) @(posedge vif.clk);
      trans.a = vif.a;
      trans.b = vif.b;
      trans.mul = vif.mul;
      $display("[MON] : Data Sent to monitor");
      trans.display();
      mbx.put(trans);
    end
  endtask
endclass    


class scoreboard;
  transaction trans;
  virtual top_if vif;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task compare(input transaction trans);
    if ((trans.mul) == (trans.a * trans.b))
      $display("[SCO] : MUL and result match");
    else
      $error("[SCO] : MUL and result don't match"); // $fatal() - forcefully stops, $warning()
  endtask
  
  task run();
    forever begin
      mbx.get(trans);
      $display("[SCO] : Data RCVD from MON");
      trans.display();
      compare(trans);
      $display("--------------------------------------------------");
      #20;
    end
  endtask
     
endclass

module tb;
  monitor mon;
  scoreboard sco;
  top_if vif();
  mailbox #(transaction) mbx;
  
  top dut (vif.clk, vif.a, vif.b, vif.mul);
  
  initial begin
    vif.clk <= 0;
  end
  
  always #5 vif.clk <= ~vif.clk;
  
  initial begin
    for(int i = 0; i<20; i++) begin
      repeat (2) @(posedge vif.clk);
      vif.a <= $urandom_range(1,15);
      vif.b <= $urandom_range(1,15);
    end
    
  end
  
   initial begin
     mbx = new();
     mon = new(mbx);
     sco = new(mbx);
     mon.vif = vif;
     fork
       mon.run();
       sco.run();
     join
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
     $dumpvars;    
    #300;
    $finish();
  end
  
endmodule
