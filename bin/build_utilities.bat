@echo off

SET CATALINA_DEFINE=

if "%1" == "" goto setup_lccdir
cls
@echo.
@echo   ERROR: This batch file does not accept parameters. It is an interactive
@echo          batch file that will prompt for any required information.
@echo.
@echo   Remove the parameters and re-execute the batch file.
@echo.
goto finish

:setup_lccdir

set TMP_LCCDIR=%LCCDIR%
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files (x86)\Catalina
if EXIST "%TMP_LCCDIR%\utilities\build_utilities.bat" goto found_catalina
cls
@echo.
@echo   ERROR: Catalina does not appear to be installed in %TMP_LCCDIR%
@echo.
@echo   Set the environment variable LCCDIR to where Catalina is installed.
@echo.
goto finish

:found_catalina

set CACHE=
set XMM_BOARD=
set TMP_SRAM=
set TMP_FLASH=
set XMM_CACHE=
set FLASH_CACHE=
set DEFAULT_XMM=
set COPY_BIN=
set COPY_CURRENT=
set TMP_CURRENT=%CD%

@cls
@echo.
@echo                      ===========================
@echo                      Building Catalina Utilities
@echo                      ===========================
@echo.
@echo This command will build various Catalina utilities. It is important that
@echo the utilities be built with options compatible with those you use when
@echo you build your Catalina programs.
@echo.
@echo For example, if you intend to compile programs to execute from FLASH RAM,
@echo then to load the program you must build the FLASH load utility.
@echo.
@echo Similarly, if you if you intend to compile programs to use a specific
@echo cache size then you must build the load utilities with the same cache
@echo size.
@echo.
@echo You can re-run this program any time if you need to change options. 
@echo.
SET/P PAUSE="Press ENTER to begin ..."
cls
@echo.
@echo First, do you want this script to copy the utilities it builds to 
@echo your current directory? Select yes if you only want to use these
@echo utilities with programs in the current directory.
@echo.
SET/P COPY_CURRENT="Copy the utilities to your current directory? (Y/N): "
if "%COPY_CURRENT%" == "y" SET COPY_CURRENT=Y

@echo.
@echo Next, do you want this script to copy the utilities it builds to 
@echo Catalina's bin directory? 
@echo.
@echo NOTE: To do this. you need to execute this utility as an administrator,
@echo ====  or else have write permissions to Catalina's bin directory.
@echo       Otherwise, the utilities will be left in the utilities directory.
@echo.
SET/P COPY_BIN="Copy the utilities to Catalina's bin directory? (Y/N): "
if "%COPY_BIN%" == "y" SET COPY_BIN=Y

if NOT "%COPY_BIN%"=="Y" goto no_delete
cls
@echo.
@echo Deleting existing utilities in Catalina's bin directory ...
@echo.
if EXIST "%TMP_LCCDIR%\bin\XMM.bin" del /f "%TMP_LCCDIR%\bin\XMM.bin"
if EXIST "%TMP_LCCDIR%\bin\SRAM.bin" del /f "%TMP_LCCDIR%\bin\SRAM.bin"
if EXIST "%TMP_LCCDIR%\bin\XMM.binary" del /f "%TMP_LCCDIR%\bin\XMM.binary"
if EXIST "%TMP_LCCDIR%\bin\SRAM.binary" del /f "%TMP_LCCDIR%\bin\SRAM.binary"
if EXIST "%TMP_LCCDIR%\bin\EEPROM.binary" del /f "%TMP_LCCDIR%\bin\EEPROM.binary"
if EXIST "%TMP_LCCDIR%\bin\MOUSE.binary" del /f "%TMP_LCCDIR%\bin\MOUSE.binary"
if EXIST "%TMP_LCCDIR%\bin\Hydra_MOUSE.binary" del /f "%TMP_LCCDIR%\bin\Hydra_MOUSE.binary"
if EXIST "%TMP_LCCDIR%\bin\Hybrid_MOUSE.binary" del /f "%TMP_LCCDIR%\bin\Hybrid_MOUSE.binary"
if EXIST "%TMP_LCCDIR%\bin\FLASH.binary" del /f "%TMP_LCCDIR%\bin\FLASH.binary"
if EXIST "%TMP_LCCDIR%\bin\Flash_Boot.binary" del /f "%TMP_LCCDIR%\bin\Flash_Boot.binary"
@echo.
SET/P PAUSE="Done. Press ENTER to continue ..."
cls

:no_delete

