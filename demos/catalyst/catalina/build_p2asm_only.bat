@echo off

rem We want the commmand line options specified for the Catalina build_all
rem script to be the same as the Catalyst build_all script, so we set any
rem necessary additional options such as model, cache size (e.g. CACHED_8K, 
rem CACHED_16K, CACHED_32K or CACHED_64K) and WRITE_BACK here ...

rem To use the most common options:
set EXTRA_OPTIONS=-D__STDC__=1 -C LARGE -C CACHED_64K -C WRITE_BACK -C NO_MOUSE

rem To use the Hub Memory allocation option:
rem set EXTRA_OPTIONS=-D__STDC__=1 -C LARGE -C HUB_MALLOC -C CACHED_64K -C WRITE_BACK -C NO_MOUSE

rem To use the XMM cache options:
rem set EXTRA_OPTIONS=-D__STDC__=1 -C LARGE -C CACHED_64K -C CACHE_LUT -C CACHE_PINS -C FLOAT_PINS -C WRITE_BACK -C NO_MOUSE

rem
rem save the current LCCDIR
rem
set SAVE_LCCDIR=%LCCDIR%
if NOT "%LCCDIR%"=="" goto got_lccdir
echo LCCDIR not set - cannot continue
goto done

:got_lccdir
rem save value of CATALINA_DEFINE (note we must use a different TMP name!)
set TMP_DEFINE_TOP2=%CATALINA_DEFINE%
echo.
if "%1"=="" goto no_parameters
set TMP_PARAMS=%*
for /f "delims=" %%A in ('echo %TMP_PARAMS%') do call :Trim %%A
if "%CATALINA_DEFINE%" == "" goto parameters_and_no_define
if "%CATALINA_DEFINE%" == "%TMP_PARAMS%" goto use_define
echo ERROR: Command line options conflict with CATALINA_DEFINE
echo.
echo    CATALINA_DEFINE is set to %CATALINA_DEFINE%
echo    Command line options were %*
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
echo NOTE: All programs will be built with options %*
echo       plus the script EXTRA_OPTIONS (%EXTRA_OPTIONS%).
echo.
echo   If these options conflict, or conflict with other options specified in  
echo   the script or Makefile, the results may be unexpected.
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

call set_short_path TMP_LIBPATH "."

@echo.
@echo building p2asm ...
@echo.
cd source\p2asm_src
catalina -p2 -L %TMP_LIBPATH% -I ..\..\include %EXTRA_OPTIONS% -l%TMP_PSRAM% -lcx -lmc -o p2asm symsubs.c strsubs.c p2asm.c -y
cd ..

rem restore original LCCDIR
set LCCDIR=%SAVE_LCCDIR%

:done
rem restore value of CATALINA_DEFINE (note we used a different TMP name!)
set CATALINA_DEFINE=%TMP_DEFINE_TOP2%
echo.
echo ====
echo Done
echo ====
echo.

