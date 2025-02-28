Imagine you are a highly experienced Digital Design Engineer working for a top hardware design firm. Your task is to develop a critical Verilog module that will be an integral part of a next-generation product. The flawless performance of this module is essential to preserve your company's esteemed reputation within the industry.

Your current challenge focuses on a specific Karnaugh map, for which you are to create a circuit implementation. This implementation must use exactly one 4-to-1 multiplexer, along with as many 2-to-1 multiplexers as necessary—but you should aim to minimize their number. Importantly, no other types of logic gates may be used in this design. Additionally, you must adhere strictly to the requirement that signals named "a" and "b" serve as the selector inputs for the 4-to-1 multiplexer, as depicted in the provided multiplexer diagram.

The Karnaugh map provided has its rows and columns associated with variables c, d, a, and b as follows:

  Columns (combination of a and b): a'b', a'b, ab, ab'  
  Rows (combination of c and d):  
   Row 1: c'd' values: 1 0 0 1  
   Row 2: c'd values: 0 0 0 0  
   Row 3: cd values: 1 1 1 0  
   Row 4: cd' values: 1 1 0 1

Your objective is to design and implement only the segment of the circuit labeled "top_module." This module should integrate seamlessly with the 4-to-1 multiplexer so that the overall circuit faithfully realizes the logic represented by the above Karnaugh map.

The Verilog module header is provided as:

  module top_module (
   input c,
   input d,
   output [3:0] mux_in
  );

In your implementation, you are expected to insert the necessary code in place of the comment, taking into account all the constraints and design requirements mentioned above.

This restated and expanded version emphasizes that you must carefully translate the Karnaugh map into a Verilog code structure using only multiplexers as specified, ensuring full compliance with the input and output constraints, as well as the selection input usage for the 4-to-1 multiplexer.