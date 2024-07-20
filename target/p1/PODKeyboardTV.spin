{{
**************************
* Driver for POD to use  *
* keyboard and TV        *
* at your Prop board     *
* (C) 2007 Thomas Kliche *
**************************

Revision History
----------------
 1.0 on 16 May 2007
     - separated code as driver to handle input and output of POD to allow
       easier changes for other uses
     - added hot keys F12 and Ctrl-F12 as additional control equal to F10 and Ctrl-F10
       to provide control if PropTerminal is used, while F10 is used for menu
     - added method to show help

...................................................................................................

This driver contains all information required to control POD via keyboard and provide output on
a TV.
By default it uses the drivers for PropTerminal, so you can use your PC or notebook as a terminal
to control and show output of POD. See OBJ section for more details.

---------------------------------------------------------------------------------------------------
}}
CON

  'BEGIN OF CUSTOMIZING AREA
  'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  DEVTYPE_SERIAL  = TRUE                               'to determine if driver uses serial communication
  BASEPIN_TV      = 24                                  'base port pin for TV output
  BASEPIN_KEYB    = 12                                  'port pin for data of keyboard, clock pin will be then +1
  SCR_HEIGHT      = 30'13                                  '13 rows on NTSC
  SCR_WIDTH       = 40                                  '40 characters per row on NTSC

  'constants for layout
  HSPLIT_CHAR     = $90                                 'character used for horizontal split
  HSPLIT_ROW      = 15'6                                  '6 for TV
  FIRST_ROW       = 1

  'used colors, see DAT section for details of color palette
  'Note: if you are using PropTerminal you have to change the color palette in file PropTerminal.ini
  COLOR_BRKPNT    = 2
  COLOR_CHANGED   = 1
  COLOR_CURRENT   = 4
  COLOR_CURBRKPNT = 5
  COLOR_FLAG      = 6
  COLOR_FLAGCHG   = 7
  COLOR_NORMAL    = 0
  COLOR_TITLE     = 6
  COLOR_TITLEHDR  = 3
  '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  'END OF CUSTOMIZING AREA
  '

  'hot keys
  KEY_HELP         = $0D0                               'F1
  KEY_SETADDR      = $0D1                               'F2 set address
  KEY_FIND         = $0D2                               'F3 find text or bytes
  KEY_STEPINTO     = $0D4                               'F5 debug step into, performs one instruction and goes into subroutine on a call or jmpret
  KEY_STEPOVER     = $0D5                               'F6 debug step over, performs one instruction without going into subroutine on a call or jmpret
  KEY_RETURN       = $0D6                               'F7 debug return, run in realtime until previous callee
  KEY_RESUME       = $0D7                               'F8 debug resume, run in realtime until next breakpoint
  KEY_RUNTOLINE    = $2D7                               'Ctrl-F8
  KEY_TOGLBRKPNT   = $0D8                               'F9 toggle breakpoint
  KEY_DELALLBRKPTS = $2D8                               'Ctrl-F9 remove all breakpoints
  KEY_TOGLVIEWHGH0 = $0D9                               'F10 maximized or split view
  KEY_TOGLFOCVIEW0 = $2D9                               'Ctrl-F10 toggle focused view
  KEY_TOGLVIEWHGH2 = $0DB                               'F12 maximized or split view
  KEY_TOGLFOCVIEW2 = $2DB                               'Ctrl-F12 toggle focused view
  KEY_TOGLDATVIEW  = $0DA                               'F11 toggle data view between Cog and main memory view

  KEY_ARROWUP      = $0C2
  KEY_ARROWDOWN    = $0C3
  KEY_HOME         = $0C4
  KEY_FIRSTPOS     = $2C4                               'Ctrl-HOME go to first position
  KEY_LASTPOS      = $2C5                               'Ctrl-END go to last position
  KEY_PAGEUP       = $0C6
  KEY_PAGEDOWN     = $0C7
  KEY_SECTIONUP    = $2C6
  KEY_SECTIONDOWN  = $2C7

  KEY_ESCAPE       = $0CB                               'ESC abort realtime execution

  KEY_TOGLHEXVIEW  = $268                               'Ctrl-H toggle data view between hex and assembly view
  KEY_TOGLLMMVIEW  = $26C                               'Ctrl-L toggle data asm between cog and main assembly view

  'some constants used by TV object
  TV_CLS          = $00
  TV_HOME         = $01
  TV_SETCOL       = $0A
  TV_SETROW       = $0B
  TV_SETCOLOR     = $0C
  TV_NEWLINE      = $0D


OBJ

