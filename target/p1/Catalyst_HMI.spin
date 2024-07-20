{{
'-------------------------------------------------------------------------------
'
'   Catalyst_HMI - A Wrapper module to allow the use of a Catalina HMI option
'                  from a SPIN program (such as Catalyst).
'
'   Note that before this module is called, the following is required:
'
'   common.InitilizeRegistry
'
'   The Setup function must be called to allocate data block, then Start can
'   be called:
'
'      HMI.Setup
'      HMI.Start
'
'   Version 3.1 - Simplified version
'
'-------------------------------------------------------------------------------
}}

CON

DATA_LONGS = HMI#DATA_LONGS

ROWS     = HMI#rows
COLS     = HMI#cols

OBJ
'
' The following object MUST be included:
'
  common : "Catalina_Common"
'
' The following object MUST be loaded for HMI support ...
'
  HMI : "HMI"
'
VAR 

  LONG commblock
  LONG HMI_cog

'
' This function is called by the target to allocate data blocks or set up 
' other details for the extra plugins. If it does not need to do anything
' it can simply be a null routine.
'   
PUB Setup
   HMI.Setup (-1, -1, -1)

PUB Start : ok | i

  HMI_cog := -1
  HMI.Start

  ' find cog allocated to HMI plugin (makes for faster calls)
  HMI_cog := -1
  repeat i from 0 to 7 
     if ((long[Common#REGISTRY][i] >> 24) == common#LMM_HMI)
       HMI_cog := i
       commblock := LONG[Common#REGISTRY][i] & $00FFFFFF
       return 1 ' found it

  return 0 ' no such plugin registered

PUB stop

  ' Catalyst must unregister this HMI to avoid calling a stopped cog!
  if HMI_cog <> -1
     common.UnRegister(HMI_cog)

PUB HMI_plugin(request) : result | block
  LONG[commblock] := request
  repeat while LONG[commblock] <> 0
  result := LONG[commblock][1]

PUB short_HMI_request(code, param) : result
   if (HMI_cog => 0)
      return HMI_plugin((code<<24) | param)
   else
      return -1   

PUB long_HMI_request(code, param) | tmp
   tmp := param
   if (HMI_cog => 0)
      return HMI_plugin((code<<24) | @tmp)
   else
      return -1   

PUB long_HMI_request_2(code, param1, param2) | tmp1, tmp2
   tmp1 := param1
   tmp2 := param2
   if (HMI_cog => 0)
      return HMI_plugin((code<<24) | @tmp1)
   else
      return -1   

PUB k_present : ok
  return short_HMI_request(1, 0)

PUB k_get : key
  return short_HMI_request(2, 0)
  
PUB k_wait : key
  return short_HMI_request(3, 0)

PUB k_new : key
  return short_HMI_request(4, 0)

PUB k_ready : ok
  return short_HMI_request(5, 0)

PUB k_clear : ok
  return short_HMI_request(6, 0)

PUB k_state (key) : ok
  return short_HMI_request(7, 0)

PUB m_present : ok
  return short_HMI_request(11, 0)

PUB m_button (b) : ok
  return short_HMI_request(12, b)

PUB m_buttons : buttons
  return short_HMI_request(13, 0)

PUB m_abs_x : x
  return short_HMI_request(14, 0)

PUB m_abs_y : y
  return short_HMI_request(15, 0)

PUB m_abs_z : z
  return short_HMI_request(16, 0)

PUB m_delta_x : x
  return short_HMI_request(17, 0)

PUB m_delta_y : y
  return short_HMI_request(18, 0)

PUB m_delta_z : z
  return short_HMI_request(19, 0)

PUB m_reset
  return short_HMI_request(20, 0)

PUB t_geometry : col_row
  return short_HMI_request(21, 0)

PUB t_char(curs, char) : ok
  return short_HMI_request(22, ((curs&1)<<23)|char)

PUB t_string (curs, str) : ok
  return short_HMI_request(23, ((curs&1)<<23)|str)

PUB t_int (curs, int) : ok
  return short_HMI_request(24, ((curs&1)<<23)|@int)

PUB t_unsigned (curs, uns) : ok
  return short_HMI_request(25, ((curs&1)<<23)|@uns)

PUB t_hex (curs, hex) : ok | i, j
  repeat i from 0 to 7
    j := (hex & $F0000000) >> 28
    if j < 10
       j += 48
    else
       j += 55 
    t_char(curs, j)
    hex <<= 4
  return 0

PUB t_bin (curs, bin) : ok | i, j
  repeat i from 0 to 31
    j := 48 + ((bin & $80000000) >> 31)
    t_char(curs, j)
    bin <<= 1
  return 0

PUB t_setpos (curs, col, row) : ok
  return short_HMI_request(28, ((curs&1)<<23)|(col<<8)|(row))

PUB t_getpos (curs) : x_y
  return short_HMI_request(29, ((curs&1)<<23))

PUB t_mode(curs, mode) : ok
  return short_HMI_request(30, ((curs&1)<<23)|mode)

PUB t_scroll (curs, count, first, last) : ok
  return short_HMI_request(31, ((curs&1)<<23)|(count<<16)|(first<<8)|(last))

PUB t_color (curs, color) : ok
  return short_HMI_request(32, ((curs&1)<<23)|color)
