@echo off
if not exist .\Makefile goto no_makefile
make clean >NUL: 2>&1
:no_makefile
del /q Catalina.spin Catalina.s >NUL: 2>&1
del /q *.bin *.binary *.eeprom *.dbg *.debug *.obj *.lst >NUL: 2>&1


