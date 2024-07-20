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

with Terminal_Types;
with Terminal_Internal_Types;
with Buffer_Types;
with Graphic_Buffer;
with Ansi_Parser;
with Font_Maps;
with Win32_Support;

with Protection;

package Ansi_Buffer is

   use Terminal_Types;
   use Terminal_Internal_Types;
   use Buffer_Types;
   use Font_Maps;

   package AP  renames Ansi_Parser;

   package WS  renames Win32_Support;

   type Ansi_Buffer is new Graphic_Buffer.Graphic_Buffer with record

   
      KeyLockOn      : Boolean   := False; -- Keyboard unlocked
      KeyRepeatOn    : Boolean   := True;  -- Allow repeated keys
      UpDownView     : Boolean   := False; -- arrows (u/d) move View
      PageView       : Boolean   := False; -- arrows (u/d) move View
      HomeEndView    : Boolean   := False; -- home/end moves View
      LRWrap         : Boolean   := False; -- arrows (l/r) wrap around on lines
      LRScroll       : Boolean   := False; -- arrows (l/r) Scroll screen
      HomeEndInLine  : Boolean   := False; -- home/end stay within line
      MouseCursorOn  : Boolean   := False; -- mouse can move input cursor
      MouseSelectsOn : Boolean   := True;  -- mouse can select
      CommsPort      : WS.Win32_Handle := WS.INVALID_HANDLE_VALUE;
      CommsMutex     : Protection.MutexPtr := null;
      DTROn          : Boolean   := False; -- DTR On
      CursorKeysOn   : Boolean   := False; -- arrows and home/end move cursor
      ExtendedKeysOn : Boolean   := False; -- extended keys (use GetExtended)
      VTKeysOn       : Boolean   := False; -- simulate VTxxx more closely with
                                           -- PF1 .. PF4 on the numeric keypad
   
      AnsiParser     : AP.Access_Parser_Structure;
      AnsiResult     : AP.Access_Parser_Result;
      AnsiMode       : Ansi_Mode := DEFAULT_ANSI_MODE;
      AnsiBase       : Ansi_Mode := DEFAULT_ANSI_MODE;
   
      AnsiOnInput    : Boolean := False; -- Ansi sequences processed on echoed
                                         -- input i.e. entered on keyboard -
                                         -- also requires Echo to be on.
   
      AnsiOnOutput   : Boolean := True;  -- Ansi sequences processed on output
                                         -- i.e. received for display via "put"
   
      -- values saved in PC mode
      PcCursSaved    : Boolean     := False;
      PcSaveCurs     : Scrn_Pos;
      PcSizeSaved    : Boolean     := False;
      PcSaveSize     : Scrn_Pos;
   
      -- values saved in Ansi (VTxx) modes
      AnsiCursSaved  : Boolean     := False;
      AnsiSaveCurs   : Scrn_Pos;
      AnsiSaveStyle  : Real_Cell;
      AnsiSaveMode   : Boolean     := False; -- Origin Mode
      AnsiSaveWrap   : Boolean     := False; -- Wrap Mode
      AnsiSaveGLSet  : Font_Map    := DEC_MULTINATIONAL;
      AnsiSaveGLNum  : Natural     := 0;
      AnsiSaveGRSet  : Font_Map    := DEC_MULTINATIONAL;
      AnsiSaveGRNum  : Natural     := 0;
   
      -- values saved on first PC or Ansi character processing
      FgBgSaved      : Boolean     := False;
      FgBgReverse    : Boolean     := False;
      InitSaveFg     : Color_Type;
      InitSaveBg     : Color_Type;
   
      DECUDK         : DECUDK_Array := (others => (others => Null_String));
   
      PCUDK          : PCUDK_Array  := (others => (others => Null_String));
   
      -- Other ANSI/DEC related flags and values
      BitMode        : Boolean  := False; -- 8 Bit mode if True
      NoScroll       : Boolean  := False;
      LEDText        : Unbounded_String := Null_String;
      LED1           : Boolean  := False;
      LED2           : Boolean  := False;
      LED3           : Boolean  := False;
      LED4           : Boolean  := False;
      DECOM          : Boolean  := False; -- Absolute Origin Mode
      DECUDKLock     : Boolean  := False; -- DEC User defined Keys locked
      DECUDKArg1     : Integer  := 0;     -- used during DEC UDK loading
      DECUDKArg2     : Integer  := 0;     -- used during DEC UDK loading
      DECNRCM        : Boolean  := False; -- Multinational Mode
      DECBKM         : Boolean  := True;  -- Back Arrow is BS (not DEL)
      DECKBUM        : Boolean  := True;  -- Data Processing Keyboard Usage Mode
      DECKPM         : Boolean  := False; -- Key Position Mode
      DECNKM         : Boolean  := False; -- Numeric Keypad Mode
      DECCKM         : Boolean  := False; -- Cursor Keypad Mode
      DECCRM         : Boolean  := False; -- Control code representation
      DECVSSM        : Boolean  := False; -- Vertical Split Screen Mode
      DECSACE        : Boolean  := True;  -- rectangle mode

      DECPFF         : Boolean  := False; -- Print Form Feed Mode
      DECPEX         : Boolean  := False; -- Print Extent Mode
      DECPRNHST      : Boolean  := False; -- Printer to Host Session
      DECPRNCTRL     : Boolean  := False; -- Print Controller Mode
   
      KeySet         : Font_Map := WIN_DEFAULT; -- for Typewriter mode (DCKBUM)
      SingleShift    : Boolean  := False; -- restore GL after next char
      SavedGLSet     : Font_Map := WIN_DEFAULT; -- used when SingleShift-ing
      SavedGLNum     : Natural  := 0;
   
      -- ISO related flags and values
      ISOERM         : Boolean   := True;  -- Erasure Mode
      ISOLastChar    : Character := ASCII.NUL; -- last char (for Repeat)
   
   end record;

 
   -- TurnOnNumLock : Make sure the num lock key is on.
   --                 Essential for VTKey mode.
   procedure TurnOnNumLock (Buffer : in out Ansi_Buffer);


   -- AnsiReset : reset DEC/ANSI values. This is done
   --             whenever the ANSI mode is changed.
   procedure AnsiReset (
         Buffer   : in out Ansi_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         Style    : in out Real_Cell);


   -- SGRReset : reset SGR attributes
   procedure SGRReset (
         Buffer   : in out Ansi_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         Style    : in out Real_Cell);


   -- SoftReset : Perform a soft reset
   procedure SoftReset (
         Buffer   : in out Ansi_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         Style    : in out Real_Cell);


   -- HardReset : Perform a hard reset
   procedure HardReset (
         Buffer   : in out Ansi_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         Style    : in out Real_Cell);


   procedure SetCommsPort(Buffer : in out Ansi_Buffer;
                          Port   : in WS.Win32_Handle;
                          Mutex  : in Protection.Mutex);

   -- ControlDTR : Turn DTR on or off according to DTROn
   procedure ControlDTR (Buffer : in out Ansi_Buffer);

   -- PulseDTR : Pulse DTR on or off according to DTROn
   procedure PulseDTR (Buffer : in out Ansi_Buffer);

   -- ProcessAnsi : Process an Ansi parser result.
   procedure ProcessAnsi (
         Buffer   : in out Ansi_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         WrapNext : in out Boolean;
         Ansi     : in     AP.Single_Result;
         Style    : in out Real_Cell;
         Input    : in     Boolean := True;
         Draw     : in     Boolean := True);

   -- ProcessChar : Put character at the specified Screen location.
   --               This location is updated. Can be used with Input
   --               or Output location and style.
   procedure ProcessChar (
         Buffer   : in out Ansi_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         WrapNext : in out Boolean;
         Char     : in     Character;
         Style    : in out Real_Cell;
         Input    : in     Boolean := True;
         Draw     : in     Boolean := True);


   -- ProcessStr : Put string at the specified Screen location.
   --              This location is updated. Can be used with
   --              Input or Output location and style.
   procedure ProcessStr (
         Buffer   : in out Ansi_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         WrapNext : in out Boolean;
         Str      : in     String;
         Style    : in out Real_Cell;
         Input    : in     Boolean := True;
         Draw     : in     Boolean := True);


   procedure ProcessKey (
         Buffer  : in out Ansi_Buffer;
         Special : in     Special_Key_Type;
         Key     : in     Character;
         Modifier: in     Modifier_Key_Type;
         Numeric : in     Boolean;
         Sent    :    out Boolean);
         

end Ansi_Buffer;
