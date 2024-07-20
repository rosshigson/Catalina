-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 2.0                                   --
--                                                                           --
--                   Copyright (C) 2003 Ross Higson                          --
--                                                                           --
-- The Ada Terminal Emulator package is free software; you can redistribute  --
-- it and/or modify it under the terms of the GNU General Public License as  --
-- published by the Free Software Foundation; either version 2 of the        --
-- License, or (at your option) any later version.                           --
--                                                                           --
-- The Ada Terminal Emulator package is distributed in the hope that it will --
-- be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General --
-- Public License for more details.                                          --
--                                                                           --
-- You should have received a copy of the GNU General Public License along   --
-- with the Ada Terminal Emulator package - see file COPYING; if not, write  --
-- to the Free Software Foundation, Inc., 59 Temple Place - Suite 330,       --
-- Boston, MA  02111-1307, USA.                                              --
-------------------------------------------------------------------------------

with System;
with MIT_Defs;
with MIT_Parser;

package Ansi_Parser is

   MAX_ARGUMENTS : constant := MIT_Defs.VTARGS;
   MAX_RESULTS   : constant := 16;


   subtype Parser_Mode is MIT_Defs.PA_INT;

   -- parser modes

   VT52   : constant := MIT_Defs.Mode_VT52;
   VT100  : constant := MIT_Defs.Mode_VT100;
   VT420  : constant := MIT_Defs.Mode_VT420;
   VT7BIT : constant := MIT_Defs.Mode_VT7BIT;
   VT8BIT : constant := MIT_Defs.Mode_VT8BIT;

   -- 7 bit ANSI control sequences

   IND_7BIT : constant String := ASCII.ESC & "D";
   NEL_7BIT : constant String := ASCII.ESC & "E";
   HTS_7BIT : constant String := ASCII.ESC & "H";
   RI_7BIT  : constant String := ASCII.ESC & "M";
   SS2_7BIT : constant String := ASCII.ESC & "N";
   SS3_7BIT : constant String := ASCII.ESC & "O";
   DCS_7BIT : constant String := ASCII.ESC & "P";
   SOS_7BIT : constant String := ASCII.ESC & "X";
   CSI_7BIT : constant String := ASCII.ESC & "[";
   ST_7BIT  : constant String := ASCII.ESC & "\";
   OSC_7BIT : constant String := ASCII.ESC & "]";
   PM_7BIT  : constant String := ASCII.ESC & "^";
   APC_7BIT : constant String := ASCII.ESC & "_";

   -- 8 bit ANSI control sequences

   IND_8BIT : constant String (1 .. 1) := (1 => Character'Val (Character'Pos ('D') + 16#40#));
   NEL_8BIT : constant String (1 .. 1) := (1 => Character'Val (Character'Pos ('E') + 16#40#));
   HTS_8BIT : constant String (1 .. 1) := (1 => Character'Val (Character'Pos ('H') + 16#40#));
   RI_8BIT  : constant String (1 .. 1) := (1 => Character'Val (Character'Pos ('M') + 16#40#));
   SS2_8BIT : constant String (1 .. 1) := (1 => Character'Val (Character'Pos ('N') + 16#40#));
   SS3_8BIT : constant String (1 .. 1) := (1 => Character'Val (Character'Pos ('O') + 16#40#));
   DCS_8BIT : constant String (1 .. 1) := (1 => Character'Val (Character'Pos ('P') + 16#40#));
   SOS_8BIT : constant String (1 .. 1) := (1 => Character'Val (Character'Pos ('X') + 16#40#));
   CSI_8BIT : constant String (1 .. 1) := (1 => Character'Val (Character'Pos ('[') + 16#40#));
   ST_8BIT  : constant String (1 .. 1) := (1 => Character'Val (Character'Pos ('\') + 16#40#));
   OSC_8BIT : constant String (1 .. 1) := (1 => Character'Val (Character'Pos (']') + 16#40#));
   PM_8BIT  : constant String (1 .. 1) := (1 => Character'Val (Character'Pos ('^') + 16#40#));
   APC_8BIT : constant String (1 .. 1) := (1 => Character'Val (Character'Pos ('_') + 16#40#));


   -- Attribute values for SGR

   ATTR_RESET      : constant := 0;   -- 0x0000
   ATTR_BOLD       : constant := 1;   -- 0x0001
   ATTR_UNDER      : constant := 2;   -- 0x0002 UNDERLINE
   ATTR_BLINK      : constant := 4;   -- 0x0004
   ATTR_NEG        : constant := 8;   -- 0x0008 NEGITIVE
   ATTR_INV        : constant := 16;  -- 0x0010 INVISIBLE
   ATTR_NOT        : constant := 128; -- 0x0080
   ATTR_ALL        : constant := 31;  -- 0x001F
   ATTR_NONE       : constant := 0;   -- 0x0000

   -- parser codes (note: an asterisk means the code is interpreted by the emulator)

   DO_ECHO         : constant := 0;   -- * echo character
   DO_IGNORE       : constant := 1;   -- * parser consumed character
   DO_ERROR        : constant := 2;   -- * parser error
                                      --
   DO_ENQ          : constant := 601; -- * Enquiry
   DO_BEL          : constant := 602; -- * Bell
   DO_LS0          : constant := 603; -- * Lock shift G0. G0 --> GL
   DO_LS1          : constant := 604; -- * Lock shift G1. G1 --> GL
   DO_LS1R         : constant := 605; -- * Lock shift G1 right. G1 --> GR
   DO_LS2          : constant := 606; -- * Lock shift G2. G2 --> GL
   DO_LS2R         : constant := 607; -- * Lock shift G2 right. G2 --> GR
   DO_LS3          : constant := 608; -- * Lock shift G3. G3 --> GL
   DO_LS3R         : constant := 609; -- * Lock shift G3 right. G3 --> GR
   DO_SS2          : constant := 610; -- * Single shift G2. G2 --> GL for next graphic char
   DO_SS3          : constant := 611; -- * Single shift G3. G3 --> GL for next graphic char
   DO_SCS          : constant := 612; -- * Select character set.
                                      --    Args[0]: n, where Gn is G0-G4
                                      --    Args[1]: either CS_96 or CS_94: char set length
                                      --    Args[2]: final char (see CS_xx in vt_const.h for the
                                      --       final chars for the standard hard char sets)
                                      --    Args[3]: encoded intermediate chars.  Formula:
                                      --       Args[3] = #_of_intermediates * 0x0100 +
                                      --                 (intermediate_#_1 - ' ') * 0x0010 +
                                      --                 (intermediate_#_2 - ' ')
                                      --     NOTE: You do NOT need to decode this argument
                                      --     since the parser is always using the same encoding
                                      --     in all functions
   DO_XON          : constant := 613; -- *
   DO_XOFF         : constant := 614; -- *
   DO_KAM          : constant := 615; -- * Keyboard Lock.  SET: locked; RESET: Unlocked
   DO_IRM          : constant := 616; -- * Insert Mode.  SET: Insert mode; RESET: Replace
   DO_SRM          : constant := 617; -- * Local echo.  SET: OFF; RESET: ON
   DO_LNM          : constant := 618; -- * LF/New Line mode.
                                      --    SET: Received LF, FF, or VT cause New Line action,
                                      --      and pressed [Enter] or [Return] sends CR LF;
                                      --    RESET: Received LF, FF, or VT cause cursor moving
                                      --      to the next line on the same column, and pressed
                                      --      [Enter] or [Return] sends CR
   DO_DECCKM       : constant := 619; -- * Cursor key mode: SET: Application Mode;
                                      --                    RESET: Cursor Mode
   DO_DECCOLM      : constant := 620; -- * Columns: SET: 132 Columns; RESET: 80 columns
   DO_DECSCLM      : constant := 621; -- * Scrolling. SET: Smooth scrolling;
                                      --              RESET: Jump scrolling
   DO_DECSCNM      : constant := 622; -- * Reverse Screen.  SET: Reverse Screen;
                                      --                    RESET: Normal Screen
   DO_DECOM        : constant := 623; -- * Origin.  SET: Origin Mode; RESET: Absolute Mode
   DO_DECAWM       : constant := 624; -- * Auto wrap mode.  SET: ON; RESET: OFF
   DO_DECARM       : constant := 625; -- * Auto repeat mode.  SET: ON; RESET: OFF
   DO_DECPFF       : constant := 626; -- * Print FF mode.  SET: ON; RESET: OFF
   DO_DECPEX       : constant := 627; -- * Print extent mode. SET: Full Screen
                                      --                    RESET: Scrolling region
   DO_DECTCEM      : constant := 628; -- * Text cursor.  SET: ON; RESET: OFF
   DO_DECNKM       : constant := 629; -- * Keypad Mode: SET: Application; RESET: Numeric
   DO_DECNRCM      : constant := 630; -- * Char Set. SET: National; RESET: Multinational
   DO_GRM          : constant := 631; -- * Char Set. SET: Use Special Graphics character set;
                                      --             RESET: Use Standard ASCII character set
   DO_CRM          : constant := 632; -- * Control Codes. SET: Act upon;
                                      --                  RESET: Debug display
   DO_HEM          : constant := 633; -- Horizontal Editing.  SET: ON; RESET: OFF
   DO_DECINLM      : constant := 634; -- * Interlace.  SET: ON; RESET: OFF
   DO_DECKBUM      : constant := 635; -- * Typewriter mode. SET: Data process;
                                      -- *                  RESET: typewriter
   DO_DECVSSM      : constant := 636; -- * Vertical split screen mode. SET: ON; RESET: OFF
   DO_DECSASD      : constant := 637; -- Select active status display. SET: Status Line
                                      --                               RESET: Main Display
   DO_DECBKM       : constant := 638; -- * Backarrow mode.
                                      --    SET: backarrow is backspace and sends BS;
                                      --    RESET: backarrow is delete and sends DEL
   DO_DECKPM       : constant := 639; -- Key position mode.
                                      --  SET: send key position reports;
                                      --  RESET: send character codes
   DO_DECARSM      : constant := 640; -- Auto-resize mode. SET: on; RESET: off
                                      --
   DO_CUU          : constant := 650; -- * Cursor UP  Args[0]: lines
   DO_CUD          : constant := 651; -- * Cursor DOWN  Args[0]: lines
   DO_CUF          : constant := 652; -- * Cursor right  Args[0]: columns
   DO_CUB          : constant := 653; -- * Cursor left  Args[0]: columns
   DO_CUP          : constant := 654; -- * Cursor move  Args[0]: line#  Args[1]: column#
   DO_IND          : constant := 655; -- * Index. Move cursor down. Possible scroll up
   DO_RI           : constant := 656; -- * Reverse index. Possible scroll down
   DO_NEL          : constant := 657; -- * New Line. Move cursor 1st position on next line.
                                      --      Possible scroll up
   DO_HOME         : constant := 658; -- * Move Cursor to home
   DO_UP           : constant := 659; -- * Move up (no scrolling)
   DO_DOWN         : constant := 660; -- * Move down (no scrolling)
   DO_LEFT         : constant := 661; -- * Move left (or stay at the margin )
   DO_RIGHT        : constant := 662; -- * Move right (or stay at the margin )
   DO_DECI         : constant := 663; -- * Index.  SET: Forward index; RESET: Back index
   DO_SD           : constant := 664; -- * Pan down Args[0] lines
   DO_SU           : constant := 665; -- * Pan up Args[0] lines
   DO_CNL          : constant := 666; -- * Do DO_NEL Args[0] times
   DO_CPL          : constant := 667; -- * Do DO_RI Args[0] times
   DO_CHA          : constant := 668; -- * Move ANSI cursor to absolute column Args[0]
   DO_CHI          : constant := 669; -- * Cursor frwrd Args[0] TAB stops. Horizontal index
   DO_CPR          : constant := 670; -- Cursor position report, sent by terminal.
                                      --  Args[0]: row  Args[1]: column
   DO_CVA          : constant := 671; -- ANSI cursor to row Args[0] absolute
   DO_NP           : constant := 672; -- Next page.  Args[0]: # of pages to move.
                                      --          New cursor position: Home
   DO_PP           : constant := 673; -- Previous page.  Args[0]: # of pages to move.
                                      --          New cursor position: Home
   DO_PPA          : constant := 674; -- Page position absolute.  Args[0]: page number.
   DO_PPB          : constant := 675; -- Page position backward.  Args[0]: page number.
   DO_PPR          : constant := 676; -- Page position relative.  Args[0]: page number.
                                      --
   DO_DECSC        : constant := 680; -- * Save state: cursor position, graphic rendition,
                                      --    character set shift state, wrap flag, origin mode,
                                      --    state of selective erase
   DO_DECRC        : constant := 681; -- * Restores states described above. If none are saved,
                                      --    cursor moves to the home position, origin more is
                                      --    reset, no character attributes are assigned, the
                                      --    default character set mapping is established
   DO_HTS          : constant := 682; -- * Horizontal TAB set. Set a horizontal tab at the
                                      --    current column
   DO_TBC          : constant := 683; -- * Clear horizontal TAB stop at the current column
   DO_TBCALL       : constant := 684; -- * Clear all horizontal TAB stops
   DO_DECST8C      : constant := 685; -- * Set TAB at every eight columns starting with
                                      --    column 9
                                      --
   DO_SGR          : constant := 687; -- * Graphics Rendition. The command sets visual
                                      --    attributes.  Args[0] = visual attribute.  For the
                                      --    values of the attributes see vtconst.h ATTR_xxx.
                                      --    Note: ATTR_NOT can be combined with all other
                                      --    attributes (except ATTR_RESET).
   DO_SGRF         : constant := 688; -- * Change foreground color Args[0]: color.
                                      --    Bit values: 1=red, 2=green, 4=blue
   DO_SGRB         : constant := 689; -- * Change background color Args[0]: color.
                                      --    Bit values: 1=red, 2=green, 4=blue
                                      --
   DO_DECDHL       : constant := 690; -- * Double-height line. SET: Top half;
                                      --                       RESET: Bottom half
   DO_DECLW        : constant := 691; -- * Line width.  SET: Double-width line;
                                      --                RESET: Single-width line
   DO_DECHCCM      : constant := 692; -- Horizontal cursor-coupling mode.
                                      --  SET: Coupled; RESET: Uncoupled.
   DO_DECVCCM      : constant := 693; -- Vertical cursor-coupling mode.
                                      --  SET: Coupled; RESET: Uncoupled.
   DO_DECPCCM      : constant := 694; -- Page cursor-coupling mode.
                                      --  SET: Coupled; RESET: Uncoupled.
                                      --
   DO_DECSCA       : constant := 700; -- * Select Character Protection Attributes.
                                      --    SET: the following characters are NOT erasable;
                                      --    RESET: the following characters are erasable.
   DO_IL           : constant := 701; -- * Insert Line at the cursor position.
                                      --    Args[0]: #lines
   DO_DL           : constant := 702; -- * Delete line at the cursor position.
                                      --    Args[0]: #lines
   DO_ICH          : constant := 703; -- * Insert blank characters at the cursor position with
                                      --    normal attributes.  Args[0]: #characters
   DO_DCH          : constant := 704; -- * Delete characters at the cursor position.
                                      --    Args[0]: #characters
   DO_DECIC        : constant := 705; -- * Insert column starting with the cursor column.
                                      --    Args[0]: number of columns to insert.
   DO_DECDC        : constant := 706; -- * Delete column starting with the cursor column.
                                      --    Args[0]: number of columns to delete.
   DO_ECH          : constant := 707; -- * Erase characters at the cursor position.
                                      --    Args[0]: #characters
   DO_ELE          : constant := 708; -- * Erase Line from the cursor position to the end of
                                      --    the line. SET: erase all; RESET: only erasable
   DO_ELB          : constant := 709; -- * Erase Line from the beginning to the cursor
                                      --    position. SET: erase all; RESET: only erasable
   DO_EL           : constant := 710; -- * Erase Line. SET: erase all; RESET: only erasable
   DO_EDE          : constant := 711; -- * Erase from the cursor position to the end of the
                                      --    screen. SET: erase all; RESET: only erasable
   DO_EDB          : constant := 712; -- * Erase from the beginning of the screen to the cursor
                                      --    position. SET: erase all; RESET: only erasable
   DO_ED           : constant := 713; -- * Erase Screen. SET: erase all;
                                      --    RESET: only erasable
   DO_DECXRLM      : constant := 714; -- Transmit Rate Limiting. SET: limit transmit rate;
                                      --  RESET: unlimited transmit rate
   DO_DECHEM       : constant := 715; -- Hebrew Encoding Mode. SET: on; RESET: off
   DO_DECRLM       : constant := 716; -- Cursor Right to Left Mode. SET: on; RESET: off
   DO_DECNAKB      : constant := 717; -- Greek/N-A Keyboard Mapping. SET: Greek;
                                      --  RESET: North American (note: the parser reverses
                                      --  the native VT set/reset values for the sake of
                                      --  consistency. )
   DO_DECHEBM      : constant := 718; -- Hebrew/N-A Keyboard Mapping. SET: Hebrew;
                                      --  RESET: North American
                                      --
   DO_DECSTBM      : constant := 720; -- * Set top and bottom margins for the scrolling
                                      --   region. Args[0]: top; Args[1]: bottom. If Args[1]=1,
                                      --   then the margin defaults to the bottom of the screen,
                                      --   which is the current number of lines per screen.
   DO_DECSLRM      : constant := 721; -- * Set left and right margins. Args[0]: column # of
                                      --    left margin; Args[1]: of right margin. If Args[1]=1,
                                      --    right margin must be set to the right-most column
                                      --    (80 or 132) depending on the page width.
                                      -- ***RJH*** DOS MODE save cursor position.
   DO_DECSCPP      : constant := 722; -- * Set columns per page.  Args[0]: #columns
   DO_DECSLPP      : constant := 723; -- * Set the number of lines per page. Args[0]: #lines
   DO_DECSNLS      : constant := 724; -- * Set the number of lines per screen.
                                      --    Args[0]: #lines
                                      --
   DO_AUTOPRN      : constant := 730; -- * Auto Print mode. SET: ON; RESET: OFF
   DO_PRNCTRL      : constant := 731; -- * Printer Controller mode. SET: ON; RESET: OFF
   DO_PRNCL        : constant := 732; -- * Print the display line containing cursor
                                      --   (and wait till done)
   DO_PRNSCR       : constant := 733; -- * Print screen (or the scrolling region)
                                      --   (and wait till done)
   DO_PRNHST       : constant := 734; -- * Communication from the printer port to the host port
                                      --   SET: Start; RESET: Stop
   DO_PRNDSP       : constant := 735; -- * Print Composed Display
   DO_PRNALLPG     : constant := 736; -- * Print All Pages
   DO_ASSGNPRN     : constant := 737; -- * Assign Printer to Active Host Session
   DO_RELPRN       : constant := 738; -- * Release Printer
                                      --
   DO_DA1          : constant := 740; -- * "What is your service class code and what are
                                      --    your attributes?" DA primary
   DO_DA2          : constant := 741; -- * "What terminal type are you, what version, and what
                                      --    hardware options installed?" DA secondary
   DO_DA3          : constant := 742; -- * "What is your unit ID?" DA tertiary
   DO_DSROS        : constant := 743; -- * "Please report your operation status using DSR
                                      --    control sequence"
   DO_DSRCPR       : constant := 744; -- * "Please report your cursor position using CPR
                                      --    control sequence"
   DO_DECEKBD      : constant := 745; -- Extended Cursor Position Report.
   DO_DSRPRN       : constant := 746; -- * "What is the printer status?"
   DO_DSRUDK       : constant := 747; -- * "Are user-defined keys locked or unlocked?"
   DO_DSRKB        : constant := 748; -- * "What is keyboard language?"
   DO_DSRDECMSR    : constant := 749; -- Macro space report.
   DO_DSRDECCKSR   : constant := 750; -- Memory checksum of text macro definitions.
                                      --  Args[0] -> Pid (numerical label).  0 if none.
   DO_DSRFLG       : constant := 751; -- "What is the status of your data integrity flag?
   DO_DSRMULT      : constant := 752; -- "What is the status of the multiple-session
                                      --  configuration?"
   DO_DECRQCRA     : constant := 753; -- Request a checksum of the rectangular area.
                                      --  Args[0] = numeric Pid
                                      --  Args[1] = page number.  If Args[1] = 0, return a
                                      --    checksum for all pages ignoring all parameters.
                                      --  Args[2] = top-line border
                                      --  Args[3] = left-column border
                                      --  Args[4] = bottom-line border
                                      --    Args[4] = 0 -> last line of the page
                                      --  Args[5] = right-column border
                                      --    Args[5] = 0 -> last column of the page
   DO_DECRQSTAT    : constant := 754; -- Request entire machine state
   DO_DECRQTSR     : constant := 755; -- Request Terminal State Report
   DO_DECRQTSRCP   : constant := 756; -- Request color palette
   DO_DECRQUPSS    : constant := 757; -- Request User Preferred Supplemental Set
   DO_DECRQCIR     : constant := 758; -- Request cursor information report
   DO_DECRQTAB     : constant := 759; -- Request Tab stop report
   DO_DECRQMANSI   : constant := 760; -- Request ANSI mode controls.
                                      --  Args[0]: mode (see RQM_ vtconst.h)
   DO_DECRQMDEC    : constant := 761; -- Request DEC mode controls.
                                      --  Args[0]: mode (see RQM_ vtconst.h)
   DO_DECREQTPARM  : constant := 762; -- * Request terminal parameters
                                      --   SET: generate DECREPTPARMs only in response to a
                                      --       request;
                                      --   RESET: can send unsolicited DECREPTPARMs.
   DO_DECRQDE      : constant := 763; -- Request Displayed Extent
                                      --
   DO_DECSTR       : constant := 770; -- * Soft Reset.  Selects most of the power-up factory-
                                      --   default settings
   DO_RIS          : constant := 771; -- * Hard Reset.  Selects the saved settings saved in
                                      --   nonvolatile memory
   DO_DECSR        : constant := 772; -- Secure Reset.  Sets the terminal to its power-up
                                      --   state to guarantee the terminal state for secure
                                      --   connections.
                                      --     Args[0] = secure reset id
                                      --             = -1 no id; do not send DECSRC
                                      --
   DO_DECTSTMLT    : constant := 780; -- * Do: DECTSTxxx, xxx are POW, RSP, PRN, BAR, RSM
   DO_DECTSTPOW    : constant := 781; -- * Power-up self-test
   DO_DECTSTRSP    : constant := 782; -- * RS-232 port loopback test
   DO_DECTSTPRN    : constant := 783; -- * Printer port loopback test
   DO_DECTSTBAR    : constant := 784; -- * Color bar test
   DO_DECTSTRSM    : constant := 785; -- * Modem control line loopback test
   DO_DECTST20     : constant := 786; -- * 20 mA port/DEC-420 loopback test
   DO_DECTSTBLU    : constant := 787; -- * Full screen blue
   DO_DECTSTRED    : constant := 788; -- * Full screen red
   DO_DECTSTGRE    : constant := 789; -- * Full screen green
   DO_DECTSTWHI    : constant := 790; -- * Full screen white
   DO_DECTSTMA     : constant := 791; -- * Internal modem analog loopback test
   DO_DECTSTME     : constant := 792; -- * Internal modem external loopback test
   DO_DECALN       : constant := 793; -- * Display full screen of E's
                                      --
   DO_VTMODE       : constant := 800; -- * Change VTxxx mode. Args[0]: VT_MODE52, VT_MODE100,
                                      --   VT_MODE420. Args[1]: (for VT420) VT_7BIT, VT_8BIT.
                                      --   VT52 and VT100 are always 7 bit)
   DO_ANSICONF     : constant := 801; -- Change ANSI conformance level
                                      -- Args[0] - desired level (1, 2, or 3).
   DO_DECPCTERM    : constant := 802; -- Change PC Emulation mode.
                                      -- Args[0] - operating mode
                                      --         = 0 -> VT mode
                                      --         = 1 -> PC TERM mode
                                      -- Args[1] = PC character set
                                      --          (see vtconst.h for PCCS_xxx)
                                      --
   DO_DECLL        : constant := 810; -- * LED. RESET: All LED off. Otherwise, turn LED on,
                                      --   where Args[0] is LED# (usually, 1-4)
   DO_DECSSDT      : constant := 811; -- Select Status line type.
                                      -- Args[0] = 0 -> No status line;
                                      -- Args[0] = 1 -> Local owned (indicator line);
                                      -- Args[0] = 2 -> Host-owned (remote status line)
                                      --
   DO_DECES        : constant := 815; -- Enable Session
                                      --
   DO_DECCRA       : constant := 820; -- * Copy rectangular area.
                                      --   Args[0] = SOURCE: top-line border
                                      --   Args[1] = SOURCE: left-column border
                                      --   Args[2] = SOURCE: bottom-line border
                                      --     Args[2] = 0 -> last line of the page
                                      --   Args[3] = SOURCE: right-column border
                                      --     Args[3] = 0 -> last column of the page
                                      --   Args[4] = SOURCE: page number
                                      --   Args[5] = DESTINATION: top-line border
                                      --   Args[6] = DESTINATION: left-column border
                                      --   Args[7] = DESTINATION: page number
   DO_DECERA       : constant := 821; -- * Erase rectangular area.
                                      --   Args[0] = top-line border
                                      --   Args[1] = left-column border
                                      --   Args[2] = bottom-line border
                                      --     Args[2] = 0 -> last line of the page
                                      --   Args[3] = right-column border
                                      --     Args[3] = 0 -> last column of the page
   DO_DECFRA       : constant := 822; -- * Fill rectangular area.
                                      --   Args[0] = fill character
                                      --   Args[1] = top-line border
                                      --   Args[2] = left-column border
                                      --   Args[3] = bottom-line border
                                      --     Args[3] = 0 -> last line of the page
                                      --   Args[4] = right-column border
                                      --     Args[4] = 0 -> last column of the page
   DO_DECSERA      : constant := 823; -- * Selective erase rectangular area.
                                      --   Args[0] = top-line border
                                      --   Args[1] = left-column border
                                      --   Args[2] = bottom-line border
                                      --     Args[2] = 0 -> last line of the page
                                      --   Args[3] = right-column border
                                      --     Args[3] = 0 -> last column of the page
   DO_DECSACE      : constant := 824; -- * Select attribute change extent.
                                      --   SET: change stream of character positions
                                      --   RESET: change rect area of character positions
   DO_DECCARA      : constant := 825; -- * Change visual attributes in rectangular area.
                                      --   Args[0] = top-line border
                                      --   Args[1] = left-column border
                                      --   Args[2] = bottom-line border
                                      --     Args[2] = 0 -> last line of the page
                                      --   Args[3] = right-column border
                                      --     Args[3] = 0 -> last column of the page
                                      --   Args[4] = attributes to SET
                                      --   Args[5] = attributes to CLEAR
                                      --      (See ATTR_xxx in vtconst.h)
                                      --      Note: the attributes may be cleared and set in
                                      --        any order since there will be NO attributes
                                      --        set in BOTH Args[4] and Args[5].  The attributes
                                      --        to be set or cleared are Bold, Underline,
                                      --        Blinking, Negative, and Invisible.
                                      --   Args[n+1]..Args[VTARGS-1] = ATTR_NONE (-1)
   DO_DECRARA      : constant := 826; -- *  Reverse visual attributes in rectangular area.
                                      --   Args[0] = top-line border
                                      --   Args[1] = left-column border
                                      --   Args[2] = bottom-line border
                                      --     Args[2] = 0 -> last line of the page
                                      --   Args[3] = right-column border
                                      --     Args[3] = 0 -> last column of the page
                                      --   Args[4] = attributes to be reversed.  The attributes
                                      --     that can be reversed are Bold, Underline, Blinking,
                                      --     Negative, and Invisible.
                                      --
   DO_DECELF       : constant := 830; -- Enable (and disable) Local Functions.
                                      -- Args[0] = 0 -> all local function
                                      --           1 -> local copy and paste
                                      --           2 -> local panning
                                      --           3 -> local window resize
                                      -- Args[1] = 0 -> factory default
                                      --           1 -> enable
                                      --           2 -> disable
   DO_DECLFKC      : constant := 831; -- Local Functions Key Control.
                                      -- Args[0] = 0 -> all local function keys
                                      --           1 -> F1 [Hold]
                                      --           2 -> F2 [Print]
                                      --           3 -> F3 [Set-Up]
                                      --           4 -> F4 [Session]
                                      -- Args[1] = 0 -> factory default
                                      --           1 -> local function
                                      --           2 -> send key sequence
                                      --           3 -> disable
   DO_DECSMKR      : constant := 832; -- Select Modifier Key Reporting.
                                      -- Args[0] = 0 -> all keys
                                      --           1 -> left [Shift]
                                      --           2 -> right [Shift]
                                      --           3 -> [Caps Lock]
                                      --           4 -> [Ctrl]
                                      --           5 -> left [Alt Function]
                                      --           6 -> right [Alt Function]
                                      --           7 -> left [Compose Character]
                                      --           8 -> right [Compose Character]
                                      -- Args[1] = 0 -> factory default
                                      --           1 -> modifier function
                                      --           2 -> extended keyboard report
                                      --           3 -> disabled

  -- The following functions are the set of Locator Extentions implemented in
  -- several DEC terminals.  These are often unsupported by other parsers/
  -- emulators

   DO_DECELR       : constant := 840; -- Enable Locator Reports.
                                      -- Args[0] = 0 -> locator disabled
                                      --           1 -> locator reports enabled
                                      --           2 -> one shot (allow one report and
                                      --                  disable)
                                      -- Args[1] - specifies coordinate units
                                      --         = 0 or 2 -> character cells
                                      --           1 -> device physical pixels
   DO_DECSLE       : constant := 841; -- Select Locator Events.
                                      -- Args[0] = 0 -> report only to explicit host requests
                                      --           1 -> report button down transitions
                                      --           2 -> do not report button down transitions
                                      --           3 -> report button up transitions
                                      --           4 -> do not report button up transitions
   DO_DECRLP       : constant := 842; -- Request Locator Position.
   DO_DECEFR       : constant := 843; -- Enable Filter Rectangle.
                                      -- Args[0] = Top boundary of filter rectangle
                                      -- Args[1] = Left boundary of filter rectangle
                                      -- Args[2] = Bottom boundary of filter rectangle
                                      -- Args[3] = Right boundary of filter rectangle
                                      -- NOTE: The origin is 1,1.  If any of the arguments are
                                      --   equal to 0, they default to the current locator
                                      --   coordinate.
   DO_DSRLOCATOR   : constant := 844; -- Request locator device status
   DO_LOCATORCTRL  : constant := 845; -- Locator controller mode. SET: ON; RESET: OFF
                                      --
   DO_DECUDK       : constant := 900; -- * Set User Definable Keys.
                                      --   First, the command is called with:
                                      --     Args[0] = 0 -> clear all UDK definitions.
                                      --               1 -> clear only keys to be defined
                                      --     Args[1] = 0 -> lock the keys
                                      --               1 -> do not lock the keys
                                      --     Args[2] = 1 -> define unshifted function key
                                      --               2 -> define shifted function key
                                      --               3 -> define alternate unshifted F-key
                                      --               4 -> define alternate shifted F-key
                                      --
                                      --   After, while loading UDK,
                                      --     Args[0] = -1
                                      --     Args[1] = DEC F key number defined: (1-20)
                                      --       Note: if Args[1] < 0, then this DEC F key number
                                      --       is -Args[1] and is an ALTERNATE (no matter what
                                      --       Args[1] in the initial call claimed, which,
                                      --       however, still defines whether the key is
                                      --       shifted alternate or an unshifted alternate).
                                      --     Args[2]:Args[3] = integer encoded pointer to a
                                      --       NULL-terminating string of ASCII codes
                                      --       assigned to the key (use INTSTOPOINTER).
                                      --     Args[4] = 0 -> errors in string.  attempted to
                                      --                      correct.
                                      --               1 -> ok.  no errors.
                                      --
                                      --   When the sequence ended:
                                      --     Args[0] = Args[1] = -1
                                      --     Args[2] = 0 -> abnormal termination (CAN, etc. )
                                      --               1 -> normal termination (with ST)
                                      --   
   DO_DECDLD       : constant := 901; -- Downline Load soft character set.
                                      -- First, the command is called with:
                                      --   Args[0] = 0 or 1. Font number (buffer number).
                                      --                       Both result in DRCS 1 in VT420.
                                      --   Args[1] = First character to load.
                                      --              Range of Args[1]: 0x20 - 0x7F.
                                      --   Args[2] = 0 -> erase all chars in DRCS with this
                                      --                    number, width, and rendition
                                      --             1 -> erase only chars in locations being
                                      --                    reloaded
                                      --             2 -> erase all renditions of the char set
                                      --      Note: erased chars are undefined (not black).
                                      --            They shall be displayed as the error char.
                                      --   Args[3] = 2 -> 5x10 pixel cell (V220 compatible)
                                      --             3 -> 6x10 pixel cell (V220 compatible)
                                      --             4 -> 7x10 pixel cell (V220 compatible)
                                      --             other -> Args[3] = pixel width (5 - 10)
                                      --   Args[4] = #columns and lines.
                                      --               24 + 12 * (Args[4] % 16) --> #lines
                                      --               80 + 52 * (Args[4] / 16) --> #columns
                                      --   Args[5] = 1 -> text font (do spacing and centering)
                                      --             2 -> full cell (display as is)
                                      --   Args[6] = pixel height (# of pixels) (1 - 16)
                                      --   Args[7] = 0 -> 94-character set
                                      --             1 -> 96-character set
                                      --   Args[8] - final char (see CS_xx in vt_const.h for
                                      --     the final chars for the standard hard char sets)
                                      --   Args[9] - encoded intermediate chars.  Formula:
                                      --      Args[9] = #_of_intermediates * 0x0100 +
                                      --               (intermediate_#_1 - ' ') * 0x0010 +
                                      --               (intermediate_#_2 - ' ')
                                      --       NOTE: You do NOT need to decode this
                                      --             argument since the parser is using the
                                      --             same encoding formula in all functions.
                                      --
                                      -- After, while loading DLD,
                                      --   Args[0] = -1
                                      --   Args[1] = # of the char loaded (1-first, 2-second,
                                      --     3-third, ...)  This argument will probably have
                                      --     little use, but...
                                      --   Args[2]:Args[3] = integer encoded pointer to a
                                      --     NULL-terminating string of ASCII sixels that
                                      --     define the next character.  The sixel groups are
                                      --     separated by "/" char, just as received in the
                                      --     first place (with 0x3F offset still in place)
                                      --     (use INTSTOPOINTER).
                                      --
                                      -- When the sequence ended:
                                      --   Args[0] = Args[1] = -1
                                      --   Args[2] = 1 -> normal termination (with ST)
                                      --             0 -> abnormal termination (CAN, etc. )
                                      --   Args[3] = total # of chars loaded.
                                      --
   DO_DECRQSS      : constant := 902; -- * Request control function setting.  The response
                                      --   expected is the command that would do that function
                                      --   except the leading CSI is omitted.
                                      --
                                      --   Args[0] is the command that is requested.  Standard
                                      --    VT420 commands that could be requested this way
                                      --    are: DO_DECELF, DO_DECLFKC, DO_DECSASD, DO_DECSACE,
                                      --    DO_SGR, DO_DECSMKR, DO_DECSCA, DO_DECSCPP,
                                      --    DO_VTMODE, DO_DECSLRM, DO_DECSLPP, DO_DECSNLS,
                                      --    DO_DECSSDT, DO_DECSTBM.  However, the parser will
                                      --    lookup any command in vtcsi.tbl table.  If a
                                      --    command is not found, DO_VTERR is returned.
                                      --   Args[1]..Args[VTARGS-1] contain the ACSII chars
                                      --     passed in DECRQSS string, which were used to
                                      --     identify the command, and will have to be echoed
                                      --     back (with the other info).  The unused places are
                                      --     filled with -1.
                                      --
                                      --   Note: the command in Args[0] is either the only
                                      --     command or the default command associated with the
                                      --     given char identifier and flags.
                                      --
   DO_DECDMAC      : constant := 903; -- Define macro.
                                      --   Args[0] = macro ID number.  range: 0 and 63.
                                      --   Args[1] = 0 -> delete only the macro defined
                                      --             1 -> delete all current macro definitions
                                      --   Args[2]:Args[3] = integer encoded pointer to a
                                      --     NULL-terminating string of ASCII characters that
                                      --     define the macro (use INTSTOPOINTER).
                                      --
                                      --   Args[4] = 0 -> errors in macro. attempted to
                                      --                    correct.
                                      --             1 -> ok.  no errors in macro.
                                      --
                                      --   Args[5] = 0 -> abnormal termination (CAN, etc. )
                                      --             1 -> normal termination (with ST)
                                      --
   DO_DECINVM      : constant := 904; -- Invoke macro.  Args[0] = macro ID number
                                      --
   DO_DECAUPSS     : constant := 905; -- Assign User-Preferred Character Set
                                      --   Args[0] - final char (see CS_xx in vt_const.h for
                                      --     the final chars for the standard hard char sets)
                                      --   Args[1] - encoded intermediate chars.  Formula:
                                      --     Args[1] = #_of_intermediates * 0x0100 +
                                      --              (intermediate_#_1 - ' ') * 0x0010 +
                                      --              (intermediate_#_2 - ' ')
                                      --     NOTE: You do NOT need to decode this
                                      --           argument since the parser is using the
                                      --           same encoding formula in all functions.
                                      --
   DO_DECRSTS      : constant := 906; -- Restore Terminal to a previous state specified in a
                                      -- terminal state report (DECTSR).
                                      --   Args[0]:Args[1] -> integer encoded pointer to the
                                      --                     NULL-terminated data string
                                      --                     (use INTSTOPOINTER).
                                      --   Args[2] = 0 -> abnormal termination (CAN, etc. )
                                      --             1 -> normal termination (with ST)
                                      --
                                      --  Note: RSTSLEN parameter in vt420.h defines the size
                                      --    of the buffer (the actual space allocated is
                                      --    RSTSLEN + 1 to accommodate for the null character
                                      --    at the end of the string.
                                      --
   DO_DECRSCI      : constant := 907; -- Restore Cursor Information.  The arguments are
                                      -- passed one-by-one.
                                      --   Args[0] = number of the data element reported
                                      --     (the first data element has the number 1).
                                      --     The DEC mnemonics for the elements are:
                                      --              1  -> Pr
                                      --              2  -> Pc
                                      --              3  -> Pp
                                      --              4  -> Srend
                                      --              5  -> Sarr
                                      --              6  -> Sflag
                                      --              7  -> Pgl
                                      --              8  -> Pgr
                                      --              9  -> Scss
                                      --              10 -> Sdesig
                                      --   Args[1] = 0 -> error in the argument.  attempted
                                      --                    to correct
                                      --             1 -> ok.  no error
                                      --   All Pxx elements (or 0 if omitted) are returned
                                      --     in Args[2].
                                      --   All Sxxx except Sdesig are returned as
                                      --     Args[2]:Args[3] as integer encoded pointer to a
                                      --           null-terminating string containing
                                      --           the parameter.
                                      --     Sdesig is returned as:
                                      --       Args[2] - final char for G0
                                      --       Args[3] - encoded intermediate chars for G0
                                      --       Args[4] - final char for G1
                                      --       Args[5] - encoded intermediate chars for G1
                                      --       Args[6] - final char for G2
                                      --       Args[7] - encoded intermediate chars for G2
                                      --       Args[8] - final char for G3
                                      --       Args[9] - encoded intermediate chars for G3
                                      --
                                      --       A final char that is equal to -1 indicates an
                                      --         error in this Cdesig argument.
                                      --
                                      --       See CS_xx in vt_const.h for the final chars
                                      --       for the standard hard char sets)
                                      --       The formula for encoded intermediate chars is
                                      --         Args[x] = #_of_intermediates * 0x0100 +
                                      --               (intermediate_#_1 - ' ') * 0x0010 +
                                      --               (intermediate_#_2 - ' ')
                                      --       NOTE: You do NOT need to decode this
                                      --             argument since the parser is using the
                                      --             same encoding formula in all functions.
                                      --       HOWEVER: to use DECCIR, you will need to use
                                      --         PA_DECODEINTERMS macro.
                                      --
                                      --   When DECRSCI data is over
                                      --     Args[0] = -1
                                      --     Args[1] = 0 -> abnormal termination (CAN, etc. )
                                      --               1 -> normal termination (with ST or too
                                      --                   many parameters)
                                      --     Args[2] = 0 -> the data string is too long (too
                                      --                   many params).  Extras are ignored.
                                      --               1 -> either enough or too few params
                                      --                   then needed.  See Args[3] to find
                                      --                   out which.
                                      --     Args[3] = total number of params encountered
                                      --
   DO_DECRSTAB     : constant := 908; -- Restore TAB Information.
                                      -- Args[0] = tab position or 0 is omitted
                                      -- Args[1] = 0 -> error in data.  attempted to correct
                                      --           1 -> ok.  no error
                                      --
                                      --   NOTE: If the DCS string does not specify ANY TAB
                                      --     information, one call to DO_DECRSTAB with
                                      --     Args[0] = 0 will be made.
                                      --
                                      -- When DECRSTAB data is over,
                                      --   Args[0] = -1
                                      --   Args[1] = 0 -> abnormal termination (CAN, etc. )
                                      --             1 -> normal termination (with ST)

    --  The following group of functions are NOT VT standard ones.  However, a
    --  few terminal programs do understand them.  Please note that while
    --  XTRANS, XRECEIVE, XAPPEND, and XSAVE _are_ used by some terminal
    --  emulators, XSUPP and XOK / XERROR  (XOK is 'ESC { + '  and XERROR is
    --  'ESC { - ') are unique to this parser implementation.

   DO_XSUPP        : constant := 950; -- "Do you support the extended functions?"  If you
                                      -- do support the following functions, respond with
                                      --                   ESC { +
                                      -- Otherwise, ignore
   DO_XTRANS       : constant := 951; -- Transmit a file.
                                      -- Args[0]:Args[1] - integer encoded pointer to a null-
                                      --   terminated string with the filename
                                      --   (use INTSTOPOINTER).
                                      -- If the application agrees to honor the request,
                                      -- respond with " ESC { + ".  If there is an error,
                                      -- respond with " ESC { - ".  If you do not support
                                      -- extended functions, ignore the request.
   DO_XRECEIVE     : constant := 952; -- Receive a file.
                                      -- Args[0]:Args[1] - integer encoded pointer to a null-
                                      --   terminated string with the filename
                                      --   (use INTSTOPOINTER).
                                      -- If the application agrees to honor the request,
                                      -- respond with " ESC { + ".  If there is an error,
                                      -- respond with " ESC { - ".  If you do not support
                                      -- extended functions, ignore the request.
   DO_XAPPEND      : constant := 953; -- Append to a file.
                                      -- Args[0]:Args[1] - integer encoded pointer to a null-
                                      --   terminated string with the filename
                                      --   (use INTSTOPOINTER).
                                      -- If the application agrees to honor the request,
                                      -- respond with " ESC { + ".  If there is an error,
                                      -- respond with " ESC { - ".  If you do not support
                                      -- extended functions, ignore the request.
   DO_XSAVE        : constant := 954; -- Save a file collected text.  This command is used
                                      -- with XRECEIVE and XAPPEND.
                                      -- If the application agrees to honor the request,
                                      -- respond with " ESC { + ".  If there is an error,
                                      -- respond with " ESC { - ".  If you do not support
                                      -- extended functions, ignore the request.

   DO_DOSRC        : constant := 955; -- **RJH** DOS mode Restore Cursor. Note that
                                      --         Dos mode Save Cursor is DO_DECSLRM.
   DO_DOSSM        : constant := 956; -- **RJH** DOS mode set mode.
   DO_DOSRM        : constant := 957; -- **RJH** DOS mode reset mode.
   DO_HPA          : constant := 958; -- **RJH** ISO 6429 Horizontal Position Absolute
   DO_CBT          : constant := 959; -- **RJH** ISO 6429 Cursor Backwards Tabulation
   DO_SL           : constant := 960; -- **RJH** ISO 6429 Shift Left
   DO_SR           : constant := 961; -- **RJH** ISO 6429 Shift Right
   DO_REP          : constant := 962; -- **RJH** ISO 6429 Repeat
   DO_EPA          : constant := 963; -- **RJH** ISO 6429 End of Guarded Area (note that
                                      --         SPA or Start of Guarded Area is DO_PRNCL2)
   DO_ERM          : constant := 964; -- **RJH** ISO 6429 Erasure Mode
   DO_PRNCL2       : constant := 965; -- **RJH** Added to distinguish from DO_PRNCL, which
                                      --         is also SPA for ISO 6429 emulation


   -- parser values used in specifying character sets

   CS_96               : constant := 0;
   CS_94               : constant := 1;

   CS_NO_INTERM        : constant :=   0;
   CS_DEC_INTERM       : constant := 336; -- %
   CS_NAT_INTERM       : constant := 288; -- "

   CS_ASCII            : constant := Character'Pos ('B') + CS_NO_INTERM;
   CS_USERPREF         : constant := Character'Pos ('<') + CS_NO_INTERM;
   CS_DECSUPPL         : constant := Character'Pos ('5') + CS_DEC_INTERM;
   CS_DECSPEC          : constant := Character'Pos ('0') + CS_NO_INTERM;
   CS_DECTECH          : constant := Character'Pos ('>') + CS_NO_INTERM;
   CS_ISOBRITISH       : constant := Character'Pos ('A') + CS_NO_INTERM;
   CS_DECFINNISH_1     : constant := Character'Pos ('5') + CS_NO_INTERM;
   CS_DECFINNISH_2     : constant := Character'Pos ('C') + CS_NO_INTERM;
   CS_ISOFRENCH        : constant := Character'Pos ('R') + CS_NO_INTERM;
   CS_DECFRENCH_CAN_1  : constant := Character'Pos ('9') + CS_NO_INTERM;
   CS_DECFRENCH_CAN_2  : constant := Character'Pos ('Q') + CS_NO_INTERM;
   CS_ISOGERMAN        : constant := Character'Pos ('K') + CS_NO_INTERM;
   CS_ISOITALIAN       : constant := Character'Pos ('Y') + CS_NO_INTERM;
   CS_ISONORW_DANISH   : constant := Character'Pos ('`') + CS_NO_INTERM;
   CS_DECNORW_DANISH_1 : constant := Character'Pos ('6') + CS_NO_INTERM;
   CS_DECNORW_DANISH_2 : constant := Character'Pos ('E') + CS_NO_INTERM;
   CS_DECPORTUGUESE    : constant := Character'Pos ('6') + CS_DEC_INTERM;
   CS_ISOSPANISH       : constant := Character'Pos ('Z') + CS_NO_INTERM;
   CS_DECSWEDISH_1     : constant := Character'Pos ('7') + CS_NO_INTERM;
   CS_DECSWEDISH_2     : constant := Character'Pos ('H') + CS_NO_INTERM;
   CS_DECSWISS         : constant := Character'Pos ('=') + CS_NO_INTERM;
   CS_HEBREW           : constant := Character'Pos ('1') + CS_NO_INTERM;
   CS_ISODUTCH         : constant := Character'Pos ('4') + CS_NO_INTERM;

   CS_DECGREEKSUPPL    : constant := Character'Pos ('?') + CS_NAT_INTERM;
   CS_DECHEBREWSUPPL   : constant := Character'Pos ('4') + CS_NAT_INTERM;
   CS_DECTURKISHSUPPL  : constant := Character'Pos ('0') + CS_DEC_INTERM;
   CS_DECGREEK7BIT     : constant := Character'Pos ('>') + CS_NAT_INTERM;
   CS_DECHEBREW7BIT    : constant := Character'Pos ('=') + CS_DEC_INTERM;
   CS_DECTURKISH7BIT   : constant := Character'Pos ('2') + CS_NAT_INTERM;

   CS_ISOLATIN7GREEK   : constant := Character'Pos ('F') + CS_NO_INTERM;
   CS_ISOLATINHEBREW   : constant := Character'Pos ('H') + CS_NO_INTERM;
   CS_ISOLATIN5TURKISH : constant := Character'Pos ('M') + CS_NO_INTERM;


   type Parser_Args is array (0 .. MAX_ARGUMENTS - 1) of Integer;


   type Single_Result is record
      Code : Integer     := 0;
      Char : Character   := ASCII.NUL;
      Arg  : Parser_Args := (others => 0);
   end record;


   type Parser_Result_Array
   is array (1 .. MAX_RESULTS) of Single_Result;


   type Parser_Result is record
      Count  : Integer := 0;
      Result : Parser_Result_Array;
   end record;


   type Access_Parser_Result is access all Parser_Result;


   package Parser is new MIT_Parser (Parser_Result, Access_Parser_Result);


   subtype Access_Parser_Structure is Parser.PS;


   -- CSI : return an 8 bit or 7 bit CSI
   function CSI (EightBit : in Boolean)
      return String;


   -- DCS : return an 8 bit or 7 bit DCS
   function DCS (EightBit : in Boolean)
      return String;


   -- SS2 : return an 8 bit or 7 bit SS2
   function SS2 (EightBit : in Boolean)
      return String;


   -- SS3 : return an 8 bit or 7 bit SS3
   function SS3 (EightBit : in Boolean)
      return String;


   -- ST : return an 8 bit or 7 bit ST
   function ST (EightBit : in Boolean)
      return String;


   -- InitializeParser : Allocate and return an initialized
   --                    parser structure, suitable for use
   --                    by ParseChar.
   function  InitializeParser return Access_Parser_Structure;


   -- ResetParser : Reset the parser, cancelling processing of
   --               any pending ANSI sequences.
   procedure ResetParser (ParseStruct : in Access_Parser_Structure);


   -- ResetParser : Reset the parser, and force any buffered data
   --               to be processed.
   procedure FlushParserBuffer (ParseStruct : in Access_Parser_Structure);


   -- SwitchParserMode : Change the emulation mode of the parser.
   procedure SwitchParserMode (ParseStruct : in Access_Parser_Structure;
                               Mode : Parser_Mode);


   -- ProcessSkip : Skip to the end of a DCS sequence.
   procedure ProcessSKIP (ParseStruct : in Access_Parser_Structure);


   -- ParseChar : This procedure accepts a single character and
   --             passes it to the MIT Parser. Any outputs of the
   --             MIT parser will be collected in the Parser_Result
   --             structure passed in the Parser parameter. The
   --             results should be checked after each call, but
   --             it is common for the results to be empty if the
   --             MIT Parser is in the middle of parsing an ANSI
   --             sequence.
   procedure ParseChar (ParseStruct : in Access_Parser_Structure;
                        Result      : in Access_Parser_Result;
                        Char        : in Character);


   -- IntsToAddress : convert a pointer encoded in two
   --                 integers into an address.
   function IntsToAddress (Int1 : in Integer;
                           Int2 : in Integer)
         return System.Address;
private

   -- ProcessAnsi : This procedure does no processing, it just collects
   --               output from the MIT parser into the Parser_Result
   --               structure. These results (which may be just an echo
   --               of a character) must be processed elsewehere, usually
   --               after each call to ParseChar.
   procedure ProcessAnsi (pSesptr : Access_Parser_Result;
                          iCode   : MIT_Defs.PA_INT;
                          args    : MIT_Defs.LPARGS);

   pragma Export (C, ProcessAnsi, "ProcessAnsi"); -- WAS CPP

   package Processor is new Parser.MIT_Processor (ProcessAnsi);

end Ansi_Parser;
