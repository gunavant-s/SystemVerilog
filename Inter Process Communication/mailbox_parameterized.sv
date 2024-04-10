// The parameterized mailbox can be put or get data of particular data_type.
// The parameterized mailbox is useful when data_type needs to be fixed. For differences in data_type, a compilation error is expected.


class transaction;
  randc bit [3:0] data1;
  randc bit [3:0] data2;
  
endclass


class generator;
  transaction dc;
  mailbox #(transaction) mbx; ///gen2drv
  
  function new(mailbox #(transaction) mbx); //Specifying mailbox with custom constructor
    this.mbx = mbx;
  endfunction
  
  task main();
    
    for(int i=0;i<10;i++) begin
      dc = new();
      if(dc.randomize()) begin
        dc.randomize();
      	mbx.put(dc); //Sends the data
        $display("[GEN] : SENT DATA : %0d %0d", dc.data1, dc.data2);
        #10;
      end
      else 
        $stop();
    end
  endtask
  
endclass
 

class driver;
  transaction dc;
  mailbox #(transaction) mbx;
   
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task main();
    
    forever begin
      mbx.get(dc);
      $display("[DRV] : RCVD DATA : %0d %0d", dc.data1, dc.data2);
      #10;
    end
  endtask
  
endclass
  

module tb; 
  generator gen;
  driver drv;
  mailbox #(transaction) mbx;
  
  initial begin
    mbx = new();
    gen = new(mbx);
    drv = new(mbx);
	
    fork 
      gen.main();
      drv.main();
    join
  end
endmodule
