@echo off

SET PORT=%1
if "%PORT%" == "" (
  SET PORT=11
)

SET BAUD=%2

if "%BAUD%" == "" (
  SET BAUD=230400
)

start comms /baudrate=%BAUD% /com=%PORT% /mode=PC /settitle=PC(ANSI) /fontsize=12 /fgcolor=yellow /bgcolor=dark_green /sizing=screen /wrap /autocronlf
