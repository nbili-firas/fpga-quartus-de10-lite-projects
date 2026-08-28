# Project 004 – Quartus Source Files

## Overview

This folder contains the Intel Quartus Prime Lite source files used to develop **Project 004 – Moore State Machine Even Counter**.

The design implements a four-state Moore finite state machine that cycles through the even 3-bit binary values:

```text
000 → 010 → 100 → 110 → 000
```

The project also integrates a 25-bit clock divider to create a slow, human-observable state transition rate on the DE10-Lite FPGA Development Board.

---

# Project Configuration

The Quartus project uses:

```text
Project Name: Lab3p6
Final Top-Level Entity: TB2
FPGA Family: MAX 10
Target Device: 10M50DAF484C6GES
```

Primary configuration files:

- [`Lab3p6.qpf`](Lab3p6.qpf)
- [`Lab3p6.qsf`](Lab3p6.qsf)

---

# Source Files

| File | Purpose |
|---|---|
| [`Lab3p6.qpf`](Lab3p6.qpf) | Main Quartus project file |
| [`Lab3p6.qsf`](Lab3p6.qsf) | Device settings and FPGA pin assignments |
| [`counter3Beven.smf`](counter3Beven.smf) | Moore State Machine File |
| [`counter3Beven.v`](counter3Beven.v) | Generated Verilog HDL implementation |
| [`counter3Beven.bsf`](counter3Beven.bsf) | State-machine block symbol |
| [`TB1.bdf`](TB1.bdf) | Functional simulation schematic |
| [`TB2.bdf`](TB2.bdf) | Final hardware top-level schematic |
| [`Counter25B.qip`](Counter25B.qip) | 25-bit counter IP integration file |
| [`Counter25B.bsf`](Counter25B.bsf) | Counter block symbol |
| [`Waveform.vwf`](Waveform.vwf) | Functional simulation waveform |
| [`DE10_LITE_Golden_Top.v`](DE10_LITE_Golden_Top.v) | DE10-Lite board reference Verilog source |

If available, also include:

```text
Counter25B.vhd
Counter25B.cmp
```

These files are referenced by the generated counter IP integration file.

---

# Moore State Machine

The core state-machine design is stored in:

[`counter3Beven.smf`](counter3Beven.smf)

The state machine contains four states.

The output sequence is:

```text
State 1 → 000
State 2 → 010
State 3 → 100
State 4 → 110
State 1 → 000
```

The output order is:

```text
C B A
```

---

# Generated Verilog

Quartus generated the hardware implementation:

[`counter3Beven.v`](counter3Beven.v)

The generated module contains:

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

- State storage
- State transitions
- RESET behavior
- State-dependent Moore outputs

---

# State-Machine Symbol

The generated symbol is:

[`counter3Beven.bsf`](counter3Beven.bsf)

The symbol allows the state-machine module to be placed inside Quartus BDF designs.

---

# TB1 – Simulation Schematic

The first top-level schematic is:

[`TB1.bdf`](TB1.bdf)

TB1 connects:

```text
RESET
CLK
 |
 v
counter3Beven
 |
 +--- A
 +--- B
 +--- C
```

TB1 is used to verify the state machine independently before integrating the hardware clock divider.

---

# Functional Simulation

The simulation configuration is stored in:

[`Waveform.vwf`](Waveform.vwf)

The simulation uses:

```text
CLK
RESET
A
B
C
```

Clock configuration:

```text
Period: 100 ns
Duty Cycle: 50%
```

RESET is initially pulsed HIGH to initialize the FSM.

The expected output sequence is:

```text
CBA

000
010
100
110
000
```

---

# Counter25B Clock Divider

The final hardware implementation uses:

`Counter25B`

to reduce the DE10-Lite system clock.

The counter is integrated through:

[`Counter25B.qip`](Counter25B.qip)

and represented graphically by:

[`Counter25B.bsf`](Counter25B.bsf)

The design converts the:

```text
50 MHz
```

system clock into a much slower signal of approximately:

```text
1.49 Hz
```

for visual hardware testing.

---

# TB2 – Final Hardware Design

The final top-level schematic is:

[`TB2.bdf`](TB2.bdf)

TB2 integrates:

```text
50 MHz CLK
     |
     v
Counter25B
     |
     v
Slow Clock
     |
     v
counter3Beven
     |
     +--- A
     +--- B
     +--- C
```

RESET is also connected to the state-machine module.

TB2 is configured as the final top-level entity.

---

# FPGA Pin Assignments

The project assignments are stored in:

[`Lab3p6.qsf`](Lab3p6.qsf)

The primary project signals are mapped as follows:

| Signal | FPGA Pin |
|---|---|
| `A` | `PIN_A8` |
| `B` | `PIN_A9` |
| `C` | `PIN_A10` |
| `CLK` | `PIN_P11` |
| `RESET` | `PIN_C10` |

The assigned I/O standard is:

```text
3.3-V LVTTL
```

---

# RESET Operation

The RESET signal is controlled using the DE10-Lite switch:

```text
SW0
```

When RESET is asserted, the state machine returns to:

```text
CBA = 000
```

and the normal counting sequence is stopped while reset remains active.

---

# Quartus Development Workflow

```text
Create Lab3p6 Project
        |
        v
Create counter3Beven.smf
        |
        v
Add Four States
        |
        v
Create State Transitions
        |
        v
Assign CBA Outputs
        |
        v
Generate Verilog
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
Verify FSM
        |
        v
Integrate Counter25B
        |
        v
Create TB2.bdf
        |
        v
Assign FPGA Pins
        |
        v
Compile Final Design
        |
        v
Program DE10-Lite
```

---

# Related Project Sections

Return to the complete project overview:

[Project 004 Main README](../README.md)

View development screenshots:

[Project Screenshots](../Screenshots/)

View the physical FPGA demonstration:

[Hardware Demonstration](../Hardware/)

---

# Purpose of This Folder

This folder preserves the Quartus source files used to develop the Moore finite state machine.

Together, the files document the progression from graphical state-machine design through generated Verilog HDL, functional simulation, hierarchical clock-divider integration, FPGA configuration, and physical DE10-Lite implementation.
