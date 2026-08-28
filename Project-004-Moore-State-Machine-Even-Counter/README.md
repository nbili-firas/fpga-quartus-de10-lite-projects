# Project 004 – FPGA Moore State Machine Even Counter

## Project Overview

This project demonstrates the design, simulation, integration, compilation, and FPGA implementation of a **Moore finite state machine (FSM)** using **Intel Quartus Prime Lite** and the **Terasic DE10-Lite FPGA Development Board**.

The state machine counts upward through the even 3-bit binary values:

```text
000 → 010 → 100 → 110 → 000 → ...
```

The design contains four states, with each state producing a specific three-bit output represented by:

```text
C B A
```

The project also integrates a **25-bit clock divider** so that the DE10-Lite's 50 MHz system clock can be reduced to approximately **1.49 Hz**. This slower clock makes the state transitions visible on the physical FPGA board.

The complete project demonstrates:

- Moore finite state machine design
- State creation and transitions
- State-dependent outputs
- State Machine File development
- Verilog HDL generation
- Functional waveform simulation
- 25-bit clock division
- Hierarchical schematic integration
- FPGA pin assignments
- Successful Quartus compilation
- USB-Blaster/JTAG programming
- Physical DE10-Lite verification

---

## Project Objectives

The objectives of this project were to:

- Design a Moore finite state machine.
- Implement four states.
- Count through even 3-bit binary values.
- Configure state-dependent outputs.
- Generate Verilog HDL from a Quartus State Machine File.
- Generate a reusable Quartus symbol.
- Build a simulation test bench.
- Verify the state sequence using a waveform.
- Integrate a slower FPGA clock for hardware observation.
- Use a 25-bit counter as a frequency divider.
- Assign FPGA pins to the DE10-Lite board.
- Implement RESET control.
- Compile the complete FPGA design.
- Program the MAX 10 FPGA.
- Verify the state-machine sequence on physical hardware.

---

# Software and Hardware

## Software

- Intel Quartus Prime Lite
- Quartus State Machine Editor
- Quartus State Machine Wizard
- Verilog HDL
- Quartus Block Diagram/Schematic Editor
- Quartus Simulation Waveform Editor
- Quartus Pin Planner
- Quartus Programmer

## Hardware

- Terasic DE10-Lite FPGA Development Board
- Intel MAX 10 FPGA
- 50 MHz system clock
- On-board switch for RESET
- On-board LEDs for state outputs
- USB-Blaster interface
- JTAG programming mode

## Target FPGA

```text
10M50DAF484C6GES
```

---

# Moore State Machine

## State Sequence

The state machine cycles through four states.

The corresponding output sequence is:

```text
State 1 → CBA = 000
State 2 → CBA = 010
State 3 → CBA = 100
State 4 → CBA = 110
State 1 → CBA = 000
```

This produces the repeating count:

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
0 → 2 → 4 → 6 → 0 → ...
```

---

# Moore Machine Principle

A Moore state machine produces outputs based on the **current state**.

The basic architecture is:

```text
          Clock
            |
            v
     +---------------+
     | State Register|
     +-------+-------+
             |
             v
     +---------------+
     |  Next-State   |
     |     Logic     |
     +-------+-------+
             |
             v
     +---------------+
     | Output Logic  |
     +-------+-------+
             |
             v
          C B A
```

Each state in this design corresponds to one fixed output value.

---

# State Diagram Development

## Step 1 – Create the Quartus Project

A Quartus project named:

`Lab3p6`

was created for the MAX 10 FPGA.

The project configuration files are:

- `Lab3p6.qpf`
- `Lab3p6.qsf`

The final hardware design uses:

```text
Top-Level Entity: TB2
FPGA Family: MAX 10
Device: 10M50DAF484C6GES
```

---

## Step 2 – Create the State Machine File

A Quartus State Machine File was created:

`counter3Beven.smf`

Four states were placed in the State Machine Editor.

### State Diagram

![Moore State Diagram](Screenshots/Picture2.png)

The transitions form a continuous loop:

```text
State 1
   |
   v
State 2
   |
   v
State 3
   |
   v
State 4
   |
   +------> State 1
```

---

## Step 3 – Configure State Outputs

The State Machine Wizard was used to configure the output variables:

```text
C
B
A
```

Each state was assigned an output combination.

| State | C | B | A | Binary |
|---|---:|---:|---:|---|
| State 1 | 0 | 0 | 0 | `000` |
| State 2 | 0 | 1 | 0 | `010` |
| State 3 | 1 | 0 | 0 | `100` |
| State 4 | 1 | 1 | 0 | `110` |

The resulting output sequence represents even decimal values.

---

# Verilog Generation

## Step 4 – Generate Verilog HDL

Quartus generated a Verilog hardware description from the State Machine File.

The generated source file is:

`counter3Beven.v`

The module contains:

```text
Inputs:
reset
clock

