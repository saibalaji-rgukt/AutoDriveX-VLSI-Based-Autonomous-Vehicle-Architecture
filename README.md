# 🚗 AutoDriveX - Autonomous Vehicle Decision System (Verilog RTL)

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![Vivado](https://img.shields.io/badge/Tool-Xilinx%20Vivado-green)
![FPGA](https://img.shields.io/badge/Target-FPGA-orange)
![Simulation](https://img.shields.io/badge/Simulation-Passed-brightgreen)
![License](https://img.shields.io/badge/License-MIT-yellow)

## 📖 Overview

AutoDriveX is a modular RTL design developed in **Verilog HDL** that models the decision-making logic of an autonomous vehicle.

The system continuously monitors:

- Obstacle Detection
- Vehicle Distance
- Lane Departure
- Vehicle Speed

Based on sensor inputs, the controller determines the appropriate driving action such as:

- Move Forward
- Apply Brake
- Turn Left
- Turn Right
- Emergency Stop

The project was designed, simulated, synthesized, and verified using **AMD Xilinx Vivado**.

---

# 🏗️ System Architecture

```

```
                    +----------------------+
                    |  Obstacle Detector   |
                    +----------+-----------+
                               |
                               |
                    +----------v-----------+
                    | Sensor Fusion Engine |
                    +----------+-----------+
                               ^
                               |
          +--------------------+-------------------+
          |                                        |
+---------v---------+                    +---------v---------+
|   Lane Detector   |                    | Speed Controller  |
+---------+---------+                    +---------+---------+
          |                                        |
          +--------------------+-------------------+
                               |
                               v
                     +-------------------+
                     |  Decision Unit    |
                     +---------+---------+
                               |
                               v
                     +-------------------+
                     | Motor Controller  |
                     +---------+---------+
                               |
                               v
                        Vehicle Outputs

```

---

# ✨ Features

- Modular Verilog RTL Design
- Obstacle Detection
- Lane Detection
- Speed Monitoring
- Sensor Fusion Logic
- Decision Making Unit
- Motor Control Logic
- Behavioral Simulation
- RTL Schematic
- Synthesized Design
- Resource Utilization Analysis
- Timing Analysis

---

# 📂 Project Structure

```text
AutoDriveX/
│
├── rtl/
│   ├── autodrivex_top.v
│   ├── obstacle_detector.v
│   ├── lane_detector.v
│   ├── speed_controller.v
│   ├── sensor_fusion_engine.v
│   ├── decision_unit.v
│   └── motor_controller.v
│
├── tb/
│   └── autodrivex_tb.v
│
├── docs/
│   ├── block_diagram.png
│   ├── waveform.png
│   ├── rtl_schematic.png
│   ├── synthesized_schematic.png
│   ├── utilization_report.png
│   └── timing_summary.png
│
├── README.md
└── LICENSE
```

---

# 🧩 RTL Modules

### Obstacle Detector

Detects collision risk using obstacle presence and distance.

**Inputs**

- obstacle_detected
- distance

**Output**

- collision_risk

---

### Lane Detector

Detects lane deviation and requests steering correction.

**Inputs**

- lane_left
- lane_right

**Outputs**

- turn_left_req
- turn_right_req

---

### Speed Controller

Monitors vehicle speed against a predefined speed limit.

**Inputs**

- speed
- speed_limit

**Outputs**

- accelerate_req
- brake_req

---

### Sensor Fusion Engine

Combines information from all sensors and generates a unified vehicle status.

Priority:

1. Collision Risk
2. Turn Left
3. Turn Right
4. Brake
5. Move Forward

---

### Decision Unit

Generates vehicle control decisions based on the fused sensor status.

Outputs:

- Move Forward
- Brake
- Turn Left
- Turn Right
- Emergency Stop

---

### Motor Controller

Converts decision signals into motor control outputs.

Outputs:

- move_forward
- apply_brake
- turn_left_motor
- turn_right_motor
- emergency_stop_motor

---

# 🧪 Test Scenarios

The testbench verifies the following scenarios:

- Normal Driving
- Left Lane Drift
- Right Lane Drift
- Obstacle Detection
- Collision Risk
- Over Speed
- Safe Speed Recovery
- Emergency Stop
- Return to Normal Driving

---

# 📊 Simulation Results

Behavioral Simulation successfully completed.

Included in **docs/**

- Behavioral Waveform
- RTL Schematic
- Synthesized Schematic
- Utilization Report
- Timing Summary

---

# 🛠️ Tools Used

- Verilog HDL
- AMD Xilinx Vivado 2025.2
- Behavioral Simulation
- RTL Analysis
- Synthesis
- Implementation

---

# 📈 Resource Utilization

| Resource | Usage |
|----------|-------|
| Slice LUTs | 8 |
| Slice Registers | 4 |
| Bonded IOB | 32 |

---

# ⏱️ Timing Summary

- WNS : No Timing Violations
- TNS : 0 ns
- WHS : No Hold Violations
- THS : 0 ns

*This project is a combinational RTL design without user-defined timing constraints.*

---

# 🚀 Future Improvements

- Clocked FSM Architecture
- FPGA Board Implementation
- UART Sensor Interface
- Camera Sensor Integration
- CAN Bus Communication
- VGA Dashboard
- AI-assisted Obstacle Detection

---

# 🎯 Applications

- Autonomous Vehicles
- ADAS Prototyping
- FPGA Learning
- RTL Design Practice
- Digital System Design

---

# 👨‍💻 Author

**Sai Balaji**

Electronics and Communication Engineering (ECE)

Interested in:

- RTL Design
- FPGA Design
- VLSI
- Computer Architecture
- Embedded Systems

---

# 📜 License

This project is licensed under the MIT License.
