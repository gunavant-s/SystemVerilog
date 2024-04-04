/*
1. Create two arrays of reg type capable of storing 15 elements. 
Use $urandom function to add 15 values to the array. Print the value of all the elements of the array on a single line.
*/
module tb();
  reg arr[15];
  reg arr1[15];
  
  initial begin
    foreach(arr[i]) begin
      arr[i] = $urandom();
      arr1[i] = $urandom();
  end
    $display("The arr values: %0p", arr); //The arr values: 1 1 1 0 0 0 0 1 0 1 0 0 0 1 0
    $display("The arr1 values: %0p", arr1); //The arr1 values: 0 0 1 0 0 0 0 1 1 1 0 1 0 1 0
  end
endmodule

/*
2. Create a dynamic array capable of storing 7 elements. add a value of multiple of 7 starting from 7 in the array (7, 14, 21 ....49).
After 20 nsec Update the size of the dynamic array to 20. 
Keep existing values of the array as it is and update the rest 13 elements to a multiple of 5 starting from 5.
Print Value of the dynamic array after updating all the elements.
Expected result : 7, 14, 21, 28 ..... 49, 5, 10, 15 ..... 65 .
*/
module tb;
    int ar[];
    int i;
  
    initial begin
      ar = new[7];
      for(i=0;i<7;i++) begin
       ar[i] = (i+1)*7;
      end
      #20;
      ar = new[20](ar);
      for(i=7;i<20;i++) begin
        ar[i] = (i-6)*5;
      end
      $display("%0p",ar);
    end
endmodule

/*
3. Create a Fixed-size array capable of storing 20 elements.
Add random values to all the 20 elements by using $urandom function. 
Now add all the elements of the fixed-size array to the Queue in such a way that the first element of the Fixed-size array should be the last element of the Queue.
Print all the elements of both fixed-size array and Queue on Console.
*/
module tb;
  int arr[20];
  int queue[$];
  
  initial begin
    foreach(arr[i])begin
      arr[i] = $urandom();
    end
    $display("arr: %0p", arr);

    for(int j = 20; j > 0 ; j--)begin
      queue.push_front(arr[20-j]);
    end
    $display("queue: %0p", queue);
    
  end
endmodule
