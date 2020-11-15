@echo off
if NOT "%1"=="" goto do_copy
@echo.
@echo ERROR: no DRIVE specified !
@echo.
@echo usage: copy_morpheus_proxy_demos D:
@echo.
@echo    where D: is the drive you use to read/write SD cards
@echo.
goto done
:do_copy
REM
REM copy all clients and servers to SD Card (using DOS 8.3 file names)
REM
@echo on
copy test_1_client_2.binary %1T1_C_2.BIN
copy test_1_server_1.binary %1T1_S_1.BIN

copy test_2_client_2.binary %1T2_C_2.BIN
copy test_2_server_1.binary %1T2_S_1.BIN

copy test_3_client_2.binary %1T3_C_2.BIN
copy test_3_server_1.binary %1T3_S_1.BIN

copy test_4_client_1.binary %1%T4_C_1.BIN
copy test_4_server_2.binary %1%T4_S_2.BIN
:done
