interface add_if;
  logic [3:0] a;
  logic [3:0] b;
  logic [4:0] sum;
  
endinterface

module tb;
  add_if inf(); //Unlike handler in class, interface requires ()
  add dut (inf); //No need to specify 

  initial begin
    inf.a = 4;
    inf.b = 4;
    #10;
    inf.a = 5;
    inf.b = 6;
    #20;
    $finish();
  end
  
  always #10 $display("Sum : %0d | Time : %0d",inf.sum,$time());
  
endmodule
