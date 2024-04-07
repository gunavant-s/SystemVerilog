// On calling randomize(), pre_randomize() and post_randomize() functions will get called before and after the randomize call respectively
// Users can override the pre_randomize() and post_randomize() functions

class generator;
  randc bit [4:0] a,b;
  int min,max;
  
  function void pre_randomize(input int min,max);
    this.min = min;
    this.max = max;
  endfunction
  
  constraint data {
    a inside {[min:max]};
    b inside {[min:max]};
  };
  
  function void post_randomize();
    $display("Post randomize: a = %0d b = %0d",a,b);
  endfunction
  
endclass
    
module tb;
  generator g;
  
  initial begin
    g = new();
    
    for(int i=0;i<12;i++) begin
      g.pre_randomize($urandom_range(5,15),$urandom_range(16,31));
      g.randomize();
    end
  end
endmodule
