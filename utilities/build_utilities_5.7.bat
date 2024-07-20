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
goto error

:no_utilities
cls
@echo.
@echo   NOTE: The platform you have specified does not currently have
@echo   ====  any utilities that require building.
@echo.
goto error

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
goto error

:found_catalina
set CACHE=
set XMM_BOARD=
set TMP_SRAM=
set TMP_FLASH=
set XMM_CACHE=
set FLASH_CACHE=
set DEFAULT_XMM=
set COPY=

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
@echo Catalina's bin directory? 
@echo.
@echo NOTE: To do this. you need to execute this utility as an administrator,
@echo ====  or else have write permissions to Catalina's bin directory.
@echo       Otherwise, the utilities will be left in the utilities directory.
@echo.
SET/P COPY="Copy the utilities to Catalina's bin directory? (Y/N): "
if "%COPY%" == "y" SET COPY=Y

cls
@echo.
@echo Next, specify your platform. This batch file knows how to build utilities for:
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
@echo        FLIP
@echo        P2_CUSTOM
@echo        P2D2
@echo        P2_EDGE
@echo        P2_EVAL
@echo. 
@echo If your platform is not listed above, enter CUSTOM and you may have to
@echo specify various additional details about your platform.

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
if "%PLATFORM%" == "CUSTOM" goto ask_xmm
if "%PLATFORM%" == "DRACBLADE" goto ask_xmm
if "%PLATFORM%" == "RAMBLADE" goto ask_xmm
if "%PLATFORM%" == "RAMBLADE3" goto ask_xmm
if "%PLATFORM%" == "TRIBLADEPROP" goto ask_xmm
if "%PLATFORM%" == "C3" goto ask_xmm
if "%PLATFORM%" == "PP" goto ask_xmm
if "%PLATFORM%" == "QUICKSTART" goto ask_xmm
if "%PLATFORM%" == "P2_CUSTOM" goto no_utilities
if "%PLATFORM%" == "P2D2" goto no_utilities
if "%PLATFORM%" == "P2_EDGE" goto ask_xmm
if "%PLATFORM%" == "P2_EVAL" goto no_utilities
@echo.
@echo Invalid Platform selected - try again.
SET PLATFORM=
goto enter_platform

:ask_xmm
cls
@echo.
@echo Next, specify if you have an XMM add-on board. If your XMM memory is built
@echo into your platform (or you have no add-on board) just leave this blank. 
@echo This batch file knows how to build utilities for:
@echo.
@echo        SUPERQUAD
@echo        RAMPAGE
@echo        HX512
@echo        RP2
@echo        PMC
@echo. 
@echo Note that you do not need to specify the HX512 for the HYDRA or HYBRID - it
@echo it assumed automatically. But if you use a different add-on board for these
@echo platforms, then you can specify it here.

:enter_xmm
@echo.
SET/P XMM_BOARD="Enter your XMM add-on board (in UPPER CASE): "
if "%XMM_BOARD%" == "SUPERQUAD" goto check_cpu_and_flash
if "%XMM_BOARD%" == "RAMPAGE" goto check_cpu_and_flash
if "%XMM_BOARD%" == "HX512" goto check_cpu_and_flash
if "%XMM_BOARD%" == "RP2" goto check_cpu_and_flash
if "%XMM_BOARD%" == "PMC" goto check_cpu_and_flash
if "%XMM_BOARD%" == "" goto check_cpu_and_flash
@echo.
@echo Invalid XMM add-on board selected - try again.
SET XMM_BOARD=
goto enter_xmm

:check_cpu_and_flash
if "%XMM_BOARD%" == "SUPERQUAD" goto force_flash
if "%XMM_BOARD%" == "RAMPAGE" goto force_flash
if "%XMM_BOARD%" == "HX512" goto no_flash
if "%XMM_BOARD%" == "RP2" goto force_flash
if "%XMM_BOARD%" == "PMC" goto force_flash

