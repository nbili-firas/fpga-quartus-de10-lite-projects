# Project 006 – Quartus Source Files

## Overview

This folder contains the Intel Quartus Prime Lite source files for **Project 006 – FPGA Scrolling Message**.

The project creates a five-character message and scrolls it across all six 7-segment displays on the Terasic DE10-Lite FPGA Development Board.

The final top-level entity is:

```text
Project12
```

---

# FPGA Configuration

```text
FPGA Family: MAX 10
Device: 10M50DAF484C6GES
Top-Level Entity: Project12
```

---

# Recommended Source Files

```text
Quartus/
│
├── Project12.qpf
├── Project12.qsf
├── Project12.bdf
├── Message.bdf
├── Message.bsf
├── CountMod5.bdf
├── SSD.vhd
├── Waveform.vwf
├── Waveform2.vwf
└── DE10_LITE_Golden_Top.v
```

---

# File Descriptions

| File | Purpose |
|---|---|
| `Project12.qpf` | Main Quartus project file |
| `Project12.qsf` | FPGA configuration and pin assignments |
| `Project12.bdf` | Final scrolling-message top-level design |
| `Message.bdf` | Message-generation schematic |
| `Message.bsf` | Reusable symbol for the Message module |
| `CountMod5.bdf` | Mod-5 counter schematic |
| `SSD.vhd` | Reused 7-segment display-driver VHDL |
| `Waveform.vwf` | Mod-5 functional simulation |
| `Waveform2.vwf` | Message-module simulation |
| `DE10_LITE_Golden_Top.v` | DE10-Lite reference Verilog source |

---

# CountMod5.bdf

The Mod-5 counter is implemented in:

```text
CountMod5.bdf
```

The module uses a 74161 counter and supporting logic.

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

The output sequence is:

```text
0000
0001
0010
0011
0100
0000
...
```

This provides five repeating counter states for the five-character message.

---

# Mod-5 Counter Purpose

Each count value identifies one message character.

Conceptually:

```text
Count 0 → Character 1
Count 1 → Character 2
Count 2 → Character 3
Count 3 → Character 4
Count 4 → Character 5
```

After count 4, the counter returns to count 0.

---

# SSD.vhd

The project reuses:

```text
SSD.vhd
```

from the earlier 7-segment display-driver project.

The module accepts:

```text
D[3..0]
EN
```

and produces:

```text
S[6..0]
```

This converts the selected message-character code into a 7-segment display pattern.

---

# Message.bdf

The message-generation stage is implemented in:

```text
Message.bdf
```

The module connects the Mod-5 counter to the SSD display driver.

```text
EN
CLK
 |
 v
CountMod5
 |
 v
D[3..0]
 |
 v
SSD
 |
 v
S[6..0]
```

This produces the correct display segment pattern for each character position in the five-character sequence.

---

# Message Symbol

After verification, the Message design was converted into:

```text
Message.bsf
```

This allows the entire message-generation module to be reused within the final top-level scrolling design.

---

# Functional Simulation

The project uses two functional verification stages.

## Waveform.vwf

```text
Waveform.vwf
```

is used to verify the Mod-5 counter.

The simulation confirms:

```text
0 → 1 → 2 → 3 → 4 → 0
```

---

## Waveform2.vwf

```text
Waveform2.vwf
```

is used to verify the Message module.

The test also verifies enable behavior.

The design remains disabled until:

```text
EN = HIGH
```

after the required initial delay.

---

# Project12.bdf

The final top-level design is:

```text
Project12.bdf
```

The final design combines:

- Message modules
- Shift-register logic
- Enable input
- Manual clock
- Six 7-segment display buses

---

# Shift Register

The project uses a:

```text
74199
```

shift register to move display information across the six HEX displays.

The data progresses from the far-right display toward the far-left display.

---

# Display Outputs

The final design controls:

```text
HEX0[6..0]
HEX1[6..0]
HEX2[6..0]
HEX3[6..0]
HEX4[6..0]
HEX5[6..0]
```

These correspond to all six 7-segment displays on the DE10-Lite board.

---

# Clock Input

The manual scrolling clock is:

```text
CLK
```

Quartus assignment:

```text
CLK → PIN_B8
```

This corresponds to the DE10-Lite pushbutton used to manually advance the message.

The clock input uses:

```text
3.3 V Schmitt Trigger
```

---

# Enable Input

The project enable input is:

```text
ON
```

Quartus assignment:

```text
ON → PIN_A12
```

The hardware procedure uses SW4 to enable the design.

---

# HEX Pin Assignments

The project maps all six HEX display buses to the physical MAX 10 FPGA pins.

## HEX0

```text
HEX0[0] → PIN_C14
HEX0[1] → PIN_E15
HEX0[2] → PIN_C15
HEX0[3] → PIN_C16
HEX0[4] → PIN_E16
HEX0[5] → PIN_D17
HEX0[6] → PIN_C17
```

## HEX1

```text
HEX1[0] → PIN_C18
HEX1[1] → PIN_D18
HEX1[2] → PIN_E18
HEX1[3] → PIN_B16
HEX1[4] → PIN_A17
HEX1[5] → PIN_A18
HEX1[6] → PIN_B17
```

## HEX2

```text
HEX2[0] → PIN_B20
HEX2[1] → PIN_A20
HEX2[2] → PIN_B19
HEX2[3] → PIN_A21
HEX2[4] → PIN_B21
HEX2[5] → PIN_C22
HEX2[6] → PIN_B22
```

## HEX3

```text
HEX3[0] → PIN_F21
HEX3[1] → PIN_E22
HEX3[2] → PIN_E21
HEX3[3] → PIN_C19
HEX3[4] → PIN_C20
HEX3[5] → PIN_D19
HEX3[6] → PIN_E17
```

## HEX4

```text
HEX4[0] → PIN_F18
HEX4[1] → PIN_E20
HEX4[2] → PIN_E19
HEX4[3] → PIN_J18
HEX4[4] → PIN_H19
HEX4[5] → PIN_F19
HEX4[6] → PIN_F20
```

## HEX5

```text
HEX5[0] → PIN_J20
HEX5[1] → PIN_K20
HEX5[2] → PIN_L18
HEX5[3] → PIN_N18
HEX5[4] → PIN_M20
HEX5[5] → PIN_N19
HEX5[6] → PIN_N20
```

---

# I/O Standards

The display outputs use:

```text
3.3-V LVTTL
```

The manual clock input uses:

```text
3.3 V Schmitt Trigger
```

---

# Development Workflow

```text
Create Project12
       |
       v
Add SSD.vhd
       |
       v
Create CountMod5.bdf
       |
       v
Compile Counter
       |
       v
Simulate CountMod5
       |
       v
Create Message.bdf
       |
       v
Integrate SSD
       |
       v
Verify Message
       |
       v
Generate Message.bsf
       |
       v
Create Project12.bdf
       |
       v
Integrate 74199 Shift Logic
       |
       v
Connect HEX0–HEX5
       |
       v
Assign FPGA Pins
       |
       v
Compile
       |
       v
Quartus Programmer
       |
       v
Program DE10-Lite
```

---

# Related Project Sections

Main project:

```text
../README.md
```

Screenshots:

```text
../Screenshots/
```

Hardware demonstration:

```text
../Hardware/
```

---

# Purpose

This folder preserves the Quartus source files required to understand the complete scrolling-message system.

The project demonstrates modular FPGA development through reuse of a VHDL display driver, creation of a custom Mod-5 counter, hierarchical schematic integration, shift-register operation, and multi-display FPGA control.
