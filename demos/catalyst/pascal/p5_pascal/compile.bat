@echo off
rem
rem Compile file in batch mode.
rem
rem Runs a compile with the input and output coming from/
rem going to files.
rem 
rem Execution:
rem 
rem Compile <file>
rem
rem <file> is the filename without extention.
rem
rem The files are:
rem
rem <file>.pas - The Pascal source file
rem <file>.p5  - The intermediate file produced
rem <file>.err - The errors output from the compiler
rem
rem Note that the l+ option must be specified to get a full
rem listing in the .err file (or just a lack of l-).
rem
pcom %1.p5 < %1.pas > %1.err