// New data types are constructed from built-in types and other user-defined types using typedef, similar to
// SystemVerilog also provides a package construct to encapsulate typedef definitions and other definitions.
// Using user-defined types can prevent accidental mismatches in size or type

typedef logic [31:0] bus32;
typedef logic [63:0] bus64;

typedef enum {
  TRUE = 1,
  FALSE = 0
} bool;

module tb();
  bus32 a = 32'd429496729;
  bus64 b = 64'd4294967296;
  // bool check;
  
  initial begin
    while(TRUE) begin
      b = a*b;
      $display("Value : %0d, Time : %0t",b,$time());
      #10;
    end
  end
  
  initial begin
    #40;
    $finish();
  end 
endmodule

/*
Value : 1844674404793974784, Time : 0
Value : 15495265023462211584, Time : 10
Value : 7304910652261269504, Time : 20
Value : 12219123274981834752, Time : 30
*/
