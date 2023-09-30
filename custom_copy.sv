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
  end
  
  
  
  
  
  
 /* 
  initial begin
    f1 = new();
    ///////////
    f1.data = 45;
    /////////
    f2 = new f1;
    ////////////
    f2.data = 56;
    
    
    $display("%0d", f1.data);
  
  end
  */
  
endmodule
