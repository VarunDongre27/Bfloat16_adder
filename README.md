# Bfloat16 Adder (Verilog)

Implementation of a 16-bit floating-point adder/subtractor on the Basys3 FPGA board using Verilog (Xilinx Vivado).

## Overview

This project implements a bfloat16 floating-point adder and subtractor in Verilog and deploys it on the Basys3 FPGA board.

The design performs:
- Sign extraction
- Exponent comparison and alignment
- Mantissa addition/subtraction
- Result normalization

Output is displayed using onboard LEDs.

## bfloat16 Format

16-bit floating-point format:
- 1 bit → Sign
- 8 bits → Exponent
- 7 bits → Mantissa

## Hardware & Tools

- Basys3 (Artix-7 FPGA)
- Vivado
- Verilog HDL

## How to Run

1. Open project in Vivado
2. Add source files and constraints (.xdc)
3. Generate bitstream
4. Program Basys3 board
