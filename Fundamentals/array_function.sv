//Using array in a function. Dont forget automatic, ref keywords.

module tb;
  bit [30:0] ar[15];
  
  function automatic void multiply(ref bit [30:0] ar1[15]); //As variable is returned
    for(int i=0;i<$size(ar1);i++) begin
      ar1[i] = i*i;
    end
  endfunction
  
  initial begin
    multiply(ar);
    $display("%0p",ar); // 0 1 4 9 16 25 36 49 64 81 100 121 144 169 196
  end
  
endmodule