if "%PLATFORM%" == "HYDRA" goto no_flash
if "%PLATFORM%" == "HYBRID" goto no_flash
if "%PLATFORM%" == "DEMO" goto no_flash
if "%PLATFORM%" == "ASC" goto no_flash
if "%PLATFORM%" == "FLIP" goto ask_flash
if "%PLATFORM%" == "CUSTOM" goto ask_flash
if "%PLATFORM%" == "DRACBLADE" goto no_flash
if "%PLATFORM%" == "RAMBLADE" goto no_flash
if "%PLATFORM%" == "RAMBLADE3" goto no_flash
if "%PLATFORM%" == "TRIBLADEPROP" goto select_cpu
if "%PLATFORM%" == "C3" goto force_flash
if "%PLATFORM%" == "PP" goto no_flash
if "%PLATFORM%" == "QUICKSTART" goto no_flash
if "%PLATFORM%" == "P2_EDGE" goto no_flash

goto no_flash

:select_cpu
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
:cpu_error
@echo.
@echo Invalid CPU selected - try again.
goto enter_cpu

:add_underscore
SET CPU_SUFFIX=_%CPU%
SET CPU=CPU_%CPU%

:ask_proxy_extras
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

:ask_flash

if "%PLATFORM%" == "TRIBLADEPROP" goto ask_extras

@echo.
SET/P TMP_FLASH="Does your %PLATFORM% %CPU% %XMM_BOARD% have FLASH RAM installed? (Y/N): "
if "%TMP_FLASH%" == "y" goto force_flash
if NOT "%TMP_FLASH%" == "Y" goto no_flash
:force_flash
SET TMP_FLASH=Y

:select_flash_cache
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
@echo       libgraphics libvgraphics libtty libtty256 libsound libma libmb
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

:no_flash

if "%XMM_BOARD%" == "SUPERQUAD" goto force_xmm
if "%XMM_BOARD%" == "RAMPAGE" goto force_xmm
if "%XMM_BOARD%" == "RP2" goto force_xmm
if "%XMM_BOARD%" == "PMC" goto force_xmm
if "%PLATFORM%" == "FLIP" goto ask_xmm
if "%PLATFORM%" == "CUSTOM" goto ask_xmm
if "%PLATFORM%" == "DEMO" goto ask_xmm
if "%PLATFORM%" == "PP" goto no_xmm
if "%PLATFORM%" == "ASC" goto no_xmm
if "%PLATFORM%" == "P2_EDGE" goto ask_xmm
if "%PLATFORM% %CPU%" == "TRIBLADEPROP CPU_3" goto no_xmm
goto force_xmm

:ask_xmm
@echo.
SET/P TMP_SRAM="Does your %PLATFORM% %CPU% %XMM_BOARD% have SRAM (other than FLASH) installed? (Y/N): "
if "%TMP_SRAM%" == "y" goto force_xmm
if NOT "%TMP_SRAM%" == "Y" goto no_xmm

:force_xmm

if NOT "%XMM_BOARD%" == "SUPERQUAD" goto select_xmm_cache

set TMP_SRAM=N
goto done_multi

:select_xmm_cache

set TMP_SRAM=Y

@cls
@echo.
@echo The %PLATFORM% %CPU% %XMM_BOARD% has SRAM that can be used as XMM RAM. 
@echo.
@echo When using SRAM this way, you have the option of using the cache.
@echo.
@echo To do so, select the cache size - or just press ENTER to disable it.
@echo.
@echo The cache size can be:
@echo.
@echo    1 kilobyte
@echo    2 kilobytes
@echo    4 kilobytes
@echo    8 kilobytes
if NOT "%PLATFORM%" == "P2_EDGE" goto enter_xmm_cache
@echo    16 kilobytes
@echo    32 kilobytes
@echo    64 kilobytes

