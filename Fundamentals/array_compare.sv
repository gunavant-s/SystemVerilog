//Compare using == or !=
//Should be same size
module tb;
  int arr1[10] = '{10{95}};
  int arr2[10];
  
  initial begin
    arr2 = arr1;
    $display("Array1 : %0p", arr1); //Array1 : 95 95 95 95 95 95 95 95 95 95
    $display("Array2 : %0p", arr2); //Array2 : 95 95 95 95 95 95 95 95 95 95
    $display("Status : %0d", arr1==arr2); //Status : 1
    
    arr2[1] = 98;
    $display("Array1 : %0p", arr1); //Array1 : 95 95 95 95 95 95 95 95 95 95
    $display("Array2 : %0p", arr2); //Array2 : 95 98 95 95 95 95 95 95 95 95
    $display("Status : %0d", arr1==arr2); //Status : 0
  end
endmodule

//Case when diff size
module tb;
  int arr1[10] = '{10{95}};
  int arr2[11]; 
  
  initial begin
    arr2[0:9] = arr1;
    $display("Array1 : %0p",arr1); //Array1 : 95 95 95 95 95 95 95 95 95 95
    $display("Array2 : %0p",arr2); //Array2 : 95 95 95 95 95 95 95 95 95 95 0
    $display("Status : %0d",arr1==arr2[1:10]); //Status : 0
  end
endmodule
