' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _malloc_sell_out

 alignl_label
C__malloc_sell_out ' <symbol:_malloc_sell_out>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16B_LODL + (r23)<<D16B
 alignl_p1
 long @C__malloc_store ' reg <- addrg
 alignl_p1
 long I32_JMPA + (@C__malloc_sell_out_7)<<S32 ' JUMPV addrg
 alignl_label
C__malloc_sell_out_4
 word I16A_RDLONG + (r21)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C__malloc_sell_out_10)<<S32 ' JUMPV addrg
 alignl_label
C__malloc_sell_out_9
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNP4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_NEGI + (r18)<<D16A + (-($fffffffd)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__malloc_do_free)<<S32 ' CALL addrg
 word I16A_RDLONG + (r21)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 alignl_label
C__malloc_sell_out_10
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__malloc_sell_out_9)<<S32 ' NEU4 reg coni
' C__malloc_sell_out_5 ' (symbol refcount = 0)
 word I16A_ADDSI + (r23)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl_label
C__malloc_sell_out_7
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__malloc_store+128 ' reg <- addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C__malloc_sell_out_4)<<S32 ' LTU4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C__malloc_sell_out_3 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _malloc_store

' Catalina Import _malloc_do_free
' end
