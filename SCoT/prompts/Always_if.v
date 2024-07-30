Chain of Thought:

Understand the Requirements:
- A 2-to-1 multiplexer selects between two inputs (a and b) based on select signals (sel_b1 and sel_b2).
- The output should be b if both sel_b1 and sel_b2 are true.
- Otherwise, the output should be a.
- We need to implement this functionality twice: once using assign statements and once using a procedural if statement within an always block.

Determine the Inputs and Outputs:
- Inputs: a, b, sel_b1, sel_b2
- Outputs: out_assign, out_always

Define Intermediate Signals:
- No intermediate signals are needed since the logic can be directly applied in the assign statement and the always block.

Structuring the Module:
1. Start with the module declaration, specifying the inputs and outputs.
2. Implement the functionality using an assign statement:
   - Use a conditional (ternary) operator to set out_assign.
   - If both sel_b1 and sel_b2 are true, assign the value of b to out_assign.
   - Otherwise, assign the value of a to out_assign.
3. Implement the functionality using a procedural always block:
   - Create an always block triggered on changes to sel_b1, sel_b2, a, or b.
   - Inside the always block, use an if statement to check if both sel_b1 and sel_b2 are true.
   - If the condition is true, assign the value of b to out_always.
   - Otherwise, assign the value of a to out_always.

By following this logical structure, the 2-to-1 multiplexer can be implemented effectively using both assign and procedural if statements.