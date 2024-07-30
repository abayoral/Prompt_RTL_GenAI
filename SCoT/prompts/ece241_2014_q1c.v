Chain of Thought:

1. **Understand the Requirements:**
    - We need to add two 8-bit 2's complement numbers, `a` and `b`, resulting in an 8-bit sum, `s`.
    - Additionally, we need to determine if there is a signed overflow. Signed overflow occurs when:
        - Adding two positive numbers results in a negative number.
        - Adding two negative numbers results in a positive number.

2. **Determine the Inputs and Outputs:**
    - Inputs: `a[7:0]`, `b[7:0]`
    - Outputs: `s[7:0]`, `overflow`

3. **Define Intermediate Signals:**
    - Compute the sum of `a` and `b`, which might initially be wider than 8 bits to check for overflow.
    - Determine the most significant bit of the numbers and the result to check sign change causing overflow.

4. **Implementing the Addition:**
    - Perform the addition of `a` and `b` using the addition operator.
    - Note that the sum should be confined to 8 bits.

5. **Detecting Overflow:**
    - Use the sign bits of `a`, `b`, and `s` to detect overflow.
    - The overflow can be detected if:
        - The sign of `a` and `b` are the same, but the sign of `s` differs.

6. **Structuring the Module:**
    - Start with the module declaration, specifying the inputs and outputs.
    - Use assign statements to implement the addition and overflow detection.
    - For overflow detection:
        - Compare the sign bits of `a`, `b` with the sign bit of `s`.
        - If `a` and `b` have the same sign, but `s` differs in sign, overflow has occurred.

So, putting it all together:

- Start by initializing the module declaration.
- Use an assign statement to perform the addition of `a` and `b` and assign the result to `s`.
- Use assign statements to check the conditions of overflow based on the sign bits:
    - Assign overflow based on the logical conditions derived from comparing the sign bits of `a`, `b`, and `s`.

This approach should compute the sum of two 8-bit numbers and determine if an overflow has occurred efficiently.