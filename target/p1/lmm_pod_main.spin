{{
'-------------------------------------------------------------------------------
'
' LMM_pod_main - a POD front-end for Catalina (used by the lmm_pod target).
'
******************************
* Frontend of POD            *
* Propeller On-chip Debugger *
*  (C) 2007 Thomas Kliche    *
******************************

Revision History
----------------
 1.2 on 16 May 2007
     - fixed breakpoint handling in prepareBreakpoints and restoreBreakpoints which
       cause POD to hang after some steps of debugging
     - fixed speed of animation in runInRealtime which cause sometimes POD to hang
       when using a serial connection for output
     - added help via hot key F1
     - added improved handling of current line
     - added some labels which will be shown in data view
     - separated code as driver PODKeyboardTV.spin to handle input and output of POD

 1.1 on 29 March 2007
     - fixed removeBreakpoint which did not work properly
     - added hot key Ctrl-F9 to remove all breakpoints
     - added main memory view shown via toggle key F11
     - added hot key Ctrl-H to toggle between assembly view and hexadecimal view for both,
       Cog memory and main memory view
     - added hot key Ctrl-Home and Ctrl-End to navigate quickly in a view
       to the first and last position
     - added method restartDebugCog which is always used to start the Cog to debug,
       so we have only one location where changes could be necessary
     - some code optimizations

 1.0 on 18 March 2007
     - first public version

...................................................................................................

This is the frontend of the Propeller On-chip Debugger called POD which allows you to debug your
assembly code running on a Cog. It uses a disassembler to show you your code in a familiar
manner like the Propeller tool, so that you can easily follow the program flow on single step
execution.
The debugging of your code is enabled by a little debug kernel of assembly code that you must
add to your assembly code which you want to debug.

---------------------------------------------------------------------------------------------------
}}
CON
'
' Note - these are not really significant since this is no longer the top level file - so
'        they are now duplicated in lmm_debug.spin ...
'
_clkmode  = Common#CLOCKMODE
_xinfreq  = Common#XTALFREQ
_stack    = Common#STACKSIZE
'
  'BEGIN OF CUSTOMIZING AREA
  'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  'debugger stuff
  MAX_BREAKPOINTS = 10
  '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  'END OF CUSTOMIZING AREA
  '

  EMPTY_BRKPNT    = $FFFF

  'UI constants
  MASK_VIEWLINES  = %0001_1111                          'up to 31 lines of view
  MASK_HEXVIEW    = %1000_0000                          'bit in ViewLines to control hex mode

  VIEW_TOP        = 0
  VIEW_BOTTOM     = 1

  VIEW_NOTVISIBLE = -1
  VIEW_COGDISASM  = 0
  VIEW_LMMDISASM  = 1
  VIEW_COGMEMO    = 2
  VIEW_MAINMEMO   = 3
  MAXVIEWS        = 4

  VIEW_COGHEXROW  = 2                                   'number of longs per row shown in hex view from Cog memory
  VIEW_MAINHEXROW = 8                                   'number of bytes per row shown in hex view from main memory
  VIEW_MAXHEIGHT  = term#SCR_HEIGHT - 1
  VIEW_TOPMAXHGHT = term#HSPLIT_ROW - term#FIRST_ROW
  VIEW_BTMMAXHGHT = VIEW_MAXHEIGHT - term#HSPLIT_ROW

  FOCUS_BOTTOM    = "v"
  FOCUS_TOP       = "^"

VAR

  'Catalina specific stuff
  'UI related stuff
  byte  FocusView                                       'view that has the focus
  byte  CurrentViews[2]                                 'contains id of current visible views
                                                        'maximal 2 views can be visible at the same time
                                                        'element 0 is top view, element 1 is bottom view
  byte  ViewLines[MAXVIEWS]                             'maximum number of lines of view
  byte  ViewFirstRow[MAXVIEWS]                          'start of first row of view
  long  CurrentLine[MAXVIEWS]                           'relative row of current line in view
  long  TopAddr[MAXVIEWS]                               'corresponding address of first row of view

  'Cog debugging stuff
  word  PC                                              'programm counter of debugged Cog
  word  BreakpointIdx                                   'index of next free element in following breakpoint arrays
  word  Breakpoint[MAX_BREAKPOINTS]                     'address of breakpoint, first element is used for current breakpoint
  long  BreakpointInstr[MAX_BREAKPOINTS]                'original instruction at breakpoint

  'LMM debugging stuff
  word  LMM_PC                                          'programm counter of debugged LMM
  word  LMM_BreakpointIdx                               'index of next free element in following breakpoint arrays
  word  LMM_Breakpoint[MAX_BREAKPOINTS]                 'address of breakpoint, first element is used for current breakpoint
  long  LMM_BreakpointInstr[MAX_BREAKPOINTS]            'original instruction at breakpoint

  'must be located before parameter stack, because it's used on startup of debug kernel
  long  MainRomSize                                     'size of main ROM memory
  long  MainMemoSize                                    'size of whole main memory
  long  AddrCmdTable                                    'address of command jump table of kernel in Cog memory

  'parameter stack to communicate with debugged Cog
  long  DebugCmd                                        'command send to kernel, response is 0 if kernel is ready
  long  DebugAddr                                       'address send to kernel to access Cog or main memory
  long  DebugData                                       'data send to or received from kernel

  'some important addresses of debugged object
  long  DebugParameter                                  'used to pass your parameter to your assembly routine
  long  DebugObjAddr                                    'address of debugged object in main memory
  word  DebugBeginVarAddr                               'start address of initialized variable area of debugged code in Cog memory
  word  DebugBeginResAddr                               'start address of uninitialized variable area of debugged code in Cog memory


OBJ
'
  term   : "PODKeyboardTV"
'
  disasm : "Disassembler"
'
  asmdbg : "Catalina_LMM_pod"
'
  common : "Catalina_Common"
