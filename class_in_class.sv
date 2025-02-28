`timescale 1ns/1ps

class first;
  	int data;
endclass

class second;
  first f1;
  function new();
    f1 = new();
  endfunction
endclass

module tb;
  second s;
  initial begin
    s = new();
    s.f1.data = 'd54;
    $display("Value : %d",s.f1.data);
  end
endmodule
