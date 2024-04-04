//To copy array they must be of same size
module tb;
  int arr1[10] = '{10{95}};
  int arr2[10];
  
  initial begin
	arr2 = arr1;
    $display("Array1 : %0p",arr1); //Array1 : 95 95 95 95 95 95 95 95 95 95
    $display("Array2 : %0p",arr2); //Array2 : 95 95 95 95 95 95 95 95 95 95
  end
endmodule
