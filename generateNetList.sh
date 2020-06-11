#!/usr/bin/env bash
#
# Generates a netlist that can be burnt onto an ICE40 FPGA.

./doGenerate.sh --verilog-core --xlen 32 && \
yosys -p "synth_ice40 -blif models/core32/System.blif" models/core32/System.sv && \
arachne-pnr -d 8k models/core32/System.blif -o models/core32/System.asc && \
icepack models/core32/System.asc models/core32/System.bin
