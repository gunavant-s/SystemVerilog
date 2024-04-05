//Create a task that will generate stimulus for addr , wr, and en signal as mentioned in a waveform of the Instruction tab. 
//Assume address is 6-bit wide while en and wr both are 1-bit wide. The stimulus should be sent on a positive edge of 25 MHz clock signal.
//https://www.udemy.com/course/complete-systemverilog-for-rtl-verification-part-1/learn/practice/1370462

module tb;
  reg clk = 0;
  bit [5:0] addr;
  bit en = 0,wr = 0;
  
  always #20 clk = ~clk;
  
  task stimuli();
    @(posedge clk);
    en=1;
    wr=1;
    addr = 6'hc;
    #20; //40
    addr = 6'he;
    #20; //60ns
    wr=0;
    addr = 6'h17;
    #20; //80ns
    addr = 6'h30;
    #20; //100ns
    addr = 6'h38;
    en=0;
    #40; //140ns
    en = 1;
  endtask
  
  initial begin
    $monitor(addr,en,wr);
    stimuli();
  end
  
  initial begin 
    #145;
    $finish();
  end
  
  initial begin
	$dumpfile("dump.vcd");
	$dumpvars;
  end
endmodule
