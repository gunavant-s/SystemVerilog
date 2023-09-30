class first;
  
  int data = 34;
  bit [7:0] temp = 8'h11;
  
  function first copy(); //custom function
    copy = new();
    copy.data = data;
    copy.temp = temp;
  endfunction
  
  
endclass
 
 
module tb;
  
  first f1;
  first f2;
  
  initial begin
    f1 = new();  
    f2 = new();
    
    f2 = f1.copy;  // calling the function better than "f2 = new f1"
    $display("Data : %0d and TEMP : %0x", f2.data, f2.temp); 
    f2.data = 45;
    $display("Data : %0d and TEMP : %0x", f2.data, f2.temp); 
  end

// # KERNEL: Data : 34 and TEMP : 11
// # KERNEL: Data : 45 and TEMP : 11

endmodule
