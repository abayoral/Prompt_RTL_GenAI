Imagine you are a senior Digital Design Engineer working at an esteemed hardware design firm, responsible for designing a foundational Verilog module for an upcoming state-of-the-art product. The effectiveness and reliability of this module are crucial to the company, as its seamless operation is integral to the preservation of your hardware company's esteemed reputation within the competitive industry landscape.

You have been presented with a digital system characterized by four inputs: a, b, c, and d. This system produces a single output, and the logic that determines this output is based on specific combinations of the inputs. The system is designed to output a logic-1 under very specific conditions: when the binary representation of the inputs corresponds to the decimal numbers 2, 7, or 15. In contrast, the system is configured to output a logic-0 when the inputs represent the numbers 0, 1, 4, 5, 6, 9, 10, 13, or 14. Notably, the conditions for the numbers 3, 8, 11, and 12 will never occur within the operation of this system, meaning such scenarios do not need to be addressed in your design. For instance, the binary representation for the number 7, which results in a logic-1, would have inputs a, b, c, and d set to 0, 1, 1, 1, respectively.

Your task is to derive the output signals out_sop and out_pos for this digital system. Specifically, you need to express the output out_sop in its simplest Sum of Products (SOP) form, and the output out_pos in its simplest Product of Sums (POS) form. This involves deriving the most efficient logical expression that defines the relationship between the inputs and the desired outputs, optimizing logic gate usage in the process. You are expected to implement this logic within a Verilog module, named `top_module`, which should include the specified inputs and outputs.

```verilog
module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
);

// Insert your code here

endmodule
```

This task not only requires technical expertise in designing digital logic circuits but also a strategic approach in ensuring your module adheres to optimal design principles while contributing positively to the innovative efforts of your company.