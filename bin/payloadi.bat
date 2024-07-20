@echo off
setlocal enabledelayedexpansion

rem Batch file to decode -g options to get ROWS and COLUMNS, use the "mode"
rem command to set the terminal to the specified size, and invoke "payload"
rem with the -i option in the resulting terminal

rem Set default rows and colums ...
set _ROWS=24
set _COLUMNS=80

rem Replace commas (in -g arguments) with underscore
set _ARGS=%*
set _ARGS=%_ARGS:,=_%

set _OTHER_ARGS=
set _NEXT=

for %%x in (%_ARGS%) do (
   set _TOKEN=%%x
   if "!_NEXT!" == "Y" (
      rem parse -g arguments to get rows and columns
      for /f "tokens=1,2 delims=_" %%a in ("!_TOKEN!") do (
        set _COLUMNS=%%a
        set _ROWS=%%b
      )
      set _NEXT=
      set _TOKEN=
   )
   if "!_TOKEN!" == "-g" ( 
     set _NEXT=Y
     set _TOKEN=
   ) else (
      if "!_TOKEN:~0,2!" == "-g" (
         rem parse -g arguments to get rows and columns
         for /f "tokens=1,2 delims=_" %%a in ("!_TOKEN:~2!") do (
           set _COLUMNS=%%a
           set _ROWS=%%b
         )
         set _TOKEN=
      )
   )
   rem just collect arguments other than -g 
   set _OTHER_ARGS=!_OTHER_ARGS! !_TOKEN!
)

rem echo COLUMNS=!_COLUMNS!
rem echo ROWS=!_ROWS!
rem echo OTHER ARGS=!_OTHER_ARGS!

mode con COLS=!_COLUMNS! LINES=!_ROWS!
payload !_OTHER_ARGS! -i -g!_COLUMNS!,!_ROWS!

