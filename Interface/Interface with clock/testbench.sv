interface add_if;
  logic [3:0] a;
  logic [3:0] b;
  logic clk;
  logic [4:0] sum;
  
endinterface

module tb;
  add_if inf(); //Unlike handler in class, interface requires ()
  
  add dut (inf.a,inf.b,inf.clk,inf.sum); // Design top module
  
  always #5 inf.clk = ~inf.clk;
  
  initial begin 
    inf.clk <= 0; //Always refer variables in interface using reference
  end
   
  initial begin
    inf.a <= 4;
    inf.b <= 4;
    #10;
    inf.a <= 5;
    #10
    inf.b <= 6;
    #10;
    inf.a <= 15;
    #10;
    inf.b <= 11;
    #20;
    $finish();
  end
  
  always #10 $display("Sum : %0d | Time : %0d",inf.sum,$time());
  
endmodule
