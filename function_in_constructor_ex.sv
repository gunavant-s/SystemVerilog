// Assume the class consists of three 8-bit data members a, b, and c. 
// Create a Custom Constructor that allows the user to update the value of these data members while adding a constructor to the class. 
// Test your code by adding the value of 2, 4, and 56 to a, b and c respectively.


class first;
  
  int data1;
  bit [7:0] data2;
  shortint data3;
  
  function new(input int data1 = 0, input bit[7:0] data2 = 8'h00, input shortint data3 = 0);
     this.data1 = data1;
     this.data2 = data2;
     this.data3 = data3;    
  endfunction
  
  
endclass
 
 
module tb;
  
  first f1;
  
  initial begin
    //f1 = new(23,,35); ///follow position
    f1 = new( .data2(4), .data3(5), .data1(23)); //follow name
    $display("Data1 : %0d, Data2 : %0d and Data3 : %0d", f1.data1, f1.data2, f1.data3); 
  end
  
  
endmodule
