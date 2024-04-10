class transaction;
  randc bit [3:0] data1;
  randc bit [3:0] data2;
  
endclass

class generator;
  transaction dc;
  mailbox mbx; // gen2drv
  
  function new(mailbox mbx); //Specifying mailbox with custom constructor
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
  mailbox mbx;
   
  function new(mailbox mbx);
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
  mailbox mbx;
  
  
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
