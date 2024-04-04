/*
A dynamic array is an unpacked array whose size can be set or changed at run time, and hence is quite different from a static
array where the size is pre-determined during declaration of the array. The default size of a dynamic array is zero until it is set
by the new() constructor. 
*/

module tb;
  int arr1[] = new[4]('{12,34,56,78});
  int arr2[];
  int arr3[10]; //fixed array
  
  initial begin
    $display("Array1 : %0p",arr1); //Array1 : 12 34 56 78
    arr1 = new[10](arr1); 
    arr2 = new[10](arr1);
    $display("Array1 : %0p",arr1); //Array1 : 12 34 56 78 0 0 0 0 0 0
    $display("Array2 : %0p",arr2); //Array2 : 12 34 56 78 0 0 0 0 0 0
    
    arr3 = arr2; //copy
    $display("Array3 : %0p",arr3); //Array3 : 12 34 56 78 0 0 0 0 0 0
    arr1.delete();
  end
endmodule
