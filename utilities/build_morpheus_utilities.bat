@echo off
if NOT "%CATALINA_DEFINE%" == "" goto define_error
if "%1"=="" goto no_parameters
@echo.
@echo ERROR: ERROR: Command line parameters are not supported.
@echo.
@echo usage: build_morpheus_utilities
@echo.
goto done

:no_parameters
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

DEL /F /Q *.binary

@echo.
@echo    ==================
@echo    Building Utilities
@echo    ==================
@echo.

rem now build utilities for specific platform

@echo off
rem build programs intended to run on CPU #2
rem NOTE: this proxy support the screen (for programs executed on CPU #1)
call build_pasm_tmp_var MORPHEUS CPU_2 NO_KEYBOARD NO_MOUSE NO_SD
@echo on
spinnaker -p -a Generic_Proxy_Server.spin -o Generic_Proxy_Server_2 -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
@echo.
spinnaker -p -a Payload_XMM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o XMM_2 %TMP_VAR%
spinnaker -p -a Payload_EEPROM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o EEPROM_2 %TMP_VAR%
@echo.
spinnaker -p -a Generic_SIO_Loader_2.spin -I "%TMP_LCCDIR%\target" -b %TMP_VAR% 
@echo off
rem build programs intended to run on CPU #1 (do these last)
rem NOTE: this proxy will support the keyboard, mouse or SD card (for
rem       programs executed on CPU #2)
call build_pasm_tmp_var MORPHEUS CPU_1 NO_SCREEN 
@echo on
spinnaker -p -a Generic_Proxy_Server.spin -o Generic_Proxy_Server_1 -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
@echo.
spinnaker -p -a Payload_XMM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o XMM_1 %TMP_VAR%
spinnaker -p -a Payload_EEPROM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o EEPROM_1 %TMP_VAR%
@echo.
spinnaker -p -a CPU_2_Boot.spin -o CPU_2_Boot_1 -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
@echo.
spinnaker -p -a CPU_2_Reset.spin -o CPU_2_Reset_1 -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
@echo.
call build_pasm_tmp_var MORPHEUS PC CPU_1 SMALL 
@echo on
spinnaker -p -a "%TMP_LCCDIR%\target\xmm_default.spin" -I "%TMP_LCCDIR%\target" -b %TMP_VAR% -o Flash_Boot
@echo off
goto copy

:define_error
@echo off
@echo.
@echo ERROR: Environment variable CATALINA_DEFINE is set (to %CATALINA_DEFINE%)
@echo.
@echo You must undefine this environment variable before using this 
@echo batch file, and instead specify the target on the command line.
@echo.
goto done

:copy
@echo Copying ...
@echo.
copy /Y *.binary "%TMP_LCCDIR%\bin"

:done

unset TMP_LCCDIR
