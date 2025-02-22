Imagine that you are a seasoned Digital Design Engineer working at a top-tier hardware design company. Your current assignment involves developing a crucial Verilog module that will play a significant role in your company's latest product line. The success of this module is critical to uphold and enhance your company's esteemed reputation in the competitive computer hardware industry.

In this scenario, your task is to design a circuit that functions as an 8x1 memory. This memory will have a unique characteristic where writing data involves shifting bits into the memory, akin to how a shift register operates. On the other hand, reading from the memory will feature "random access" capabilities, similar to conventional RAM systems. The challenge is to then utilize this circuit design to execute a specific 3-input logic function.

Begin by creating an 8-bit shift register that is comprised of eight D-type flip-flops. The outputs of these flip-flops will be denoted as Q[0] through Q[7]. The input to this shift register is termed as S, which is wired directly into the input of Q[0]. Here, the most significant bit (MSB) is the first to be shifted into the register. There is also an enable input that determines when shifting should occur.

Next, expand your circuit by incorporating three extra inputs, labeled A, B, and C, as well as an output labeled Z. The operation of this extended circuit should adhere to a specific pattern: when the inputs ABC are 000, the output Z should be equal to Q[0]; when ABC is 001, Z should match Q[1]; and this pattern continues up to ABC being 111, where Z should equate to Q[7]. 

To achieve this, ensure that your circuit design relies solely on the 8-bit shift register and multiplexers, without introducing any additional components. It's important to note that this configuration is known as a 3-input look-up-table (LUT) within digital design realms.

Your final objective is to encapsulate this functionality within a Verilog module. The module you are to complete has already been partially defined, including the input and output parameters. As you work on this design, focus on integrating the components in a way that fulfills the operational requirements described.

Here's the starting code outline:

```
module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

    // Insert your detailed code here to implement the desired functionality

endmodule
```

Devote attention to preparing a solution that meets these specifications, effectively utilizing the shift register and multiplexers, and implementing the desired random access read functionality, reflective of a 3-input LUT.