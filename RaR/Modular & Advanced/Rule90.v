As a senior Digital Design Engineer at a leading hardware design company, you're tasked with developing a crucial Verilog module for an upcoming and highly significant product in the pipeline. The completion and performance of this particular module are absolutely critical to upholding the esteemed reputation of your company within the competitive computer hardware industry. In this context, you are to implement a Rule 90 cellular automaton using Verilog. Rule 90 is a fascinating one-dimensional cellular automaton characterized by its simplicity and intriguing patterns.

The behavior of Rule 90 is straightforward: you have a linear array of cells, each of which can either be in an "on" (represented as 1) or "off" (represented as 0) state. During each discrete time step, the future state of a cell is determined by calculating the XOR (exclusive OR) of its two immediate neighbors' current states. This can be represented in a truth table format, where a cell's next state is a function of its left neighbor, itself (the center), and its right neighbor. The specific transitions of Rule 90 are tabulated below:

- Left = 1, Center = 1, Right = 1 results in Center's next state = 0
- Left = 1, Center = 1, Right = 0 results in Center's next state = 1
- Left = 1, Center = 0, Right = 1 results in Center's next state = 0
- Left = 1, Center = 0, Right = 0 results in Center's next state = 1
- Left = 0, Center = 1, Right = 1 results in Center's next state = 1
- Left = 0, Center = 1, Right = 0 results in Center's next state = 0
- Left = 0, Center = 0, Right = 1 results in Center's next state = 1
- Left = 0, Center = 0, Right = 0 results in Center's next state = 0

An interesting point of trivia, "Rule 90" derives its name from the decimal equivalent of its next-state column: 01011010, which equals ninety in decimal form.

For this project, you're expected to create a digital circuit with a 512-cell system, denoted as q[511:0]. The system should progress by a single time step with each clock cycle. The 'load' input has a special role; it allows the system's state to be initialized with the provided 'data[511:0]' when activated. It is important to handle the system boundaries as well, specifically assuming that the states at locations q[-1] and q[512] are both zero (off), thereby simulating an infinite line of cells.

To illustrate how this cellular automaton evolves, consider starting with an initial state where all elements of q[511:0] are zero except the least significant bit, which is one. The initial state (q[511:0] = 1) will evolve as follows over the first few iterations:

1.     1
2.    10
3.   101
4.  1000

These iterations form an intriguing pattern known as half of a Sierpiński triangle, which is a known fractal.

In writing the Verilog code for this automaton, make sure your module, named `top_module`, comprises the essential port declarations: an input `clk` for the clock signal, an input `load` for loading initial data, an input vector `data` which holds the 512-bit wide initial state, and an output vector `q` which carries the 512-bit wide result of the current state after each clock cycle update. Craft the internal logic to embody the Rule 90 transitions accurately, using combinational logic for the cell state updates and edge-triggered storage to maintain the system's integrity across clock cycles.