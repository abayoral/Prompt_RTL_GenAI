Imagine you are a senior Digital Design Engineer employed at a top-tier hardware design company, renowned for pushing the boundaries of modern technology. You have been entrusted with the development of a critical component for an upcoming cutting-edge product. This task involves crafting a sophisticated Verilog module whose performance and reliability play an essential role in preserving the esteemed reputation of your computer hardware company within the competitive industry landscape.

In particular, your assignment involves creating a single D flip-flop using Verilog code. This component is crucial, as flip-flops are fundamental building blocks in digital circuits, enabling the storage and transfer of data across sequential circuits. The efficient and precise design of this module is imperative, as it impacts the overall performance of the product.

The module should include the following attributes:

1. **Input Specifications**:
   - The design should include an input signal, `clk`, representing the clock signal crucial in sequential circuits for timing purposes.
   - Another input signal, `d`, will represent the data input to be captured and transferred by the D flip-flop.

2. **Output Specifications**:
   - The design requires an output signal, `q`, which will hold and reflect the state of the flip-flop following each clock cycle's positive edge.

3. **Behavioral Requirements**:
   - Implement a clocked always block within your Verilog module.
   - Ensure that data `d` is copied to output `q` at each rising or positive edge of the clock signal `clk`.
   - It is critical to utilize non-blocking assignments within the clocked always block to accurately capture the flip-flop's behavior in response to the clock edges.

Your task is to encapsulate these functional requirements into a coherent module, ensuring the design is not only efficient and reliable but also aligns with industry best practices for digital circuit design. The success of this task directly influences the ability of your company to deliver on its promise of innovative and high-quality hardware solutions. Therefore, understanding the comprehensive structure and implementation nuances of this D flip-flop is vital in executing your responsibilities effectively.