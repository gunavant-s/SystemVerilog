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


module tb1;
  bit [7:0] ar[31];
  
  function automatic void multiple(ref bit[7:0] ar[31]); //automatic, ref for pass by reference. No return.
    for(int i=0;i<=30;i++) begin
      ar[i] = (i+1)*8; // changes made in the array by altering the memory
    end
  endfunction
  
  initial begin
    multiple(ar); //altered the array
    for(int i=0;i<=30;i++) begin
      $display("%0d -> %0d ",i,ar[i]);
    end
  end
endmodule

// module tb;
  
//   bit clk;
//   initial clk = 0;
//   bit en,wr;
//   bit [5:0] addr;
  
//   always #20 clk = !clk;
  
//   task stmuli();
//     #10
//     en=1;wr=1;addr=12;
//     #10
//     @(posedge clk);
//       addr = 14;
      
//     @(posedge clk);
//       wr=0;addr = 23;
    
//     @(posedge clk);
//       addr = 48;
    
//     @(posedge clk);
//       en =0;addr = 56;
    
//   endtask
  
  
// endmodule
