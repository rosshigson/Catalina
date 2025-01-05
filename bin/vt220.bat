@echo off

SET PORT=%1
if "%PORT%" == "" (
  SET PORT=11
)

SET BAUD=%2

if "%BAUD%" == "" (
  SET BAUD=230400
)

start comms /baudrate=%BAUD% /com=%PORT% /mode=vt220 /settitle="vt220" /fontsize=12 /fgcolor=white /bgcolor=dark_blue /sizing=screen /wrap /autocronlf
