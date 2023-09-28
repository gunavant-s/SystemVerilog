class first;
  
  int data;
  
  function new(input int datain = 0);
    data = datain;
  endfunction
  
endclass

module tb;
  
  first f;
  initial begin
    f = new(45);
    $display("%0d",f.data);
  end
  
endmodule
    
