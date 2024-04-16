// Verilog-2001 added the always @* construct to automatically infer a complete sensitivity list, but in some cases, simulation and synthesis infer different lists.
// It waits until a change in signal list. always @* is only sensiive to the arguments of a function. Permits multiple process to write to same variable
// always_comb starts execution at zero time. Sensitive to changes within contents of function. Doesnt permit. Cr - https://www.youtube.com/watch?v=G0v-KwWh39o

//---------(1)------- 
module check;
  int a,b,c,y,z;
  //logic a,b,c,y,z;

  always @(a)
    y= a^b^c;
  
  always_comb
    z=a^b^c;
  
  initial begin 
    a=0;b=1;c=0;
    #5 a=0;b=0;c=1;
    #5 a=0;b=1;c=1;
    #5 a=1;b=1;c=1;
  end
  
  initial $monitor("| t=%0t  a=%0d,b=%0d,c=%0d | y=%0d | z=%0d |",$time,a,b,c,y,z);
endmodule
/*
In output y didnt change until #15 because only then there is a change in a. z changes for each interval.
# KERNEL: | t=0  a=0,b=1,c=0 | y=0 | z=1 |
# KERNEL: | t=5  a=0,b=0,c=1 | y=0 | z=1 |
# KERNEL: | t=10  a=0,b=1,c=1 | y=0 | z=0 |
# KERNEL: | t=15  a=1,b=1,c=1 | y=1 | z=1 | 
*/

//--------(2)--------
module check;
  logic a,b,c,y,z;
  
  function logic fun_call(logic c);
    return a|b|c;
  endfunction
  
  always @(*)
    y = fun_call(c); //y only changes if the c value changes, else y = previous value
  
  always_comb
    z=fun_call(c);
  
  initial begin 
    a=0;b=0;c=0;
    #5 a=1;
    #5 b=1;
    #5 c=1;
  end
  
  initial $monitor("| t=%0t  a=%0d,b=%0d,c=%0d | y=%0d | z=%0d |",$time,a,b,c,y,z);  
endmodule
/*
As the arguments of function is c, y changes only for changes in c. z changes for any changes in a,b,c.
# KERNEL: | t=0  a=0,b=0,c=0 | y=0 | z=0 |
# KERNEL: | t=5  a=1,b=0,c=0 | y=0 | z=1 |
# KERNEL: | t=10  a=1,b=1,c=0 | y=0 | z=1 |
# KERNEL: | t=15  a=1,b=1,c=1 | y=1 | z=1 |
*/

//------(3)--------- 
/*
module check;
  logic a,b,c,y,z;
  
  always @(*)
    y= a|b|c;
  
  always_comb
    y=a&b; // Error as always_comb doesnt allow multiple process to write in same variable.
  
  initial begin 
  a=0;b=0;c=0;
    #5 a=1;
    #5 b=1;
    #5 c=1;
  end
  
  initial $monitor("a=%0d,b=%0d,y=%0d z=%0d",a,b,y,z);
endmodule
*/
