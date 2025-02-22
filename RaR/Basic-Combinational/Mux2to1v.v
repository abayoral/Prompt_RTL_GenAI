As a Senior Digital Design Engineer at a prestigious hardware design firm, you have been assigned a crucial task to develop a significant Verilog module for a cutting-edge product. This task is vital as the success of this module will directly influence and uphold your company's esteemed reputation within the computer hardware industry. Your specific challenge is to design and implement a 100-bit wide, 2-to-1 multiplexer. This device needs to efficiently select between two 100-bit input signals, 'a' and 'b', based on the value of a single control signal, 'sel'. When the control signal, 'sel', is set to 0, the output should directly reflect the input 'a'. Conversely, when 'sel' is set to 1, the output should correspond to the input 'b'. You are encouraged to utilize the ternary operator (cond ? iftrue : iffalse) for its simplicity and readability advantages, to present your logic clearly within the module. Your implementation will be encapsulated within the provided module template, and it is expected that you precisely insert the appropriate code to fulfill these requirements within this framework:

```verilog
module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );

    // Insert your Verilog code for the 2-to-1 multiplexer here
    
endmodule
```

Ensure that your solution is robust, meets all specified conditions, and adheres to best practices in digital design to maintain and enhance the company's technological leadership in the industry.