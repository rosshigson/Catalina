@echo off
@echo.
@echo   NOTE: The use of this batch file is deprecated, and may be removed
@echo         from a subsequent release - use 'build_utilities' instead!
@echo.

if NOT "%CATALINA_DEFINE%" == "" goto define_error
if NOT "%1"=="" goto have_parameters
@echo.
@echo ERROR: no PLATFORM specified !
@echo.
@echo usage: build_all PLATFORM [ OPTIONS ]
@echo.
@echo    where PLATFORM is:
@echo.
@echo                   HYDRA, HYBRID, MORPHEUS, TRIBLADEPROP, SUPERQUAD,
@echo                   RAMPAGE, DRACBLADE, RAMBLADE, DEMO, C3 or CUSTOM
@echo.
@echo    and OPTIONS can include:
@echo.
@echo                   Any Catalina target options (e.g. TV, SD, CLOCK) needed
@echo                   to configure which plugins will be loaded by Flash_Boot
@echo                   utility, as well as options to configure the various
@echo                   load utilities, such as:
@echo.
@echo                   FLASH, WRITE_CHECK, ERASE_CHECK, CHIP_ERASE
@echo                   CACHED, CACHED_1K, CACHED_2K, CACHED_4K, CACHED_8K
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

DEL /F /Q *.binary

@echo.
@echo    ==================
@echo    Building Utilities
@echo    ==================
@echo.

rem now build utilities for specific platforms (if any)

if "%1"=="TRIBLADEPROP" goto tribladeprop
if "%1"=="MORPHEUS" goto morpheus
if "%1"=="C3" goto C3
if "%1"=="SUPERQUAD" goto SUPERQUAD
if "%1"=="RAMPAGE" goto RAMPAGE
if "%1"=="HYBRID" goto hybrid
if "%1"=="HYDRA" goto hydra

@echo.
call build_pasm_tmp_var %1 %2 %3 %4 %5 %6 %7 %8 %9
@echo on
spinnaker -p -a Payload_XMM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o XMM %TMP_VAR%
spinnaker -p -a Payload_EEPROM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o EEPROM %TMP_VAR%
@echo off
goto copy

:hybrid
@echo.
call build_pasm_tmp_var %1 %2 %3 %4 %5 %6 %7 %8 %9
@echo on
spinnaker -p -a Mouse_Port_Loader.spin -I "%TMP_LCCDIR%\target" -b -o Hybrid_Mouse %TMP_VAR%
copy Hybrid_Mouse.binary XMM.binary
spinnaker -p -a Payload_EEPROM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o EEPROM %TMP_VAR%
@echo off
goto copy

:hydra
@echo.
call build_pasm_tmp_var %1 %2 %3 %4 %5 %6 %7 %8 %9
@echo on
spinnaker -p -a Mouse_Port_Loader.spin -I "%TMP_LCCDIR%\target" -b -o Hydra_Mouse %TMP_VAR%
copy Hydra_Mouse.binary XMM.binary
spinnaker -p -a Payload_EEPROM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o EEPROM %TMP_VAR%
@echo off
goto copy

:C3
call build_pasm_tmp_var %1 %2 %3 %4 %5 %6 %7 %8 %9 SMALL
@echo on
spinnaker -p -a Payload_XMM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o XMM %TMP_VAR%
spinnaker -p -a Payload_EEPROM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o EEPROM %TMP_VAR%
spinnaker -p -a "%TMP_LCCDIR%\target\xmm_default.spin" -I "%TMP_LCCDIR%\target" -b %TMP_VAR% -o Flash_Boot
@echo.
@echo off
goto copy

:superquad
call build_pasm_tmp_var %1 %2 %3 %4 %5 %6 %7 %8 SMALL
@echo on
spinnaker -p -a Payload_XMM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o XMM %TMP_VAR%
spinnaker -p -a Payload_EEPROM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o EEPROM %TMP_VAR%
spinnaker -p -a "%TMP_LCCDIR%\target\xmm_default.spin" -I "%TMP_LCCDIR%\target" -b %TMP_VAR% -o Flash_Boot
@echo.
@echo off
goto copy

:rampage
call build_pasm_tmp_var %1 %2 %3 %4 %5 %6 %7 %8 SMALL
@echo on
spinnaker -p -a Payload_XMM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o XMM %TMP_VAR%
spinnaker -p -a Payload_EEPROM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o EEPROM %TMP_VAR%
spinnaker -p -a "%TMP_LCCDIR%\target\xmm_default.spin" -I "%TMP_LCCDIR%\target" -b %TMP_VAR% -o Flash_Boot
@echo.
@echo off
goto copy

:morpheus
@echo off
rem build programs intended to run on CPU #2
rem NOTE: this proxy support the screen (for programs executed on CPU #1)
call build_pasm_tmp_var %1 %2 %3 %4 %5 CPU_2 NO_KEYBOARD NO_MOUSE NO_SD
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
call build_pasm_tmp_var %1 %2 %3 %4 %5 %6 %7 CPU_1 NO_SCREEN 
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
call build_pasm_tmp_var %1 %2 %3 %4 %5 %6 PC CPU_1 SMALL 
@echo on
spinnaker -p -a "%TMP_LCCDIR%\target\xmm_default.spin" -I "%TMP_LCCDIR%\target" -b %TMP_VAR% -o Flash_Boot
@echo off
goto copy

:tribladeprop
@echo off
rem build programs intended to run on CPU #1
rem NOTE: this proxy will support the keyboard, mouse or screen
rem       (for programs executed on another CPU)
call build_pasm_tmp_var %1 %2 %3 %4 %5 %6 %7 CPU_1 NO_SD
@echo on
spinnaker -p -a Generic_Proxy_Server.spin -o Generic_Proxy_Server_1 -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
@echo.
spinnaker -p -a Generic_SIO_Loader_1.spin -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
@echo.
spinnaker -p -a Payload_XMM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o XMM_1 %TMP_VAR%
spinnaker -p -a Payload_EEPROM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o EEPROM_1 %TMP_VAR%
@echo.
@echo off
rem build programs intended to run on CPU #3
call build_pasm_tmp_var %1 %2 %3 %4 %5 %6 %7 %8 CPU_3
@echo on
spinnaker -p -a Generic_SIO_Loader_3.spin -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
@echo off
rem build programs intended to run on CPU #2 (do these last)
rem NOTE: this proxy will support the SD card 
rem        (for programs running on another CPU), but we also
rem        specify a PC HMI device , which allows us to proxy 
rem        programs running on any other CPU to the PC.
call build_pasm_tmp_var %1 %2 %3 %4 %5 %6 %7 CPU_2 PC
@echo on
spinnaker -p -a Generic_Proxy_Server.spin -o Generic_Proxy_Server_2 -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
@echo.
spinnaker -p -a Payload_XMM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o XMM_2 %TMP_VAR%
spinnaker -p -a Payload_EEPROM_Loader.spin -I "%TMP_LCCDIR%\target" -b -o EEPROM_2 %TMP_VAR%
@echo.
spinnaker -p -a CPU_1_Boot.spin -o CPU_1_Boot_2 -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
spinnaker -p -a CPU_3_Boot.spin -o CPU_3_Boot_2 -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
@echo.
spinnaker -p -a CPU_1_Reset.spin -o CPU_1_Reset_2 -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
spinnaker -p -a CPU_3_Reset.spin -o CPU_3_Reset_2 -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
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
unset TMP_CATBIND
