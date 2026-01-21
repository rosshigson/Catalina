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
del /f /q "%TMP_LCCDIR%\demos\catalyst\image\*.*"
pushd %TMP_LCCDIR%\demos\catalyst\catalina
call clean_all
popd
pushd %TMP_LCCDIR%\demos\catalyst\core
call clean_all
popd
pushd %TMP_LCCDIR%\demos\catalyst\demo
call clean_all
popd
pushd %TMP_LCCDIR%\demos\catalyst\dumbo_basic
call clean_all
popd
pushd %TMP_LCCDIR%\demos\catalyst\fymodem
call clean_all
popd
pushd %TMP_LCCDIR%\demos\catalyst\jzip
call clean_all
popd
pushd %TMP_LCCDIR%\demos\catalyst\lua-5.4.8\src
call clean_all
popd
pushd %TMP_LCCDIR%\demos\catalyst\pascal\p5_c
call clean_all
popd
pushd %TMP_LCCDIR%\demos\catalyst\sst
call clean_all
popd
pushd %TMP_LCCDIR%\demos\catalyst\time
call clean_all
popd
pushd %TMP_LCCDIR%\demos\catalyst\xvi-2.51\src
call clean_all
popd
:done
@echo.
@echo ... done cleanng
@echo.
