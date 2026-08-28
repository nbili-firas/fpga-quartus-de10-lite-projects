# Project 005 – FPGA Traffic Light Control System

## Project Overview

This project implements a complete **traffic light control system** using **Intel Quartus Prime Lite** and the **Terasic DE10-Lite FPGA Development Board**.

The system combines several reusable digital-design modules:

- Traffic light finite state machine
- 8-clock-cycle one-shot timer
- 22-clock-cycle one-shot timer
- 25-bit clock divider
- 5-bit counter
- Vehicle sensor input
- System reset control

The design controls traffic lights for a **main street** and a **side street**.

A simulated vehicle sensor determines when traffic is waiting on the side street. The finite state machine then coordinates the red, yellow, and green lights while timing each traffic-light phase.

The project demonstrates hierarchical FPGA design by integrating previously developed modules into one complete digital control system.

---

# System Requirements

The traffic-light controller was designed to satisfy the following timing requirements:

- The main street green light remains ON for a minimum of approximately 14 seconds when there are no vehicles on the side street.
- The side street green light remains ON while a vehicle is detected and transitions after the required timing conditions.
- Yellow lights remain ON for approximately 5 seconds before the corresponding street transitions to red.
- A vehicle sensor determines when traffic is waiting on the side street.
- A reset input initializes the controller to a known starting condition.

The initial condition is:

```text
Main Street: GREEN
Side Street: RED
```

---

# Traffic Light Outputs

The system contains six traffic-light outputs.

## Main Street

```text
MR = Main Red
MY = Main Yellow
MG = Main Green
```

## Side Street

```text
SR = Side Red
SY = Side Yellow
SG = Side Green
```

The vehicle sensor input is:

```text
VS
```

Additional inputs are:

```text
sysclock
reset
```

---

# FPGA Hardware

## Development Board

```text
Terasic DE10-Lite
```

## FPGA

```text
Intel MAX 10
10M50DAF484C6GES
```

## System Clock

```text
50 MHz
```

## Programming

```text
USB-Blaster
JTAG
```

---

# Software

The project was developed using:

- Intel Quartus Prime Lite
- VHDL
- Quartus Block Diagram/Schematic Editor
- Quartus Pin Planner
- Quartus Programmer
- Quartus Waveform Editor
- Hierarchical Block Design

---

# System Architecture

The traffic-light system combines several reusable FPGA modules.

```text
                     +----------------+
50 MHz sysclock ---->|   Counter25B   |
                     | Clock Divider  |
                     +-------+--------+
                             |
                             v
                         ~1.49 Hz
                             |
                +------------+-------------+
                |                          |
                v                          v
        +---------------+          +---------------+
        |   oneshot8    |          |   oneshot22   |
        | ~5.37 seconds |          | ~14.77 sec    |
        +-------+-------+          +-------+-------+
                |                          |
                +------------+-------------+
                             |
                             v
                     +----------------+
VS ----------------->| TrafficLights  |
reset -------------->|      FSM       |
                     +-------+--------+
                             |
          +------------------+------------------+
          |        |        |        |        |
          v        v        v        v        v
         MR       MY       MG       SR       SY       SG
```

---

# Timing System

The DE10-Lite provides a high-speed:

```text
50 MHz
```

system clock.

The project uses a 25-bit counter to reduce this clock to approximately:

```text
1.49 Hz
```

A 1.49 Hz signal generates approximately one pulse every:

```text
0.67 seconds
```

This slower clock is then used by the one-shot timing circuits.

---

# 8-Clock-Cycle One-Shot

The module:

```text
oneshot8.bdf
```

creates an approximately 8-cycle timing interval.

Using the 1.49 Hz timing clock:

```text
8 × 0.67114 seconds ≈ 5.37 seconds
```

This timing interval is used for the yellow-light phase.

The yellow light therefore remains active for approximately:

```text
5 seconds
```

before the next traffic-light transition.

---

# 22-Clock-Cycle One-Shot

The module:

```text
oneshot22.bdf
```

creates an approximately 22-cycle timing interval.

Using the 1.49 Hz clock:

```text
22 × 0.67114 seconds ≈ 14.77 seconds
```

This provides the longer timing interval required by the traffic-light controller.

---

# Reusable VHDL Modules

## TrafficLights.vhd

```text
TrafficLights.vhd
```

contains the traffic-light state-machine logic.

The FSM coordinates the six traffic-light outputs:

```text
MR
MY
MG
SR
SY
SG
```

based on:

- Current traffic-light state
- Vehicle sensor
- Timer completion signals
- Reset condition

---

## Counter25B.vhd

```text
Counter25B.vhd
```

