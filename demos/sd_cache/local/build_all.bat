@echo off

if NOT "%LCCDIR%"=="" goto got_lccdir
echo LCCDIR not set - cannot continue
goto done

:got_lccdir
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
echo NOTE: The library will be built with options %1 %2 %3 %4 %5 %6 %7 %8 %9
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
echo   The library will be built using these options. If these conflict
echo   with options specified in this file, the results may be unexpected.
echo.
goto start

:use_default
echo NOTE: Environment variable CATALINA_DEFINE is not set

:start

@echo.
@echo cleaning output directories ...

call clean_all
mkdir lib\p2
mkdir lib\p2\cmm
mkdir lib\p2\lmm
mkdir lib\p2\nmm
mkdir lib\p2\xmm

call set_short_path TMP_LIBPATH "."

@echo.
@echo copying library source tree ...

xcopy /s /y "%LCCDIR%"\source\lib source\lib\ >NUL:
xcopy /s /y "%LCCDIR%"\target\p2 target\p2\ >NUL:

@echo.
@echo cleaning library source tree ...

cd source
call clean_all >NUL: 2>&1
cd ..

@echo.
@echo building library for Catalina ...
rem save CATALINA_DEFINE before building library
set TMP_DEFINE_3=%CATALINA_DEFINE%

if "%2" == "PSRAM" goto psram_lib
if "%2" == "HYPER" goto hyper_lib
if "%1" == "P2_EDGE" goto psram_lib
if "%1" == "P2_EVAL" goto hyper_lib
echo ERROR: Only P2_EDGE or P2_EVAL supported
goto done

:psram_lib
set TMP_PSRAM=psram
cd source\lib
call build_psram >result.txt 2>&1
cd ..\..
goto lib_done

:hyper_lib
set TMP_PSRAM=hyper
cd source\lib
call build_hyper >result.txt 2>&1
cd ..\..
goto lib_done

:lib_done
rem restore CATALINA_DEFINE after building library
set CATALINA_DEFINE=%TMP_DEFINE_3%

:done
echo.