{
Uncomment the next two lines if you want to use a keyboard and TV connected at your Prop board.
Please then comment out the lines of drivers below necessary for PropTerminal.
Note: Please set SCR_HEIGHT and DEVTYPE_SERIAL in CON section to the proper value.
}
'  screen : "TV_Text"
'  keybrd : "Keyboard_iso_010"
{
---------------------------------------------------------------------------------------------------
The following drivers are necessary if you want to use the PropTerminal to control and show output
of POD.
Please then comment out the lines of drivers above necessary for real devices at your Prop board.
}
  screen : "PC_Text"
  keybrd : "PC_Keyboard"


PUB start

  stop
  keybrd.start(BASEPIN_KEYB, BASEPIN_KEYB + 2)
  'keybrd.start(3)
  screen.start(BASEPIN_TV)
  screen.setcolors(@Palette)


PUB stop

  keybrd.stop
  screen.stop

'==============================================================================
'TV related functions
'
PUB str(stringptr)

  screen.str(stringptr)


PUB dec(value)

  screen.dec(value)


PUB hex(value, digits)

  screen.hex(value, digits)


PUB bin(value, digits)

  screen.bin(value, digits)


PUB out(c)

  screen.out(c)


PUB setcolors(colorptr)

  screen.setcolors(colorptr)


'==============================================================================
'keyboard related functions
'
PUB present : truefalse

  return keybrd.present


PUB key : keycode

  return keybrd.key


'==============================================================================
'other functions
'
PUB showHelp | col, row, aKey

  aKey := "1"                                           'start with first help page
  repeat
    out(TV_SETCOLOR)
    out(COLOR_NORMAL)

    out(TV_SETROW)
    out(FIRST_ROW)
    out(TV_SETCOL)
    out(0)
    repeat row from FIRST_ROW to SCR_HEIGHT - FIRST_ROW
      out(TV_SETROW)
      out(row)
      out(TV_SETCOL)
      out(0)
      col := 0
      repeat SCR_WIDTH
        if row == SCR_HEIGHT - 1 AND col++ == SCR_WIDTH - 1
          quit                                          'prevent scroll on last row
        out($20)

    if aKey == $0D                                      'continue debugging
      quit

    out(TV_SETROW)
    out(FIRST_ROW)
    out(TV_SETCOL)
    out(0)
    if aKey == "1"                                      'first help page
      out(TV_SETCOLOR)
      out(COLOR_FLAGCHG)
      str(@Help1Header)
      out(TV_SETCOLOR)
      out(COLOR_NORMAL)
      str(@Help1Text)

    if aKey == "2"                                      'second help page
      out(TV_SETCOLOR)
      out(COLOR_FLAGCHG)
      str(@Help2Header)
      out(TV_SETCOLOR)
      out(COLOR_NORMAL)
      str(@Help2Text)

    out(TV_SETCOLOR)
    out(COLOR_CURRENT)
    str(@NextHelpPage)

    repeat
      aKey := keybrd.key
      if aKey == 0
        next                                              'wait for key press
      if aKey == $0D OR aKey == "1" OR aKey == "2"
        quit


DAT
                                '0123456789012345678901234567890123456789
Help1Header             byte    "page 1      = HOT KEY COMMANDS =",0
Help1Text               byte    $0D
                        byte    "F5 step into         | F6 step over",$0D
                        byte    "                     | F8 resume",$0D
                        byte    "F9 toogle breakpoint | F1 show help",$0D
                        byte    "CTRL-F9 clear all breakpoints",$0D
                        byte    "F12 maximized or split view",$0D
                        byte    "Ctrl-F12 toggle focused view",$0D
                        byte    "F11 toggle data view (main or Cog mem)",$0D
                        byte    "Ctrl-H toggle hex data view",$0D
                        byte    "Ctrl-L toggle cog/lmm disasm view",$0D,0

Help2Header             byte    "page 2      = NAVIGATION KEYS =",0
Help2Text               byte    $0D
                        byte    "down - next line   | up - previous line",$0D
                        byte    "PgDn page down     | PgUp page up",$0D
                        byte    "Ctrl-PgDn sec down | Ctrl-PgUp sec up",$0D
                        byte    "Ctrl-HOME goto top | Ctrl-END goto end",$0D
                        byte    "HOME goto page of PC or begin of data",$0D,0

NextHelpPage            byte    $0D,"<1 or 2 for help page/enter to return>",0


                        '     FORE   BACK                          DEFAULT
                        '     COLOR  COLOR                         USAGE
Palette                 byte  $02,   $04  '    black / gray        normal
                        byte  $9E,   $04  '   yellow / gray        changed
                        byte  $05,   $CB  '    white / red         breakpoint
                        byte  $8E,   $CB  '   yellow / red         breakpoint changed
                        byte  $07,   $0A  '    white / dark blue   current
                        byte  $07,   $CB  '    white / red         current with breakpoint
                        byte  $1A,   $3C  'dark blue / cyan        title
                        byte  $8E,   $3C  '   yellow / cyan        title changed
'