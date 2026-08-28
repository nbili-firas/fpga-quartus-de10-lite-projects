# Project 004 – DE10-Lite Moore State Machine Hardware Demonstration

## Overview

This folder contains the physical FPGA demonstration for **Project 004 – Moore State Machine Even Counter**.

The project was implemented on the **Terasic DE10-Lite FPGA Development Board** after the state machine was designed, simulated, integrated with a clock divider, compiled, and programmed using Quartus Prime Lite.

The hardware demonstration verifies that the Moore state machine operates on the physical Intel MAX 10 FPGA.

---

# Hardware Demonstration Video

## File

[`DE10-Lite-Moore-Even-Counter-Demo.mp4`](DE10-Lite-Moore-Even-Counter-Demo.mp4)

## Watch the Demonstration

[View DE10-Lite Moore Even Counter Demo](DE10-Lite-Moore-Even-Counter-Demo.mp4)

---

# Hardware Platform

The project uses:

```text
Board: Terasic DE10-Lite
FPGA Family: Intel MAX 10
Device: 10M50DAF484C6GES
System Clock: 50 MHz
Programming Interface: USB-Blaster
Programming Mode: JTAG
```

---

# State Outputs

The physical FPGA outputs represent:

```text
C B A
```

The expected Moore state sequence is:

```text
000
010
100
110
000
...
```

In decimal form:

```text
0
2
4
6
0
...
```

---

# Clock Division

The DE10-Lite's system clock operates at:

```text
50 MHz
```

This is too fast for individual state changes to be observed manually.

The project therefore uses:

`Counter25B`

to divide the FPGA clock.

A slow output of approximately:

```text
1.49 Hz
```

is used to clock the Moore state machine.

This makes the state changes visible on the physical board.

---

# Hardware Signal Flow

```text
DE10-Lite
50 MHz Clock
     |
     v
+-------------+
| Counter25B  |
+------+------+
       |
       v
   ~1.49 Hz
       |
       v
+------------------+
| counter3Beven    |
| Moore State FSM  |
+----+----+----+---+
     |    |    |
     A    B    C
     |    |    |
     v    v    v
   DE10-Lite LEDs
```

---

# RESET Control

The project uses:

```text
SW0
```

as the RESET control.

When RESET is HIGH:

- The state machine returns to the initial state.
- The outputs return to `000`.
- The normal counting sequence is held/stopped.

When RESET is released, normal state transitions continue.

---

# FPGA Pin Mapping

The hardware implementation uses:

| Signal | FPGA Pin |
|---|---|
| `A` | `PIN_A8` |
| `B` | `PIN_A9` |
| `C` | `PIN_A10` |
| `CLK` | `PIN_P11` |
| `RESET` | `PIN_C10` |

The primary I/O standard is:

```text
3.3-V LVTTL
```

---

# Hardware Implementation Process

## Step 1 – Design the Moore FSM

The four-state Moore state machine was created in Quartus.

---

## Step 2 – Generate Verilog

Quartus generated:

`counter3Beven.v`

from the graphical State Machine File.

---

## Step 3 – Simulate the FSM

The state machine was tested using a 100 ns clock waveform.

The output sequence was verified as:

```text
000 → 010 → 100 → 110
```

---

## Step 4 – Integrate the Clock Divider

The `Counter25B` module was connected to the state-machine clock input.

This converts the high-speed 50 MHz system clock into a slower observable signal.

---

## Step 5 – Configure FPGA Pins

The state outputs, clock input, and reset input were mapped to physical MAX 10 FPGA pins.

---

## Step 6 – Compile the Final Design

`TB2` was configured as the final top-level entity and compiled.

---

## Step 7 – Connect the DE10-Lite

The development board was connected to the computer using USB-Blaster.

---

## Step 8 – Program the FPGA

Quartus Programmer transferred the compiled design using JTAG.

---

## Step 9 – Observe the Hardware Sequence

The physical outputs were observed on the DE10-Lite.

The LEDs demonstrate the repeating even-number sequence:

```text
000
010
100
110
000
```

---

# Complete Hardware Workflow

```text
Moore FSM Design
       |
       v
Functional Simulation
       |
       v
Verify Even Count
       |
       v
Integrate Counter25B
       |
       v
Divide 50 MHz Clock
       |
       v
Configure Pin Assignments
       |
       v
Compile TB2
       |
       v
USB-Blaster / JTAG
       |
       v
Program MAX 10 FPGA
       |
       v
Observe CBA LEDs
       |
       v
Verify Physical FSM Operation
```

---

# Skills Demonstrated

## FPGA Hardware

- Terasic DE10-Lite
- Intel MAX 10 FPGA
- FPGA Clock Inputs
- FPGA LED Outputs
- Switch Inputs
- Physical Pin Mapping
- USB-Blaster
- JTAG Programming

## Sequential Digital Logic

- Moore State Machines
- Finite State Machines
- State Transitions
- State-Dependent Outputs
- Binary Counting
- Reset Logic
- Clock Division

## Quartus

- State Machine Editor
- State Machine Wizard
- Verilog Generation
- BDF Integration
- IP Integration
- Functional Simulation
- Pin Planner
- Compilation
- Quartus Programmer

## Engineering

- Sequential-System Design
- Digital Timing
- Functional Verification
- Hardware/Software Integration
- Testing
- Troubleshooting
- Technical Documentation

---

# What the Hardware Demonstration Proves

The hardware video demonstrates that the project progressed beyond a graphical state diagram and software simulation.

The complete design was:

```text
Designed
   ↓
Converted to Verilog
   ↓
Simulated
   ↓
Integrated with a Clock Divider
   ↓
Compiled
   ↓
Mapped to Physical FPGA Pins
   ↓
Programmed onto the DE10-Lite
   ↓
Tested on Physical Hardware
```

This provides practical evidence of FPGA finite-state-machine development and hardware implementation.

---

# Related Project Sections

Return to the complete project overview:

[Project 004 Main README](../README.md)

View Quartus source files:

[Quartus Source Files](../Quartus/)

View development screenshots:

[Project Screenshots](../Screenshots/)

---

# Purpose of This Folder

This folder provides evidence of the final physical implementation of the Moore state-machine project.

The hardware demonstration complements the state-machine source files, Verilog code, waveform simulation, and Quartus screenshots by showing the completed design operating on the physical DE10-Lite FPGA board.
