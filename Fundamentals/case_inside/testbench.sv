class gen;
  randc bit [3:0] din;
endclass

module tb;
  reg [3:0] din;
  logic [1:0] encode;
  gen g;
  
  priority_encoder dut(
    .din(din), 
    .encode(encode)
  );
  
  initial begin
    g = new();
    forever begin
      if ($time() > 150)
    	$finish();
      else begin
        g.randomize();
        din = g.din;
        #10;
        $display("%0d %0d", din, encode);
      end
    end
  end
    
endmodule

/*
# KERNEL: 1 0
# KERNEL: 15 3
# KERNEL: 3 1
# KERNEL: 0 0
# KERNEL: 13 3
# KERNEL: 7 2
# KERNEL: 9 3
# KERNEL: 5 2
# KERNEL: 12 3
# KERNEL: 8 3
# KERNEL: 10 3
# KERNEL: 14 3
# KERNEL: 4 2
# KERNEL: 2 1
# KERNEL: 11 3
# KERNEL: 6 2
*/
