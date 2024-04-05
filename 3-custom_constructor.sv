class first;
  bit[7:0] a,b,c;
  
  function new(input bit[7:0] a,b,c);
    this.a = a; // Which a,b,c should get assigned ?
    this.b = b; //a,b,c variable in first class should be assigned with local variable a,b,c in new()
    this.c = c;
  endfunction
endclass

module tb;
  first f;
  
  initial begin
    f = new(2,4,56);
    $display("a, b, c : %0d, %0d, %0d",f.a,f.b,f.c);
  end
endmodule
  
  
