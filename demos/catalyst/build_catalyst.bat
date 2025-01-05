@echo off

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
set TMP_FLASH=
set TMP_CACHE=

@cls
@echo.
@echo This command will build Catalyst and various utilities. It is important
@echo that Catalyst be built with options compatible with those you intend to
@echo use when you build your Catalina programs to be run under Catalyst. 
@echo.
@echo The most important cases are that if you intend to compile programs to use
@echo Flash memory as XMM RAM, then you must build Catalyst with Flash support
@echo enabled, and if you intend to run programs that use a specific cache size
@echo then you must also build Catalyst to use a cache of the same size.
@echo.
@echo First, specify your platform. If your platform is not listed, you must
@echo build Catalyst using the 'build_all' script in the Catalyst directory
@echo instead of using this script.
@echo.
@echo The platforms currently supported by this script are:
@echo.
@echo     HYDRA   HYBRID   DEMO   TRIBLADEPROP
@echo     MORHPEUS   DRACBLADE   RAMBLADE
@echo     ASC   C3   FLIP   CUSTOM
@echo     P2_EVAL   P2_EDGE
:enter_platform
@echo.
SET CPU=
SET PLATFORM=
SET/P PLATFORM="Enter your platform in UPPER CASE: "
if "%PLATFORM%" == "HYDRA" goto select_cache
if "%PLATFORM%" == "HYBRID" goto select_cache
if "%PLATFORM%" == "DEMO" goto select_cache
if "%PLATFORM%" == "ASC" goto select_cache
if "%PLATFORM%" == "FLIP" goto select_cache
if "%PLATFORM%" == "CUSTOM" goto select_cache
if "%PLATFORM%" == "DRACBLADE" goto select_cache
if "%PLATFORM%" == "RAMBLADE" goto select_cache
if "%PLATFORM%" == "TRIBLADEPROP" goto select_cpu
if "%PLATFORM%" == "C3" goto select_flash
if "%PLATFORM%" == "P2_EVAL" goto do_build
if "%PLATFORM%" == "P2_EDGE" goto do_build
@echo.
@echo Invalid Platform selected - try again.
SET PLATFORM=
goto enter_platform

:select_cpu
@cls
@echo.
@echo The %PLATFORM% supports multiple CPUs.
:enter_cpu
@echo.
SET/P CPU="Enter the CPU you want to use (1, 2 or 3): "
if "%CPU%" == "1" goto check_for_flash_platform
if "%CPU%" == "2" goto check_for_flash_platform
if "%CPU%" == "3" goto check_for_flash_platform
:cpu_error
@echo.
@echo Invalid CPU selected - try again.
goto enter_cpu

:check_for_flash_platform
if NOT "%PLATFORM%" == "C3" goto select_cache

:select_flash
@cls
@echo.
@echo The %PLATFORM% has Flash memory which can be used as XMM RAM.
@echo.
SET/P TMP_FLASH="Would you like to use the Flash memory as XMM RAM (Y/N): "
if "%TMP_FLASH%" == "y" set TMP_FLASH=Y

:select_cache
@cls
@echo.
@echo If you would like to use the cache, please select the cache size, or just
@echo press ENTER to disable the cache (note the cache is required to use XMM 
@echo on some platforms). The cache size can be:
@echo.
@echo    1 kilobyte
@echo    2 kilobytes
@echo    4 kilobytes
@echo    8 kilobytes
:enter_cache
@echo.
SET/P TMP_CACHE="Enter the size of the cache (1,2,4,8 or ENTER for none): "
if "%TMP_CACHE%" == "" goto cache_check
if "%TMP_CACHE%" == "1" goto do_build
if "%TMP_CACHE%" == "2" goto do_build
if "%TMP_CACHE%" == "4" goto do_build
if "%TMP_CACHE%" == "8" goto do_build
@echo.
echo Invalid cache size. Try again.
set TMP_CACHE=
goto enter_cache

:cache_check
if "%PLATFORM%%TMP_FLASH%%TMP_CACHE%" == "C3Y" goto need_cache
goto do_build

:need_cache
@echo.
echo The %PLATFORM% requires the cache when using Flash memory as XMM. Try again.
goto enter_cache

:do_build
SET FLASH=
if "%TMP_FLASH%"=="Y" set FLASH=FLASH
SET CACHE=
if NOT "%TMP_CACHE%"=="" set CACHE=CACHED_%TMP_CACHE%K

rem first try current directory ...
if exist "%CD%\build_catalyst.bat" goto current_build

rem then try home directory ...
if exist "%HOMEPATH%\demos\catalyst\build_catalyst.bat" goto home_build

rem then use installation directory ...
echo Building Catalyst in installation directory
pushd "%TMP_LCCDIR%\demos\catalyst"
goto select_options

:current_build
echo Building Catalyst in current directory
pushd "%CD%"
:goto select_options

:home_build
echo Building Catalyst in home directory
pushd "%HOMEPATH%\demos\catalyst"
:goto select_options

:select_options
@echo.
@echo If you would like to enter any other options, specify them here, 
@echo with each option separated by a space. For example TTY VT100
@echo.
SET/P OPTIONS="Enter other options: "

@echo.
@echo build_all %PLATFORM% %FLASH% %CACHE% %OPTIONS%
call build_all %PLATFORM% %FLASH% %CACHE% %OPTIONS%
popd
goto done

:done