:enter_p2_xmm_cache
@echo.
SET/P XMM_CACHE="Enter the size of the cache (1,2,4,8,16,32,64 or ENTER for none): "
if "%XMM_CACHE%" == "" goto check_xmm_cache
if "%XMM_CACHE%" == "1" goto check_xmm_cache
if "%XMM_CACHE%" == "2" goto check_xmm_cache
if "%XMM_CACHE%" == "4" goto check_xmm_cache
if "%XMM_CACHE%" == "8" goto check_xmm_cache
if "%XMM_CACHE%" == "16" goto check_xmm_cache
if "%XMM_CACHE%" == "32" goto check_xmm_cache
if "%XMM_CACHE%" == "64" goto check_xmm_cache
goto done_xmm_cache
@echo.
echo Invalid cache size. Try again.
set XMM_CACHE=
goto enter_p2_xmm_cache

:enter_xmm_cache
@echo.
SET/P XMM_CACHE="Enter the size of the cache (1,2,4,8 or ENTER for none): "
if "%XMM_CACHE%" == "" goto check_xmm_cache
if "%XMM_CACHE%" == "1" goto check_xmm_cache
if "%XMM_CACHE%" == "2" goto check_xmm_cache
if "%XMM_CACHE%" == "4" goto check_xmm_cache
if "%XMM_CACHE%" == "8" goto check_xmm_cache
@echo.
echo Invalid cache size. Try again.
set XMM_CACHE=
goto enter_xmm_cache

:check_xmm_cache
if NOT "%XMM_CACHE%" == "" goto done_xmm_cache
if "%XMM_BOARD%" == "RAMPAGE" goto needs_xmm_cache
if "%XMM_BOARD%" == "SUPERQUAD" goto needs_xmm_cache
if "%XMM_BOARD%" == "RP2" goto needs_xmm_cache
if "%XMM_BOARD%" == "PMC" goto needs_xmm_cache
if "%XMM_BOARD%" == "P2_EDGE" goto needs_xmm_cache
goto done_xmm_cache

:needs_xmm_cache
@echo.
echo The %PLATFORM% %XMM_BOARD% requires the cache to be used. Try again.
if "%PLATFORM%" == "P2_EDGE" goto enter_p2_xmm_cache
goto enter_xmm_cache

:done_xmm_cache

if NOT "%PLATFORM%" == "P2_EDGE" goto select_xmm_or_flash

rem all information gathered - start building

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

catalina Catalina_SIO_loader.c -p2 -lci -lserial2 -lpsram -R0x10000 -C NO_HMI -C %PLATFORM% -o SRAM
copy /Y SRAM.bin XMM.bin

if "%COPY%"=="Y" goto do_copy_p2

popd
goto done

:do_copy_p2
@echo.
@echo Copying binaries ...
@echo.

copy /Y SRAM.bin "%TMP_LCCDIR%\bin"\SRAM.bin
copy /Y XMM.bin "%TMP_LCCDIR%\bin"\XMM.bin

popd

goto done

:no_xmm

if "%PLATFORM%" == "P2_EDGE" goto no_utilities
if "%PLATFORM%" == "P2_EVAL" goto no_utilities

:select_xmm_or_flash
@echo.
if NOT "%TMP_FLASH%%TMP_SRAM%" == "YY" goto check_xmm_or_flash
cls
:select_default
@echo.
@echo The %PLATFORM% %CPU% %XMM_BOARD% can use both the FLASH and SRAM as XMM. Would you like the
SET/P DEFAULT_XMM="default XMM loader to load FLASH or SRAM? (F/S): "
if "%DEFAULT_XMM%" == "F" goto done_default
if "%DEFAULT_XMM%" == "S" goto done_default
if "%DEFAULT_XMM%" == "f" goto force_default_flash
if "%DEFAULT_XMM%" == "s" goto force_default_sram
@echo.
@echo Invalid entry. Try again.
goto select_default
:check_xmm_or_flash
if "%TMP_SRAM%" == "Y" goto force_default_sram
if "%TMP_FLASH%" == "Y" goto force_default_flash
goto done_default
:force_default_flash
set DEFAULT_XMM=F
goto done_default
:force_default_sram
set DEFAULT_XMM=S

