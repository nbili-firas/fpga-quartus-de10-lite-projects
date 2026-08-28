# Project 003 – FPGA 1.49 Hz Clock Divider Screenshots

## Overview

This folder contains screenshots documenting the Quartus Prime Lite development process for **Project 003 – FPGA 1.49 Hz Clock Divider**.

The screenshots demonstrate:

- Top-level counter schematic
- Generated Project6 symbol
- Successful Quartus compilation
- Simulation waveform setup
- Quartus Programmer configuration

---

# Screenshot 1 – 25-Bit Counter Schematic

## File

[`Picture1.png`](Picture1.png)

## Screenshot

![25-Bit Counter Schematic](Picture1.png)

## Description

This screenshot shows the top-level `Project6.bdf` design.

The schematic contains the generated:

`Counter25B`

25-bit up-counter block.

The design connects:

```text
CLK → Counter25B clock input

Counter25B q[24..0]
        ↓
Top-Level q[24..0] Output
```

The thick signal line represents the 25-bit output bus.

This screenshot demonstrates the integration of generated Quartus IP into a graphical top-level FPGA design.

---

# Screenshot 2 – Generated Project6 Symbol

## File

[`Picture2.png`](Picture2.png)

## Screenshot

![Generated Project6 Symbol](Picture2.png)

## Description

This screenshot shows the generated Quartus Block Symbol File for the completed Project6 design.

The symbol contains:

```text
Input:
CLK

Output:
q[24..0]
```

Generating a symbol allows the completed module to be reused as a component in larger Quartus designs.

---

# Screenshot 3 – Compilation Report

## File

[`Picture3.png`](Picture3.png)

## Screenshot

![Quartus Compilation Report](Picture3.png)

## Description

This screenshot documents the Quartus Flow Summary after compilation.

The project targets:

```text
Family: MAX 10
Device: 10M50DAF484C6GES
Top-Level Entity: Project6
```

The screenshot also shows that Quartus completed the project flow successfully.

This stage verifies that the frequency-divider design can be processed for FPGA implementation.

---

# Screenshot 4 – Simulation Waveform Setup

## File

[`Picture4.png`](Picture4.png)

## Screenshot

![Simulation Waveform](Picture4.png)

## Description

This screenshot shows the Quartus Simulation Waveform Editor configured for the clock-divider design.

The visible signals include:

```text
CLK
q[24..0]
```

The `q` signal is represented as a 25-bit output bus.

This waveform configuration provides an environment for testing the counter design in software.

The displayed simulation window is short compared with the period of the slowest counter bit, so physical hardware testing is particularly useful for observing `q[24]` at approximately 1.49 Hz.

---

# Screenshot 5 – Quartus Programmer

## File

[`Picture5.png`](Picture5.png)

## Screenshot

![Quartus Programmer](Picture5.png)

## Description

This screenshot shows Quartus Programmer configured for the DE10-Lite FPGA.

The configuration includes:

```text
Hardware: USB-Blaster
Mode: JTAG
FPGA Family: MAX 10
```

The compiled FPGA design is loaded into the programmer and prepared for transfer to the physical DE10-Lite board.

This stage represents the transition from software development to FPGA hardware implementation.

---

# Screenshot Summary

| Screenshot | Development Stage |
|---|---|
| [`Picture1.png`](Picture1.png) | 25-bit counter top-level schematic |
| [`Picture2.png`](Picture2.png) | Generated Project6 block symbol |
| [`Picture3.png`](Picture3.png) | Quartus compilation report |
| [`Picture4.png`](Picture4.png) | Simulation waveform configuration |
| [`Picture5.png`](Picture5.png) | USB-Blaster/JTAG FPGA programming |

---

# Documented FPGA Workflow

```text
Generate Counter25B IP
        |
        v
Create Counter Symbol
        |
        v
Build Project6.bdf
        |
        v
Create q[24..0] Bus
        |
        v
Generate Project Symbol
        |
        v
Compile Design
        |
        v
Create Simulation Waveform
        |
        v
Configure FPGA
        |
        v
Quartus Programmer
        |
        v
DE10-Lite Hardware
```

---

# Related Project Files

Return to the main project:

[Project 003 Main README](../README.md)

View the Quartus source files:

[Quartus Source Files](../Quartus/)

View the DE10-Lite hardware demonstration:

[Hardware Demonstration](../Hardware/)

---

# Purpose of This Folder

This folder provides visual documentation of the design and FPGA implementation process used for Project 003.

The screenshots complement the Quartus source files and physical hardware demonstration by showing the project progressing from generated counter logic through compilation, simulation setup, and FPGA programming.
