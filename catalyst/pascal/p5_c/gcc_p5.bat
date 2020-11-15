@echo off
rem
rem Compile with P5
rem
rem Execute with:
rem
rem p5 <file>
rem
rem where <file> is the name of the source file without
rem extention. The Pascal file is compiled and run.
rem Any compiler errors are output to the screen. Input
rem and output to and from the running program are from
rem the console, but output to the prr file is placed
rem in <file>.out.
rem The intermediate code is placed in <file>.p5.
rem
gcc_pcom %1.p5 < %1.pas
gcc_pint %1.p5 %1.out
