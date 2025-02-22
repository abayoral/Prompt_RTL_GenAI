The scenario involves managing the water level in a large reservoir that provides water to its users. To monitor and control this water level, the system employs three vertical sensors strategically placed at intervals of 5 inches. The core objective is to maintain the water level at an optimal height by adjusting the input flow rate according to the sensor readings. Here is a detailed breakdown of the requirements:

1. **Sensor and Flow Rate Relationship:**
   - There are three sensors, named S_1, S_2, and S_3. These sensors detect different levels of water in the reservoir.
   - If the water level rises above the highest sensor, S_3, the input flow should be fully stopped, which means the flow rate should be zero.
   - Conversely, if the water falls below the lowest sensor, S_1, the input flow should be maximized. This is achieved by opening both the Nominal and Supplemental flow valves.

2. **Flow Rate Adjustments Based on Sensor Readings:**
   - When the water level is detected between sensors S_3 and S_2, only the first flow rate, FR1, should be activated.
   - If the water level is between sensors S_2 and S_1, both FR1 and FR2 should be asserted, indicating an increased input flow.
   - Below sensor S_1, all flow rates (FR1, FR2, and FR3) should be engaged, maximizing the flow into the reservoir.

3. **Flow Rate Adjustments Based on Previous Levels:**
   - The decision to open or close the Supplemental flow valve is influenced by the water level's trend:
     - If the preceding water level was lower than the current level, the nominal flow rate should proceed without additional flow increase.
     - If the previous level was higher than the current one, the flow rate should be increased beyond the nominal rate by opening the Supplemental flow valve, controlled by the delta FR.
   
4. **Design Challenge – Moore Machine:**
   - The task is to design a Moore finite state machine (FSM) that can handle these flow rate adjustments and manage state transitions efficiently.
   - The FSM should consider the three sensor inputs (S_1, S_2, and S_3) to determine the outputs, which are FR1, FR2, FR3, and delta FR. Each state of the FSM should clearly define the flow rate outputs.

5. **Reset Functionality:**
   - The FSM design must incorporate an active-high synchronous reset that, when triggered, resets the machine to a state as if the water had been below the lowest sensor for a prolonged period. This implies that no sensors should be asserted, and all four outputs should be active, simulating a scenario where maximum input flow is necessary.

Using this information, develop a clear state transition diagram and logic for the FSM, ensuring each state corresponds to a distinct combination of sensor readings and corresponding output operations.