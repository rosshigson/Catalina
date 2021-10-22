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
call build_tmp_var %1 %2 %3 %4 %5
catalina catalina_pcom.c -lcx -I..\ptoc ..\ptoc\paslib.c ..\ptoc\set.c ..\ptoc\io.c -C LARGE -M512k -lma -o pcom -C MORPHEUS -C CPU_2 -C PC -C VT100 -C NO_MOUSE -C PROXY_SD -C PROXY_SCREEN -C PROXY_KEYBOARD %TMP_VAR%
catalina catalina_pint.c -lcx -I..\ptoc ..\ptoc\paslib.c ..\ptoc\set.c ..\ptoc\io.c -C LARGE -M512k -lma -o pint -C MORPHEUS -C CPU_2 -C PC -C VT100 -C NO_MOUSE -C PROXY_SD -C PROXY_SCREEN -C PROXY_KEYBOARD %TMP_VAR%

call build_pasm_tmp_var %1 %2 %3 %4 %5
spinnaker -p -a "%TMP_LCCDIR%\utilities\Generic_Proxy_Server.spin" -o proxy -I "%TMP_LCCDIR%\target" -b -D MORPHEUS -D CPU_1 -D PC -D NO_MOUSE %TMP_VAR%

:done
set TMP_LCCDIR=

