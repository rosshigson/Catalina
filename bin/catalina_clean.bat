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
del /f /q p2\Catalina.s
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
popd
pushd %TMP_LCCDIR%\demos
call clean_all
popd
pushd %TMP_LCCDIR%\demos\alloca
call clean_all
popd
pushd %TMP_LCCDIR%\demos\benchmarks
call clean_all
popd
pushd %TMP_LCCDIR%\demos\catapult
call clean_all
popd
pushd %TMP_LCCDIR%\demos\debug
call clean_all
popd
pushd %TMP_LCCDIR%\demos\dosfs
call clean_all
popd
pushd %TMP_LCCDIR%\demos\examples
call clean_all
popd
pushd %TMP_LCCDIR%\demos\file_systems
call clean_all
popd
pushd %TMP_LCCDIR%\demos\games
call clean_all
popd
pushd %TMP_LCCDIR%\demos\globbing
call clean_all
popd
pushd %TMP_LCCDIR%\demos\graphics
call clean_all
popd
pushd %TMP_LCCDIR%\demos\hub_malloc
call clean_all
popd
pushd %TMP_LCCDIR%\demos\inline_pasm
call clean_all
popd
pushd %TMP_LCCDIR%\demos\interrupts
call clean_all
popd
pushd %TMP_LCCDIR%\demos\loader
call clean_all
popd
pushd %TMP_LCCDIR%\demos\lua
call clean_all
popd
pushd %TMP_LCCDIR%\demos\lut_exec
call clean_all
popd
pushd %TMP_LCCDIR%\demos\minimal
call clean_all
popd
pushd %TMP_LCCDIR%\demos\multicog
call clean_all
popd
pushd %TMP_LCCDIR%\demos\multicpu
call clean_all
popd
pushd %TMP_LCCDIR%\demos\multimodel
call clean_all
popd
pushd %TMP_LCCDIR%\demos\multithread
call clean_all
popd
pushd %TMP_LCCDIR%\demos\p2
call clean_all
popd
pushd %TMP_LCCDIR%\demos\p2_ram
call clean_all
popd
pushd %TMP_LCCDIR%\demos\parallelize
call clean_all
popd
pushd %TMP_LCCDIR%\demos\pasm_pstr
call clean_all
popd
pushd %TMP_LCCDIR%\demos\pthreads
call clean_all
popd
pushd %TMP_LCCDIR%\demos\random
call clean_all
popd
pushd %TMP_LCCDIR%\demos\serial2
call clean_all
popd
pushd %TMP_LCCDIR%\demos\serial4
call clean_all
popd
pushd %TMP_LCCDIR%\demos\serial8
call clean_all
popd
pushd %TMP_LCCDIR%\demos\small_lisp
call clean_all
popd
pushd %TMP_LCCDIR%\demos\sound
call clean_all
popd
pushd %TMP_LCCDIR%\demos\spi
call clean_all
popd
pushd %TMP_LCCDIR%\demos\spinc
call clean_all
popd
pushd %TMP_LCCDIR%\demos\test_suite
call clean_all
popd
pushd %TMP_LCCDIR%\demos\tty
call clean_all
popd
pushd %TMP_LCCDIR%\demos\tty256
call clean_all
popd
pushd %TMP_LCCDIR%\demos\utilities
call clean_all
popd
pushd %TMP_LCCDIR%\demos\vgraphics
call clean_all
popd
pushd %TMP_LCCDIR%\demos\xeprom
call clean_all
popd
pushd %TMP_LCCDIR%\utilities
call clean_all
popd
pushd %TMP_LCCDIR%\validation
call clean_all
popd
call catalyst_clean
:done
@echo.
@echo Done!
@echo.
