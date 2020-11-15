@echo off
rem
rem This file assumes MinGW is installed in J:\MinGW, MSYS in J:\msys\1.0
rem and Catalina in C:\Program Files\Catalina - edit this file as necessary.
rem
rem You may also need to edit makefile.mgw
rem
set path=.;%PATH%

make clean -f makefile.mgw
make all -f makefile.mgw
make install -f makefile.mgw

