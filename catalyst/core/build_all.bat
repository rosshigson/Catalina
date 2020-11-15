@echo off
@echo.
if "%1"=="" goto no_parameters
if "%CATALINA_DEFINE%" == "" goto parameters_and_no_define
if "%CATALINA_DEFINE%" == "%1 %2 %3 %4 %5 %6 %7 %8 %9" goto use_define
@echo ERROR: Command line options conflict with CATALINA_DEFINE
@echo.
@echo    The Environment variable CATALINA_DEFINE is set to %CATALINA_DEFINE%
@echo    The Command line options specified are %1 %2 %3 %4 %5 %6 %7 %8 %9
@echo.
@echo    Either set CATALINA_DEFINE to null using the following command:
@echo.
@echo       unset CATALINA_DEFINE
@echo.
@echo    or do not specify any command line parameters
@echo.
goto done

:parameters_and_no_define
set CATALINA_DEFINE=%1 %2 %3 %4 %5 %6 %7 %8 %9
goto have_parameters

:no_parameters
if "%CATALINA_DEFINE%" == "" goto use_default
:use_define
@echo NOTE: Environment variable CATALINA_DEFINE is set to %CATALINA_DEFINE%
@echo.
@echo All programs will be built using these options. If these options conflict
@echo with any options specified in this file, the results may be unexpected.
goto have_parameters

:use_default
@echo NOTE: Environment variable CATALINA_DEFINE is not set
@echo.
@echo All programs will be built for the default target (CUSTOM) 

:have_parameters
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
echo.
echo    =================
echo    BUILDING CATALYST
echo    =================
echo.

call build_pasm_tmp_var CATALYST %1 %2 %3 %4 %5 %6 %7 %8 

set platform=%1
if "%platform:~0,2%"=="P2" goto build_p2

@echo on
copy "%TMP_LCCDIR%\target\Catalina_Cogstore.spin" .
spinnaker -q -p -a Catalina_Cogstore.spin  -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
spinc Catalina_Cogstore.binary -n COGSTORE > cogstore_array.h
del /f Catalina_Cogstore.spin Catalina_Cogstore.binary 

copy  "%TMP_LCCDIR%\target\Catalina_XMM_SD_Loader.spin" .
spinnaker -q -p -a Catalina_XMM_SD_Loader.spin  -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
spinc Catalina_XMM_SD_Loader.binary -n LOADER > loader_array.h
del /f Catalina_XMM_SD_Loader.spin Catalina_XMM_SD_Loader.binary

copy "%TMP_LCCDIR%\target\Catalina_SIO_Plugin.spin" .
spinnaker -q -p -a Catalina_SIO_Plugin.spin  -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
spinc Catalina_SIO_Plugin.binary -n SIO > sio_array.h
del /f Catalina_SIO_Plugin.spin Catalina_SIO_Plugin.binary

copy "%TMP_LCCDIR%\target\Catalina_SPI_Cache.spin" .
spinnaker -q -p -a Catalina_SPI_Cache.spin  -I "%TMP_LCCDIR%\target" -b %TMP_VAR%
spinc Catalina_SPI_Cache.binary -n CACHE > cache_array.h
del /f Catalina_SPI_Cache.spin Catalina_SPI_Cache.binary

@echo on
catalina catalyst.c cogstore.c loader.c sio.c cache.c -lcix -C CATALYST -C NO_MOUSE -C COMPACT -C NO_FLOAT -C NO_ARGS -O5

catalina rmdir.c -lcix -C COMPACT -C NO_MOUSE -C NO_FLOAT -O5

catalina mkdir.c -lcix -C COMPACT -C NO_MOUSE -C NO_FLOAT -O5

catalina rm.c -lcix -C COMPACT -C NO_MOUSE -C NO_FLOAT -O5

catalina ls.c -lcix -C COMPACT -C NO_MOUSE -C NO_FLOAT -O5

catalina cp.c -lcix -C COMPACT -C NO_MOUSE -C NO_FLOAT -O5

catalina mv.c -lcix -C COMPACT -C NO_MOUSE -C NO_FLOAT -O5

catalina cat.c -lcix -C COMPACT -C NO_MOUSE -C NO_FLOAT -O5
@echo off

goto done

:build_p2

@echo on
copy "%TMP_LCCDIR%\target_p2\Catalina_CogStore.spin2" .
call p2_asm Catalina_CogStore.spin2  -I "%TMP_LCCDIR%\target_p2" %TMP_VAR%
@echo on
bindump -c -p "   0x" Catalina_CogStore.bin > cogstore_array_p2.inc
del /f Catalina_CogStore.spin2 Catalina_CogStore.lst Catalina_Cogstore.bin 

copy  "%TMP_LCCDIR%\target_p2\Catalina_SD_Loader.spin2" .
call p2_asm Catalina_SD_Loader.spin2  -I "%TMP_LCCDIR%\target_p2" %TMP_VAR%
@echo on
bindump -c -p "   0x" Catalina_SD_Loader.bin > loader_array_p2.inc
del /f Catalina_SD_Loader.spin2 Catalina_SD_Loader.lst Catalina_SD_Loader.bin

@echo on
catalina -p2 catalyst.c cogstore.c loader.c -lcix -C CATALYST -C NO_MOUSE -C NATIVE -C NO_FLOAT -C NO_ARGS

catalina -p2 -C NATIVE rmdir.c -lcix -C NO_MOUSE -C NO_FLOAT

catalina -p2 -C NATIVE mkdir.c -lcix -C NO_MOUSE -C NO_FLOAT

catalina -p2 -C NATIVE rm.c -lcix -C NO_MOUSE -C NO_FLOAT

catalina -p2 -C NATIVE ls.c -lcix -C NO_MOUSE -C NO_FLOAT

catalina -p2 -C NATIVE cp.c -lcix -C NO_MOUSE -C NO_FLOAT

catalina -p2 -C NATIVE mv.c -lcix -C NO_MOUSE -C NO_FLOAT

catalina -p2 -C NATIVE cat.c -lcix -C NO_MOUSE -C NO_FLOAT
@echo off

goto done

:done
@echo off
set TMP_LCCDIR=
call unset CATALINA_DEFINE

echo.
echo  ====
echo  Done
echo  ====
echo.


