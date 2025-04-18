' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export getlhex

 alignl ' align long
C_getlhex ' <symbol:getlhex>
 calld PA,#NEWF
 sub SP, #84
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, #80 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_safe_gets
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, #80 ' reg ARG coni
 mov r4, #16 ' reg ARG coni
 mov r5, FP
 sub r5, #-(-8) ' reg ARG ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, FP
 sub RI, #-(-88)
 wrlong RI, --PTRA ' stack ARG ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C__scanf_getll
 add SP, #16 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
' C_getlhex_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #84 ' framesize
 calld PA,#RETF


' Catalina Import _scanf_getll

' Catalina Import safe_gets
' end
