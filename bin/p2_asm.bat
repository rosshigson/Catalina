@ECHO off
SETLOCAL ENABLEDELAYEDEXPANSION

SET CMD=%~1

IF "%CMD%" == "" (
  SET CMD=%~0
  GOTO usage
)

SET CMD=%~0

SET DEFINES=
SET INCLUDES=
SET OUTPUT=""
SET INPUT=""
SET LISTING=""

:args
SET PARAM=""
SET MYPARAM=%~1
SET ARG=""
SET MYARG=%~2

IF "%~1" == "" (
  GOTO endargs
)

if NOT "%MYPARAM%"=="%MYPARAM: =%" (
   SET PARAM=%1
) ELSE (
   SET PARAM="%~1"
)

IF "%~2" == "" (
  SET ARG="-"
  GOTO no_second_arg
)

if NOT "%MYARG%"=="%MYARG: =%" (
   SET ARG=%2
) ELSE (
   SET ARG="%~2"
)

:no_second_arg
IF %PARAM% == "-D" (
  SHIFT
  IF NOT %ARG% == "" (
    IF NOT "%ARG:~1,1%" == "-" (
      for /f "useback tokens=*" %%a in ('!ARG!') do set ARG=%%~a
      SET DEFINES=!DEFINES! -D !ARG!
      SHIFT
    ) ELSE (
      ECHO Missing -D value. 1>&2
      ECHO:
      GOTO usage
    )
  ) ELSE (
    ECHO Missing -D value. 1>&2
    ECHO:
    GOTO usage
  )
) ELSE IF %PARAM% == "-I" (
  SHIFT
  IF NOT %ARG% == "" (
    IF NOT "%ARG:~1,1%" == "-" (
      for /f "useback tokens=*" %%a in ('!ARG!') do set ARG=%%~a
      SET INCLUDES=!INCLUDES! -I "!ARG!"
      SHIFT
    ) ELSE (
      ECHO Missing -I value. 1>&2
      ECHO:
      GOTO usage
    )
  ) ELSE (
    ECHO Missing -I value. 1>&2
    ECHO:
    GOTO usage
  )
) ELSE IF %PARAM% == "-o" (
  SHIFT
  IF NOT %OUTPUT% == "" (
    ECHO Multiple -o values not permitted. 1>&2
    ECHO:
    GOTO usage
  )
  IF NOT %ARG% == "" (
    SET OUTPUT=%ARG%
    SHIFT
  ) ELSE (
    ECHO Missing -o value. 1>&2
    ECHO:
    GOTO usage
  )
) ELSE IF %PARAM% == "-b" (
    ECHO Option -b ignored. 1>&2
    ECHO:
   SHIFT
) ELSE IF %PARAM% == "-e" (
    ECHO Option -e not supported. 1>&2
    ECHO:
    GOTO usage
) ELSE IF %PARAM% == "-l" (
   SET LISTING= "-l"
   SHIFT
) ELSE (
  SHIFT
  IF NOT %INPUT% == "" (
    ECHO Multiple file names not permitted. 1>&2
    ECHO:
    GOTO usage
  )
  SET INPUT=%PARAM%
)
GOTO args
:endargs

IF %INPUT% == "" (
  ECHO Missing File name 1>&2
  ECHO:
  GOTO usage
) ELSE (
  rem @ECHO File name: %INPUT%
)

IF NOT "%DEFINES%" == "" (
  rem @ECHO Defined Symbols: %DEFINES%
)

rem the following won't work if the includes has quote characters! ...
rem IF NOT "%INCLUDES%" == "" (
rem   rem @ECHO Include Paths: %INCLUDES%
rem )

IF NOT %OUTPUT% == "" (
  rem @ECHO Output File: %OUTPUT%
)

IF NOT EXIST %INPUT% (
  ECHO Input file %INPUT% not found 1>&2
  GOTO :eof
)

IF %OUTPUT% == "" (
   SET OUTPUT=%INPUT%
)

IF NOT %OUTPUT% == %INPUT% (
   spp %DEFINES% %INCLUDES% %INPUT% > %OUTPUT%
   p2asm -v33 %LISTING% %OUTPUT%
   del %OUTPUT%
) ELSE (
    FOR %%i IN (%INPUT%) DO (
       SET FN_ONLY=%%~nxi
    )
   copy %INPUT% "%TEMP%"\\!FN_ONLY! > NUL:
   spp %DEFINES% %INCLUDES% "%TEMP%"\\!FN_ONLY! > %INPUT%
   p2asm -v33 %LISTING% %INPUT%
   copy "%TEMP%"\\!FN_ONLY! %INPUT% > NUL:
   del "%TEMP%"\\!FN_ONLY!
)

GOTO :eof

:usage
ECHO Usage: %CMD% [-I path]* [-D symbol]* [-o output_file] [-l] input_file
EXIT /B 1
