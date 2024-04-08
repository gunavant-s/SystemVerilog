// @ trigger event when we have a valid edge as compared to wait which triggers event when we have a valid level. 
// The level will stay constant for the current simulation time hence wait could sense an event any time during current simulation time while @ sense event only when signal level value changes from 0 to 1/ 1 to 0
// hence @ have a higher probability of missing an event as compared to wait.

module tb;
 event a1,a2;
  
  initial begin
    ->a1;
    ->a2;
  end
  
  initial begin
    wait(a1.triggered);
    $display("Event A1 Trigger"); // if our event is triggered it will execute next statement. Non blocking
    wait(a2.triggered);
    $display("Event A2 Trigger");
  end

endmodule

/*
# KERNEL: Event A1 Trigger
# KERNEL: Event A2 Trigger
*/

// module tb;
//  event a1,a2;
  
//   initial begin
//     ->a1;
//     ->a2;
//   end
  
//   initial begin
//     @(a1.triggered);
//     $display("Event A1 Trigger"); //blocking statement so the next statement wont execute until a1 is triggered. If a2 triggered first then both stmts wont execute
//     @(a2.triggered);
//     $display("Event A2 Trigger");
//   end
// endmodule
//Here no above statements are displayed as events are missed unlike in wait()
    
