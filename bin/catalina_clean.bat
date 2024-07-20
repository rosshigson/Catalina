@echo off
rem
rem This script tries to clean up generated files in the 
rem target directory - it should be run as Administrator
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
if "%CATALINA_TARGET%" == "" goto check_lccdir
@echo Cleaning %CATALINA_TARGET%
pushd %CATALINA_TARGET%
goto clean
:check_lccdir
if "%TMP_LCCDIR%" == "" goto check_all
@echo Cleaning %TMP_LCCDIR%\target
pushd %TMP_LCCDIR%\target
:clean
@echo.
rem
rem cleanup generated output files ...
rem 
del /f /q p1\Catalina.spin
del /f /q p2\Catalina.spin
rem
popd
:check_all
if "%1" == "all" goto all
if "%1" == "ALL" goto all
goto done
:all
pushd %TMP_LCCDIR%\bin
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\benchmarks
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\debug
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\dosfs
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\examples
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\file_systems
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\games
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\globbing
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\graphics
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\inline_pasm
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\interrupts
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\loader
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\minimal
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\multicog
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\multicpu
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\multimodel
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\multithread
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\p2
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\p2_ram
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\parallelize
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\pthreads
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\serial2
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\serial4
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\serial8
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\small_lisp
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\sound
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\spi
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\spinc
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\test_suite
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\tty
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\tty256
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\utilities
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\vgraphics
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\xeprom
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\catalyst\bin
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\demos\catalyst\catalina
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
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
pushd %TMP_LCCDIR%\demos\catalyst\lua-5.4.4\src
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
pushd %TMP_LCCDIR%\utilities
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
pushd %TMP_LCCDIR%\validation
del /f /q *.bin
del /f /q *.binary
del /f /q *.eeprom 
del /f /q *.lst 
del /f /q *.debug 
del /f /q *.dbg
popd
:done
@echo.
@echo Done!
@echo.
