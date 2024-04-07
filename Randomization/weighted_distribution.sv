// comparing := and :/ operators
class first;
  rand bit wr; //:=
  rand bit rd; //:/
  // := -> Equal weights to all values
  // :/ -> Divide weights equally b/w values in range. This operator is more efficient. Choose this when wished to utilize weighted distribution.
  
  rand bit [1:0] var1; //:=
  rand bit [1:0] var2; //:/
  
  constraint data {
    var1 dist {0 := 30, [1:3] := 90};  // 30 + 90*3 = 300 . Here not divided so 90 for each 1,2,3
    // P(0) = 30/300, P(1,2,3) = 90/300
    var2 dist {0 :/ 30, [1:3] :/ 90};// 30+90 = 120 As weight divided equally 1,2,3 have 30 each
    //// P(0,1,2,3) = 30/120
  }
  
  constraint cntrl {
    wr dist {0 := 30, 1 := 70};//distribution of wr signal   
    rd dist {0 :/ 30, 1 :/ 70};//distribution of rd signal
    //for weighted distribution "dist" keyword is used
  }
endclass

module tb;
  first f;
  
  initial begin
    f = new();
    
    for(int i=0;i<15;i++) begin
      f.randomize();
      // $display("Values wr : %0d, rd : %0d",f.wr,f.rd);
      $display("Values var1(:=) is %0d, var2(:/) is %0d",f.var1,f.var2); 
    end  
  end
endmodule

/*
# KERNEL: Values var1(:=) is 0, var2(:/) is 1
# KERNEL: Values var1(:=) is 2, var2(:/) is 0
# KERNEL: Values var1(:=) is 1, var2(:/) is 1
# KERNEL: Values var1(:=) is 0, var2(:/) is 2
# KERNEL: Values var1(:=) is 1, var2(:/) is 2
# KERNEL: Values var1(:=) is 0, var2(:/) is 1
# KERNEL: Values var1(:=) is 2, var2(:/) is 1
# KERNEL: Values var1(:=) is 2, var2(:/) is 1
# KERNEL: Values var1(:=) is 0, var2(:/) is 2
# KERNEL: Values var1(:=) is 3, var2(:/) is 1
# KERNEL: Values var1(:=) is 2, var2(:/) is 1
# KERNEL: Values var1(:=) is 1, var2(:/) is 1
# KERNEL: Values var1(:=) is 3, var2(:/) is 1
# KERNEL: Values var1(:=) is 3, var2(:/) is 2
# KERNEL: Values var1(:=) is 1, var2(:/) is 3
*/