rem cls
@echo.
@echo Next, specify your platform. This script knows how to build utilities for:
@echo.
@echo        HYDRA
@echo        HYBRID
@echo        DEMO
@echo        TRIBLADEPROP
@echo        ASC
@echo        DRACBLADE
@echo        RAMBLADE
@echo        RAMBLADE3
@echo        C3
@echo        PP
@echo        QUICKSTART
@echo        ACTIVITY
@echo        FLIP
@echo        P2_CUSTOM
@echo        P2D2
@echo        P2_EDGE
@echo        P2_EVAL
@echo. 
@echo If your platform is not listed above, enter CUSTOM for a Propeller 1, 
@echo or P2_CUSTOM for a Propeller 2.

SET CPU=
SET CPU_SUFFIX=
SET PLATFORM=
SET TMP_FLASH=
SET TMP_SRAM=

:enter_platform

@echo.
SET/P PLATFORM="Enter your platform (in UPPER CASE): "
if "%PLATFORM%" == "HYDRA" goto ask_xmm
if "%PLATFORM%" == "HYBRID" goto ask_xmm
if "%PLATFORM%" == "DEMO" goto ask_xmm
if "%PLATFORM%" == "ASC" goto ask_xmm
if "%PLATFORM%" == "FLIP" goto ask_xmm
if "%PLATFORM%" == "ACTIVITY" goto ask_xmm
if "%PLATFORM%" == "CUSTOM" goto ask_xmm
if "%PLATFORM%" == "DRACBLADE" goto ask_xmm
if "%PLATFORM%" == "RAMBLADE" goto ask_xmm
if "%PLATFORM%" == "RAMBLADE3" goto ask_xmm
if "%PLATFORM%" == "TRIBLADEPROP" goto ask_xmm
if "%PLATFORM%" == "C3" goto ask_xmm
if "%PLATFORM%" == "PP" goto ask_xmm
if "%PLATFORM%" == "QUICKSTART" goto ask_xmm
if "%PLATFORM%" == "P2D2" goto no_utilities
if "%PLATFORM%" == "P2_EDGE" goto ask_xmm
if "%PLATFORM%" == "P2_EVAL" goto ask_xmm
if "%PLATFORM%" == "P2_CUSTOM" goto ask_xmm
@echo.
@echo Invalid Platform selected - try again.
SET PLATFORM=
goto enter_platform

:no_utilities

cls
@echo.
@echo   NOTE: The platform you have specified does not currently have
@echo   ====  any supported utilities.
@echo.
goto finish

:ask_xmm

cls
@echo.
@echo Next, specify if you have an XMM add-on board. If your XMM memory is built
@echo into your platform (or you have no add-on board) just leave this blank. 
@echo This batch file knows how to build utilities for:
@echo.
@echo        SUPERQUAD
@echo        RAMPAGE
@echo        DUALSRAM
@echo        HX512
@echo        RP2
@echo        PMC
@echo        HYPER
@echo. 
@echo Note that you do not need to specify the HX512 for the HYDRA or HYBRID - it
@echo it assumed automatically. But if you use a different add-on board for these
@echo platforms, then you can specify it here.

:enter_xmm

@echo.
SET/P XMM_BOARD="Enter your XMM add-on board (in UPPER CASE): "
if "%XMM_BOARD%" == "SUPERQUAD" goto check_for_multi_cpu
if "%XMM_BOARD%" == "RAMPAGE" goto check_for_multi_cpu
if "%XMM_BOARD%" == "DUALSRAM" goto check_for_multi_cpu
if "%XMM_BOARD%" == "HX512" goto check_for_multi_cpu
if "%XMM_BOARD%" == "RP2" goto check_for_multi_cpu
if "%XMM_BOARD%" == "PMC" goto check_for_multi_cpu
if "%XMM_BOARD%" == "HYPER" goto check_for_multi_cpu
if "%XMM_BOARD%" == "" goto check_for_multi_cpu
@echo.
@echo Invalid XMM add-on board selected - try again.
SET XMM_BOARD=
goto enter_xmm

:check_for_multi_cpu

if NOT "%PLATFORM%" == "TRIBLADEPROP" goto not_multi_cpu

@cls
@echo.
@echo The %PLATFORM% supports multiple CPUs. You must specify which
@echo CPU to build utilities for. To build for multiple CPUs, run
@echo this batch file multiple times, specifying each CPU separately.

:enter_cpu

