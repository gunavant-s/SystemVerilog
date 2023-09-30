class first;
  
  reg [5:0] data1; 
  reg [6:0] data2;
  reg [6:0] data3;
  
  
endclass
 
 
module tb;
  
  first f; //handler
  
  initial begin
    f = new(); //default constructor
    #1;
    f.data1 = 6'd45;
    f.data2 = 7'd78;
    f.data3 = 7'd90;
    $display("%0p %0p %0p",f.data1,f.data2,f.data3); //accessing of values of f
  end
  
endmodule
