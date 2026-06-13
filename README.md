# 🚗 AutoDriveX - Autonomous Vehicle Decision System (Verilog RTL)

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![Vivado](https://img.shields.io/badge/Tool-AMD%20Xilinx%20Vivado-green)
![FPGA](https://img.shields.io/badge/Target-FPGA-orange)
![Simulation](https://img.shields.io/badge/Simulation-Passed-brightgreen)

---

# 📖 Overview

AutoDriveX is a modular autonomous vehicle decision system developed using **Verilog HDL**. The design simulates the core decision-making logic of an autonomous vehicle by integrating obstacle detection, lane monitoring, speed control, sensor fusion, and motor control.

The project follows a hierarchical RTL design approach where each subsystem is implemented as an independent module and integrated through a top-level controller.

The complete design has been simulated, synthesized, and verified using **AMD Xilinx Vivado**.

---

# 🏗️ System Architecture

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
- Motor Controller
- Behavioral Simulation
- RTL Analysis
- Synthesized Design
- Resource Utilization Analysis
- Timing Verification

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
└── README.md
```

---

# 🧩 RTL Modules

## 1. Obstacle Detector

Detects the presence of an obstacle and determines whether a collision risk exists based on the measured distance.

**Inputs**
- obstacle_detected
- distance

**Output**
- collision_risk

---

## 2. Lane Detector

Monitors lane departure and generates steering correction requests.

**Inputs**
- lane_left
- lane_right

**Outputs**
- turn_left_req
- turn_right_req

---

## 3. Speed Controller

Monitors vehicle speed and compares it with the predefined speed limit.

**Inputs**
- speed
- speed_limit

**Outputs**
- accelerate_req
- brake_req

---

## 4. Sensor Fusion Engine

Combines information from all sensor modules and generates a single vehicle status.

Priority:

1. Emergency Stop
2. Turn Left
3. Turn Right
4. Brake
5. Move Forward

---

## 5. Decision Unit

Generates the final driving action according to the fused vehicle status.

Outputs:

- Move Forward
- Apply Brake
- Turn Left
- Turn Right
- Emergency Stop

---

## 6. Motor Controller

Converts decision signals into motor control outputs.

Outputs:

- move_forward
- apply_brake
- turn_left_motor
- turn_right_motor
- emergency_stop_motor

---

# 🧪 Testbench Verification

The behavioral testbench validates multiple driving scenarios.

### Test Cases

- Normal Driving
- Left Lane Drift
- Right Lane Drift
- Safe Obstacle Detection
- Collision Risk
- Over Speed
- Safe Speed Recovery
- Emergency Stop
- Return to Normal Driving

All scenarios were successfully verified through behavioral simulation.

---

# 📊 Results

The following outputs are available inside the **docs/** folder.

- Behavioral Waveform
- RTL Schematic
- Synthesized Schematic
- Resource Utilization Report
- Timing Summary

---

# 🛠️ Development Tools

- Verilog HDL
- AMD Xilinx Vivado
- Behavioral Simulation
- RTL Analysis
- Logic Synthesis

---

# 📈 FPGA Resource Utilization

| Resource | Utilization |
|----------|-------------|
| Slice LUTs | 8 |
| Slice Registers | 4 |
| Bonded IOB | 32 |

---

# ⏱️ Timing Summary

- Worst Negative Slack (WNS): No Timing Violations
- Total Negative Slack (TNS): 0 ns
- Worst Hold Slack (WHS): No Hold Violations
- Total Hold Slack (THS): 0 ns

**Note:** This project is a combinational RTL design without user-defined clock constraints.

---

# 🚀 Future Improvements

- Clocked FSM Architecture
- FPGA Hardware Implementation
- UART-Based Sensor Interface
- CAN Bus Communication
- Camera Sensor Integration
- VGA Dashboard
- AI-Based Obstacle Detection

---

# 🎯 Applications

- Autonomous Vehicle Control
- ADAS Research
- FPGA Design Practice
- RTL Design Learning
- Digital System Design
- Embedded Hardware Development

---

# 📚 Learning Outcomes

This project demonstrates practical experience in:

- Verilog RTL Design
- Modular Hardware Architecture
- Combinational Logic Design
- Sensor Fusion
- Hierarchical Design Methodology
- Functional Verification
- FPGA Design Flow
- Vivado Simulation and Synthesis

---

# 👨‍💻 Author

**Sai Balaji**

Electronics and Communication Engineering (ECE)

### Areas of Interest

- RTL Design
- FPGA Design
- VLSI
- Computer Architecture
- Digital System Design
- Embedded Systems
