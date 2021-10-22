@echo off
rem
rem Test a single program run
rem
rem Tests the compile and run of a single program.
rem
rem To do this, there must be the files:
rem
rem <file>.inp - Contains all input to the program
rem <file>.cmp - Used to compare the <file>.lst program to, should
rem              contain an older, fully checked version of <file>.lst.
rem
rem <file>.dif will contain the differences in output of the run.
rem
if not "%1"=="" goto paramok
echo *** Error: Missing parameter
goto stop
:paramok
if exist %1.pas goto :sourcefileexist
echo *** Error: Source file %1.pas does not exist
goto stop
:sourcefileexist
if exist %1.inp goto :inputfileexist
echo *** Error: Input file %1.inp does not exist
goto stop
:inputfileexist
echo Compile and run %1
call compile %1
call run %1
diff %1.lst %1.cmp > %1.dif
dir %1.dif
:stop
