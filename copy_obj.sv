class first;
  int data;
  int data2;
  
  function new(input int datain=90);
    data = datain;
  endfunction
  
endclass
 
module tb;
  first f1;
  first f2;
  
  initial begin
    f1 = new(88);  ///1. constructor 
    f1.data2 = 24;   ///2. processing
  
    f2 = new f1;  /// 3. copying data from f1 to p1
    
    $display("Value of data member f2 : %0d", f2.data);  //4. processing 
    
    f2.data = 12; // data in f1 won't change
    
    $display("Value of data member f1 : %0d", f1.data);  //4. processing     
  end
endmodule
