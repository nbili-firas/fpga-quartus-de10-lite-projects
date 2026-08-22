# Project 001 – FPGA 7-Segment Display Driver Screenshots

## Overview

This folder contains screenshots documenting the design, simulation, pin assignment, compilation, and FPGA programming stages of Project 001.

The screenshots provide visual evidence of the complete Quartus Prime Lite workflow used to implement the VHDL 7-segment display driver on the DE10-Lite FPGA Development Board.

---

# Screenshot 1 – Top-Level Quartus Schematic

## File

`Picture1.png`

![Top-Level Quartus Schematic](Picture1.png)

## Description

This screenshot shows the top-level Block Diagram/Schematic developed in Quartus Prime Lite.

The design includes:

- `D[3..0]` 4-bit input
- `EN` enable input
- `SSD` display-driver symbol
- `S[6..0]` 7-bit output

The `SSD` block represents the VHDL display-driver module generated as a Quartus symbol.

### Design Flow

```text
D[3..0] ─────┐
              │
              ▼
          ┌─────────┐
EN ──────►│   SSD   │──────► S[6..0]
          └─────────┘
