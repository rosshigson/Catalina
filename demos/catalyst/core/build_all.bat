@echo off
rem save value of CATALINA_DEFINE
set TMP_DEFINE=%CATALINA_DEFINE%
echo.
if "%1"=="" goto no_parameters
set TMP_PARAMS=%1 %2 %3 %4 %5 %6 %7 %8 %9
for /f "delims=" %%A in ('echo %TMP_PARAMS%') do call :Trim %%A
if "%CATALINA_DEFINE%" == "" goto parameters_and_no_define
if "%CATALINA_DEFINE%" == "%TMP_PARAMS%" goto use_define
echo ERROR: Command line options conflict with CATALINA_DEFINE
echo.
echo    CATALINA_DEFINE is set to %CATALINA_DEFINE%
echo    Command line options were %1 %2 %3 %4 %5 %6 %7 %8 %9
echo.
echo    Either set CATALINA_DEFINE to null using the following command:
echo.
echo       unset CATALINA_DEFINE
echo.
echo    or do not specify any command line parameters
echo.
goto done

:Trim
set TMP_PARAMS=%*
exit /b 0 

:parameters_and_no_define
echo NOTE: All programs will be built with options %1 %2 %3 %4 %5 %6 %7 %8 %9
echo.
echo   If these options conflict with options specified in the Makefile, 
echo   the results may be unexpected.
echo.
set CATALINA_DEFINE=%TMP_PARAMS%
goto start

:no_parameters
if "%CATALINA_DEFINE%" == "" goto use_default
:use_define
echo NOTE: Environment variable CATALINA_DEFINE is set to %CATALINA_DEFINE%
echo.
echo   All programs will be built using these options. If these conflict
echo   with options specified in this file, the results may be unexpected.
echo.
goto start

:use_default
echo NOTE: Environment variable CATALINA_DEFINE is not set
echo.
echo   All programs will be built for the default target 
echo.

:start
set TMP_LCCDIR=%LCCDIR%
if "%TMP_LCCDIR%"=="" set TMP_LCCDIR=C:\Program Files (x86)\Catalina
if EXIST "%TMP_LCCDIR%\bin\catalina_env.bat" goto found_catalina
echo ERROR: Catalina does not appear to be installed in %TMP_LCCDIR%
echo.
echo   Set the environment variable LCCDIR to where Catalina is installed.
echo.
goto done

:found_catalina
echo.
echo =================
echo Building Catalyst
echo =================
echo.

rem do Windows-specific builds ...

echo.
call build_pasm_tmp_var CATALYST %CATALINA_DEFINE%

set platform=%1

if "%platform:~0,2%"=="P2" goto build_p2
if "%CATALINA_DEFINE:~0,2%"=="P2" goto build_p2

copy "%TMP_LCCDIR%\target\p1\Catalina_Cogstore.spin" .
spinnaker -q -p -a Catalina_Cogstore.spin  -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR%
spinc Catalina_Cogstore.binary -n COGSTORE > cogstore_array.h
del /f Catalina_Cogstore.spin Catalina_Cogstore.binary 

copy  "%TMP_LCCDIR%\target\p1\Catalina_XMM_SD_Loader.spin" .
spinnaker -q -p -a Catalina_XMM_SD_Loader.spin  -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR%
spinc Catalina_XMM_SD_Loader.binary -n LOADER > loader_array.h
del /f Catalina_XMM_SD_Loader.spin Catalina_XMM_SD_Loader.binary

copy "%TMP_LCCDIR%\target\p1\Catalina_SIO_Plugin.spin" .
spinnaker -q -p -a Catalina_SIO_Plugin.spin  -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR%
spinc Catalina_SIO_Plugin.binary -n SIO > sio_array.h
del /f Catalina_SIO_Plugin.spin Catalina_SIO_Plugin.binary

copy "%TMP_LCCDIR%\target\p1\Catalina_SPI_Cache.spin" .
spinnaker -q -p -a Catalina_SPI_Cache.spin  -I "%TMP_LCCDIR%\target\p1" -b %TMP_VAR%
spinc Catalina_SPI_Cache.binary -n CACHE > cache_array.h
del /f Catalina_SPI_Cache.spin Catalina_SPI_Cache.binary

goto common

:build_p2

copy "%TMP_LCCDIR%\target\p2\cogstore.t" .
call p2_asm cogstore.t  -I "%TMP_LCCDIR%\target\p2" %TMP_VAR%
bindump -c -p "   0x" cogstore.bin > cogstore_array_p2.inc
del /f cogstore.t cogstore.lst cogstore.bin 

copy  "%TMP_LCCDIR%\target\p2\sdload.t" .
call p2_asm sdload.t  -I "%TMP_LCCDIR%\target\p2" %TMP_VAR%
bindump -c -p "   0x" sdload.bin > loader_array_p2.inc
del /f sdload.t sdload.lst sdload.bin

copy "%TMP_LCCDIR%\target\p2\cogcache.t" .
call p2_asm cogcache.t  -I "%TMP_LCCDIR%\target\p2" %TMP_VAR%
bindump -c -p "   0x" cogcache.bin > cache_array_p2.inc
del /f cogcache.t cogcache.lst cogcache.bin

:common

rem do common builds

make -B all

:done
@echo off
rem restore value of CATALINA_DEFINE
set CATALINA_DEFINE=%TMP_DEFINE%
echo.
echo ====
echo Done
echo ====
echo.


