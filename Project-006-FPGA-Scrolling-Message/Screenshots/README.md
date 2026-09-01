# Project 006 – Development Screenshots

## Overview

This folder contains nine screenshots documenting the design, simulation preparation, compilation, hierarchical integration, FPGA pin assignment, and programming stages of **Project 006 – FPGA Scrolling Message**.

The screenshots show the progression from the Mod-5 counter subsystem to the complete six-display DE10-Lite implementation.

---

# Screenshot 1 – CountMod5 Schematic

## File

```text
Picture1.png
```

![CountMod5 Schematic](Picture1.png)

## Description

This screenshot shows the completed:

```text
CountMod5.bdf
```

schematic.

The design uses a 74161 counter and supporting feedback logic to create a modulo-5 counting sequence.

Inputs:

```text
EN
CLK
```

Outputs:

```text
A
B
C
D
```

The Quartus status area also shows successful compilation with zero errors.

---

# Screenshot 2 – CountMod5 Compilation Report

## File

```text
Picture2.png
```

![CountMod5 Compilation Report](Picture2.png)

## Description

This screenshot shows the Quartus Flow Summary after compiling the Mod-5 counter.

It verifies that the counter subsystem was successfully processed before being integrated into the larger design.

This modular verification approach helps identify errors before the final hierarchical design is assembled.

---

# Screenshot 3 – CountMod5 Waveform Setup

## File

```text
Picture3.png
```

![CountMod5 Waveform Setup](Picture3.png)

## Description

This screenshot shows the Quartus Simulation Waveform Editor configured with:

```text
A
B
C
D
CLK
EN
```

The waveform is used to verify the Mod-5 counter operation.

The expected count is:

```text
0 → 1 → 2 → 3 → 4 → 0
```

---

# Screenshot 4 – Message Compilation

## File

```text
Picture4.png
```

![Message Compilation](Picture4.png)

## Description

This screenshot shows the Quartus Flow Summary with:

```text
Top-Level Entity: Message
```

The successful compilation verifies the message-generation subsystem before it is integrated into the final Project12 design.

---

# Screenshot 5 – Message Module

## File

```text
Picture5.png
```

![Message Module](Picture5.png)

## Description

This screenshot shows the `Message.bdf` schematic.

The module integrates:

```text
CountMod5
SSD
```

The flow is:

```text
EN + CLK
   |
   v
CountMod5
   |
   v
4-Bit Character Selection
   |
   v
SSD
   |
   v
S[6..0]
```

This converts the Mod-5 count into 7-segment display data.

---

# Screenshot 6 – Project12 Compilation

## File

```text
Picture6.png
```

![Project12 Compilation](Picture6.png)

## Description

This screenshot shows the Quartus Flow Summary for the completed:

```text
Project12
```

top-level design.

The design has progressed from independently verified modules to the full scrolling-message system.

The hierarchy shown in the Project Navigator demonstrates the multiple reusable components integrated into the final design.

---

# Screenshot 7 – Final Project12 Schematic

## File

```text
Picture7.png
```

![Final Project12 Schematic](Picture7.png)

## Description

This screenshot shows the final top-level FPGA schematic.

The design includes multiple display-data paths and shift-register stages connected to the six 7-segment display outputs.

The top-level system distributes scrolling display information to:

```text
HEX0
HEX1
HEX2
HEX3
HEX4
HEX5
```

This is the primary hardware architecture for the scrolling-message application.

---

# Screenshot 8 – FPGA Pin Planner

## File

```text
Picture8.png
```

![FPGA Pin Planner](Picture8.png)

## Description

This screenshot shows Quartus Pin Planner configured for the Intel MAX 10 FPGA.

The pin-assignment table contains the physical connections for all six 7-segment displays.

The visible signals include:

```text
HEX0[x]
HEX1[x]
HEX2[x]
HEX3[x]
HEX4[x]
HEX5[x]
```

This stage connects the logical FPGA display buses to the physical DE10-Lite display segments.

---

# Screenshot 9 – Quartus Programmer

## File

```text
Picture9.png
```

![Quartus Programmer](Picture9.png)

## Description

This screenshot shows Quartus Programmer configured for the DE10-Lite FPGA.

Programming configuration:

```text
Hardware: USB-Blaster
Mode: JTAG
Target: Intel MAX 10
```

The compiled design is loaded and prepared for transfer to the physical FPGA.

---

# Screenshot Summary

| Screenshot | Stage |
|---|---|
| `Picture1.png` | Mod-5 counter schematic |
| `Picture2.png` | Mod-5 compilation |
| `Picture3.png` | Counter waveform setup |
| `Picture4.png` | Message module compilation |
| `Picture5.png` | Message schematic |
| `Picture6.png` | Final Project12 compilation |
| `Picture7.png` | Final scrolling-message schematic |
| `Picture8.png` | Six-display FPGA pin assignment |
| `Picture9.png` | USB-Blaster/JTAG programming |

---

# Visual Development Workflow

```text
CountMod5 Design
      |
      v
Counter Compilation
      |
      v
Waveform Setup
      |
      v
Message Module
      |
      v
Message Compilation
      |
      v
Project12 Integration
      |
      v
Final Compilation
      |
      v
HEX Pin Assignment
      |
      v
Quartus Programmer
      |
      v
DE10-Lite Hardware
```

---

# Related Project Sections

Main project:

```text
../README.md
```

Quartus source files:

```text
../Quartus/
```

Hardware demonstration:

```text
../Hardware/
```

---

# Purpose

This folder provides visual evidence of the complete FPGA development workflow for the scrolling-message system.

Together with the Quartus source files and hardware video, the screenshots document modular design, compilation, hierarchical integration, physical pin mapping, and DE10-Lite programming.
