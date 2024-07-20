@echo off
rem save value of CATALINA_DEFINE (note we must use a different TMP name!)
set TMP_DEFINE_TOP=%CATALINA_DEFINE%
echo.
if "%1"=="" goto no_parameters
set TMP_PARAMS=%1 %2 %3 %4 %5 %6 %7 %8 %9
for /f "delims=" %%A in ('echo %TMP_PARAMS%') do call :Trim %%A
if "%CATALINA_DEFINE%" == "" goto parameters_and_no_define
if "%CATALINA_DEFINE%" == "%TMP_PARAMS%" goto use_define
echo ERROR: Command line options conflict with CATALINA_DEFINE
echo.
echo    CATALINA_DEFINE is set to %CATALINA_DEFINE%
echo    Command line options were %1 %2 %3 %4 %5 %6 %7 %8 %9
echo.
echo    Either set CATALINA_DEFINE to null using the following command:
echo.
echo       unset CATALINA_DEFINE
echo.
echo    or do not specify any command line parameters
echo.
goto done

:Trim
set TMP_PARAMS=%*
exit /b 0 

:parameters_and_no_define
echo NOTE: All programs will be built with options %1 %2 %3 %4 %5 %6 %7 %8 %9
echo.
echo   If these options conflict with options specified in the Makefile, 
echo   the results may be unexpected.
echo.
set CATALINA_DEFINE=%TMP_PARAMS%
goto start

:no_parameters
if "%CATALINA_DEFINE%" == "" goto use_default
:use_define
echo NOTE: Environment variable CATALINA_DEFINE is set to %CATALINA_DEFINE%
echo.
echo   All programs will be built using these options. If these conflict
echo   with options specified in this file, the results may be unexpected.
echo.
goto start

:use_default
echo NOTE: Environment variable CATALINA_DEFINE is not set
echo.
echo   All programs will be built for the default target 
echo.

:start
set TMP_LCCDIR=%LCCDIR%
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files (x86)\Catalina
if EXIST "%TMP_LCCDIR%\bin\catalina_env.bat" goto found_catalina
echo ERROR: Catalina does not appear to be installed in %TMP_LCCDIR%
echo.
echo   Set the environment variable LCCDIR to where Catalina is installed.
echo.
goto done

:found_catalina

echo.
echo  ===========================
echo  Building all Catalyst Demos
echo  ===========================
echo.

call clean_all
del /f /q "image\*"
copy CATALYST.TXT "image\"

cd core
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\image\"
cd ..

cd fymodem
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\image\"
cd ..

if "%1%" == "SUPERQUAD" goto done

cd xvi-2.51
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\image\"
cd ..

cd time
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\image\"
cd ..

if "%1%" == "C3" goto no_pascal

cd pascal\p5_c
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\..\image\"
cd ..\..
:no_pascal

if "%1%" == "C3" goto no_jzip

cd jzip
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\image\"
cd ..

:no_jzip

cd dumbo_basic
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\image\"
cd ..

cd sst
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\image\"
cd ..

cd lua-5.4.4
call build_all %1 %2 %3 %4 %5 %6 %7 %8 %9
call copy_all "..\image\"
cd ..


:done
rem restore value of CATALINA_DEFINE (note we used a different TMP name!)
set CATALINA_DEFINE=%TMP_DEFINE_TOP%
echo.
echo ====
echo Done
echo ====
echo.


