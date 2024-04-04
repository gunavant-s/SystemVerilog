//Declare using <datatype> <Name> [$];
//Operations for adding : .push_back, .push_front, .insert(position, data)
//Operations for removing : .pop_front(), .pop_back(), .delete(position)

module tb;
  int arr1[$]; //queue
  
  initial begin
    $display("Array1 : %0p",arr1);
    arr1 = {1,2,3};
    $display("Array1 after adding data : %0p",arr1);
    
    arr1.push_front(7); //At start of queue
    $display("Array1 after adding data : %0p",arr1);//7,1,2,3
    
    arr1.push_back(8);//At end of queue
    $display("Array1 after adding data : %0p",arr1);//7,1,2,3,8
    
    arr1.insert(2,10); // Adding data(10) at specific position(2)
    $display("Array1 after adding data : %0p",arr1);//7,1,10,2,3,8
    
    arr1.pop_front();
    $display("Array1 after pop : %0p",arr1);//Array1 after pop : 1 10 2 3 8
    
    arr1.pop_back();
    $display("Array1 after pop : %0p",arr1);//Array1 after pop : 1 10 2 3
    
    arr1.delete(2);
    $display("Array1 after delete : %0p",arr1);//Array1 after delete : 1 10 3
  end
endmodule