implements the 25-bit clock divider used to reduce the DE10-Lite's 50 MHz clock.

This allows human-observable timing intervals to be generated from the high-speed FPGA clock.

---

## count5B.vhd

```text
count5B.vhd
```

implements the 5-bit counter used by the timing subsystem.

The counter supports the longer one-shot timing interval used by the traffic-light controller.

---

# Reusable BDF Modules

The project also includes the complete source BDF files for both one-shot circuits.

```text
oneshot8.bdf
oneshot22.bdf
```

Including the BDF source files is important because the traffic-light project uses these modules hierarchically.

---

# Top-Level Design

The final system is implemented in:

```text
TLSystem.bdf
```

The Quartus top-level entity is:

```text
TLSystem
```

The schematic integrates:

```text
TrafficLights
Counter25B
oneshot8
oneshot22
Vehicle Sensor
Reset
Traffic Light Outputs
```

This demonstrates hierarchical digital-system design in which multiple independently developed components are combined into one FPGA application.

---

# Traffic Sequence

The controller begins in a known condition after RESET.

## Initial State

```text
MAIN STREET
Red:    OFF
Yellow: OFF
Green:  ON

SIDE STREET
Red:    ON
Yellow: OFF
Green:  OFF
```

Therefore:

```text
Main = GREEN
Side = RED
```

---

# Vehicle Detection

The side-street vehicle sensor is represented by:

```text
VS
```

On the DE10-Lite board, the laboratory test uses:

```text
KEY0
```

to simulate vehicle detection.

When a vehicle is detected on the side street, the traffic-light controller begins the required timed transition.

---

# Main Street Transition

When a side-street vehicle is detected, the main street transitions from:

```text
GREEN
  ↓
YELLOW
  ↓
RED
```

The side street remains RED while the main street passes through its yellow transition.

---

# Side Street Transition

After the main street becomes RED, the side street transitions to:

```text
GREEN
```

When the vehicle is no longer detected and the appropriate timing condition is satisfied, the side street transitions:

```text
GREEN
  ↓
YELLOW
  ↓
RED
```

The main street then returns to:

```text
GREEN
```

---

# Complete Traffic Sequence

```text
Main GREEN / Side RED
          |
          | Vehicle detected
          v
Main YELLOW / Side RED
          |
          | Yellow timer
          v
Main RED / Side GREEN
          |
          | Vehicle clears / timer condition
          v
Main RED / Side YELLOW
          |
          | Yellow timer
          v
Main GREEN / Side RED
```

The cycle then repeats whenever another vehicle is detected.

---

# Reset Operation

The system reset is represented by:

```text
reset
```

The laboratory implementation uses:

```text
KEY1
```

for system reset.

Reset places the controller into the known starting condition:

```text
Main Street = GREEN
Side Street = RED
```

This ensures predictable system behavior before the traffic-light controller goes live.

---

# DE10-Lite I/O

The laboratory implementation uses the DE10-Lite LEDs to represent the traffic lights.

| FPGA Signal | Function |
|---|---|
| `MR` | Main street red |
| `MY` | Main street yellow |
| `MG` | Main street green |
| `SR` | Side street red |
| `SY` | Side street yellow |
| `SG` | Side street green |
| `VS` | Vehicle sensor |
| `reset` | System reset |
| `sysclock` | 50 MHz clock |

The project uses:

```text
3.3-V LVTTL
```

for the required FPGA I/O.

---

# Physical FPGA Pin Assignments

The final Quartus project contains the following assignments:

| Signal | FPGA Pin |
|---|---|
| `MG` | `PIN_A10` |
| `MR` | `PIN_A8` |
| `MY` | `PIN_A9` |
| `reset` | `PIN_A7` |
| `SR` | `PIN_B10` |
| `SG` | `PIN_C13` |
| `SY` | `PIN_D13` |
| `sysclock` | `PIN_P11` |
| `VS` | `PIN_B8` |

---

# Development Workflow

```text
Traffic Light Requirements
          |
          v
TrafficLights FSM
          |
          +----------------+
          |                |
          v                v
     oneshot8          oneshot22
     ~5.37 sec         ~14.77 sec
          |                |
          +--------+-------+
                   |
                   v
              Counter25B
                   |
                   v
             1.49 Hz Clock
                   |
                   v
             TLSystem.bdf
                   |
                   v
           Hierarchical Design
                   |
                   v
             Pin Assignment
                   |
                   v
               Compile
                   |
                   v
          USB-Blaster / JTAG
                   |
                   v
            DE10-Lite FPGA
                   |
                   v
          Hardware Verification
```

---

