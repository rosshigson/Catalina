@echo off
rem
rem Run a Pascal file in batch mode
rem
rem Runs a Pascal intermediate in batch mode.
rem
rem Execution:
rem
rem run <file>
rem
rem <file> is the filename without extention.
rem
rem The files are:
rem
rem <file>.p5  - The intermediate file
rem <file>.out - The prr file produced
rem <file>.inp - The input file to the program
rem <file>.lst - The output file from the program
rem
pint %1.p5 %1.out < %1.inp > %1.lst