@echo.
SET/P CPU="Enter the CPU you want to build utilities for (1, 2 or 3): "
if "%CPU%" == "1" goto add_underscore
if "%CPU%" == "2" goto add_underscore
if "%CPU%" == "3" goto add_underscore
@echo.
@echo Invalid CPU selected - try again.
goto enter_cpu

:add_underscore

SET CPU_SUFFIX=_%CPU%
SET CPU=CPU_%CPU%

SET PROXY_EXTRAS=
@cls
@echo.
@echo If you intend to use the Proxy server utility on this CPU, you must 
@echo specify the plugins to be loaded when executing the server (this 
@echo depends on what devices exist on the server CPU that you want to make 
@echo available to your application executing on another CPU (the client).
@echo.
@echo By default, all proxiable devices are supported. You typically disable 
@echo various plugins by specifying one or more of following options if the
@echo device does not exist on this CPU:
@echo. 
@echo    NO_KEYBOARD NO_MOUSE NO_SCREEN NO_SD
@echo. 
@echo Specify proxy server options (each separated by a space and in UPPER CASE)
SET/P PROXY_EXTRAS="or just press ENTER for no options: "

:not_multi_cpu

if "%XMM_BOARD%" == "SUPERQUAD" goto flash_cache
if "%XMM_BOARD%" == "RAMPAGE" goto flash_cache
if "%XMM_BOARD%" == "RP2" goto flash_cache
if "%XMM_BOARD%" == "PMC" goto flash_cache

if "%PLATFORM%" == "C3" goto flash_cache

if NOT "%PLATFORM%" == "CUSTOM" goto flash_ready

@echo.
SET/P TMP_FLASH="Does your %PLATFORM% %CPU% %XMM_BOARD% have FLASH RAM installed? (Y/N): "
if "%TMP_FLASH%" == "y" goto flash_cache
if "%TMP_FLASH%" == "Y" goto flash_cache

goto flash_ready

:flash_cache

SET TMP_FLASH=Y

@cls
@echo.
@echo The %PLATFORM% %CPU% %XMM_BOARD% has FLASH RAM that can be used as XMM RAM. 
@echo.
@echo Using FLASH RAM this way requires the use of the cache.
@echo.
@echo Select the cache size to use.
@echo.
@echo The cache size can be:
@echo.
@echo    1 kilobyte
@echo    2 kilobytes
@echo    4 kilobytes
@echo    8 kilobytes

:enter_flash_cache

@echo.
SET/P FLASH_CACHE="Enter the size of the cache (1,2,4 or 8): "
if "%FLASH_CACHE%" == "1" goto ask_extras
if "%FLASH_CACHE%" == "2" goto ask_extras
if "%FLASH_CACHE%" == "4" goto ask_extras
if "%FLASH_CACHE%" == "8" goto ask_extras
@echo.
echo Invalid cache size. Try again.
set FLASH_CACHE=
goto enter_flash_cache

:ask_extras

SET EXTRAS=
@cls
@echo.
@echo If you intend to use the Flash_Boot utility, you must specify the plugins 
@echo to be loaded when executing the program, since these are not stored in FLASH.
@echo If you want the program stored in FLASH to execute on boot, you can program
@echo Flash_Boot into EEPROM, and it will load the plugins you specify here.
@echo.
@echo Some plugins are specified directly:
@echo.
@echo       HIRES_VGA LORES_VGA HIRES_TV LORES_TV
@echo       PC PROPTERMINAL TTY TTY256 SD CLOCK GAMEPAD
@echo. 
@echo Other plugins are specified via their support library:
@echo. 
@echo       libgraphics libvgraphic libtty libtty256 libsound libma libmb
@echo.
@echo You can also disable various plugins by specifying the following options:
@echo. 
@echo       NO_HMI NO_KEYBOARD NO_MOUSE NO_SCREEN NO_FLOAT NO_SD
@echo. 
@echo Finally, you can configure Flash_Boot itself by specifying one or more of:
@echo. 
@echo       WRITE_CHECK ERASE_CHECK CHIP_ERASE
@echo. 
@echo Specify the Flash_Boot options (each separated by a space and in UPPER CASE)
SET/P EXTRAS="or just press ENTER for no options: "

:flash_ready

if "%PLATFORM%" == "C3" goto sram_cache

if "%XMM_BOARD%" == "RAMPAGE" goto sram_cache
if "%XMM_BOARD%" == "DUALSRAM" goto sram_cache
if "%XMM_BOARD%" == "RP2" goto sram_cache
if "%XMM_BOARD%" == "PMC" goto sram_cache
if "%XMM_BOARD%" == "HYPER" goto sram_cache

if "%PLATFORM%" == "CUSTOM" goto ask_sram
if "%PLATFORM%" == "P2_CUSTOM" goto ask_sram
if "%PLATFORM%" == "P2_EDGE" goto ask_sram

goto sram_ready

:ask_sram

@echo.
SET/P TMP_SRAM="Does the %PLATFORM% %CPU% %XMM_BOARD% have PSRAM or SRAM installed? (Y/N): "
if "%TMP_SRAM%" == "y" goto sram_cache
if "%TMP_SRAM%" == "Y" goto sram_cache

if "%PLATFORM%" == "P2_EDGE" goto start_build_p2
if "%PLATFORM%" == "P2_EVAL" goto start_build_p2
if "%PLATFORM%" == "P2_CUSTOM" goto start_build_p2

goto sram_ready

:sram_cache

set TMP_SRAM=Y

set LARGE_CACHE_SIZE=
if "%PLATFORM%" == "P2_EDGE" set LARGE_CACHE_SIZE=Y
if "%PLATFORM%" == "P2_EVAL" set LARGE_CACHE_SIZE=Y
if "%PLATFORM%" == "P2_CUSTOM" set LARGE_CACHE_SIZE=Y

@cls
@echo.
@echo The %PLATFORM% %CPU% %XMM_BOARD% has RAM that can be used as XMM RAM. 
@echo.
@echo When using RAM this way, you have the option of using the cache.
@echo.
@echo To do so, select the cache size - or just press ENTER to disable it.
@echo (if the platform REQUIRES a cache, disabling it will not be accepted)
@echo.
@echo The cache size can be:
@echo.
@echo    1 kilobyte
@echo    2 kilobytes
@echo    4 kilobytes
@echo    8 kilobytes
if NOT "%LARGE_CACHE_SIZE%"=="Y" goto enter_sram_cache
@echo    16 kilobytes
@echo    32 kilobytes
@echo    64 kilobytes

:enter_sram_cache

@echo.
if "%LARGE_CACHE_SIZE%"=="Y" SET/P XMM_CACHE="Enter the size of the cache (1,2,4,8,16,32,64 or ENTER for none): "
if NOT "%LARGE_CACHE_SIZE%"=="Y" SET/P XMM_CACHE="Enter the size of the cache (1,2,4,8 or ENTER for none): "

if "%XMM_CACHE%" == "" goto check_sram_cache
if "%XMM_CACHE%" == "1" goto check_sram_cache
if "%XMM_CACHE%" == "2" goto check_sram_cache
if "%XMM_CACHE%" == "4" goto check_sram_cache
if "%XMM_CACHE%" == "8" goto check_sram_cache
if "%LARGE_CACHE_SIZE% %XMM_CACHE%" == "Y 16" goto check_sram_cache
if "%LARGE_CACHE_SIZE% %XMM_CACHE%" == "Y 32" goto check_sram_cache
if "%LARGE_CACHE_SIZE% %XMM_CACHE%" == "Y 64" goto check_sram_cache
goto done_sram_cache
@echo.
echo Invalid cache size. Try again.
set XMM_CACHE=
goto enter_sram_cache

:check_sram_cache

if NOT "%XMM_CACHE%" == "" goto done_sram_cache

if "%XMM_BOARD%" == "RAMPAGE" goto needs_sram_cache
if "%XMM_BOARD%" == "SUPERQUAD" goto needs_sram_cache
rem if "%XMM_BOARD%" == "DUALSRAM" goto needs_sram_cache
if "%XMM_BOARD%" == "RP2" goto needs_sram_cache
if "%XMM_BOARD%" == "PMC" goto needs_sram_cache
if "%XMM_BOARD%" == "HYPER" goto needs_sram_cache
if "%PLATFORM%" == "P2_EDGE" goto needs_sram_cache
if "%PLATFORM%" == "P2_EVAL" goto needs_sram_cache
if "%PLATFORM%" == "P2_CUSTOM" goto needs_sram_cache
goto done_sram_cache

:needs_sram_cache

@echo.
echo The %PLATFORM% %XMM_BOARD% requires the cache to be used. Try again.
goto enter_sram_cache

:done_sram_cache

:sram_ready

if "%PLATFORM%" == "P2_EDGE" goto start_build_p2
if "%PLATFORM%" == "P2_EVAL" goto start_build_p2
if "%PLATFORM%" == "P2_CUSTOM" goto start_build_p2
goto not_p2

:start_build_p2

rem all information gathered - start building

if "%TMP_SRAM%" == "Y" goto build_p2
if "%XMM_BOARD%" == "" goto no_utilities

:build_p2

@echo.
SET/P PAUSE="Ready to build utilities for %PLATFORM% %CPU% %XMM_BOARD% - Press ENTER to continue ..."

cls

rem first try current directory ...
if exist "%CD%\build_utilities.bat" goto current_build_p2

rem then try home directory ...
if exist "%HOMEPATH%\utilities\build_utilities.bat" goto home_build_p2

rem then use installation directory ...
echo Building utilities in installation directory
pushd "%TMP_LCCDIR%\utilities"
goto do_build_p2

:current_build_p2
echo Building utilities in current directory
pushd "%CD%"
goto do_build_p2

:home_build_p2
echo Building utilities in home directory
pushd "%HOMEPATH%\utilities"
goto do_build_p2


:do_build_p2

set TMP_XMMLIB=-lpsram
if "%XMM_BOARD%" == "HYPER" set TMP_XMMLIB=-lhyper

catalina Catalina_SIO_loader.c -p2 -lci -lserial2 %TMP_XMMLIB% -R0x10000 -C NO_HMI -C %PLATFORM% -o SRAM
copy /Y SRAM.bin XMM.bin

if NOT "%COPY_CURRENT%"=="Y" goto do_copy_bin_p2

@echo.
@echo Copying XMM binaries to current ...
@echo.

copy /Y SRAM.bin "%TMP_CURRENT%"\SRAM.bin
copy /Y XMM.bin "%TMP_CURRENT%"\XMM.bin


:do_copy_bin_p2
if "%COPY_BIN%"=="Y" goto do_copy_p2

popd
goto done

:do_copy_p2

@echo.
@echo Copying XMM binaries to bin ...
@echo.

copy /Y SRAM.bin "%TMP_LCCDIR%\bin"\SRAM.bin
copy /Y XMM.bin "%TMP_LCCDIR%\bin"\XMM.bin

popd

goto done

:not_p2

@echo.
if NOT "%TMP_FLASH% %TMP_SRAM%" == "Y Y" goto check_xmm_or_flash
cls

:select_default

@echo.
@echo The %PLATFORM% %CPU% %XMM_BOARD% can use both the FLASH and SRAM as XMM. Would you like the
SET/P DEFAULT_XMM="default XMM loader to load FLASH or SRAM? (F/S): "
if "%DEFAULT_XMM%" == "F" goto done_default
if "%DEFAULT_XMM%" == "S" goto done_default
if "%DEFAULT_XMM%" == "f" goto default_flash
if "%DEFAULT_XMM%" == "s" goto default_sram
@echo.
@echo Invalid entry. Try again.
goto select_default

:check_xmm_or_flash

if "%TMP_SRAM%" == "Y" goto default_sram
if "%TMP_FLASH%" == "Y" goto default_flash
goto done_default

:default_flash

set DEFAULT_XMM=F
goto done_default

:default_sram

set DEFAULT_XMM=S
:done_default

rem all information gathered - start building

@echo.
SET/P PAUSE="Ready to build utilities for %PLATFORM% %CPU% %XMM_BOARD% - Press ENTER to continue ..."

cls

if NOT "%PLATFORM%" == "TRIBLADEPROP" goto not_multi_build

if exist "%CD%\build_utilities.bat" goto user_build_multi
pushd "%TMP_LCCDIR%\utilities"
goto start_build_multi

:user_build_multi

pushd "%CD%"

:start_build_multi

@echo.
@echo Building CPU-specific utilities ...
@echo.

call build_pasm_tmp_var %PLATFORM% %CPU% %XMM_BOARD% %PROXY_EXTRAS%

spinnaker -p -a Generic_Proxy_Server.spin -o Generic_Proxy_Server%CPU_SUFFIX% -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR%

spinnaker -p -a Generic_SIO_Loader_1.spin -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR% 
spinnaker -p -a Generic_SIO_Loader_2.spin -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR% 
spinnaker -p -a Generic_SIO_Loader_3.spin -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR% 

if NOT "%CPU%" == "CPU_1" spinnaker -p -a CPU_1_Boot.spin -o CPU_1_Boot%CPU_SUFFIX% -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR%
if NOT "%CPU%" == "CPU_1" spinnaker -p -a CPU_1_Reset.spin -o CPU_1_Reset%CPU_SUFFIX% -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR%
if NOT "%COPY_CURRENT%"=="Y" goto done_cpu_1_utilities_current
if NOT "%CPU%" == "CPU_1" copy /Y CPU_1_Boot%CPU_SUFFIX%.binary "%TMP_CURRENT%\CPU_1_Boot%CPU_SUFFIX%.binary"
if NOT "%CPU%" == "CPU_1" copy /Y CPU_1_Reset%CPU_SUFFIX%.binary "%TMP_CURRENT%\CPU_1_Reset%CPU_SUFFIX%.binary"
:done_cpu_1_utilities_current
if NOT "%COPY_BIN%"=="Y" goto done_cpu_1_utilities
if NOT "%CPU%" == "CPU_1" copy /Y CPU_1_Boot%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin\CPU_1_Boot%CPU_SUFFIX%.binary"
if NOT "%CPU%" == "CPU_1" copy /Y CPU_1_Reset%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin\CPU_1_Reset%CPU_SUFFIX%.binary"
:done_cpu_1_utilities
if NOT "%CPU%" == "CPU_3" spinnaker -p -a CPU_3_Boot.spin -o CPU_3_Boot%CPU_SUFFIX% -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR%
if NOT "%CPU%" == "CPU_3" spinnaker -p -a CPU_3_Reset.spin -o CPU_3_Reset%CPU_SUFFIX% -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR%
if NOT "%COPY_CURRENT%"=="Y" goto :done_cpu_3_utilities_current
if NOT "%CPU%" == "CPU_3" copy /Y CPU_3_Boot%CPU_SUFFIX%.binary "%TMP_CURRENT%\CPU_3_Boot%CPU_SUFFIX%.binary"
if NOT "%CPU%" == "CPU_3" copy /Y CPU_3_Reset%CPU_SUFFIX%.binary "%TMP_CURRENT%\CPU_3_Reset%CPU_SUFFIX%.binary"
:done_cpu_3_utilities_current
if NOT "%COPY_BIN%"=="Y" goto :done_cpu_3_utilities
if NOT "%CPU%" == "CPU_3" copy /Y CPU_3_Boot%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin\CPU_3_Boot%CPU_SUFFIX%.binary"
if NOT "%CPU%" == "CPU_3" copy /Y CPU_3_Reset%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin\CPU_3_Reset%CPU_SUFFIX%.binary"
:done_cpu_3_utilities

popd

:not_multi_build

if NOT "%TMP_FLASH%"=="Y" goto no_flash_build

SET CACHE=
if NOT "%TMP_FLASH%"=="" set CACHE=CACHED_%FLASH_CACHE%K

if exist "%CD%\build_utilities.bat" goto user_build_flash
pushd "%TMP_LCCDIR%\utilities"
goto start_build_flash

:user_build_flash

pushd "%CD%"

:start_build_flash

@echo.
@echo Building FLASH utilities ...
@echo.

if "%XMM_BOARD%"=="SUPERQUAD" call build_pasm_tmp_var %PLATFORM% %CPU% %XMM_BOARD% FLASH SMALL %CACHE% %EXTRAS%
if NOT "%XMM_BOARD%"=="SUPERQUAD" call build_pasm_tmp_var %PLATFORM% %CPU% %XMM_BOARD% FLASH LARGE %CACHE% %EXTRAS%
spinnaker -p -a Payload_XMM_Loader.spin -I "%TMP_LCCDIR%\target\p1" -b -o FLASH%CPU_SUFFIX% %TMP_VAR%
spinnaker -p -a "%TMP_LCCDIR%\target\p1\xmmdef.t" -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR% -o Flash_Boot%CPU_SUFFIX%

if "%DEFAULT_XMM%" == "F" copy /Y FLASH%CPU_SUFFIX%.binary XMM%CPU_SUFFIX%.binary

if NOT "%COPY_CURRENT%"=="Y" goto no_flash_copy_current
@echo.
@echo Copying FLASH binaries to current ...
@echo.
copy /Y FLASH%CPU_SUFFIX%.binary "%TMP_CURRENT%"\FLASH%CPU_SUFFIX%.binary
copy /Y Flash_Boot%CPU_SUFFIX%.binary "%TMP_CURRENT%"\Flash_Boot%CPU_SUFFIX%.binary

if "%DEFAULT_XMM%" == "F" copy /Y XMM%CPU_SUFFIX%.binary "%TMP_CURRENT%"\XMM%CPU_SUFFIX%.binary

:no_flash_copy_current
if NOT "%COPY_BIN%"=="Y" goto no_flash_copy
@echo.
@echo Copying FLASH binaries to bin ...
@echo.
copy /Y FLASH%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin"\FLASH%CPU_SUFFIX%.binary
copy /Y Flash_Boot%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin"\Flash_Boot%CPU_SUFFIX%.binary

if "%DEFAULT_XMM%" == "F" copy /Y XMM%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin"\XMM%CPU_SUFFIX%.binary

:no_flash_copy

popd

:no_flash_build

if NOT "%TMP_SRAM%"=="Y" goto no_sram_build

@echo.
@echo Building SRAM utilities ...
@echo.

SET CACHE=
if NOT "%XMM_CACHE%"=="" set CACHE=CACHED_%XMM_CACHE%K

if exist "%CD%\build_utilities.bat" goto user_build_non_flash
pushd "%TMP_LCCDIR%\utilities"
goto start_build_non_flash

:user_build_non_flash

pushd "%CD%"

:start_build_non_flash
call build_pasm_tmp_var %PLATFORM% %CPU% %XMM_BOARD% %CACHE%
spinnaker -p -a Payload_XMM_Loader.spin -I "%TMP_LCCDIR%\target\p1" -b -o SRAM%CPU_SUFFIX% %TMP_VAR%

if "%DEFAULT_XMM%" == "S" copy /Y SRAM%CPU_SUFFIX%.binary "XMM%CPU_SUFFIX%.binary

if NOT "%COPY_CURRENT%"=="Y" goto no_sram_copy_current
@echo.
@echo Copying SRAM binaries to current ...
@echo.
copy /Y SRAM%CPU_SUFFIX%.binary "%TMP_CURRENT%"\SRAM%CPU_SUFFIX%.binary
if "%DEFAULT_XMM%" == "S" copy /Y XMM%CPU_SUFFIX%.binary "%TMP_CURRENT%"\XMM%CPU_SUFFIX%.binary

:no_sram_copy_current
if NOT "%COPY_BIN%"=="Y" goto no_sram_copy
@echo.
@echo Copying SRAM binaries to bin ...
@echo.
copy /Y SRAM%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin"\SRAM%CPU_SUFFIX%.binary
if "%DEFAULT_XMM%" == "S" copy /Y XMM%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin"\XMM%CPU_SUFFIX%.binary

:no_sram_copy

popd

:no_sram_build

@echo.
@echo Building EEPROM utilities ...
@echo.

if exist "%CD%\build_utilities.bat" goto user_build_eeprom
pushd "%TMP_LCCDIR%\utilities"
goto start_build_eeprom

:user_build_eeprom

pushd "%CD%"

:start_build_eeprom

call build_pasm_tmp_var %PLATFORM% %CPU% %XMM_BOARD% 
spinnaker -p -a Payload_EEPROM_Loader.spin -I "%TMP_LCCDIR%\target\p1" -b -o EEPROM%CPU_SUFFIX% %TMP_VAR%

if NOT "%COPY_CURRENT%"=="Y" goto no_eeprom_copy_current
@echo.
@echo Copying EEPROM binaries to current ...
@echo.
copy /Y EEPROM%CPU_SUFFIX%.binary "%TMP_CURRENT%"\EEPROM%CPU_SUFFIX%.binary

:no_eeprom_copy_current
if NOT "%COPY_BIN%"=="Y" goto no_eeprom_copy
@echo.
@echo Copying EEPROM binaries to bin ...
@echo.
copy /Y EEPROM%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin"\EEPROM%CPU_SUFFIX%.binary

:no_eeprom_copy

popd

if exist "%CD%\build_utilities.bat" goto user_build_mouse
pushd "%TMP_LCCDIR%\utilities"
goto start_build_mouse

:user_build_mouse

pushd "%CD%"

:start_build_mouse

if NOT "%PLATFORM%"=="HYDRA" goto not_hydra

@echo.
@echo Building HYDRA Mouse Loader utilities ...
@echo.
call build_pasm_tmp_var %PLATFORM% %XMM_BOARD% %CACHE%
spinnaker -p -a Mouse_Port_Loader.spin -I "%TMP_LCCDIR%\target\p1" -b -o Hydra_Mouse %TMP_VAR%

copy /Y Hydra_Mouse.binary XMM.binary
copy /Y Hydra_Mouse.binary SRAM.binary
copy /Y Hydra_Mouse.binary MOUSE.binary

if NOT "%COPY_CURRENT%"=="Y" goto no_hydra_copy_current
@echo.
@echo Copying HYDRA Mouse binaries to current ...
@echo.
copy /Y Hydra_Mouse.binary "%TMP_CURRENT%"\Hydra_Mouse.binary
copy /Y Hydra_Mouse.binary "%TMP_CURRENT%"\XMM.binary
copy /Y Hydra_Mouse.binary "%TMP_CURRENT%"\SRAM.binary
copy /Y Hydra_Mouse.binary "%TMP_CURRENT%"\MOUSE.binary

:no_hydra_copy_current
if NOT "%COPY_BIN%"=="Y" goto no_hydra_copy
@echo.
@echo Copying HYDRA Mouse binaries to bin ...
@echo.
copy /Y Hydra_Mouse.binary "%TMP_LCCDIR%\bin"\Hydra_Mouse.binary
copy /Y Hydra_Mouse.binary "%TMP_LCCDIR%\bin"\XMM.binary
copy /Y Hydra_Mouse.binary "%TMP_LCCDIR%\bin"\SRAM.binary
copy /Y Hydra_Mouse.binary "%TMP_LCCDIR%\bin"\MOUSE.binary

:no_hydra_copy

:not_hydra

if NOT "%PLATFORM%"=="HYBRID" goto not_hybrid

@echo.
@echo Building HYBRID Mouse Loader utilities ...
@echo.
call build_pasm_tmp_var %PLATFORM% %XMM_BOARD% %CACHE%
spinnaker -p -a Mouse_Port_Loader.spin -I "%TMP_LCCDIR%\target\p1" -b -o Hybrid_Mouse %TMP_VAR%

copy /Y Hybrid_Mouse.binary XMM.binary
copy /Y Hybrid_Mouse.binary SRAM.binary
copy /Y Hybrid_Mouse.binary MOUSE.binary

if NOT "%COPY_CURRENT%"=="Y" goto no_hybrid_copy_current
@echo.
@echo Copying HYBRID Mouse binaries to current ...
@echo.
copy /Y Hybrid_Mouse.binary "%TMP_CURRENT%"\Hybrid_Mouse.binary
copy /Y Hybrid_Mouse.binary "%TMP_CURRENT%"\XMM.binary
copy /Y Hybrid_Mouse.binary "%TMP_CURRENT%"\SRAM.binary
copy /Y Hybrid_Mouse.binary "%TMP_CURRENT%"\MOUSE.binary

:no_hybrid_copy_current
if NOT "%COPY_BIN%"=="Y" goto no_hybrid_copy
@echo.
@echo Copying HYBRID Mouse binaries to bin ...
@echo.
copy /Y Hybrid_Mouse.binary "%TMP_LCCDIR%\bin"\Hybrid_Mouse.binary
copy /Y Hybrid_Mouse.binary "%TMP_LCCDIR%\bin"\XMM.binary
copy /Y Hybrid_Mouse.binary "%TMP_LCCDIR%\bin"\SRAM.binary
copy /Y Hybrid_Mouse.binary "%TMP_LCCDIR%\bin"\MOUSE.binary

:no_hybrid_copy

:not_hybrid

popd

:done

popd

@echo.
@echo                       ============================
@echo                       Building utilities completed
@echo                       ============================
@echo.
if NOT "%COPY_CURRENT%"=="Y" goto done_no_current_copy
@echo The utility programs should have been copied to the current directory.
@echo.

:done_no_current_copy
if NOT "%COPY_BIN%"=="Y" goto done_no_bin_copy
@echo The utility programs should have been copied to the Catalina 'bin' directory.
@echo If you saw error messages from the copy commands, ensure you have write
@echo permission to the 'bin' directory and then rerun this utility. 
@echo.
@echo Other errors may indicate the options you selected are not supported by 
@echo your Propeller platform - check the options and then rerun this utility.
@echo.
goto finish

:done_no_bin_copy

@echo The utility programs will be left in the utilities directory.
@echo These can be copied to any directory containing binaries to
@echo be loaded and will be used in preference to any in Catalina's bin
@echo directory.
@echo.
@echo Any errors may indicate the options you selected are not supported by 
@echo your Propeller platform - check the options and then rerun this utility.
@echo.
:finish

