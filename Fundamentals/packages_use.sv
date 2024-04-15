// Packages provide a declaration space that can be referenced from any design module, as well as from verification code.
// SystemVerilog also allows package chaining, which simplifies using packages that reference items from other packages.
// A parameter defined in a package cannot be redefined, and is treated the same as a localparam.
// Also note that synthesis requires that tasks and functions defined in a package be declared as automatic
// Definitions within a package : Explicit package reference, Explicit import reference, Wildcard import statement
// Explicit references of a package item use the package name followed by ::.  An explicit package reference must be used each time the definition is used within the module
// Explicit imports of a package item use an import statement. Once imported, that item can be referenced any number of times within the module.
// Wildcard imports use an asterisk to represent all definitions within the package. Wildcard imports make all items of the package visible within a module.

package alu_types;
  localparam DELAY = 1;
  typedef logic [31:0] bus32_t;
  typedef logic [63:0] bus64_t;
  typedef enum logic [3:0] {ADD, SUB, MUL, DIV} opcode_t;

  typedef struct {
    bus32_t i0, i1;
    opcode_t opcode;
  } instr_t;

  function automatic logic parity_gen(input d);
  	return ^d;
  endfunction
endpackage

package alu_addr;
  typedef logic [15:0] bus16_t;
  typedef logic [7:0] bus8_t;													
endpackage

module alu
  import alu_types::bus32_t; // Explicit import statement
  import alu_addr::*;// Wildcard import statement
  (input alu_types::instr_t instruction, // use package item in port list
  output alu_types::bus64_t result );
  
  alu_types::bus64_t temp64; // use package item within module
  // Explicit package reference
  
  bus32_t temp32;
  
  bus16_t temp16 = 16'd90;
  bus8_t temp8 = 8'd8;
endmodule
