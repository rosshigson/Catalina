@echo off

SET PORT=%1
if "%PORT%" == "" (
  SET PORT=11
)

SET BAUD=%2

if "%BAUD%" == "" (
  SET BAUD=230400
)

start comms /baudrate=%BAUD% /com=%PORT% /mode=vt100 /settitle="vt100" /fontsize=12 /fgcolor=white /bgcolor=black /sizing=screen /wrap
