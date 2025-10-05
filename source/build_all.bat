@echo off

rem
rem check LCCDIR is set
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

call ..\use_catalina

cd %LCCDIR%\source

cd catalina
call build_all
cd ..\cake
call build_all
cd ..\catoptimize
call build_all
call copy_all
cd ..\p2asm_src
call build_all
cd ..\lcc
call build_all
cd ..\openspin
call build_all
cd ..\lib
call build_all
cd ..

:done