Outputs:
C
B
A
```

The Verilog source implements:

- Four state definitions
- State transitions
- Reset behavior
- Moore-style output assignments

---

## Step 5 – Generate the State-Machine Symbol

A Quartus Block Symbol File was generated:

`counter3Beven.bsf`

This allows the state-machine module to be reused inside Block Diagram/Schematic files.

---

# TB1 – Functional Simulation Design

## Step 6 – Build TB1

A Block Diagram/Schematic called:

`TB1.bdf`

was created for functional verification of the state machine.

The schematic connects:

```text
RESET
CLK
  |
  v
+------------------+
|  counter3Beven   |
+----+----+----+---+
     |    |    |
     A    B    C
```

### TB1 Schematic

![TB1 State Machine Schematic](Screenshots/Picture3.png)

---

## Step 7 – Compile TB1

`TB1.bdf` was temporarily made the top-level entity so the state-machine logic could be compiled and simulated independently.

This isolates the FSM from the hardware clock-divider design and allows the state logic to be verified first.

---

# Functional Simulation

## Step 8 – Create the Waveform

The Quartus waveform file is:

`Waveform.vwf`

The waveform contains:

```text
CLK
RESET
A
B
C
```

A periodic clock with a:

```text
Period: 100 ns
Duty Cycle: 50%
```

was used.

RESET is pulsed HIGH during the first portion of the simulation to initialize the state machine.

### Initial Waveform Setup

![Initial Waveform Setup](Screenshots/Picture5.png)

---

## Step 9 – Run the Simulation

The completed waveform demonstrates the Moore state-machine sequence.

### Simulation Results

![Moore State Machine Simulation](Screenshots/Picture6.png)

The output bits transition through the expected sequence:

```text
CBA

000
010
100
110
000
...
```

This verifies the state-machine logic before hardware implementation.

---

# Hardware Clock Integration

## Step 10 – Create TB2

A second top-level schematic was created:

`TB2.bdf`

TB2 integrates:

- `Counter25B`
- `counter3Beven`
- RESET
- CLK
- State outputs A, B, and C

### Final Hardware Schematic

![TB2 Hardware Schematic](Screenshots/Picture1.png)

The architecture is:

```text
50 MHz CLK
    |
    v
+-------------+
| Counter25B  |
| Clock Divider
+------+------+
       |
       | Slow Clock
       v
+------------------+
|  counter3Beven   |
| Moore State FSM  |
+----+----+----+---+
     |    |    |
     A    B    C
```

---

# Clock Divider

The `Counter25B` module is used to reduce the DE10-Lite system clock.

The original FPGA clock is:

```text
50 MHz
```

The 25-bit counter provides slower divided-clock outputs.

The slowest relevant output is approximately:

```text
1.49 Hz
```

This low-frequency clock allows the state changes to be observed visually on the DE10-Lite LEDs.

The generated IP integration file is:

`Counter25B.qip`

and the symbol is:

`Counter25B.bsf`

---

# Final Compilation

## Step 11 – Set TB2 as Top-Level Entity

For physical FPGA implementation:

```text
Top-Level Entity: TB2
```

The integrated state-machine and clock-divider design was then compiled.

### Final Compilation

![TB2 Compilation](Screenshots/Picture7.png)

### Flow Summary

![TB2 Flow Summary](Screenshots/Picture8.png)

The final design successfully targets the Intel MAX 10 FPGA.

---

# FPGA Pin Assignment

## Step 12 – Configure Pin Planner

Quartus Pin Planner was used to map the design signals to physical DE10-Lite FPGA pins.

The project uses:

| Signal | FPGA Pin | Function |
|---|---|---|
| `A` | `PIN_A8` | State output |
| `B` | `PIN_A9` | State output |
| `C` | `PIN_A10` | State output |
| `CLK` | `PIN_P11` | 50 MHz system clock |
| `RESET` | `PIN_C10` | Reset control |

The project uses:

```text
I/O Standard: 3.3-V LVTTL
```

### Pin Planner

![Quartus Pin Planner](Screenshots/Picture9.png)

---

# Reset Control

The DE10-Lite switch:

```text
SW0
```

is used as the RESET input.

When RESET is asserted, the state machine returns to its initial state:

```text
CBA = 000
```

On the physical board, setting SW0 HIGH holds the state machine in the reset condition and stops the normal counting sequence.

---

# FPGA Programming

## Step 13 – Connect the DE10-Lite

The FPGA board was connected using the USB-Blaster interface.

Quartus Programmer was configured using:

```text
Hardware: USB-Blaster
Mode: JTAG
Device: Intel MAX 10
```

---

## Step 14 – Program the FPGA

The compiled design was transferred to the DE10-Lite development board.

### Quartus Programmer

![Quartus Programmer](Screenshots/Picture10.png)

The programming operation completed successfully.

---

# Hardware Verification

## Step 15 – Observe the Moore Counter

After programming, the state outputs were observed on the physical DE10-Lite board.

The LEDs represent:

```text
C B A
```

The expected sequence is:

```text
000 → 010 → 100 → 110 → 000
```

Because the state machine is clocked using the divided 1.49 Hz signal, each state remains visible long enough to observe manually.

---

# Hardware Demonstration

The physical board demonstration is located in the `Hardware` folder.

[View DE10-Lite Moore Even Counter Demo](Hardware/DE10-Lite-Moore-Even-Counter-Demo.mp4)

The video provides physical evidence of the state machine operating on the MAX 10 FPGA.

---

# Complete FPGA Development Workflow

```text
Define Required Sequence
        |
        v
