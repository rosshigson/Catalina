@echo off
if "%CATALINA_DEFINE%" == "" goto no_define
:define_error
@echo off
@echo.
@echo ERROR: Environment variable CATALINA_DEFINE is set (to %CATALINA_DEFINE%)
@echo.
@echo You must undefine this environment variable before using this 
@echo batch file, and instead specify the target on the command line.
@echo.
goto done:

:no_define
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
cd src
call build_tmp_var %1 %2 %3 %4 %5
set CATALINA_DEFINE=MORPHEUS CPU_2 PC VT100 PROXY_SD PROXY_KEYBOARD PROXY_SCREEN NO_MOUSE CLOCK %1 %2 %3 %4
make -f Makefile.Catalina clean
make -f Makefile.Catalina
call unset CATALINA_DEFINE

call build_pasm_tmp_var %1 %2 %3 %4 %5
spinnaker -p -a "%TMP_LCCDIR%\utilities\Generic_Proxy_Server.spin" -o proxy -I "%TMP_LCCDIR%\target" -b -D MORPHEUS -D CPU_1 -D PC -D NO_MOUSE %TMP_VAR%
cd ..

:done
set TMP_LCCDIR=