# Hardware Testing Procedure

The completed system can be tested using the DE10-Lite controls.

## Step 1 – Reset

Press the reset control.

Expected result:

```text
Main Street = GREEN
Side Street = RED
```

## Step 2 – Detect Vehicle

Press and hold the vehicle-sensor control.

The controller detects a vehicle waiting on the side street.

## Step 3 – Main Street Yellow

The main street transitions:

```text
GREEN → YELLOW
```

while the side street remains:

```text
RED
```

## Step 4 – Side Street Green

After the required timing interval:

```text
Main Street = RED
Side Street = GREEN
```

## Step 5 – Clear Vehicle Sensor

Release the vehicle-sensor control.

This represents the vehicle leaving the side street.

## Step 6 – Side Street Yellow

After the appropriate interval:

```text
Main Street = RED
Side Street = YELLOW
```

## Step 7 – Return to Initial State

After the yellow timing interval:

```text
Main Street = GREEN
Side Street = RED
```

The system is now ready for another vehicle-detection cycle.

---

# Project Files

## Quartus

The complete FPGA source is located in:

```text
Quartus/
```

Important source files include:

| File | Purpose |
|---|---|
| `TLSystem.qpf` | Quartus project |
| `TLSystem.qsf` | FPGA configuration and pin assignments |
| `TLSystem.bdf` | Final traffic-light system |
| `TLSystem.bsf` | Traffic-light system symbol |
| `TrafficLights.vhd` | Traffic-light FSM |
| `Counter25B.vhd` | 25-bit clock divider |
| `count5B.vhd` | 5-bit counter |
| `oneshot8.bdf` | 8-cycle timer source |
| `oneshot22.bdf` | 22-cycle timer source |
| `Waveform.vwf` | Waveform file |
| `DE10_LITE_Golden_Top.v` | DE10-Lite reference source |

---

# Screenshots

Development screenshots are available in:

```text
Screenshots/
```

They document the Quartus design, compilation, FPGA configuration, and programming process.

---

# Hardware Demonstration

The physical FPGA demonstration is located in:

```text
Hardware/
```

Video:

```text
DE10-Lite-Traffic-Light-System-Demo.mov
```

The video demonstrates the traffic-light controller operating on the physical DE10-Lite board.

---

# Skills Demonstrated

## FPGA Development

- Intel MAX 10 FPGA
- Terasic DE10-Lite
- FPGA Programming
- Hierarchical FPGA Design
- Digital I/O
- Clock Division

## Digital Logic

- Finite State Machines
- Traffic-Light Controllers
- Sequential Logic
- Digital Timing
- Counters
- One-Shot Timers
- Reset Logic
- Sensor-Based Control

## VHDL

- VHDL Design
- Reusable HDL Modules
- Counter Design
- FSM Integration
- Hierarchical Components

## Quartus Prime Lite

- Project Configuration
- Block Diagram/Schematic Editor
- VHDL Integration
- Block Symbols
- Pin Planner
- Compilation
- Waveform Tools
- Quartus Programmer

## Hardware Verification

- USB-Blaster
- JTAG
- LED Output Testing
- Pushbutton Inputs
- Vehicle Sensor Simulation
- Physical FPGA Validation

---

# What I Learned

This project strengthened my understanding of hierarchical FPGA design by combining multiple reusable digital components into one complete control system.

Rather than implementing only one isolated circuit, the project required the integration of a traffic-light finite state machine, clock divider, counters, and one-shot timers.

I also gained practical experience designing timing behavior from a high-frequency FPGA clock. The 50 MHz system clock was reduced to approximately 1.49 Hz, allowing the digital timing circuits to produce approximately 5-second and 15-second traffic-light intervals.

The project demonstrated how FPGA systems can respond to external inputs such as vehicle sensors while maintaining controlled sequential timing and safe output transitions.

Most importantly, it demonstrated the complete engineering workflow from reusable HDL modules and schematic integration through compilation, FPGA pin mapping, JTAG programming, and physical hardware verification.

---

# Conclusion

Project 005 demonstrates a complete FPGA-based traffic-light control system implemented on the Terasic DE10-Lite.

The design integrates:

```text
TrafficLights.vhd
Counter25B.vhd
count5B.vhd
oneshot8.bdf
oneshot22.bdf
```

into the final:

```text
TLSystem.bdf
```

The system controls two sets of red, yellow, and green traffic lights while responding to a simulated side-street vehicle sensor.

By combining finite state machines, one-shot timers, counters, clock division, VHDL, hierarchical schematics, FPGA I/O, and physical hardware testing, the project demonstrates practical experience designing a complete sequential digital control system.