000 → 010 → 100 → 110
        |
        v
Create 4-State Moore FSM
        |
        v
Configure State Outputs
        |
        v
Generate Verilog HDL
counter3Beven.v
        |
        v
Generate Symbol
counter3Beven.bsf
        |
        v
Create TB1.bdf
        |
        v
Functional Simulation
        |
        v
Verify State Sequence
        |
        v
Integrate Counter25B
        |
        v
Create TB2.bdf
        |
        v
Divide 50 MHz Clock
        |
        v
Configure FPGA Pins
        |
        v
Compile Final Design
        |
        v
USB-Blaster / JTAG
        |
        v
Program DE10-Lite
        |
        v
Observe CBA Outputs
        |
        v
Hardware Verification
```

---

# Project Results

Project 004 successfully demonstrates the implementation of a Moore finite state machine on an FPGA.

The completed design demonstrates:

- Four-state Moore FSM
- Even-number binary sequence
- State-dependent outputs
- State transition logic
- State Machine File development
- Automatic Verilog HDL generation
- Quartus symbol generation
- Functional simulation
- Reset behavior
- 25-bit clock division
- Hierarchical schematic design
- FPGA pin mapping
- Successful compilation
- USB-Blaster/JTAG programming
- DE10-Lite hardware implementation

---

# Project Files

## Quartus Source Files

The complete project source files are located in:

[Quartus Source Files](Quartus/)

Important files include:

| File | Purpose |
|---|---|
| `Lab3p6.qpf` | Main Quartus project |
| `Lab3p6.qsf` | Device configuration and pin assignments |
| `counter3Beven.smf` | Moore State Machine File |
| `counter3Beven.v` | Generated Verilog HDL |
| `counter3Beven.bsf` | State-machine block symbol |
| `TB1.bdf` | Functional simulation schematic |
| `TB2.bdf` | Final hardware top-level schematic |
| `Counter25B.qip` | 25-bit counter IP integration file |
| `Counter25B.bsf` | 25-bit counter symbol |
| `Waveform.vwf` | FSM functional simulation |
| `DE10_LITE_Golden_Top.v` | DE10-Lite board reference source |

If available, also preserve:

```text
Counter25B.vhd
Counter25B.cmp
```

---

## Screenshots

The development screenshots are located in:

[Project Screenshots](Screenshots/)

---

## Hardware Demonstration

The physical FPGA demonstration is located in:

[Hardware Demonstration](Hardware/)

Direct video:

[Watch DE10-Lite Moore Even Counter Demo](Hardware/DE10-Lite-Moore-Even-Counter-Demo.mp4)

---

# Skills Demonstrated

## FPGA and Digital Design

- FPGA Development
- Finite State Machines
- Moore State Machines
- Sequential Logic
- State Transition Design
- Binary Counting
- Clock Division
- Hierarchical Digital Design
- Reset Logic

## HDL

- Verilog HDL
- Generated HDL
- HDL Symbol Integration
- State-Based Digital Logic

## Quartus Prime Lite

- State Machine Editor
- State Machine Wizard
- Block Diagram/Schematic Editor
- Symbol Generation
- Functional Simulation
- Waveform Editor
- IP Integration
- LPM Counter
- Pin Planner
- Compilation
- Quartus Programmer

## Hardware

- Terasic DE10-Lite
- Intel MAX 10 FPGA
- 50 MHz Clock
- LED Outputs
- Switch Inputs
- USB-Blaster
- JTAG
- Hardware Testing

## Engineering

- State-Based System Design
- Digital Timing
- Simulation
- Verification
- Troubleshooting
- Testing and Validation
- Hardware/Software Integration
- Technical Documentation

---

# What I Learned

This project strengthened my understanding of finite state machines and sequential digital system design.

I gained practical experience creating a Moore state machine, defining state transitions, assigning outputs to states, generating Verilog HDL from a graphical state-machine design, and verifying the resulting logic using functional simulation.

I also gained experience combining separate FPGA modules hierarchically by integrating the state machine with a 25-bit clock divider.

Using the slower clock on the DE10-Lite board demonstrated why clock management is important when a high-speed FPGA system must produce human-observable behavior.

The project also reinforced the importance of simulation before hardware implementation and demonstrated how a digital design progresses from state diagrams to HDL, FPGA configuration, and physical verification.

---

# Conclusion

Project 004 demonstrates the complete design and implementation of a Moore finite state machine that counts through even 3-bit binary values:

```text
000 → 010 → 100 → 110 → 000
```

The project progressed through state-machine design, output configuration, Verilog generation, functional simulation, clock-divider integration, FPGA pin assignment, compilation, JTAG programming, and physical DE10-Lite testing.

The completed project provides practical evidence of experience with **finite state machines, Moore logic, Verilog HDL, sequential digital design, clock division, FPGA development, simulation, and physical hardware implementation**.
