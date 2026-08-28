# Project 005 – DE10-Lite Traffic Light Hardware Demonstration

## Overview

This folder contains the physical hardware demonstration of **Project 005 – FPGA Traffic Light Control System**.

The traffic-light controller was implemented on the:

```text
Terasic DE10-Lite FPGA Development Board
```

using an:

```text
Intel MAX 10 FPGA
```

The demonstration verifies that the integrated traffic-light state machine and timing circuits operate on physical FPGA hardware.

---

# Demonstration Video

```text
DE10-Lite-Traffic-Light-System-Demo.mov
```

The video demonstrates the completed traffic-light control sequence on the DE10-Lite board.

---

# Hardware Platform

```text
Board: Terasic DE10-Lite
FPGA Family: Intel MAX 10
Device: 10M50DAF484C6GES
System Clock: 50 MHz
Programming: USB-Blaster
Mode: JTAG
```

---

# Traffic Lights

The DE10-Lite LEDs simulate two sets of traffic lights.

## Main Street

```text
MR = Red
MY = Yellow
MG = Green
```

## Side Street

```text
SR = Red
SY = Yellow
SG = Green
```

---

# Vehicle Sensor

The input:

```text
VS
```

represents a vehicle sensor located on the side street.

For laboratory testing, the vehicle sensor is simulated using:

```text
KEY0
```

Pressing the control indicates that a vehicle is waiting on the side street.

---

# System Reset

The reset input initializes the traffic-light system.

The laboratory procedure uses:

```text
KEY1
```

to place the controller into its known starting state.

After reset:

```text
Main Street = GREEN
Side Street = RED
```

---

# Normal Traffic Sequence

The initial condition is:

```text
MAIN: GREEN
SIDE: RED
```

When a side-street vehicle is detected:

```text
MAIN GREEN / SIDE RED
          |
          v
MAIN YELLOW / SIDE RED
          |
          v
MAIN RED / SIDE GREEN
```

After the side-street vehicle clears:

```text
MAIN RED / SIDE GREEN
          |
          v
MAIN RED / SIDE YELLOW
          |
          v
MAIN GREEN / SIDE RED
```

The system then waits for the next vehicle.

---

# Timing

The FPGA uses a:

```text
50 MHz
```

system clock.

The `Counter25B` module reduces this clock to approximately:

```text
1.49 Hz
```

or approximately:

```text
0.67 seconds per timing pulse
```

---

# Yellow-Light Timer

The:

```text
oneshot8
```

module uses eight timing pulses.

Therefore:

```text
8 × 0.67114 ≈ 5.37 seconds
```

This provides the approximately five-second yellow-light timing interval.

---

# Long-Duration Timer

The:

```text
oneshot22
```

module uses 22 timing pulses.

Therefore:

```text
22 × 0.67114 ≈ 14.77 seconds
```

This provides the longer traffic-control timing interval.

---

# Hardware Architecture

```text
                  DE10-Lite
                  50 MHz CLK
                      |
                      v
                Counter25B
                      |
                      v
                   1.49 Hz
                      |
             +--------+--------+
             |                 |
             v                 v
         oneshot8          oneshot22
         ~5.37 sec         ~14.77 sec
             |                 |
             +--------+--------+
                      |
                      v
                TrafficLights
                      |
       +--------------+--------------+
       |                             |
       v                             v
 Main Street LEDs              Side Street LEDs
   MR MY MG                       SR SY SG
```

---

# Hardware Testing Procedure

## 1. Initialize the System

Activate RESET.

Expected condition:

```text
MG = ON
SR = ON
```

Therefore:

```text
Main Street = GREEN
Side Street = RED
```

---

## 2. Simulate a Vehicle

Activate the vehicle-sensor input.

This indicates that a vehicle is waiting on the side street.

---

## 3. Main Street Transition

The main street changes:

```text
GREEN → YELLOW
```

while the side street remains:

```text
RED
```

---

## 4. Side Street Receives Green

After the required timing interval:

```text
Main Street = RED
Side Street = GREEN
```

---

## 5. Clear the Vehicle Sensor

Release the vehicle-sensor input.

This indicates that the side-street vehicle has cleared the intersection.

---

## 6. Side Street Yellow

After the timing condition is satisfied:

```text
Main Street = RED
Side Street = YELLOW
```

---

## 7. Return to Main Street Green

After the yellow interval:

```text
Main Street = GREEN
Side Street = RED
```

The system has returned to its initial operating condition.

---

# FPGA Pin Mapping

| Signal | Pin |
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

# Complete Hardware Workflow

```text
Traffic-Light FSM
       |
       v
One-Shot Timing Circuits
       |
       v
Clock Divider
       |
       v
TLSystem Integration
       |
       v
Quartus Compilation
       |
       v
FPGA Pin Assignment
       |
       v
USB-Blaster
       |
       v
JTAG Programming
       |
       v
Intel MAX 10 FPGA
       |
       v
DE10-Lite LEDs
       |
       v
Vehicle Sensor Testing
       |
       v
Physical Verification
```

---

# What the Demonstration Verifies

The hardware demonstration provides evidence that the project progressed from digital design to physical implementation.

It verifies the integration of:

```text
TrafficLights.vhd
Counter25B.vhd
count5B.vhd
oneshot22.bdf
oneshot8.bdf
```

into the complete:

```text
TLSystem
```

FPGA design.

The video demonstrates practical implementation of:

- Finite state machines
- Sequential digital logic
- Clock division
- One-shot timers
- Vehicle-sensor input
- Traffic-light sequencing
- FPGA output control
- Physical hardware testing

---

# Related Project Files

Main project documentation:

```text
../README.md
```

Quartus source files:

```text
../Quartus/
```

Development screenshots:

```text
../Screenshots/
```

---

# Conclusion

The physical DE10-Lite demonstration confirms the operation of the FPGA traffic-light control system.

The project demonstrates how a high-speed FPGA can combine finite state machines, digital timers, counters, sensor inputs, and output logic to implement a real-world sequential control application.
