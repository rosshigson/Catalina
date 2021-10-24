@echo off
rem
rem Script to run a pint self compile
rem
rem First, change elide patterns to remove prd and prr file statements.
rem The modified file goes in pintm.pas (pint modified).
rem
sed -e 's/{elide}/{/g' -e 's/{noelide}/}/g' -e 's/{remove//g' -e 's/remove}//g' pint.pas > pintm.pas
rem
rem Compile the final target, the PAT
rem
pcom iso7185pat.p5 < iso7185pat.pas
rem
rem Compile pint itself
rem
pcom pintm.p5 < pintm.pas
rem
rem Add the final target program (the pat) to the end of pint.
rem This means that the version of pint will read and interpret
rem this.
rem
cat pintm.p5 iso7185pat.p5 > selfrun.p5
rem
rem Now run pint on pint, which runs the PAT.
rem
pint selfrun.p5 pintm.out > iso7185pats.lst
diff iso7185pats.lst iso7185pats.cmp > iso7185pats.dif
dir iso7185pats.dif
