Imagine you are a senior Digital Design Engineer working at a prominent hardware design company, where your expertise is crucial for developing high-performance, reliable digital systems. Your current assignment involves designing a Verilog module that implements a one-dimensional cellular automaton known as Rule 90. The successful execution of this module is vital for ensuring that the computer hardware produced by your company continues to be recognized as cutting-edge in the industry.

Rule 90 operates on a one-dimensional array of cells, where each cell can be either "on" (represented by a 1) or "off" (represented by a 0). The evolution of the system takes place over discrete time steps. At every time step, the new state of each cell is determined by performing an XOR (exclusive OR) operation on the states of its two neighboring cells. If we consider the immediate left and right neighbors of a cell, the rules can be detailed in a truth table as follows:

• When the left, center, and right cells are 1, 1, and 1, respectively, the center cell becomes 0.
• When the cells are 1, 1, and 0, the center cell becomes 1.
• When the cells are 1, 0, and 1, the center cell becomes 0.
• When the cells are 1, 0, and 0, the center cell becomes 1.
• When the cells are 0, 1, and 1, the center cell becomes 1.
• When the cells are 0, 1, and 0, the center cell becomes 0.
• When the cells are 0, 0, and 1, the center cell becomes 1.
• When the cells are 0, 0, and 0, the center cell becomes 0.

(The rule is named “Rule 90” because if you read the new state values as a binary number from the table (01011010), it corresponds to the decimal number 90.)

Your task in this project is to design a Verilog module named "top_module" that satisfies the following requirements:

1. The module should contain an array of 512 cells, represented as q[511:0].
2. With every clock cycle, the system should advance by one time step according to the Rule 90 logic defined above.
3. A "load" signal is provided as an input. When the load signal is active, the 512-cell register (q[511:0]) should be loaded with the input data provided through data[511:0].
4. When evaluating the next state for each cell, assume that the cells immediately outside the boundaries of the array (i.e., q[-1] and q[512]) are always considered to be 0 (off).

For clarification, consider the behavior of the system when the initial state of the 512 cells is set to represent a single "on" cell. In this scenario, the system will, over successive iterations, produce patterns reminiscent of half of a Sierpiński triangle. For example, starting with an initial state where only the center cell is on, the first few iterations would be:

    1
   10
  101
 1000
10100
100010
1010101
10000000

Your final Verilog module design should encapsulate this behavior. Please note that while your solution must appropriately set up the module structure, handle the load functionality, and implement the Rule 90 evolution logic, no specific solutions or code are provided here—focus solely on clearly outlining the problem requirements and expectations for the design.

Design the Verilog module accordingly, ensuring that it meets all of the guidelines outlined above.