As a senior Digital Design Engineer at a leading hardware design company, you have been assigned the crucial responsibility of developing a Verilog module that will serve as a 1-12 counter for a next-generation product. The performance and accuracy of this module are essential, as its success directly impacts the reputation of your computer hardware company within the competitive industry landscape.

With this context in mind, you need to address the design parameters for the counter. Specifically, you are required to create a counter that increments its value from 1 to 12, under the following operational controls and signals:

1. **Reset Input**: The counter must include a synchronous, active-high reset that will force the counter to reset to the value of 1 when activated.
   
2. **Enable Input**: The counter should only count when this input is high. If it is low, the counter should remain in its current state.

3. **Clock Input**: The counting operation must be triggered by a positive edge of the clock signal.

4. **Output (Q[3:0])**: The counter's current value should be outputted in a 4-bit format.

5. **Control Signals**: Additionally, you need to manage three control signals: 
   - `c_enable`: This signal will dictate whether the internal counter can count.
   - `c_load`: This signal will enable the parallel loading of a new value into the counter, with priority over the enable signal.
   - `c_d[3:0]`: This represents the 4-bit data input for the counter, which should allow for the verification of the counter's operational correctness.

The design will utilize a provided 4-bit binary counter module named `count4`, which requires specific inputs for enablement and loading. Your task is to instantiate this module within your design. You are also permitted to use logic gates as needed to manage the control signals effectively.

Given these considerations, your challenge involves not just coding the necessary hardware description in Verilog, but also ensuring that each component interacts correctly to create a robust counting mechanism that adheres to the specifications outlined above. How will you approach the design and implementation of the 1-12 counter in this context, taking into account the available components and the functional requirements?