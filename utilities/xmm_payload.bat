@echo off
@echo.
@echo NOTE: EDIT THIS PROGRAM TO SUIT YOUR NEEDS, THEN DELETE THIS LINE !!!
@echo.
if NOT "%CATALINA_DEFINE%" == "" goto define_error
if NOT "%1"=="" goto have_parameters
@echo.
@echo ERROR: no program file specified !
@echo.
@echo usage: xmm_payload program_file [ parameters ]
@echo.
@echo    e.g.  xmm_payload hello_world.binary -p2
@echo.
goto done

:have_parameters
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
payload %TMP_LCCDIR%\utilities\XMM.binary %1 %2 %3 %4 %5 %6 %7 %8 %9

:done
unset TMP_LCCDIR
