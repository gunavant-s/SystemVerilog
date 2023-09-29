class first;
  
  bit[7:0] a,b,c;
  
  function new(input bit[7:0] a,b,c);
    this.a = a;
    this.b = b;
    this.c = c;
  endfunction
  
   task sum();
     $display("Value of Data1 : %0d , Data2 : %0d and Data3 : %0d", a,b,c);
     $display("The sum is %0d",a+b+c);
  endtask
      
endclass

module tb;
  
  first f;
  
  initial begin
    f = new(2,4,56);
    $display("a, b, c : %0d, %0d, %0d",f.a,f.b,f.c);
    f.sum();
  end
endmodule
  
