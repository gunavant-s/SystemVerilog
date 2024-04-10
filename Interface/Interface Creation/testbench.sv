// Unlike Verilog that has module ports for communication, System Verilog provides an interface construct that simply contains a bundle of sets of signals. 
// This encapsulates signals and communicates with design, testbench components.
// 1. In Verilog for the addition of new signals, it has to be manually changed everywhere that module has been instantiated. System Verilog made it easier to add new signals in the interface block for existing connections.
// 2. It has increased re-usability across the projects.
// 3. A set of signals can be easily shared across the components bypassing its handle.
// 4. It provides directional information (modports) and timing information (clocking blocks).
// 5. Interfaces can contain parameters, variables, functional coverage, assertions, tasks and functions.
// 6. Interfaces can contain procedural initial and always blocks and continuous assign statements



interface add_if;
  logic [3:0] a;
  logic [3:0] b;
  logic [4:0] sum;
  
endinterface

module tb;
  add_if inf(); //Unlike handler in class, interface requires ()
  
  add dut (.a(inf.a),
           .b(inf.b),
           .sum(inf.sum)
          ); //Mapping by name
  /*
  add dut (inf.a,
           inf.b,
           inf.sum
          ); // Positional mapping
  */
  
  initial begin
    inf.a = 4;
    inf.b = 4;
    #10;
    inf.a = 5;
    inf.b = 6;
    #10;
    $finish();
  end
  
  always #10 $display("Sum : %0d | Time : %0d",inf.sum,$time());
endmodule
