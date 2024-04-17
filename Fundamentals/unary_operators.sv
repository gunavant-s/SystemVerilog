// These operators are unary in nature, i.e., have only one operand. It reduces a multiple bit operand into a single bit based on the operator.
// Unary reduction operators — collapse a vector to a 1-bit result 
// ~ & | ^ ~& ~| ^~ ~^
// Logical - && ||

module tb;
  bit [2:0] a=3'd2, b=3'd4, y;
  
  initial begin
    $display("a : %0b | b : %0b",a,b);
    #10;
    y = ~a;
    #10;
    y = &b;
    #10;
    y = |b;
    #10;
    y = ~^a;
    #10;
    y = ^b;
    #10;
    $finish();
  end
  
  always #10 $display("y = %0b | time = %0t",y,$time());
endmodule

/*
# KERNEL: a : 10 | b : 100
# KERNEL: y = 101 | time = 10
# KERNEL: y = 0 | time = 20
# KERNEL: y = 1 | time = 30
# KERNEL: y = 0 | time = 40
# KERNEL: y = 1 | time = 50
*/
