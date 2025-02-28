The given problem describes a scenario involving a digital system with four binary inputs (a, b, c, and d) and a single binary output. The system's behavior is specified based on certain input combinations corresponding to particular decimal values. Your task is to develop Verilog code that produces two distinct minimized logical representations of the system's output: one in Sum of Products (SOP) form and the other in Product of Sums (POS) form.

The specific requirements of the system are as follows:
1. The output should be logic-1 (true) for the decimal values 2, 7, or 15.
2. The output should be logic-0 (false) for the decimal values 0, 1, 4, 5, 6, 9, 10, 13, or 14.
3. The input conditions corresponding to the decimal values 3, 8, 11, and 12 are never encountered in this system. Thus, these conditions don’t need to be considered in your logic design.

As an example to illustrate the encoding of the inputs:
- The decimal value 7 corresponds to the binary combination 0111, which means a=0, b=1, c=1, and d=1.

Incorporate these conditions into a Verilog module named `top_module` with the respective inputs and outputs. Your objective is to determine and implement the minimized SOP and POS forms of the output logic inside this module.

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

Here is what you need to achieve:
1. Define and implement `out_sop` using the minimal Sum of Products (SOP) form based on the specified input conditions.
2. Define and implement `out_pos` using the minimal Product of Sums (POS) form based on the specified input conditions.

You will need to systematically analyze each input combination, apply Boolean algebra simplifications, or use appropriate Karnaugh maps to derive the simplified expressions for both SOP and POS forms. Finally, translate these expressions into Verilog code within the defined module structure.