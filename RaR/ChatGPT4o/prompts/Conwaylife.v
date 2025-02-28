Conway’s Game of Life is a well-known two-dimensional cellular automaton simulation where each cell on the grid can either be alive, denoted by 1, or dead, denoted by 0. This simulation follows certain rules based on the number of neighboring cells that are alive, resulting in a dynamic game that evolves over a series of time steps. Specifically, the rules for changing a cell's state are as follows:

1. If a cell has 0 or 1 neighboring cells that are alive, it will become dead (0) in the next state.
2. If a cell has exactly 2 neighboring cells that are alive, its current state remains unchanged in the next state.
3. If a cell has exactly 3 neighboring cells that are alive, it will become alive (1) in the next state.
4. If a cell has 4 or more neighboring cells that are alive, it will become dead (0) in the next state.

This simulation is intended for an endless or infinite grid, but, practically speaking, we implement it on a finite 16x16 grid, with an interesting twist: the grid is a toroid (or torus), which means it wraps around at the edges. Thus, the cell located in the top-left corner, specifically at position (0,0), for instance, has neighbors even at what would be considered the opposite side of the grid, making the grid behave continuously.

For implementation, the 16x16 grid of cells is encapsulated within a 256-length vector, where consecutive segments or sub-vectors of 16 cells each represent rows 0 to 15. The sub-vector q[15:0] corresponds to the first row, q[31:16] to the second, and continues in this manner for all the rows. SystemVerilog allows defining this in a 2D vector format for ease of handling.

In this setup:
- A ‘load’ signal is used to load initial data into the vector ‘q’ at the next clock edge.
- ‘q’ encapsulates the current state of the grid and updates every clock cycle, advancing the simulation by one timestep.

A familiar test scenario for understanding boundary behavior, notably on this toroidal grid, is the "blinker" configuration. This is represented by placing 3 cells alive in a row such as 256'h0000...0007 (with '7' representing the first three cells being 1s, since 7 in binary is 111). The blinker alternates between a horizontal and vertical line, particularly when it's placed at the wraparound boundary of the grid, highlighting how the edges interact in our toroidal model. 

Given this setup, how would you implement the required module?