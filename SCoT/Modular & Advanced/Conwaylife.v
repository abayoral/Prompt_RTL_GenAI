Conway's Game of Life is a fascinating and well-known example of a two-dimensional cellular automaton, where the evolution of a grid of cells is determined by specific rules based on the states of neighboring cells. The grid is conceptualized as infinite, but for practical and computational purposes, it is constrained to a specific size, in this case, a 16x16 grid. Additionally, this grid behaves like a toroid, meaning the edges of the grid conceptually wrap around, creating cyclic boundaries rather than having hard edges.

The rules for cell state transition in this version of the Game of Life are as follows:
1. If a cell has 0 or 1 neighbor that is alive (state of 1), the cell will transition to a dead state (state of 0).
2. If a cell has exactly 2 neighbors that are alive, the cell's state remains unchanged.
3. If a cell has exactly 3 neighbors that are alive, the cell will become or remain alive (state of 1).
4. If a cell has 4 or more neighbors that are alive, it will transition to a dead state (state of 0).

For this particular scenario, the 16x16 grid is represented as a single-dimensional vector of length 256, with each row of the grid represented by a sub-vector of 16 elements. The first 16 elements (indices 0 to 15) of the vector correspond to the first row of the grid, the next 16 elements (indices 16 to 31) correspond to the second row, and so on.

In the provided SystemVerilog module template, the goal is to implement the logic that updates the grid based on the Game of Life rules at each clock cycle. The inputs include a clock signal ('clk') to drive the updates, a 'load' signal to load initial data into the grid, and a 'data' input representing the initial state of the grid. The output is a vector 'q' representing the current state of the grid after each update.

A notable test case is the "blinker" pattern, which alternates between a horizontal line and a vertical line of three consecutive alive cells. This test case, represented by the hexadecimal number 256'h7, involves placing three consecutive alive cells in the first row (columns 0 to 2). When the simulation runs, the pattern will oscillate each clock cycle due to the wrapping properties of the toroidal grid.

The task is to complete the SystemVerilog module to correctly implement this evolving pattern according to the Game of Life rules, ensuring the grid updates accurately each clock cycle, and properly handles the incoming data load when required.