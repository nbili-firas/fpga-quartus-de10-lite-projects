# Project 006 – DE10-Lite Scrolling Message Hardware Demonstration

## Overview       

This folder contains the physical FPGA demonstration of **Project 006 – Scrolling Message on Six 7-Segment Displays**.

The design was implemented on the:

```text
Terasic DE10-Lite FPGA Development Board
```

using the:

```text
Intel MAX 10 FPGA
```

The completed system scrolls a five-character message across all six on-board 7-segment displays.

---

# Hardware Demonstration Video

## File

```text
DE10-Lite-Scrolling-Message-Demo.mov
```

## Watch the Demonstration

[View DE10-Lite Scrolling Message Demo](DE10-Lite-Scrolling-Message-Demo.mov)

---

# Hardware Platform

```text
Board: Terasic DE10-Lite
FPGA Family: Intel MAX 10
Device: 10M50DAF484C6GES
Programming Interface: USB-Blaster
Programming Mode: JTAG
```

---

# Display Hardware

The DE10-Lite provides six independent 7-segment displays:

```text
HEX5 HEX4 HEX3 HEX2 HEX1 HEX0
```

The project uses all six displays to create the scrolling effect.

Each display is controlled through:

```text
7 segment outputs
```

for a total of:

```text
42 physical segment-control signals
```

---

# Enable Control

The project enable signal is:

```text
ON
```

The physical control is:

```text
SW4
```

Quartus assignment:

```text
ON → PIN_A12
```

To activate the project:

```text
Set SW4 HIGH
```

---

# Manual Clock

The scrolling sequence advances using:

```text
KEY0
```

The corresponding logical signal is:

```text
CLK
```

Quartus assignment:

```text
CLK → PIN_B8
```

The clock input uses:

```text
3.3 V Schmitt Trigger
```

Each button activation advances the message one scrolling step.

---

# Hardware Operation

The operating sequence is:

```text
Power / Program FPGA
        |
        v
Set SW4 HIGH
        |
        v
Enable Message Logic
        |
        v
Press KEY0
        |
        v
Clock Counter / Shift Register
        |
        v
Move Message One Position
        |
        v
Update HEX Displays
```

Repeated button presses continue moving the message across the display array.

---

# Hardware Architecture

```text
           SW4
            |
            v
          ENABLE
            |
            v
      +-------------+
KEY0->| CountMod5   |
      +------+------+
             |
             v
      Character Code
             |
             v
      +-------------+
      | SSD Decoder |
      +------+------+
             |
             v
        S[6..0]
             |
             v
      +-------------+
      | 74199 Shift |
      |  Register   |
      +------+------+
             |
             v
 HEX0 → HEX1 → HEX2 → HEX3 → HEX4 → HEX5
```

---

# Message Movement

The message is shifted from the right side of the display array toward the left.

Conceptually:

```text
Initial:
_ _ _ _ _ X

Next:
_ _ _ _ X X

Next:
_ _ _ X X X

Next:
_ _ X X X X

Next:
_ X X X X X

Next:
X X X X X _
```

where each `X` represents one encoded message character.

---

# Source Modules Used

The hardware implementation depends on:

```text
Project12.bdf
Message.bdf
CountMod5.bdf
SSD.vhd
```

The final top-level project also uses the `74199` shift-register logic required to move the display data across all six output positions.

---

# FPGA Programming

The project was compiled in Intel Quartus Prime Lite and transferred to the board using:

```text
USB-Blaster
JTAG
```

The programming flow is:

```text
Quartus Project
      |
      v
Compile
      |
      v
Quartus Programmer
      |
      v
USB-Blaster
      |
      v
JTAG
      |
      v
Intel MAX 10 FPGA
      |
      v
DE10-Lite
```

---

# Hardware Verification

The hardware test verifies:

- Project enable through SW4
- Manual clock input through KEY0
- Mod-5 character sequencing
- 7-segment character generation
- Shift-register movement
- Six-display output control
- Physical scrolling behavior

---

# Complete Hardware Workflow

```text
Create Mod-5 Counter
        |
        v
Generate Character Data
        |
        v
Decode Character for SSD
        |
        v
Shift Character Data
        |
        v
Drive Six HEX Displays
        |
        v
Assign FPGA Pins
        |
        v
Compile
        |
        v
USB-Blaster / JTAG
        |
        v
Program DE10-Lite
        |
        v
Enable with SW4
        |
        v
Clock with KEY0
        |
        v
Observe Scrolling Message
```

---

# Skills Demonstrated

## FPGA Hardware

- Terasic DE10-Lite
- Intel MAX 10 FPGA
- Six 7-Segment Displays
- Pushbutton Input
- Switch Input
- FPGA Pin Mapping
- JTAG Programming

## Digital Logic

- Modulo Counters
- Sequential Logic
- Shift Registers
- 74161 Counter
- 74199 Shift Register
- Manual Clocking
- Enable Logic

## Display Control

- 7-Segment Decoding
- Character Sequencing
- Multi-Display Systems
- Scrolling Display Logic

## Engineering

- Hardware/Software Integration
- Hierarchical FPGA Design
- Digital-System Verification
- Troubleshooting
- Testing
- Physical Hardware Validation

---

# What the Demonstration Proves

The hardware demonstration confirms that the project progressed beyond independent Quartus modules and software compilation.

The design was:

```text
Designed
   |
   v
Simulated
   |
   v
Integrated
   |
   v
Mapped to 42 Display Signals
   |
   v
Compiled
   |
   v
Programmed onto MAX 10
   |
   v
Controlled through SW4 and KEY0
   |
   v
Verified on Six Physical Displays
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

Development screenshots:

```text
../Screenshots/
```

---

# Conclusion

The physical DE10-Lite demonstration confirms the successful implementation of the scrolling-message FPGA system.

The project demonstrates practical integration of a Mod-5 counter, VHDL display decoder, shift-register logic, hierarchical schematics, manual clocking, and six physical 7-segment displays into one working digital application.
