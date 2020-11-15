@echo off

set path=.;%PATH%

rem get the short path name, then substitute \ with \\

call set_short_path TMP_LCCDIR "%LCCDIR%"
set TMP_LCCDIR=%TMP_LCCDIR:\=\\%

make clean -f makefile.mgw LCCDIR=%TMP_LCCDIR%
make -B all -f makefile.mgw COMPACT=TRUE LCCDIR=%TMP_LCCDIR%

make clean -f makefile.mgw LCCDIR=%TMP_LCCDIR%
make -B all -f makefile.mgw COMPACT=TRUE  PROPELLER_2=TRUE LCCDIR=%TMP_LCCDIR%

