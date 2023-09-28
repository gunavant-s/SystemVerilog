module tb;
  
  function int multiply(input int a,b);
    return a*b;
  endfunction
  
  int res;
  
  initial begin
    res = multiply(3,5);
    $display("Value is %0d",res);
    if (res == 3*5)
      $display("Test Passed ");
    else
      $display("Test Not Passed ");
  end
  
endmodule
