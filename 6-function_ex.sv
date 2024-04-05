//Create a function that will perform the multiplication of the two unsigned integer variables. 
//Compare values return by function with the expected result and if both values match send "Test Passed" to Console else send "Test Failed".

module tb;
  function int multiply(input int a,b);
    return a*b;
  endfunction
  
  int res;
  
  initial begin
    res = multiply(3,5);//pass by value
    $display("Value is %0d",res);
    if (res == 3*5)
      $display("Test Passed ");
    else
      $display("Test Not Passed ");
  end
endmodule


