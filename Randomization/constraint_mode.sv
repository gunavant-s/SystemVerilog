
class generator;
  randc bit [3:0] raddr, waddr;
  rand bit wr; ///write to mem
  rand bit oe; ///output enable
  
  constraint wr_c {
    wr dist {0:= 50, 1 := 50};
  }
   
  constraint oe_c {
    oe dist {1:= 50, 0 := 50};
  }
  
  constraint wr_oe_c {
    ( wr == 1 ) -> (oe == 0); // implication operator
  }
endclass

module tb;
  generator g;
  
  initial begin
    g = new();
   
    g.wr_oe_c.constraint_mode(0); ///1 -> COnstraint is on // 0-> constraint is off 
    $display("Constraint Status oe_c : %0d",g.wr_oe_c.constraint_mode()); // unlike in pre_randomize and post_randomize we can't change the behaviour
    for (int i = 0; i<20 ; i++) begin
      assert(g.randomize()) else $display("Randomization Failed");
      $display("Value of wr : %0b | oe : %0b | ", g.wr, g.oe);
    end  
  end
endmodule

/*
# KERNEL: Constraint Status oe_c : 0
# KERNEL: Value of wr : 0 | oe : 1 | 
# KERNEL: Value of wr : 0 | oe : 1 | 
# KERNEL: Value of wr : 0 | oe : 1 | 
# KERNEL: Value of wr : 1 | oe : 1 | 
# KERNEL: Value of wr : 0 | oe : 1 | 
# KERNEL: Value of wr : 1 | oe : 1 | 
# KERNEL: Value of wr : 0 | oe : 1 | 
# KERNEL: Value of wr : 0 | oe : 0 | 
# KERNEL: Value of wr : 1 | oe : 1 | 
# KERNEL: Value of wr : 1 | oe : 1 | 
# KERNEL: Value of wr : 1 | oe : 0 | 
# KERNEL: Value of wr : 1 | oe : 0 | 
# KERNEL: Value of wr : 1 | oe : 0 | 
# KERNEL: Value of wr : 1 | oe : 0 | 
# KERNEL: Value of wr : 1 | oe : 1 | 
# KERNEL: Value of wr : 1 | oe : 1 | 
# KERNEL: Value of wr : 1 | oe : 0 | 
# KERNEL: Value of wr : 1 | oe : 1 | 
# KERNEL: Value of wr : 1 | oe : 0 | 
# KERNEL: Value of wr : 1 | oe : 1 | 
*/
