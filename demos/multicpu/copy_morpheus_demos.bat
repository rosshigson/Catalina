@echo off
if NOT "%1"=="" goto do_copy
@echo.
@echo ERROR: no DRIVE specified !
@echo.
@echo usage: copy_morpheus_demos D:
@echo.
@echo    where D: is the drive you use to read/write SD cards
@echo.
goto done
:do_copy
@echo on
copy othello_pc_1.binary %1OTHELLO.1
copy test_fs_pc_1.binary %1TEST_FS.1
copy startrek_pc_2.binary %1STARTREK.2
copy test_suite_pc_2.binary %1TEST.2
:done
