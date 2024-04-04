//Three repetitive operations : for loop, foreach loop, repeat

// for loop
/*
module tb;
  int arr[10] = '{10{95}};
  int i;
  
  initial begin
    for(i = 0;i<$size(arr);i=i+1)
      $display("arr[%0d] = %0d",i,arr[i]); 
  end
endmodule
*/

//foreach loop
/*
module tb;
  int arr[10] = '{10{95}};
  
  initial begin
    foreach(arr[i])// starts from 0
      $display("arr[%0d] = %0d",i,arr[i]); 
  end
endmodule
*/

//repeat
module tb;
  int arr[10];
  int i = 0;
  initial begin
    repeat($size(arr)) begin
      arr[i] = i;
      i++;
    end
    $display("Array : %0p",arr); //Array : 0 1 2 3 4 5 6 7 8 9
  end
endmodule
