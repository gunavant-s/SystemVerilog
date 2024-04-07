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
    ( wr == 1 ) <-> (oe == 0); 
  }
 
  constraint write_read { 
    if(wr == 1)
    {
      waddr inside {[11:15]};
      raddr == 0;
    }
      else
      {
      waddr == 0;
      raddr inside {[11:15]};  
      }    
  } 
endclass
 
module tb;
  generator g;
  
  initial begin
    g = new();
    
    for (int i = 0; i<15 ; i++) begin
      assert(g.randomize()) else $display("Randomization Failed");
      $display("Value of wr : %0b | oe : %0b |  raddr : %0d | waddr : %0d |", g.wr, g.oe,g.raddr, g.waddr);
    end    
  end
endmodule

/*
# KERNEL: Value of wr : 0 | oe : 1 |  raddr : 14 | waddr : 0 |
# KERNEL: Value of wr : 1 | oe : 0 |  raddr : 0 | waddr : 11 |
# KERNEL: Value of wr : 1 | oe : 0 |  raddr : 0 | waddr : 14 |
# KERNEL: Value of wr : 1 | oe : 0 |  raddr : 0 | waddr : 13 |
# KERNEL: Value of wr : 1 | oe : 0 |  raddr : 0 | waddr : 12 |
# KERNEL: Value of wr : 1 | oe : 0 |  raddr : 0 | waddr : 15 |
# KERNEL: Value of wr : 0 | oe : 1 |  raddr : 13 | waddr : 0 |
# KERNEL: Value of wr : 1 | oe : 0 |  raddr : 0 | waddr : 15 |
# KERNEL: Value of wr : 1 | oe : 0 |  raddr : 0 | waddr : 14 |
# KERNEL: Value of wr : 1 | oe : 0 |  raddr : 0 | waddr : 12 |
# KERNEL: Value of wr : 1 | oe : 0 |  raddr : 0 | waddr : 11 |
# KERNEL: Value of wr : 1 | oe : 0 |  raddr : 0 | waddr : 13 |
# KERNEL: Value of wr : 0 | oe : 1 |  raddr : 11 | waddr : 0 |
# KERNEL: Value of wr : 1 | oe : 0 |  raddr : 0 | waddr : 15 |
# KERNEL: Value of wr : 1 | oe : 0 |  raddr : 0 | waddr : 11 |
*/
