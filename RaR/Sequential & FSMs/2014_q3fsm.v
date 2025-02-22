Imagine you hold the position of a senior Digital Design Engineer at a prominent hardware design company. You have been entrusted with a crucial task—developing a specific Verilog module that forms a part of an advanced, next-generation product. This module is fundamental and plays a key role in preserving your company's esteemed reputation within the competitive computer hardware industry. Therefore, understanding the assignment thoroughly is essential.

Your task involves designing a finite state machine (FSM) with two main inputs: `s` and `w`. Initially, upon reset, the FSM starts in a state referred to as state A. The condition for remaining in state A is straightforward: as long as `s = 0`, the FSM stays put in state A. However, once the input `s` turns to 1, the FSM transitions from state A to state B.

In state B, a critical sequence begins. The FSM must monitor the input `w` for exactly three consecutive clock cycles. During this period, you need to determine the number of cycles where `w = 1`. The FSM's objective in this sequence is to count instances where `w` equals 1, and if there are precisely two such instances in the three cycle window, an output, denoted as `z`, must be set to 1 in the cycle following these three clock cycles. Conversely, if the condition of two ones is not met, then `z` should be set to 0.

This process of monitoring and outputting based on `w` continues cyclically, evaluating `w` every subsequent set of three clock cycles. Your design should minimize the complexity by using as few states as possible. Importantly, note that the input `s` is only relevant while the FSM is in state A, compelling you to concentrate primarily on the input `w` in subsequent states.

Given these specifications and the accompanying timing diagram illustrating the expected output `z` for various sequences of `w`, your task is to utilize Verilog to build this FSM within the following module skeleton:

```verilog
module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
// Implement your code here

endmodule
```

Consider taking a strategic approach to translate this high-level description into an efficient, well-organized piece of code while ensuring that your FSM handles transitions correctly and adheres to the defined behavior.