@echo off
rem
rem You may need to edit makefile.mgw
rem
set path=.;%PATH%

make clean -f makefile.mgw
make all -f makefile.mgw
make install -f makefile.mgw