:done_default

rem all information gathered - start building

@echo.
SET/P PAUSE="Ready to build utilities for %PLATFORM% %CPU% %XMM_BOARD% - Press ENTER to continue ..."

cls

rem first try current directory ...
if exist "%CD%\build_utilities.bat" goto current_build_p1

rem then try home directory ...
if exist "%HOMEPATH%\utilities\build_utilities.bat" goto home_build_p1

rem then use installation directory ...
echo Building utilities in installation directory
pushd "%TMP_LCCDIR%\utilities"
goto do_build_p1

:current_build_p1
echo Building utilities in current directory
pushd "%CD%"
:goto do_build_p1

:home_build_p1
echo Building utilities in home directory
pushd "%HOMEPATH%\utilities"
:goto do_build_p1


:do_build_p1


if NOT "%PLATFORM%" == "TRIBLADEPROP" goto done_multi

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
if NOT "%COPY%"=="Y" goto done_cpu_1_utilities
if NOT "%CPU%" == "CPU_1" copy /Y CPU_1_Boot%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin\CPU_1_Boot%CPU_SUFFIX%.binary"
if NOT "%CPU%" == "CPU_1" copy /Y CPU_1_Reset%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin\CPU_1_Reset%CPU_SUFFIX%.binary"
:done_cpu_1_utilities
if NOT "%CPU%" == "CPU_3" spinnaker -p -a CPU_3_Boot.spin -o CPU_3_Boot%CPU_SUFFIX% -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR%
if NOT "%CPU%" == "CPU_3" spinnaker -p -a CPU_3_Reset.spin -o CPU_3_Reset%CPU_SUFFIX% -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR%
if NOT "%COPY%"=="Y" goto :done_cpu_3_utilities
if NOT "%CPU%" == "CPU_3" copy /Y CPU_3_Boot%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin\CPU_3_Boot%CPU_SUFFIX%.binary"
if NOT "%CPU%" == "CPU_3" copy /Y CPU_3_Reset%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin\CPU_3_Reset%CPU_SUFFIX%.binary"
:done_cpu_3_utilities

popd

:done_multi

if NOT "%TMP_FLASH%"=="Y" goto done_flash

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
spinnaker -p -a "%TMP_LCCDIR%\target\p1\xmm_default.spin" -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR% -o Flash_Boot%CPU_SUFFIX%

if NOT "%COPY%"=="Y" goto done_flash
@echo.
@echo Copying FLASH binaries ...
@echo.
copy /Y FLASH%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin"\FLASH%CPU_SUFFIX%.binary
copy /Y Flash_Boot%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin"\Flash_Boot%CPU_SUFFIX%.binary

:done_flash
popd

:build_non_flash

if NOT "%TMP_SRAM%"=="Y" goto do_eeprom

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

if NOT "%COPY%"=="Y" goto done_sram
@echo.
@echo Copying SRAM binaries ...
@echo.
copy /Y SRAM%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin"\SRAM%CPU_SUFFIX%.binary

:done_sram
popd

:do_eeprom
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

if NOT "%COPY%"=="Y" goto done_eeprom
@echo.
@echo Copying EEPROM binaries ...
@echo.
copy /Y EEPROM%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin"\EEPROM%CPU_SUFFIX%.binary

:done_eeprom

if "%DEFAULT_XMM%" == "F" copy /Y FLASH%CPU_SUFFIX%.binary XMM%CPU_SUFFIX%.binary
if "%DEFAULT_XMM%" == "S" copy /Y SRAM%CPU_SUFFIX%.binary "XMM%CPU_SUFFIX%.binary

if NOT "%COPY%"=="Y" goto done_default_xmm

copy /Y XMM%CPU_SUFFIX%.binary "%TMP_LCCDIR%\bin"\XMM%CPU_SUFFIX%.binary

:done_default_xmm

