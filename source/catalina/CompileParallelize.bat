@ECHO OFF
::This is a short example how to use AWKA for generating executables
::because the built-in function of AWKA doing the same may not work
::on some windows installations... :-(

rem IF NOT "%MinGWLibPath%"=="" GOTO J1

::Checking library path
IF EXIST C:\Progra~1\mingw\lib\libawka.a SET MinGWLibPath=C:\Progra~1\mingw\lib
IF EXIST C:\Progra~1\mingw32\lib\libawka.a SET MinGWLibPath=C:\Progra~1\mingw32\lib
IF EXIST C:\mingw\lib\libawka.a SET MinGWLibPath=C:\mingw\lib
IF EXIST C:\mingw32\lib\libawka.a SET MinGWLibPath=C:\mingw32\lib
IF EXIST C:\gcc\lib\libawka.a SET MinGWLibPath=C:\gcc\lib
IF EXIST .\libawka.a SET MinGWLibPath=.

IF "%MinGWLibPath%"=="" ECHO MinGWLibPath must be set first! (eg. SET MinGWLibPath=C:\Mingw32)
IF "%MinGWLibPath%"=="" GOTO End

:J1
ECHO ...using library: %MinGWLibPath%\libawka.a

IF "%1"=="" GOTO Usage
awka -i parallelize_functions.h -f %1.awk>%1.c

IF EXIST %1.exe DEL %1.exe
gcc -I. -c parallelize_functions.c
gcc -I. -O2 -s -o %1.exe %1.c parallelize_functions.o %MinGWLibPath%\libawka.a
IF EXIST %1.exe ECHO Result is stored in %1.exe

IF EXIST %1.exe GOTO End

ECHO *** Error *** Please check MinGWLibPath and MinGW32 installation
GOTO End

:Usage
ECHO.
ECHO Compile any AWKscript.awk :
ECHO.
ECHO usage:
ECHO       %0 AWKscript_without_awk_extension
ECHO.

:End
IF EXIST %1.c DEL %1.c
