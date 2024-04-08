// Trigger ->
// edge sensitive blocking @()
// level sensitive non-blocking wait() to wait at level

module tb;
  event a; // declare an event a
  
  initial begin
    #10; // default time for trigger is 1ns
    -> a; //here a is triggered
  end
  
  initial begin
    @(a); 
    // wait(a.triggered);// waits until event is triggered
    $display("Event is triggered at %0d",$time);
  end  
endmodule

//Event is triggered at 10
