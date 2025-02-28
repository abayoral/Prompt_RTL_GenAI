As a senior Digital Design Engineer at a leading hardware design company, you are given a critical task that involves developing a specific Verilog module for a next-generation hardware product. This module is a key component, and its successful execution is crucial for preserving the reputation and standing of your company in the competitive hardware industry. Your goal is to design a digital circuit in Verilog with the following specifications:

First and foremost, the module should accept a 3-bit binary input vector labeled as `vec`. This `vec` acts as the primary input to your circuit.

The module is required to produce several outputs based on the input vector `vec`. 

1. The first output is a direct replication of the input vector and should be represented as a 3-bit vector output named `outv`. Essentially, `outv` will mirror the 3-bit pattern of the `vec` input exactly as it is provided.

2. In addition to that, the module must generate three distinct 1-bit outputs. These outputs are named `o2`, `o1`, and `o0`, respectively. Each of these outputs is directly connected to and should represent one specific bit of the input vector `vec`.

    - Specifically, `o0` should be tied to the least significant bit (rightmost bit, position 0) of the `vec` input.
    - `o1` should be linked to the middle bit (position 1) of the `vec` input.
    - Finally, `o2` should be associated with the most significant bit (leftmost bit, position 2) of the `vec` input.

This required design essentially splits the 3-bit input vector into individual bits while also maintaining the integrity of the original vector through the mirrored output.

Design your module such that the functionality is correctly implemented, ensuring proper connections between the input vector and the respective outputs as specified. The body of the module should follow the module declaration where you will implement the necessary logic to achieve the described behavior.