'
PUB start (base)

  DebugParameter := base       'here you can provide the address of your parameters to pass to your assembly routine
  restartDebugCog
  term.start
  term.out(term#TV_CLS)

  term.out(term#TV_SETCOLOR)
  term.out(term#COLOR_TITLE)
  repeat term#SCR_WIDTH
    term.out($20)

  term.out(term#TV_SETROW)
  term.out(term#HSPLIT_ROW)
  term.out(term#TV_SETCOL)
  term.out(0)
  term.out(FOCUS_TOP)
  repeat term#SCR_WIDTH - 1
    term.out(term#HSPLIT_CHAR)

  term.out(term#TV_HOME)
  term.out(term#TV_SETCOLOR)
  term.out(term#COLOR_TITLEHDR)
  term.str(@Version)

  waitcnt(3 * clkfreq + cnt)
  if !term.present
    term.out(term#TV_SETROW)
    term.out(term#HSPLIT_ROW)
    term.out(term#TV_SETCOLOR)
    term.out(term#COLOR_BRKPNT)
    term.out(term#TV_SETCOL)
    term.out((term#SCR_WIDTH - strsize(@NoKeyboard)) / 2)
    term.str(@NoKeyboard)
  else
    NoKeyboard := 0

  term.out(term#TV_HOME)
  term.out(term#TV_SETCOLOR)
  term.out(term#COLOR_TITLEHDR)
  term.str(@Title)

  mainloop


PRI stop

  asmdbg.stopDebug
  term.stop
  term.stop


PRI restartDebugCog

  asmdbg.stopDebug
  asmdbg.initDebug(@DebugCmd)
  asmdbg.startDebug(DebugParameter)


PRI mainloop | currentView, disasmView, key, instr, nextPC, flags, oldFlags, ptr, incr

  if TopAddr[VIEW_COGMEMO] == TopAddr[VIEW_COGDISASM] AND TopAddr[VIEW_COGDISASM] == 0
    init
    oldFlags := flags := getFlags

  updateDisasmView (VIEW_COGDISASM)
  updateCogMemoView

  repeat
    if NoKeyboard
      if term.present
        drawSplitBar
        NoKeyboard := 0

    key := term.key
    if key == 0
      next                                              'wait for key press

    incr := 1
    if (CurrentViews[VIEW_TOP] == VIEW_COGDISASM)
      disasmView := CurrentViews[VIEW_TOP]
    elseif (CurrentViews[VIEW_TOP] == VIEW_LMMDISASM)
      disasmView := CurrentViews[VIEW_TOP]
      incr := 4
    elseif (CurrentViews[VIEW_BOTTOM] == VIEW_COGDISASM)
      disasmView := CurrentViews[VIEW_BOTTOM]
    elseif (CurrentViews[VIEW_BOTTOM] == VIEW_LMMDISASM)
      disasmView := CurrentViews[VIEW_BOTTOM]
      incr := 4
    else
      disasmView := VIEW_NOTVISIBLE

    case key
      term#KEY_HELP:
        term.showHelp
        drawSplitBar

      term#KEY_RESUME:
        if disasmView <> VIEW_NOTVISIBLE
          if disasmView == VIEW_COGDISASM
            repeat while existBreakpoint(PC, disasmView)
              instr := getCogData(PC)
              disasm.decode(instr)
              nextPC := disasm.getNextPC(PC, flags, @DebugCmd, TRUE, FALSE)
              setBreakpoint(nextPC, TRUE, disasmView)
              PC := singleStep(PC, disasmView)
          else
            repeat while existBreakpoint(LMM_PC, disasmView)
              instr := getMainData(LMM_PC)
              disasm.decode(instr)
              nextPC := disasm.getNextPC(LMM_PC, flags, @DebugCmd, TRUE, TRUE)
              setBreakpoint(nextPC, TRUE, disasmView)
              PC := singleStep(PC, disasmView)
              LMM_PC := getCogData(common#LMM_PC_OFF) - 4

          if disasmView == VIEW_COGDISASM
            PC := run(PC, disasmView)
            if PC == $FFFF                                'check if user has interrupted
              restartDebugCog
              oldFlags := flags := getFlags
              PC := 1
            else
              flags := getFlags
            setTopAddr(disasmView, PC - incr*CurrentLine[VIEW_COGDISASM], TRUE)
          else
            PC := run(PC, disasmView)
            LMM_PC := getCogData(common#LMM_PC_OFF) - 4
            if LMM_PC == $FFFF                                'check if user has interrupted
              restartDebugCog
              oldFlags := flags := getFlags
              LMM_PC := LONG[common#LMM_INIT_PC_OFF<<2 + 8] ' (only works after relocate!)
            else
              flags := getFlags
            setTopAddr(disasmView, LMM_PC - incr*CurrentLine[VIEW_LMMDISASM], TRUE)

      term#KEY_STEPINTO, term#KEY_STEPOVER:
        if disasmView == VIEW_COGDISASM
          instr := getCogData(PC)
          disasm.decode(instr)
          if key == term#KEY_STEPOVER
            nextPC := disasm.getNextPC(PC, flags, @DebugCmd, FALSE, FALSE)
          else
            nextPC := disasm.getNextPC(PC, flags, @DebugCmd, TRUE, FALSE)
          setBreakpoint(nextPC, TRUE, disasmView)
          PC := singleStep(PC, disasmView)
          flags := getFlags
          setTopAddr(disasmView, PC - incr*CurrentLine[VIEW_COGDISASM], TRUE)
        elseif disasmView == VIEW_LMMDISASM
          instr := getMainData(LMM_PC)
          disasm.decode(instr)
          if key == term#KEY_STEPOVER
            nextPC := disasm.getNextPC(LMM_PC, flags, @DebugCmd, FALSE, TRUE)
          else
            nextPC := disasm.getNextPC(LMM_PC, flags, @DebugCmd, TRUE, TRUE)
          'ShowDebugVal(0, nextPC)
          setBreakpoint(nextPC, TRUE, disasmView)
          PC := singleStep(PC, disasmView)
          LMM_PC := getCogData(common#LMM_PC_OFF) - 4
          flags := getFlags
          setTopAddr(disasmView, LMM_PC - incr*CurrentLine[VIEW_LMMDISASM], TRUE)

      term#KEY_TOGLBRKPNT:
        if (disasmView == VIEW_COGDISASM) or (disasmView == VIEW_LMMDISASM)
          nextPC := TopAddr[disasmView] + incr*CurrentLine[disasmView]
        if existBreakpoint(nextPC, disasmView)
          removeBreakpoint(nextPC, disasmView)
        else
          setBreakpoint(nextPC, FALSE, disasmView)

      term#KEY_DELALLBRKPTS:
        if disasmView <> VIEW_NOTVISIBLE
          removeAllBreakpoints

      term#KEY_HOME:
        if FocusView == VIEW_COGDISASM
          if PC == 0
            setTopAddr(FocusView, 0, TRUE)
          else
            setTopAddr(FocusView, PC - incr*CurrentLine[VIEW_COGDISASM], TRUE)
        if FocusView == VIEW_LMMDISASM
          if LMM_PC == 0
            setTopAddr(FocusView, 0, TRUE)
          else
            setTopAddr(FocusView, LMM_PC - incr*CurrentLine[VIEW_COGDISASM], TRUE)
        elseif FocusView == VIEW_COGMEMO
          setTopAddr(FocusView, DebugBeginVarAddr, TRUE)
        elseif FocusView == VIEW_MAINMEMO
          setTopAddr(FocusView, DebugParameter, TRUE)

      term#KEY_FIRSTPOS:
        setTopAddr(FocusView, 0, TRUE)

      term#KEY_LASTPOS:
        setTopAddr(FocusView, MainMemoSize, TRUE)

      term#KEY_ARROWUP:
        if (ViewLines[FocusView] & MASK_HEXVIEW)
          if FocusView == VIEW_COGMEMO
            setTopAddr(FocusView, -VIEW_COGHEXROW, FALSE)
          else
            setTopAddr(FocusView, -VIEW_MAINHEXROW, FALSE)
        else
          if FocusView == VIEW_MAINMEMO
            setTopAddr(FocusView,  -(VIEW_MAINHEXROW / 2), FALSE)
          else
            setTopAddr(FocusView, -1, FALSE)

      term#KEY_ARROWDOWN:
        if (ViewLines[FocusView] & MASK_HEXVIEW)
          if FocusView == VIEW_COGMEMO
            setTopAddr(FocusView, VIEW_COGHEXROW, FALSE)
          else
            setTopAddr(FocusView, VIEW_MAINHEXROW, FALSE)
        else
          if FocusView == VIEW_MAINMEMO
            setTopAddr(FocusView, VIEW_MAINHEXROW / 2, FALSE)
          else
            setTopAddr(FocusView, 1, FALSE)

      term#KEY_PAGEUP:
        if (ViewLines[FocusView] & MASK_HEXVIEW)
          if FocusView == VIEW_COGMEMO
            setTopAddr(FocusView, TopAddr[FocusView] - VIEW_COGHEXROW * (ViewLines[FocusView] & MASK_VIEWLINES), TRUE)
          else
            setTopAddr(FocusView, TopAddr[FocusView] - VIEW_MAINHEXROW * (ViewLines[FocusView] & MASK_VIEWLINES), TRUE)
        else
          if FocusView == VIEW_MAINMEMO
            setTopAddr(FocusView, TopAddr[FocusView] - VIEW_MAINHEXROW / 2 * (ViewLines[FocusView] & MASK_VIEWLINES), TRUE)
          elseif FocusView == VIEW_LMMDISASM
            setTopAddr(FocusView, TopAddr[FocusView] - incr*(ViewLines[FocusView] & MASK_VIEWLINES), TRUE)
          else
            setTopAddr(FocusView, TopAddr[FocusView] - (ViewLines[FocusView] & MASK_VIEWLINES), TRUE)

      term#KEY_PAGEDOWN:
        if (ViewLines[FocusView] & MASK_HEXVIEW)
          if FocusView == VIEW_COGMEMO
            setTopAddr(FocusView, TopAddr[FocusView] + VIEW_COGHEXROW * (ViewLines[FocusView] & MASK_VIEWLINES), TRUE)
          else
            setTopAddr(FocusView, TopAddr[FocusView] + VIEW_MAINHEXROW * (ViewLines[FocusView] & MASK_VIEWLINES), TRUE)
        else
          if FocusView == VIEW_MAINMEMO
            setTopAddr(FocusView, TopAddr[FocusView] + VIEW_MAINHEXROW / 2 * (ViewLines[FocusView] & MASK_VIEWLINES), TRUE)
          elseif FocusView == VIEW_LMMDISASM
            setTopAddr(FocusView, TopAddr[FocusView] + incr*(ViewLines[FocusView] & MASK_VIEWLINES), TRUE)
          else  
            setTopAddr(FocusView, TopAddr[FocusView] + (ViewLines[FocusView] & MASK_VIEWLINES), TRUE)

      term#KEY_SECTIONUP:
        if (ViewLines[FocusView] & MASK_HEXVIEW)
          if FocusView == VIEW_COGMEMO
            setTopAddr(FocusView, TopAddr[FocusView] - $40, TRUE)
          else
            setTopAddr(FocusView, TopAddr[FocusView] - $1000, TRUE)
        else
          if FocusView == VIEW_MAINMEMO
            setTopAddr(FocusView, TopAddr[FocusView] - $1000, TRUE)
          else
            setTopAddr(FocusView, TopAddr[FocusView] - incr*$40, TRUE)

      term#KEY_SECTIONDOWN:
        if (ViewLines[FocusView] & MASK_HEXVIEW)
          if FocusView == VIEW_COGMEMO
            setTopAddr(FocusView, TopAddr[FocusView] + $40, TRUE)
          else
            setTopAddr(FocusView, TopAddr[FocusView] + $1000, TRUE)
        else
          if FocusView == VIEW_MAINMEMO
            setTopAddr(FocusView, TopAddr[FocusView] + $1000, TRUE)
          else
            setTopAddr(FocusView, TopAddr[FocusView] + incr*$40, TRUE)

      term#KEY_TOGLVIEWHGH0,term#KEY_TOGLVIEWHGH2:
        if (ViewLines[FocusView] & MASK_VIEWLINES) == VIEW_MAXHEIGHT
          if CurrentViews[VIEW_TOP] == FocusView
            ViewLines[CurrentViews[VIEW_BOTTOM]] := VIEW_BTMMAXHGHT | (ViewLines[CurrentViews[VIEW_BOTTOM]] & MASK_HEXVIEW)
            ViewLines[FocusView] := VIEW_TOPMAXHGHT | (ViewLines[FocusView] & MASK_HEXVIEW)
            if CurrentLine[FocusView] => VIEW_TOPMAXHGHT
              setTopAddr(FocusView, TopAddr[FocusView] + incr*CurrentLine[FocusView] - 1, TRUE)
              CurrentLine[FocusView] := 1
          else
            ViewLines[CurrentViews[VIEW_TOP]] := VIEW_TOPMAXHGHT
            ViewLines[FocusView] := VIEW_BTMMAXHGHT | (ViewLines[FocusView] & MASK_HEXVIEW)
            ViewFirstRow[FocusView] := term#HSPLIT_ROW + 1
            if CurrentLine[FocusView] => VIEW_BTMMAXHGHT
              setTopAddr(FocusView, TopAddr[FocusView] + incr*CurrentLine[FocusView], TRUE)
              CurrentLine[FocusView] := 0
          drawSplitBar
        else
          removeSplitBar
          ViewLines[FocusView] := VIEW_MAXHEIGHT | (ViewLines[FocusView] & MASK_HEXVIEW)
          if CurrentViews[VIEW_TOP] == FocusView
            ViewLines[CurrentViews[VIEW_BOTTOM]] := 0 | (ViewLines[CurrentViews[VIEW_BOTTOM]] & MASK_HEXVIEW)
          else
            ViewLines[CurrentViews[VIEW_TOP]] := 0 | (ViewLines[CurrentViews[VIEW_TOP]] & MASK_HEXVIEW)
            ViewFirstRow[FocusView] := term#FIRST_ROW

      term#KEY_TOGLFOCVIEW0,term#KEY_TOGLFOCVIEW2:
        if (ViewLines[FocusView] & MASK_VIEWLINES) <> VIEW_MAXHEIGHT
          currentView := CurrentViews[VIEW_TOP]
          term.out(term#TV_SETROW)
          term.out(ViewFirstRow[currentView] + (ViewLines[currentView] & MASK_VIEWLINES))
          term.out(term#TV_SETCOL)
          term.out(0)
          term.out(term#TV_SETCOLOR)
          term.out(term#COLOR_TITLE)
          'swap focused view
          if CurrentViews[VIEW_TOP] == FocusView
            FocusView := CurrentViews[VIEW_BOTTOM]
            term.out(FOCUS_BOTTOM)
          else
            FocusView := CurrentViews[VIEW_TOP]
            term.out(FOCUS_TOP)

      term#KEY_TOGLDATVIEW:
        if CurrentViews[VIEW_TOP] <> FocusView
          currentView := CurrentViews[VIEW_BOTTOM]
          if currentView == VIEW_COGMEMO
            CurrentViews[VIEW_BOTTOM] := VIEW_MAINMEMO
          else
            CurrentViews[VIEW_BOTTOM] := VIEW_COGMEMO
          if currentView == FocusView
            FocusView := CurrentViews[VIEW_BOTTOM]
          updateDataViewHeight

      term#KEY_TOGLHEXVIEW:
        if CurrentViews[VIEW_BOTTOM] == FocusView
          ViewLines[FocusView] ^= MASK_HEXVIEW

      term#KEY_TOGLLMMVIEW:
        if CurrentViews[VIEW_TOP] == FocusView
          if CurrentViews[VIEW_TOP] == VIEW_COGDISASM
            CurrentViews[VIEW_TOP] := VIEW_LMMDISASM
          elseif CurrentViews[VIEW_TOP] == VIEW_LMMDISASM
            CurrentViews[VIEW_TOP] := VIEW_COGDISASM
          disasmView := CurrentViews[VIEW_TOP]
          FocusView := disasmView
          updateDisasmView (disasmView)
      
      other:
        next                                            'ignore unused keys

    'show program counter
    term.out(term#TV_HOME)
    term.out(term#TV_SETCOLOR)
    term.out(term#COLOR_TITLE)
    term.hex(PC, 3)
    term.out($20)

    showFlags(flags, oldFlags)
    oldFlags := flags

    'update visible views
    if (FocusView == VIEW_COGDISASM) OR (FocusView == VIEW_LMMDISASM) OR (disasmView <> VIEW_NOTVISIBLE {
}                                   AND (key == term#KEY_STEPINTO OR key == term#KEY_STEPOVER {
}                                        OR key == term#KEY_RETURN OR key == term#KEY_RESUME {
}                                        OR key == term#KEY_TOGLVIEWHGH0 OR key == term#KEY_TOGLVIEWHGH2))
      updateDisasmView(disasmView)
    if CurrentViews[VIEW_TOP] == VIEW_COGMEMO OR CurrentViews[VIEW_BOTTOM] == VIEW_COGMEMO
      updateCogMemoView
    if CurrentViews[VIEW_TOP] == VIEW_MAINMEMO OR CurrentViews[VIEW_BOTTOM] == VIEW_MAINMEMO
      updateMainMemoView


PRI init | i

  instrBrkpnt := MainMemoSize                           'set breakpoint instruction
  MainRomSize := $8000
  if chipver == 1
    MainMemoSize := MainRomSize * 2
  DebugObjAddr := DebugAddr - 16
  DebugParameter &= $FFFF_FFFC                          'allow only long alignment

  removeAllBreakpoints

  FocusView := CurrentViews[VIEW_TOP] := VIEW_COGDISASM
  CurrentViews[VIEW_BOTTOM] := VIEW_COGMEMO
  DebugBeginResAddr := (WORD[DebugObjAddr+4] - WORD[DebugObjAddr+2] * 4) / 4
  DebugBeginVarAddr := TopAddr[VIEW_COGMEMO] := DebugData
  TopAddr[VIEW_MAINMEMO] := DebugParameter
  TopAddr[VIEW_COGMEMO] := $25

  'calculate size of views
  ViewLines[VIEW_COGDISASM]  := VIEW_TOPMAXHGHT
  ViewLines[VIEW_LMMDISASM] := VIEW_TOPMAXHGHT
  ViewLines[VIEW_COGMEMO]    := VIEW_BTMMAXHGHT
  ViewLines[VIEW_MAINMEMO]   := 0

  ViewFirstRow[VIEW_COGDISASM]  := term#FIRST_ROW
  ViewFirstRow[VIEW_LMMDISASM] := term#FIRST_ROW
  ViewFirstRow[VIEW_MAINMEMO]   := ViewFirstRow[VIEW_COGMEMO] := term#HSPLIT_ROW + 1

  PC := 1 'start address to debug code, because at 0 is located a jump to debugger
  TopAddr[VIEW_COGDISASM] := PC - 1
  CurrentLine[VIEW_COGDISASM] := 1

  LMM_PC := LONG[common#LMM_INIT_PC_OFF<<2 + 8] 'start address to LMM debug code (only works after relocate!)
  TopAddr[VIEW_LMMDISASM] := LMM_PC
  CurrentLine[VIEW_LMMDISASM] := 0


PRI updateDisasmView(view) | addr, row, incr

  if (ViewLines[view] & MASK_VIEWLINES) > 0
    row := ViewFirstRow[view]
    if (view == VIEW_COGDISASM)
      incr := 1
    elseif (view == VIEW_LMMDISASM)
      incr := 4
      disasm.ResetNext
    repeat addr from TopAddr[view] {
}                 to TopAddr[view] + incr*(ViewLines[view] & MASK_VIEWLINES) - 1 step incr
      term.out(term#TV_SETROW)
      term.out(row++)
      showInstructionRow(addr, view)


PRI updateCogMemoView | addr, row, i

  if (ViewLines[VIEW_COGMEMO] & MASK_VIEWLINES) > 0
    row := ViewFirstRow[VIEW_COGMEMO]
    if (ViewLines[VIEW_COGMEMO] & MASK_HEXVIEW)
      i := 0
      repeat addr from TopAddr[VIEW_COGMEMO] {
}                   to TopAddr[VIEW_COGMEMO] + VIEW_COGHEXROW * (ViewLines[VIEW_COGMEMO] & MASK_VIEWLINES) - 1
        if (i // VIEW_COGHEXROW) == 0
          term.out(term#TV_SETROW)
          term.out(row++)
        showCogMemoryHexRow(addr, i++ // VIEW_COGHEXROW)
    else
      repeat addr from TopAddr[VIEW_COGMEMO] {
}                   to TopAddr[VIEW_COGMEMO] + (ViewLines[VIEW_COGMEMO] & MASK_VIEWLINES) - 1
        term.out(term#TV_SETROW)
        term.out(row++)
        showCogMemoryRow(addr)


PRI updateMainMemoView | addr, row, i

  if (ViewLines[VIEW_MAINMEMO] & MASK_VIEWLINES) > 0
    row := ViewFirstRow[VIEW_MAINMEMO]
    if (ViewLines[VIEW_MAINMEMO] & MASK_HEXVIEW)
      i := 0
      repeat addr from TopAddr[VIEW_MAINMEMO] {
}                   to TopAddr[VIEW_MAINMEMO] + VIEW_MAINHEXROW * (ViewLines[VIEW_MAINMEMO] & MASK_VIEWLINES) - 1 {
}                 step 4
        if (i // VIEW_MAINHEXROW) == 0
          term.out(term#TV_SETROW)
          term.out(row++)
        showMainMemoryHexRow(addr, i // VIEW_MAINHEXROW)
        i += 4
    else
      repeat addr from TopAddr[VIEW_MAINMEMO] {
}                   to TopAddr[VIEW_MAINMEMO] + 4 * (ViewLines[VIEW_MAINMEMO] & MASK_VIEWLINES) - 1 {
}                 step 4
        term.out(term#TV_SETROW)
        term.out(row++)
        showMainMemoryRow(addr)

PRI ShowDebugVal(pos, val)

  term.out(term#TV_SETROW)
  term.out(0)
  term.out(term#TV_SETCOL)
  term.out(20+pos*9)
  term.hex(val, 8)

PRI showInstructionRow(addr, view) | instr, isBrkpnt, incr, LMM

  isBrkpnt := isBreakpoint(addr, view)

  if (view == VIEW_COGDISASM)
    LMM := FALSE
    incr := 1
  else
    LMM := TRUE
    incr := 4

  term.out(term#TV_SETCOL)
  term.out(0)
  if addr == TopAddr[view] + CurrentLine[view]*incr
    term.out(term#TV_SETCOLOR)
    if isBrkpnt
      term.out(term#COLOR_CURBRKPNT)
    else
      term.out(term#COLOR_CURRENT)
  else
    term.out(term#TV_SETCOLOR)
    if isBrkpnt
      term.out(term#COLOR_BRKPNT)
    else
      term.out(term#COLOR_NORMAL)

  repeat term#SCR_WIDTH - 1
    term.out($20)

  if (view == VIEW_LMMDISASM) AND disasm.NextIsData
    term.out(term#TV_SETCOL)
    term.out(0)
    term.hex(addr, 4)
    term.str(string("      long    $"))
    term.hex(getMainData(addr), 8)
  else
    if (view == VIEW_COGDISASM)
      instr := getCogData(addr)
    else
      instr := getMainData(addr)
    disasm.decode(instr)

    term.out(term#TV_SETCOL)
    term.out(0)
    if (view == VIEW_COGDISASM)
       term.hex(addr, 3)
    else
       term.hex(addr, 4)
    term.out($20)
    if (view == VIEW_COGDISASM) and (addr => $02) and (addr =< $24) 
      term.str(disasm.getLMMOpName(addr))
      term.out($20)
    term.str(disasm.getConditionStr)
    term.str(string(term#TV_SETCOL, 10))
    term.str(disasm.getInstructionStr)
    term.str(string(term#TV_SETCOL, 18))
    term.str(disasm.getDestSrcStr(LMM))
    term.str(string(term#TV_SETCOL, 29))
    term.str(disasm.getEffectStr)


PRI showCogMemoryRow(addr) | data

  clearRow(FocusView == VIEW_COGMEMO AND addr == (TopAddr[VIEW_COGMEMO] + CurrentLine[VIEW_COGMEMO]))
  printData(addr, TRUE)


PRI showCogMemoryHexRow(addr, idx) | data

  data := getCogData(addr)

  if idx == 0
    clearRow(FocusView == VIEW_COGMEMO AND addr == (TopAddr[VIEW_COGMEMO] + CurrentLine[VIEW_COGMEMO]))
    term.hex(addr, 3)

  printHexData(data, idx, VIEW_COGMEMO)


PRI showMainMemoryRow(addr) | data

  clearRow(FocusView == VIEW_MAINMEMO AND addr == (TopAddr[VIEW_MAINMEMO] + CurrentLine[VIEW_MAINMEMO]))
  printData(addr, FALSE)


PRI showMainMemoryHexRow(addr, idx) | data

  data := getMainData(addr)

  if idx == 0
    clearRow(FocusView == VIEW_MAINMEMO AND addr == (TopAddr[VIEW_MAINMEMO] + CurrentLine[VIEW_MAINMEMO]))
    term.hex(addr, 4)

  printHexData(data, idx, VIEW_MAINMEMO)


PRI clearRow(currentRow)

  term.out(term#TV_SETCOL)
  term.out(0)

  if currentRow
    term.out(term#TV_SETCOLOR)
    term.out(term#COLOR_CURRENT)
  else
    term.out(term#TV_SETCOLOR)
    term.out(term#COLOR_NORMAL)

  repeat term#SCR_WIDTH - 1
    term.out($20)

  term.out(term#TV_SETCOL)
  term.out(0)


PRI printData(addr, showCogMem) | type, data

  type := disasm#TYPE_LONG

  if showCogMem
    data := getCogData(addr)
    term.hex(addr, 3)
    term.out($20)
    if addr < 2
      term.str(@DebugEntryLabel + addr * 6)

    if addr == DebugBeginVarAddr
      term.str(@DataLabel)

    if addr == DebugBeginResAddr
      term.str(@UninitDataLabel)

    if (addr => common#LMM_FIRST_REG_OFF) and (addr =< common#LMM_LAST_REG_OFF) 
      term.str(disasm.getLMMRegName(addr))


    if addr => $1F0
      term.str(@SpecPurpRegLabel + (addr - $1F0) * 5)

  else
    data := getMainData(addr)
    term.hex(addr, 4)
    term.out($20)

  term.str(string(term#TV_SETCOL, 10))
  term.str(lookupz(type : @TypeByte, @TypeWord, 0, @TypeLong))
  term.str(string(term#TV_SETCOL, 18))
  term.out("$")
  term.hex(data, 8)
  term.str(string(term#TV_SETCOL, 29))
  term.out("'")
  if type <> disasm#TYPE_LONG
    term.dec(data)

  term.str(string(term#TV_SETCOL, 35))
  term.str(disasm.getPrintableStr(data, type))


PRI printHexData(data, idx, view)

  if view == VIEW_COGMEMO
    term.out(term#TV_SETCOL)
    term.out(22 + idx * 4)
    term.str(disasm.getPrintableStr(data, disasm#TYPE_LONG))
    case idx
      0:
        term.out(term#TV_SETCOL)
        term.out(4)
        term.hex(data, 2)
        term.hex(data >>= 8, 2)
        term.hex(data >>= 8, 2)
        term.hex(data >>= 8, 2)

      1:
        term.out(term#TV_SETCOL)
        term.out(5 + idx * 8)
        term.hex(data, 2)
        term.hex(data >>= 8, 2)
        term.hex(data >>= 8, 2)
        term.hex(data >>= 8, 2)

  elseif view == VIEW_MAINMEMO
    term.out(term#TV_SETCOL)
    term.out(30 + idx)
    term.str(disasm.getPrintableStr(data, disasm#TYPE_LONG))
    case idx
      0:
        term.out(term#TV_SETCOL)
        term.out(5)
        term.hex(data, 2)
        term.out(" ")
        term.hex(data >>= 8, 2)
        term.out(" ")
        term.hex(data >>= 8, 2)
        term.out(" ")
        term.hex(data >>= 8, 2)

      4:
        term.out(term#TV_SETCOL)
        term.out(6 + idx * 3)
        term.hex(data, 2)
        term.out(" ")
        term.hex(data >>= 8, 2)
        term.out(" ")
        term.hex(data >>= 8, 2)
        term.out(" ")
        term.hex(data >>= 8, 2)


PRI setTopAddr(view, diff, isAddr) | maxLines, incr

  if (view == VIEW_LMMDISASM)
    incr := 4
  else
    incr := 1

  if isAddr
    TopAddr[view] := diff
  else
    CurrentLine[view] += diff
    maxLines := (ViewLines[view] & MASK_VIEWLINES)
    if (ViewLines[view] & MASK_HEXVIEW)
      if view == VIEW_COGMEMO
        maxLines *= VIEW_COGHEXROW
      else
        maxLines *= VIEW_MAINHEXROW
    else
      if view == VIEW_MAINMEMO
        maxLines *= (VIEW_MAINHEXROW / 2)

    if CurrentLine[view] < 0
      TopAddr[view] -= ||CurrentLine[view]*incr
      CurrentLine[view] := 0
    elseif CurrentLine[view] => maxLines
      maxLines -= ||diff
      TopAddr[view] += (CurrentLine[view] - maxLines)*incr
      CurrentLine[view] := maxLines

  case view
    VIEW_COGDISASM:
      if TopAddr[VIEW_COGDISASM] < 0
        TopAddr[VIEW_COGDISASM] := 0
      if (TopAddr[VIEW_COGDISASM] + (ViewLines[VIEW_COGDISASM] & MASK_VIEWLINES)) => $1F0
        TopAddr[VIEW_COGDISASM] := $1F0 - (ViewLines[VIEW_COGDISASM] & MASK_VIEWLINES)

    VIEW_LMMDISASM:
      if TopAddr[VIEW_LMMDISASM] < 0
        TopAddr[VIEW_LMMDISASM] := 0
      if (TopAddr[VIEW_LMMDISASM] + (ViewLines[VIEW_LMMDISASM] & MASK_VIEWLINES)) => $7FFC
        TopAddr[VIEW_LMMDISASM] := $7FFC - 4*(ViewLines[VIEW_LMMDISASM] & MASK_VIEWLINES)

    VIEW_COGMEMO:
      if TopAddr[VIEW_COGMEMO] < 0
        TopAddr[VIEW_COGMEMO] := 0
      if (ViewLines[VIEW_COGMEMO] & MASK_HEXVIEW)
        if (TopAddr[VIEW_COGMEMO] + VIEW_COGHEXROW * (ViewLines[VIEW_COGMEMO] & MASK_VIEWLINES)) => $200
          TopAddr[VIEW_COGMEMO] := $200 - VIEW_COGHEXROW * (ViewLines[VIEW_COGMEMO] & MASK_VIEWLINES)
      else
        if (TopAddr[VIEW_COGMEMO] + (ViewLines[VIEW_COGMEMO] & MASK_VIEWLINES)) => $200
          TopAddr[VIEW_COGMEMO] := $200 - (ViewLines[VIEW_COGMEMO] & MASK_VIEWLINES)

    VIEW_MAINMEMO:
      if TopAddr[VIEW_MAINMEMO] < 0
        TopAddr[VIEW_MAINMEMO] := 0
      if (ViewLines[VIEW_MAINMEMO] & MASK_HEXVIEW)
        if (TopAddr[VIEW_MAINMEMO] + VIEW_MAINHEXROW * (ViewLines[VIEW_MAINMEMO] & MASK_VIEWLINES)) => MainMemoSize
          TopAddr[VIEW_MAINMEMO] := MainMemoSize - VIEW_MAINHEXROW * (ViewLines[VIEW_MAINMEMO])
      else
        if (TopAddr[VIEW_MAINMEMO] + 4 *(ViewLines[VIEW_MAINMEMO] & MASK_VIEWLINES)) => MainMemoSize
          TopAddr[VIEW_MAINMEMO] := MainMemoSize - 4 * (ViewLines[VIEW_MAINMEMO])


PRI drawSplitBar | topView

  topView := CurrentViews[VIEW_TOP]
  term.out(term#TV_SETROW)
  term.out(ViewFirstRow[topView] + (ViewLines[topView] & MASK_VIEWLINES))
  term.out(term#TV_SETCOL)
  term.out(0)
  term.out(term#TV_SETCOLOR)
  term.out(term#COLOR_TITLE)

  if CurrentViews[VIEW_TOP] == FocusView
    term.out(FOCUS_TOP)
  else
    term.out(FOCUS_BOTTOM)

  repeat term#SCR_WIDTH - 1
    term.out(term#HSPLIT_CHAR)


PRI removeSplitBar | topView

  topView := CurrentViews[VIEW_TOP]
  term.out(term#TV_SETROW)
  term.out(ViewFirstRow[topView] + (ViewLines[topView] & MASK_VIEWLINES))
  term.out(term#TV_SETCOL)
  term.out(0)
  term.out(term#TV_SETCOLOR)
  term.out(term#COLOR_NORMAL)
  repeat term#SCR_WIDTH
    term.out($20)


PRI updateDataViewHeight

  if CurrentViews[VIEW_BOTTOM] == VIEW_COGMEMO
    ViewLines[VIEW_COGMEMO] := (ViewLines[VIEW_MAINMEMO] & MASK_VIEWLINES) | (ViewLines[VIEW_COGMEMO] & MASK_HEXVIEW)
    ViewLines[VIEW_MAINMEMO] := 0 | (ViewLines[VIEW_MAINMEMO] & MASK_HEXVIEW)
  else
    ViewLines[VIEW_MAINMEMO] := (ViewLines[VIEW_COGMEMO] & MASK_VIEWLINES) | (ViewLines[VIEW_MAINMEMO] & MASK_HEXVIEW)
    ViewLines[VIEW_COGMEMO] := 0 | (ViewLines[VIEW_COGMEMO] & MASK_HEXVIEW)

  if CurrentViews[VIEW_BOTTOM] == FocusView AND (ViewLines[FocusView] & MASK_VIEWLINES) == VIEW_MAXHEIGHT
    ViewFirstRow[FocusView] := term#FIRST_ROW
  else
    ViewFirstRow[FocusView] := term#HSPLIT_ROW + 1


PRI showFlags(flags, oldFlags)

  term.out(term#TV_SETCOLOR)
  term.out(term#COLOR_FLAG)
  if (flags & disasm#FLAG_Z) <> disasm#FLAG_Z
    if (flags & disasm#FLAG_Z) <> (oldFlags & disasm#FLAG_Z)
      term.out(term#TV_SETCOLOR)
      term.out(term#COLOR_FLAGCHG)
    term.str(@FlagNot)
  else
    if (flags & disasm#FLAG_Z) <> (oldFlags & disasm#FLAG_Z)
      term.out(term#TV_SETCOLOR)
      term.out(term#COLOR_FLAGCHG)
    term.out($20)
  term.str(@FlagZ)

  term.out(term#TV_SETCOLOR)
  term.out(term#COLOR_FLAG)
  term.out($20)
  if (flags & disasm#FLAG_C) <> disasm#FLAG_C
    if (flags & disasm#FLAG_C) <> (oldFlags & disasm#FLAG_C)
      term.out(term#TV_SETCOLOR)
      term.out(term#COLOR_FLAGCHG)
    term.str(@FlagNot)
  else
    if (flags & disasm#FLAG_C) <> (oldFlags & disasm#FLAG_C)
      term.out(term#TV_SETCOLOR)
      term.out(term#COLOR_FLAGCHG)
    term.out($20)
  term.str(@FlagC)


PRI removeAllBreakpoints | i

  BreakpointIdx := 1
  repeat i from 0 to MAX_BREAKPOINTS - 1
    WORD[@Breakpoint][i] := EMPTY_BRKPNT
    LONG[@BreakpointInstr][i] := 0

  LMM_BreakpointIdx := 1
  repeat i from 0 to MAX_BREAKPOINTS - 1
    WORD[@LMM_Breakpoint][i] := EMPTY_BRKPNT
    LONG[@LMM_BreakpointInstr][i] := 0


PRI removeBreakpoint(brkpnt, view) | i, idx

  idx := existBreakpoint(brkpnt, view)
  if (view == VIEW_COGDISASM)
    if idx
      if idx + 1 < BreakpointIdx
        repeat i from idx + 1 to BreakpointIdx - 1
          WORD[@Breakpoint][i - 1] := WORD[@Breakpoint][i]
          LONG[@BreakpointInstr][i - 1] := LONG[@BreakpointInstr][i]

      BreakpointIdx--
      WORD[@Breakpoint][BreakpointIdx] := EMPTY_BRKPNT
      LONG[@BreakpointInstr][BreakpointIdx] := 0

  elseif (view == VIEW_LMMDISASM)
    if idx
      if idx + 1 < LMM_BreakpointIdx
        repeat i from idx + 1 to LMM_BreakpointIdx - 1
          WORD[@LMM_Breakpoint][i - 1] := WORD[@LMM_Breakpoint][i]
          LONG[@LMM_BreakpointInstr][i - 1] := LONG[@LMM_BreakpointInstr][i]

      LMM_BreakpointIdx--
      WORD[@LMM_Breakpoint][LMM_BreakpointIdx] := EMPTY_BRKPNT
      LONG[@LMM_BreakpointInstr][LMM_BreakpointIdx] := 0


PRI existBreakpoint(brkpnt, view) : idx | i, addr

  if (view == VIEW_COGDISASM)
    if BreakpointIdx > 1
      repeat i from 1 to BreakpointIdx - 1
        addr := WORD[@Breakpoint][i]
        if addr == brkpnt
          return i
  elseif (view == VIEW_LMMDISASM)
    if LMM_BreakpointIdx > 1
      repeat i from 1 to LMM_BreakpointIdx - 1
        addr := WORD[@LMM_Breakpoint][i]
        if addr == brkpnt
          return i

  return 0


PRI prepareBreakpoints(isSingleStep, view) | i, firstIdx

  if isSingleStep and (view == VIEW_COGDISASM)
    firstIdx := 0
  else
    firstIdx := 1

  repeat i from firstIdx to BreakpointIdx - 1
    DebugAddr := WORD[@Breakpoint][i]
    if DebugAddr == PC
      next
    if DebugAddr == EMPTY_BRKPNT
      quit
    if isSingleStep AND i > 0 AND WORD[@Breakpoint] == DebugAddr
      next

    DebugData := InstrBrkpnt
    DebugCmd  := asmdbg#CMD_WRCOGDATA
    repeat until DebugCmd == 0

  if isSingleStep and (view == VIEW_LMMDISASM)
    firstIdx := 0
  else
    firstIdx := 1

  repeat i from firstIdx to LMM_BreakpointIdx - 1
    DebugAddr := WORD[@LMM_Breakpoint][i]
    if DebugAddr == LMM_PC
      next
    if DebugAddr == EMPTY_BRKPNT
      quit
    if isSingleStep AND i > 0 AND WORD[@LMM_Breakpoint] == DebugAddr
      next

    DebugData := InstrBrkpnt
    DebugCmd  := asmdbg#CMD_WRMAINDATA
    repeat until DebugCmd == 0    


PRI restoreBreakpoints(isSingleStep, view) | i, firstIdx, LMMInstr, LMMAddr

  LMMInstr := 0
  
  if isSingleStep and (view == VIEW_COGDISASM)
    firstIdx := 0
  else
    firstIdx := 1

  repeat i from firstIdx to BreakpointIdx - 1
    DebugAddr := WORD[@Breakpoint][i]
      
    if isSingleStep AND i > 0 AND WORD[@Breakpoint] == DebugAddr
      next

    DebugData := LONG[@BreakpointInstr][i]
    DebugCmd  := asmdbg#CMD_WRCOGDATA
    repeat until DebugCmd == 0

  if isSingleStep and (view == VIEW_LMMDISASM)
    firstIdx := 0
  else
    firstIdx := 1

  LMMAddr := getCogData(common#LMM_PC_OFF) - 4
  repeat i from firstIdx to LMM_BreakpointIdx - 1
    DebugAddr := WORD[@LMM_Breakpoint][i]

    if DebugAddr == LMMAddr
       LMMInstr := LONG[@LMM_BreakpointInstr][i]
         
    if isSingleStep AND i > 0 AND WORD[@LMM_Breakpoint] == DebugAddr
      next

    DebugData := LONG[@LMM_BreakpointInstr][i]
    DebugCmd  := asmdbg#CMD_WRMAINDATA
    repeat until DebugCmd == 0

    
  if LMMInstr <> 0
    ' fix LMM_loop, which will have loaded the break instr - fix all 4 locations
    DebugData := LMMInstr
    
    DebugAddr := common#LMM_1_OFF 
    DebugCmd  := asmdbg#CMD_WRCOGDATA
    repeat until DebugCmd == 0
    
    DebugAddr := common#LMM_2_OFF 
    DebugCmd  := asmdbg#CMD_WRCOGDATA
    repeat until DebugCmd == 0
    
    DebugAddr := common#LMM_3_OFF 
    DebugCmd  := asmdbg#CMD_WRCOGDATA
    repeat until DebugCmd == 0
    
    DebugAddr := common#LMM_4_OFF 
    DebugCmd  := asmdbg#CMD_WRCOGDATA
    repeat until DebugCmd == 0


PRI setBreakpoint(addr, currentBrkpnt, view) : ok | originalInstr

  ok := TRUE

  if (view == VIEW_COGDISASM)
    if !currentBrkpnt AND BreakpointIdx == MAX_BREAKPOINTS
      return FALSE

    originalInstr := getCogData(addr)

    if currentBrkpnt
      WORD[@Breakpoint] := addr
      LONG[@BreakpointInstr] := originalInstr
    else
      WORD[@Breakpoint][BreakpointIdx] := addr
      LONG[@BreakpointInstr][BreakpointIdx] := originalInstr
      BreakpointIdx++

  elseif (view == VIEW_LMMDISASM)
    if !currentBrkpnt AND LMM_BreakpointIdx == MAX_BREAKPOINTS
      return FALSE

    originalInstr := getMainData(addr)

    if currentBrkpnt
      WORD[@LMM_Breakpoint] := addr
      LONG[@LMM_BreakpointInstr] := originalInstr
    else
      WORD[@LMM_Breakpoint][LMM_BreakpointIdx] := addr
      LONG[@LMM_BreakpointInstr][LMM_BreakpointIdx] := originalInstr
      LMM_BreakpointIdx++

PRI isBreakpoint(addr, view) | i

  Result := FALSE
  if (view == VIEW_COGDISASM)
    if BreakpointIdx > 1
      repeat i from 1 to BreakpointIdx - 1
        if WORD[@Breakpoint][i] == addr
          return TRUE
  elseif (view == VIEW_LMMDISASM)
    if LMM_BreakpointIdx > 1
      repeat i from 1 to LMM_BreakpointIdx - 1
        if WORD[@LMM_Breakpoint][i] == addr
          return TRUE


PRI getCogData(addr) : data

  DebugAddr := addr
  DebugCmd  := asmdbg#CMD_RDCOGDATA
  repeat until DebugCmd == 0

  data := DebugData


PRI setCogData(addr, value)

  DebugAddr := addr
  DebugData := value
  DebugCmd  := asmdbg#CMD_WRCOGDATA
  repeat until DebugCmd == 0


PRI getMainData(addr) : data

  DebugAddr := addr
  DebugCmd  := asmdbg#CMD_RDMAINDATA
  repeat until DebugCmd == 0

  data := DebugData


PRI setMainData(addr, value)

  DebugAddr := addr
  DebugData := value
  DebugCmd  := asmdbg#CMD_WRMAINDATA
  repeat until DebugCmd == 0


PRI getFlags : flags

  DebugCmd  := asmdbg#CMD_RDFLAGS
  repeat until DebugCmd == 0

  if (DebugData & asmdbg#FLAG_NZ) == 0
    flags |= Disasm#FLAG_Z

  if (DebugData & asmdbg#FLAG_C)
    flags |= Disasm#FLAG_C


PRI singleStep(addr, view) : brkpnt

  brkpnt := runInRealtime(addr, TRUE, view)


PRI run(addr, view) : brkpnt

  brkpnt := runInRealtime(addr, FALSE, view)


PRI runInRealtime(addr, isSingleStep, view) : brkpnt | i, key, w

  prepareBreakpoints(isSingleStep, view)

  term.out(term#TV_HOME)
  term.out(term#TV_SETCOLOR)
  term.out(term#COLOR_TITLE)
  i := 0
  w := 0


  DebugCmd  := addr - AddrCmdTable
  repeat until DebugCmd == 0
    w //= 50
    if w++ == 0
      term.out(term#TV_SETCOL)
      term.out(0)
      term.out(BYTE[@WaitAnim][i++])
      i //= 4
    key := term.key
    if key == term#KEY_ESCAPE
      return -1

  brkpnt := DebugData - 1
    
  restoreBreakpoints(isSingleStep, view)


DAT

Version                 byte    term#TV_SETCOL,10,"POD Version 1.2 (C) 2007",0
Title                   byte    term#TV_SETCOL,10,"Propeller On-chip Debugger",0
NoKeyboard              byte    "NO KEYBOARD FOUND",0
WaitAnim                byte    "|/-\"
FlagC                   byte    "C",0
FlagZ                   byte    "Z",0
FlagNot                 byte    "N",0
TypeByte                byte    "byte",0
TypeWord                byte    "word",0
TypeLong                byte    "long",0
SpecPurpRegLabel        byte    "PAR ",0
                        byte    "CNT ",0
                        byte    "INA ",0
                        byte    "INB ",0
                        byte    "OUTA",0
                        byte    "OUTB",0
                        byte    "DIRA",0
                        byte    "DIRB",0
                        byte    "CTRA",0
                        byte    "CTRB",0
                        byte    "FRQA",0
                        byte    "FRQB",0
                        byte    "PHSA",0
                        byte    "PHSB",0
                        byte    "VCFG",0
                        byte    "VSCL",0
DebugEntryLabel         byte    "debug",0
EntryLabel              byte    "entry",0
UninitDataLabel         byte    "u"
DataLabel               byte    "data",0

InstrBrkpnt             jmpret  0-0,#0-0                'instruction used as breakpoint
'
