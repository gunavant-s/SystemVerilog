//  Implicit : If we assign a real value to int variable, compiler will automatically covert it to int type. Vice versa is also possible.
// Explicit : <type>'(<expression>) where type is the target data type and expression are the data which we want to convert.
//  If we want to point the object handle 'a' of parent class to the child class, we need to do dynamic casting
// Implicit dynamic casting - assign a child class object to parent class handle
// Explicit - $cast(<target_object_handle>,<original_object_handle>);
// For downcasting, we need to ensure that the parent class is pointing to the child class object to which we need to do the typecasting. This means that it is only allowed if the parent object is pointing to an instance of the target class

class parent;
    virtual task print();
        $display("calling from parent class");
    endtask
endclass

class child extends parent;
    task print();
        $display("calling from child class");
    endtask
endclass

module tb;
  int a = 59.99;
  
  int b = int'(56.34); //converts real number to int
  int y = real'(99); //converts character to its ascii equivalent
  
   initial begin
     parent p, p1;
     child c1, c2;

     $display("a = %0d", a);
     $display("b = %0d", b);
     p = new();
     p1 = new();
     c1 = new();
     
     p.print();
     // legal assignment (upcasting)
     p = c1;
     p.print();
     
     // explicit dynamic casting (downcasting) - casting a base class reference to a derived class reference
     if($cast(c2,p1)) begin // Didnt use constructor for c2
       $display("casting was successfull!!");
       c2.print();
     end
     else
       $error("cast unsuccessfull!");
     
     if($cast(c2,p)) begin // Didnt use constructor for c2
       $display("casting was successfull!!");
       c2.print();
     end
     else
       $error("cast unsuccessfull!");    
   end
  
endmodule

/*
# KERNEL: a = 60
# KERNEL: b = 56
# KERNEL: calling from parent class
# KERNEL: calling from child class
# KERNEL: Error: testbench.sv (47): cast unsuccessfull!
# KERNEL: casting was successfull!!
# KERNEL: calling from child class
*/
