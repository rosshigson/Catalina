''
'' TINY_HMI - a demonstration of using a Spin program as a Catalina plugin.
''
''       This is not a complete HMI plugin replacement, as the
''       real HMI plugins do a lot of other work, such as
''       cursor management and character translation - but even
''       this very simple HMI replacement is quite functional!
''
''       Note that this program must be compiled with FULL_LAYER_2 
''       defined, to ensure the appropriate Spin layer 2 methods are 
''       included - most C programs do not need the Spin versions of
''       these functions.
''
CON

' Define the HMI commands required to implement full C stdio library
' support - there are only two, which correspond to getc and putc!

K_WAIT  = 3  ' get character from the keyboard (wait if necessary)
T_CHAR  = 22 ' put character to the screen (at the current location)

OBJ

common : "Catalina_Common"
kbd    : "Keyboard"
scr    : "TV_Text"

PUB Start | cog, command, data

   ' start the standard OBEX keyboard and screen drivers
   kbd.Start (26, 27)   ' pin numbers for C3 keyboard
   scr.Start (12)       ' pin numbers for C3 TV output

   ' register ourselves as a HMI plugin
   ' (so the Catalina kernel can find us!)    
   cog := cogid
   common.Register(cog, common#LMM_HMI)
   
   ' register this program as providing the services the C
   ' program will use
   Common.RegisterServiceCog(Common#SVC_K_WAIT, -1, cog, K_WAIT)
   Common.RegisterServiceCog(Common#SVC_T_CHAR, -1, cog, T_CHAR)

   ' now process commmands as they appear in the registry
   repeat

      command := common.GetRequest(cog)
      case (command >> 24)
      
         K_WAIT:
            data := kbd.newkey & $FF
            if (data == 13) ' translate CR to LF
               data := 10
            common.SetResponse(cog, data)
            common.SetRequest(cog, 0)
                        
         T_CHAR:
            data := command & $FF
            if (data == 10) ' translate LF to CR
               scr.out(13)
            else
               scr.out(data)
            common.SetRequest(cog, 0)
      
