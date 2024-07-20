rem @echo off
rem
set TMP_LCCDIR=%LCCDIR%
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files (x86)\Catalina
if EXIST "%TMP_LCCDIR%\bin\catalina_env.bat" goto found_catalina
echo.
echo   ERROR: Catalina does not appear to be installed in %TMP_LCCDIR%
echo.
echo   Set the environment variable LCCDIR to where Catalina is installed.
echo.
goto done
:found_catalina
@echo.
@echo Cleaning Catalyst directories ...
@echo.
del /f /q "%TMP_LCCDIR%\demos\catalyst\bin\*.*"
pushd %TMP_LCCDIR%\demos\catalyst\core
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\catalyst\demo
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\catalyst\dumbo_basic
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\catalyst\jzip
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\catalyst\lua-5.1.4\src
del /f /q liblua\*.*
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\catalyst\pascal\p5_c
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\catalyst\sst
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\catalyst\xvi-2.51\src
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
:done
@echo.
@echo ... done cleanng
@echo.