popd

if "%PLATFORM%"=="HYDRA" goto do_mouse
if "%PLATFORM%"=="HYBRID" goto do_mouse
goto done

:do_mouse
if exist "%CD%\build_utilities.bat" goto user_build_mouse
pushd "%TMP_LCCDIR%\utilities"
goto start_build_mouse

:user_build_mouse
pushd "%CD%"

:start_build_mouse
@echo.
@echo Building MOUSE Loader utilities ...
@echo.
call build_pasm_tmp_var %PLATFORM% %XMM_BOARD% %CACHE%
if "%PLATFORM%"=="HYDRA" spinnaker -p -a Mouse_Port_Loader.spin -I "%TMP_LCCDIR%\target\p1" -b -o Hydra_Mouse %TMP_VAR%
if "%PLATFORM%"=="HYBRID" spinnaker -p -a Mouse_Port_Loader.spin -I "%TMP_LCCDIR%\target\p1" -b -o Hybrid_Mouse %TMP_VAR%

if "%PLATFORM%"=="HYDRA" copy /Y Hydra_Mouse.binary XMM.binary
if "%PLATFORM%"=="HYDRA" copy /Y Hydra_Mouse.binary SRAM.binary
if "%PLATFORM%"=="HYDRA" copy /Y Hydra_Mouse.binary MOUSE.binary
if "%PLATFORM%"=="HYBRID" copy /Y Hybrid_Mouse.binary XMM.binary
if "%PLATFORM%"=="HYBRID" copy /Y Hybrid_Mouse.binary SRAM.binary
if "%PLATFORM%"=="HYBRID" copy /Y Hybrid_Mouse.binary MOUSE.binary

if NOT "%COPY%"=="Y" goto done_mouse
if "%PLATFORM%"=="HYDRA" copy /Y Hydra_Mouse.binary "%TMP_LCCDIR%\bin"\Hydra_Mouse.binary
if "%PLATFORM%"=="HYDRA" copy /Y Hydra_Mouse.binary "%TMP_LCCDIR%\bin"\XMM.binary
if "%PLATFORM%"=="HYDRA" copy /Y Hydra_Mouse.binary "%TMP_LCCDIR%\bin"\SRAM.binary
if "%PLATFORM%"=="HYDRA" copy /Y Hydra_Mouse.binary "%TMP_LCCDIR%\bin"\MOUSE.binary
if "%PLATFORM%"=="HYBRID" copy /Y Hybrid_Mouse.binary "%TMP_LCCDIR%\bin"\Hybrid_Mouse.binary
if "%PLATFORM%"=="HYBRID" copy /Y Hybrid_Mouse.binary "%TMP_LCCDIR%\bin"\XMM.binary
if "%PLATFORM%"=="HYBRID" copy /Y Hybrid_Mouse.binary "%TMP_LCCDIR%\bin"\SRAM.binary
if "%PLATFORM%"=="HYBRID" copy /Y Hybrid_Mouse.binary "%TMP_LCCDIR%\bin"\MOUSE.binary

:done_mouse
popd

:done

popd

@echo.
@echo                       ============================
@echo                       Building utilities completed
@echo                       ============================
@echo.
if NOT "%COPY%"=="Y" goto finish_no_copy
@echo The utility programs should have been copied to the Catalina 'bin' directory.
@echo If you saw error messages from the copy commands, ensure you have write
@echo permission to the 'bin' directory and then rerun this utility. 
@echo.
@echo Other errors may indicate the options you selected are not supported by 
@echo your Propeller platform - check the options and then rerun this utility.
goto finish

:finish_no_copy
@echo The utility programs have been built in the utilities directory only.
@echo These versions can be copied to any directory containing binaries to
@echo be loaded and will be used in preference to any in Catalina's bin
@echo directory.
@echo.
@echo Any errors may indicate the options you selected are not supported by 
@echo your Propeller platform - check the options and then rerun this utility.

:finish
@echo.

:error

