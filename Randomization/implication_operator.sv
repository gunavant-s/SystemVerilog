//Chip enable
//Reset

class generator;  
  randc bit [3:0] a;
  rand bit ce;
  rand bit rst;
  
  constraint control_rst {
    rst dist {0:= 80, 1 := 20};
  }
  
  constraint control_ce {
    ce dist {1:= 80, 0 := 20};
  }
  
  constraint control_rst_ce {
    ( rst == 0 ) -> (ce == 1); 
    // In implication operator as long as "rst = 0" the "ce = 1". Else ce = 0 or 1.
  }
endclass
 
module tb;
  generator g;
  
  initial begin
    g = new();
    
    for (int i = 0; i<10 ; i++) begin
      assert(g.randomize()) else $display("Randomization Failed");
      $display("Value of rst : %0b and ce : %0b", g.rst, g.ce);
    end
  end
endmodule

/*
# KERNEL: Value of rst : 0 and ce : 1
# KERNEL: Value of rst : 1 and ce : 0
# KERNEL: Value of rst : 0 and ce : 1
# KERNEL: Value of rst : 0 and ce : 1
# KERNEL: Value of rst : 1 and ce : 1
# KERNEL: Value of rst : 0 and ce : 1
# KERNEL: Value of rst : 0 and ce : 1
# KERNEL: Value of rst : 0 and ce : 1
# KERNEL: Value of rst : 1 and ce : 1
# KERNEL: Value of rst : 0 and ce : 1
*/
