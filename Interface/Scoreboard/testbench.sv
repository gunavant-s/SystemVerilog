class transaction;
 randc bit [3:0] a;
 randc bit [3:0] b;
 bit [4:0] sum;
 bit clk;
  
 function void display();
  $display("a : %0d \t b: %0d \t sum : %0d",a,b,sum);
 endfunction
  
endclass


interface add_if;
  logic [3:0] a;
  logic [3:0] b;
  logic [4:0] sum;
  logic clk;
endinterface
 
class monitor;
  virtual add_if aif;
  transaction trans;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    trans = new();
    forever begin
      @(posedge aif.clk);
      trans.a = aif.a;
      trans.b = aif.b;
      trans.sum = aif.sum;
      $display("[MON] : Data Sent to monitor");
      trans.display();
      mbx.put(trans);
    end
  endtask
endclass    


class scoreboard;
  transaction trans;
  virtual add_if aif;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    forever begin
      mbx.get(trans);
      $display("[SCO] : Data RCVD from MON");
      trans.display();
      #20;
    end
  endtask
      
endclass
  
module tb;
  
  add_if aif();
  monitor mon;
  scoreboard sco;
 
  mailbox #(transaction) mbx;
  
  add dut (aif.a, aif.b, aif.sum, aif.clk );
 
  initial begin
    aif.clk <= 0;
  end
  
  always #10 aif.clk <= ~aif.clk;
 
   initial begin
     for(int i=0;i<10;i++) begin
       @(posedge aif.clk);
         aif.a <= $urandom_range(0,15);
         aif.b <= $urandom_range(0,15);
     end
   end
  
  initial begin
    mbx = new();
    mon = new(mbx);
    sco = new(mbx);
    mon.aif = aif;
    sco.aif = aif;
  end
  
  initial begin
    fork
      mon.run();
      sco.run();
    join
    
  end
    
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;  
    #400;
    $finish();
  end
  
endmodule
