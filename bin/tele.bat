@echo off
if NOT "%1"=="" goto start
@echo.
@echo Usage: tele [ host_name or ip_address ]
goto done
:start
start telnet /mode=char /uselfaseol /autocronlf /host=%1
:done
