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
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files\Catalina
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
catalina -c -C LARGE -DLOUSY_RANDOM catalina_jzip.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM control.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM extern.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM fileio.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM input.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM interpre.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM math.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM memory.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM object.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM operand.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM osdepend.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM license.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM property.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM quetzal.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM screen.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM text.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM variable.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM getopt.c %TMP_VAR%
catalina -c -C LARGE -DLOUSY_RANDOM dumbio.c %TMP_VAR%
catalina -C LARGE -M256k -C CLOCK -C MORPHEUS -C CPU_2 -C PC -C VT100 -C NO_MOUSE -C PROXY_SD -C PROXY_SCREEN -C PROXY_KEYBOARD -lcx -lma -o jzip catalina_jzip.obj control.obj extern.obj fileio.obj input.obj interpre.obj math.obj memory.obj object.obj operand.obj osdepend.obj license.obj property.obj quetzal.obj screen.obj text.obj variable.obj getopt.obj dumbio.obj %TMP_VAR%

call build_pasm_tmp_var %1 %2 %3 %4 %5
spinnaker.exe -p -a "%TMP_LCCDIR%\utilities\Generic_Proxy_Server" -o proxy -I "%TMP_LCCDIR%\target" -b -D MORPHEUS -D CPU_1 -D PC -D NO_MOUSE %TMP_VAR%

:done
set TMP_LCCDIR=

