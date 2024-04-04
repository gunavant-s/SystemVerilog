// Array initialization is of three types
//Single quote is use to distinguish between packed and unpacked array in SystemVerilog. 
//Refer : https://www.linkedin.com/pulse/choosing-between-packed-unpacked-arrays-systemverilog/
//1. Unique values : bit[4:0] ar[3] = '{1,2,3,4,5}; or bit [4:0] ar[] = {1,2,3,4,5};
//2. Repetitive value : bit arr[] = '{6{0}}; array consisits of 6 zeros
//3. Default value : bit arr[3] = {default : 1}; Default 1 is given

module tb;
  //unique
  bit [3:0] ar1[] = '{1,2,3,3,4,5}; // 1,2,3,3,4,5
  integer ar2[] = '{1,2,3,4}; // 1,2,3,4
  //repetition operator
  int ar3[] = '{6{90}}; //  90 90 90 90 90 90
  //default
  int ar4[5] = '{default : 2}; // 2,2,2,2,2
  //uninitialized
  integer ar5[]; // 0 for 2-state datatype, X for 4-state
  
  initial begin
    $display("j %0p",ar5);
  end
  
endmodule 
