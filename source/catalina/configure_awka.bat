@echo off
rem
rem this script attempts to configure awka, which cannot be done in a 
rem command shell, it must be done in a MINGW32 bash shell - so we try 
rem to detect if MinGW has been installed where we expect it ...
rem
if EXIST "C:\msys64\usr\bin" goto found_mingw
@echo.
@echo   ERROR: MinGW does not seem to be installed in "C:\msys64"
@echo.
@echo   Modify "source/catalina/configure_awka.bat" or akwa will not 
@echo   be configured correctly.
@echo.
goto finish

:found_mingw
C:\\msys64\\usr\\bin\\env MSYSTEM=MINGW32 CHERE_INVOKING=1 /usr/bin/bash -lc "cd awka-0.7.5;./configure"
:finish

