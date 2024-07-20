@echo off
if NOT "%CATALINA_DEFINE%" == "" goto define_error
if NOT "%1"=="" goto have_parameters
@echo.
@echo ERROR: no PLATFORM specified !
@echo.
@echo usage: build_ram_test PLATFORM [ CPU ] [ OPTIONS ]
@echo.
@echo    where  PLATFORM is:
@echo.
@echo.              HYDRA, HYBRID, RAMBLADE, DRACBLADE, DEMO, C3, CUSTOM
@echo               or TRIBLADEPROP CPU_1 or TRIBLADEPROP CPU_2
@echo               or SUPERQUAD or RAMPAGE
@echo.
@echo    and    OPTIONS can include:
@echo.
@echo               NO_RAM, FLASH, CACHED, CACHED_1K, CACHED_2K, CACHED_4K, CACHED_8K
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
@echo.
@echo    =================
@echo    Building RAM Test
@echo    =================
@echo.
call build_pasm_tmp_var %1 %2 %3 %4 %5 %6 %7 %8 %9 NO_MOUSE
@echo on
spinnaker -p -a RAM_Test.spin -I "%TMP_LCCDIR%\target\p1" -D PC -b %TMP_VAR% -o RAM_Test_PC -l
spinnaker -p -a RAM_Test.spin -I "%TMP_LCCDIR%\target\p1" -D HIRES_VGA -b %TMP_VAR% -o RAM_Test_VGA
spinnaker -p -a RAM_Test.spin -I "%TMP_LCCDIR%\target\p1" -D HIRES_TV -b %TMP_VAR% -o RAM_Test_TV
@echo off
goto done

:define_error
@echo off
@echo.
@echo ERROR: Environment variable CATALINA_DEFINE is set (to %CATALINA_DEFINE%)
@echo.
@echo You must undefine this environment variable before using this 
@echo batch file, and instead specify the target on the command line.
@echo.

:done
set TMP_LCCDIR=
