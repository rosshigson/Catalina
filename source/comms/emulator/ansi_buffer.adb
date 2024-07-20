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

with System; use System;
with Ada.Unchecked_Conversion;
with Ada.Strings;
with Ada.Strings.Fixed;
with GWindows.Message_Boxes;
with GWindows.Application;
with Interfaces.C;
with GWindows.Windows;
with GWindows.GStrings;
with GWindows.GStrings.Unbounded;
with Sizable_Panels;
with Terminal_Internal_Types;

with Win32;
with Win32.Winnt;
with Win32.Winbase;
with Win32_Support;

with FYModem;

package body Ansi_Buffer is
   
   use type Win32.BOOL;
  
   package WB renames Win32.Winbase;
   
   DEFAULT_ANSWERBACK  : constant String := "TERM_IO";

   REPORT_UNKNOWN_ANSI : constant Boolean := False;

   use Terminal_Internal_Types;
   use Sizable_Panels;
   use GWindows.Application;

   -- CharBits : return 8 bit or 7 bits per character
   function CharBits (
         Buffer : in     Ansi_Buffer)
      return String is
   begin
      if Buffer.BitMode then
         return "1";
      else
         return "2";
      end if;
   end CharBits;

   -- TurnOnNumLock : Make sure the num lock key is on.
   --                 Essential if num lock is used as PF1.
   procedure TurnOnNumLock (Buffer : in out Ansi_Buffer)
   is
      SavedKeyLock : Boolean := Buffer.KeyLockOn;
   begin
      Buffer.KeyLockOn := True;
      -- temporarily turn key lock on (so that any simulated
      -- keystrokes are ignored), then turn num lock on, then
      -- process all windows messages that have been generated
      -- as a consequence.
      WS.NumLockOn;
      -- process Windows messages
      while Messages_Waiting loop
         GWindows.Application.Message_Check;
      end loop;
      Buffer.KeyLockOn := SavedKeyLock;
   end TurnOnNumLock;


   -- AnsiReset : reset DEC/ANSI values. This is done
   --             whenever the ANSI mode is changed.
   procedure AnsiReset (
         Buffer   : in out Ansi_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         Style    : in out Real_Cell)
   is
   begin
      Buffer.DECNRCM                 := False; -- Multinational mode
      -- if DECCRM mode, do not change fonts
      if not Buffer.DECCRM then
         if Buffer.AnsiMode = PC then
            Buffer.FFisLF            := False;
            Buffer.AnsiSaveGLSet     := WIN_DEFAULT;
            Buffer.AnsiSaveGLNum     := 0;
            Buffer.AnsiSaveGRSet     := WIN_DEFAULT;
            Buffer.AnsiSaveGRNum     := 0;
            Buffer.GLSet             := WIN_DEFAULT;
            Buffer.GLNum             := 0;
            Buffer.GRSet             := WIN_DEFAULT;
            Buffer.GRNum             := 0;
            Buffer.KeySet            := WIN_DEFAULT;
         else
            Buffer.FFisLF            := True;
            Buffer.AnsiSaveGLSet     := DEC_MULTINATIONAL;
            Buffer.AnsiSaveGLNum     := 0;
            Buffer.AnsiSaveGRSet     := DEC_MULTINATIONAL;
            Buffer.AnsiSaveGRNum     := 0;
            Buffer.GLSet             := DEC_MULTINATIONAL;
            Buffer.GLNum             := 0;
            Buffer.GRSet             := DEC_MULTINATIONAL;
            Buffer.GRNum             := 0;
            Buffer.KeySet            := DEC_MULTINATIONAL;
         end if;
      end if;
      Buffer.SingleShift             := False;
      Buffer.G0Set                   := DEC_MULTINATIONAL;
      Buffer.G1Set                   := DEC_MULTINATIONAL;
      Buffer.G2Set                   := DEC_MULTINATIONAL;
      Buffer.G3Set                   := DEC_MULTINATIONAL;
      Buffer.PcCursSaved             := False;
      Buffer.PcSaveCurs              := (0, 0);
      Buffer.PcSizeSaved             := False;
      Buffer.PcSaveSize              := (Buffer.Scrn_Size.Col, 
                                         Buffer.Scrn_Size.Row);
      Buffer.AnsiCursSaved           := False;
      Buffer.AnsiSaveCurs            := (0, 0);
      Buffer.AnsiSaveStyle.Italic    := False;
      Buffer.AnsiSaveStyle.Bold      := False;
      Buffer.AnsiSaveStyle.Underline := False;
      Buffer.AnsiSaveStyle.Strikeout := False;
      Buffer.AnsiSaveStyle.Inverse   := False;
      Buffer.AnsiSaveStyle.Flashing  := False;
      Buffer.AnsiSaveStyle.Selected  := False;
      Buffer.AnsiSaveMode            := False;
      Buffer.AnsiSaveWrap            := False;
      if Buffer.FgBgSaved then
         Buffer.AnsiSaveStyle.FgColor := Buffer.InitSaveFg;
         Buffer.AnsiSaveStyle.BgColor := Buffer.InitSaveBg;
      end if;
      if Buffer.VTKeysOn and Buffer.AnsiMode /= PC then
         -- make sure num lock is on so that key presses on
         -- the numeric keypad return identifiable keypad keys
         TurnOnNumLock (Buffer);
      end if;
   end AnsiReset;


   -- SGRReset : reset SGR attributes
   procedure SGRReset (
         Buffer   : in out Ansi_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         Style    : in out Real_Cell)
   is
   begin
      Style.Italic    := False;
      Style.Bold      := False;
      Style.Underline := False;
      Style.Strikeout := False;
      Style.Inverse   := False;
      Style.Flashing  := False;
      Style.Selected  := False;
      Style.Erasable  := True;
      if Buffer.FgBgSaved then
         Style.FgColor   := Buffer.InitSaveFg;
         Style.BgColor   := Buffer.InitSaveBg;
         Buffer.BlankStyle.FgColor := Buffer.InitSaveFg;
         Buffer.BlankStyle.BgColor := Buffer.InitSaveBg;
      end if;
   end SGRReset;


   -- SoftReset : Perform a soft reset
   procedure SoftReset (
         Buffer   : in out Ansi_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         Style    : in out Real_Cell)
   is
   begin
      if Buffer.AnsiMode /= Buffer.AnsiBase then
         -- escape sequences must have changed mode !!!
         Buffer.AnsiMode := Buffer.AnsiBase;
         case Buffer.AnsiMode is
            when PC =>
               -- for PC, use VT100 - differences are taken
               -- care of in ProcessAnsi routine
               AP.SwitchParserMode (Buffer.AnsiParser, AP.VT100);
            when VT52 =>
               AP.SwitchParserMode (Buffer.AnsiParser, AP.VT52);
            when VT100 | VT101 | VT102 =>
               AP.SwitchParserMode (Buffer.AnsiParser, AP.VT100);
            when VT220 | VT320 | VT420 =>
               AP.SwitchParserMode (Buffer.AnsiParser, AP.VT420);
         end case;
      end if;
      AnsiReset (Buffer, ScrnCol, ScrnRow, Style);
      SGRReset (Buffer, ScrnCol, ScrnRow, Style);
      Buffer.DECKPM      := False;     -- Keys return values, not positions
      Buffer.DECOM       := False;     -- origin mode absolute
      Buffer.Regn_Base   := (0, 0);
      Buffer.Regn_Size   := (Regn_Col (Buffer.Scrn_Size.Col), 
                             Regn_Row (Buffer.Scrn_Size.Row));
      Buffer.KeyLockOn   := False;     -- keyboard unlocked
      Buffer.DECNKM      := False;     -- numeric keypad returns numeric codes
      Buffer.DECCKM      := False;     -- cursor keys return ANSI codes
      Buffer.CursVisible := True;
      Buffer.InsertOn    := False;
      Buffer.WrapOn      := False;
      Buffer.KeyRepeatOn := True;
   end SoftReset;


   -- HardReset : Perform a hard reset
   procedure HardReset (
         Buffer   : in out Ansi_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         Style    : in out Real_Cell)
   is
   begin
      SoftReset (Buffer, ScrnCol, ScrnRow, Style);
      for i in DECUDK_Key loop
         for j in DECUDK_Type loop
            Buffer.DECUDK (i, j) := Null_String;
         end loop;
      end loop;
      Buffer.BitMode      := False;
      Buffer.SmoothScroll := False;
      Buffer.UseRegion    := False;
      Buffer.NoScroll     := False;
      Buffer.LED1         := False;
      Buffer.LED2         := False;
      Buffer.LED3         := False;
      Buffer.LED4         := False;
      ClearScreenBuffer (Buffer);
      Home (Buffer, ScrnCol, ScrnRow);
      DrawScreen (Buffer);
   end HardReset;

   procedure SetCommsPort(Buffer : in out Ansi_Buffer;
                          Port   : in WS.Win32_Handle;
                          Mutex  : in Protection.Mutex)
   is
   begin
      Buffer.CommsPort := Port;
   end SetCommsPort;

   -- ControlDTR : Turn DTR on or off according to DTROn
   procedure ControlDTR (Buffer : in out Ansi_Buffer)
   is
      Result : WS.BOOL;
   begin
      if (Buffer.CommsPort /= WS.INVALID_HANDLE_VALUE) then
         if Buffer.DTROn then
            Result := WS.EscapeCommFunction(Buffer.CommsPort, WS.SETDTR);
         else
            Result := WS.EscapeCommFunction(Buffer.CommsPort, WS.CLRDTR);
         end if;
      end if;
   end ControlDTR;

   -- PulseDTR : Pulse DTR on or off for 100ms according to DTROn
   procedure PulseDTR (Buffer : in out Ansi_Buffer)
   is
      Result : WS.BOOL;
   begin
      if (Buffer.CommsPort /= WS.INVALID_HANDLE_VALUE) then
         if Buffer.DTROn then
            --  pulse it off
            Result := WS.EscapeCommFunction(Buffer.CommsPort, WS.CLRDTR);
            delay 0.1;
            Result := WS.EscapeCommFunction(Buffer.CommsPort, WS.SETDTR);
         else
            -- pulse it on
            Result := WS.EscapeCommFunction(Buffer.CommsPort, WS.SETDTR);
            delay 0.1;
            Result := WS.EscapeCommFunction(Buffer.CommsPort, WS.CLRDTR);
         end if;
      end if;
   end PulseDTR;

   -- ProcessAnsi : Process an Ansi parser result.
   procedure ProcessAnsi (
         Buffer   : in out Ansi_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         WrapNext : in out Boolean;
         Ansi     : in     AP.Single_Result;
         Style    : in out Real_Cell;
         Input    : in     Boolean := True;
         Draw     : in     Boolean := True)
   is
      use GWindows.Message_Boxes;
   
      RealRow  : Real_Row := Real (Buffer, ScrnRow);
      OrigCol  : Scrn_Col := ScrnCol;
      OrigRow  : Scrn_Row := ScrnRow;
      Sent     : Boolean;
   
      -- GetParserString : Get the string whose address is encoded in
      --                   the two integers returned by the MIT parser.
      function GetParserString (Int1 : in integer;
                             Int2 : in Integer)
            return Unbounded_String
      is
   
         type CharPtr is access Interfaces.C.Char_Array (0 .. 255);
   
         function To_CharPtr is
         new Ada.Unchecked_Conversion (System.Address, CharPtr);
   
         Addr : System.Address;
         CPtr : CharPtr;
   
      begin
         Addr := AP.IntsToAddress (Int1, Int2);
         CPtr := To_CharPtr (Addr);
         return To_Unbounded (To_GString (Interfaces.C.To_Ada (CPtr.all)));
      end GetParserString;
   
   
      -- SelectCharacterSet : Select a character set into G0, G1, G2 or G3. 
      --                      Note that when selecting into G0, also update 
      --                      the KeySet in cases where there is an associated
      --                      foreign keyboard mapping.
      --                      TBD : Also updates GL or GR if G0, G1, G2 or G3 
      --                            changes and is currently selected into them.
      procedure SelectCharacterSet (
         Buffer  : in out Ansi_Buffer;
         Set     : in out Font_Map;
         Num     : in     Natural;
         CharSet : in     Natural)
      is
      begin
         case CharSet is
            when AP.CS_ASCII =>
               Set := DEC_MULTINATIONAL;
            when AP.CS_USERPREF =>
               Set := DEC_MULTINATIONAL;
            when AP.CS_DECSPEC =>
               Set := DEC_SPECIAL;
            when AP.CS_ISOBRITISH =>
               Set := ISO_BRITISH;
            when AP.CS_ISODUTCH =>
               Set := ISO_DUTCH;
               if Num = 0 then
                  Buffer.KeySet := Set;
               end if;
            when AP.CS_DECFINNISH_1 =>
               Set := ISO_FINNISH;
               if Num = 0 then
                  Buffer.KeySet := Set;
               end if;
            when AP.CS_DECFINNISH_2 =>
               Set := ISO_FINNISH;
               if Num = 0 then
                  Buffer.KeySet := Set;
               end if;
            when AP.CS_ISOFRENCH =>
               Set := ISO_FRENCH;
               if Num = 0 then
                  Buffer.KeySet := Set;
               end if;
            when AP.CS_DECFRENCH_CAN_1 =>
               Set := ISO_FRENCH_CANADIAN;
               if Num = 0 then
                  Buffer.KeySet := Set;
               end if;
            when AP.CS_DECFRENCH_CAN_2 =>
               Set := ISO_FRENCH_CANADIAN;
               if Num = 0 then
                  Buffer.KeySet := Set;
               end if;
            when AP.CS_ISOGERMAN =>
               Set := ISO_GERMAN;
               if Num = 0 then
                  Buffer.KeySet := Set;
               end if;
            when AP.CS_ISOITALIAN =>
               Set := ISO_ITALIAN;
               if Num = 0 then
                  Buffer.KeySet := Set;
               end if;
            when AP.CS_DECNORW_DANISH_1 =>
               Set := ISO_NORWEGIAN_DANISH;
               if Num = 0 then
                  Buffer.KeySet := Set;
               end if;
            when AP.CS_DECNORW_DANISH_2 =>
               Set := ISO_NORWEGIAN_DANISH;
               if Num = 0 then
                  Buffer.KeySet := Set;
               end if;
            when AP.CS_ISOSPANISH =>
               Set := ISO_SPANISH;
               if Num = 0 then
                  Buffer.KeySet := Set;
               end if;
            when AP.CS_DECSWEDISH_1 =>
               Set := ISO_SWEDISH;
               if Num = 0 then
                  Buffer.KeySet := Set;
               end if;
            when AP.CS_DECSWEDISH_2 =>
               Set := ISO_SWEDISH;
               if Num = 0 then
                  Buffer.KeySet := Set;
               end if;
            when AP.CS_DECSWISS =>
               Set := ISO_SWISS;
               if Num = 0 then
                  Buffer.KeySet := Set;
               end if;
            when Character'Pos ('1') =>
               -- VT100, VT101, VT102 only, 
               -- Alternate Character Rom Standard Graphic Set
               if Buffer.AnsiMode = VT100 
               or Buffer.AnsiMode = VT101
               or Buffer.AnsiMode = VT102 then
                  Set := DEC_MULTINATIONAL;
               end if;
            when Character'Pos ('2') =>
               -- VT100, VT101, VT102 only, 
               -- Alternate Character Rom Special Graphic Set
               if Buffer.AnsiMode = VT100 
               or Buffer.AnsiMode = VT101
               or Buffer.AnsiMode = VT102 then
                  Set := DEC_SPECIAL;
               end if;
            when others =>
               null;
         end case;
         -- TBD : Does changing G0, G1, G2 or G3 also change GL or GR when
         --       the set is currently selected into them ? This is currently
         --       assumed - if not true, remove the following 6 lines:
         if Buffer.GLNum = Num then
            -- set is currently selected into GL, so also change GL
            Buffer.GLSet := Set;
         end if;
         if Buffer.GRNum = Num then
            -- set is currently selected into GR, so also change GR
            Buffer.GRSet := Set;
         end if;
      end SelectCharacterSet;
   
   
   begin
      if not Buffer.FgBgSaved then
         -- if we have not already saved them, the current
         -- colors become the default fg and bg colors
         Buffer.InitSaveFg := Style.FgColor;
         Buffer.InitSaveBg := Style.BgColor;
         Buffer.FgBgSaved := True;
      end if;
      case Ansi.Code is
   
         when AP.DO_ECHO =>
            if Buffer.DECPRNCTRL then
               -- print the character without displaying it (excluding NUL)
               if Ansi.Char /= ASCII.NUL then
                  Print (
                     Buffer,
                     Char => Ansi.Char,
                     KeepOpen => True);
               end if;
            else
               -- display the character (graphic or non-graphic)
               Graphic_Buffer.ProcessChar (
                  Graphic_Buffer.Graphic_Buffer (Buffer), 
                  ScrnCol, 
                  ScrnRow, 
                  WrapNext, 
                  Ansi.Char, 
                  Style,
                  Input,
                  Draw);
               -- restore character set after single shifts
               if Buffer.SingleShift then
                  Buffer.GLSet       := Buffer.SavedGLSet;
                  Buffer.GLNum       := Buffer.SavedGLNum;
                  Buffer.SingleShift := False;
               end if;
            end if;
   
         when AP.DO_ERROR =>
            WS.Beep;
   
         when AP.DO_BEL =>
            -- CTRL+G (ASCII.BEL)
            PerformBEL (Buffer, ScrnCol, ScrnRow, Style);
   
         when AP.DO_ENQ =>
            -- CTRL+E (ASCI.ENQ)
            SendString (Buffer, DEFAULT_ANSWERBACK, Sent);
   
         when AP.DO_LS0 =>
            -- CTRL+N (ASCII.SO)
            Buffer.GLSet := Buffer.G0Set;
            Buffer.GLNum := 0;
   
         when AP.DO_LS1 =>
            -- CTRL+O (ASCII.SI)
            Buffer.GLSet := Buffer.G1Set;
            Buffer.GLNum := 1;
   
         when AP.DO_LS1R =>
            -- ESC ~
            Buffer.GRSet := Buffer.G1Set;
            Buffer.GRNum := 1;
   
         when AP.DO_LS2 =>
            -- ESC n
            Buffer.GLSet := Buffer.G2Set;
            Buffer.GLNum := 2;
   
         when AP.DO_LS2R =>
            -- ESC )
            Buffer.GRSet := Buffer.G2Set;
            Buffer.GRNum := 2;
   
         when AP.DO_LS3 =>
            -- ESC o
            Buffer.GLSet := Buffer.G3Set;
            Buffer.GLNum := 3;
   
         when AP.DO_LS3R =>
            -- ESC |
            Buffer.GRSet := Buffer.G3Set;
            Buffer.GRNum := 3;
   
         when AP.DO_SS2 =>
            -- ESC o
            Buffer.SavedGLSet  := Buffer.GLSet;
            Buffer.SavedGLNum  := Buffer.GLNum;
            Buffer.GLSet       := Buffer.G2Set;
            Buffer.GLNum       := 2;
            Buffer.SingleShift := True;
   
         when AP.DO_SS3 =>
            -- ESC |
            Buffer.SavedGLSet  := Buffer.GLSet;
            Buffer.SavedGLNum  := Buffer.GLNum;
            Buffer.GLSet       := Buffer.G3Set;
            Buffer.GLNum       := 3;
            Buffer.SingleShift := True;
   
         when AP.DO_GRM =>
            -- ESC F or ESC G
            -- only used in VT52 mode
            if Buffer.AnsiMode = VT52 then
               if Ansi.Arg (0) = 0 then
                  -- ESC F
                  Buffer.GLSet := DEC_MULTINATIONAL;
                  Buffer.GRSet := DEC_MULTINATIONAL;
               else
                  -- ESC G
                  Buffer.GLSet := DEC_SPECIAL;
                  Buffer.GRSet := DEC_SPECIAL;
               end if;
            end if;
   
         when AP.DO_DECNRCM =>
            -- ESC ? 42 h or ESC ? 42 l (private standard)
            if Ansi.Arg (0) = 0 then
               -- ESC ? 42 l
               -- Multinational mode
               Buffer.DECNRCM := False;
            else
               -- ESC ? 42 h
               -- National mode
               Buffer.DECNRCM := True;
            end if;
   
         when AP.DO_XON =>
            -- CTRL+Q (ASCII.DC1)
            -- TBD:
            null;
   
         when AP.DO_XOFF =>
            -- CTRL+S (ASCII.DC3)
            -- TBD:
            null;
   
         when AP.DO_IRM =>
            -- ESC [ 4 h or ESC [ 4 l
            if Ansi.Arg (0) = 0 then
               -- ESC [ 4 l
               Buffer.InsertOn := False;
            else
               -- ESC [ 4 h
               Buffer.InsertOn := True;
            end if;
   
         when AP.DO_SRM =>
            -- ESC [ 12 h or ESC [ 12 l
            if Ansi.Arg (0) = 0 then
               -- ESC [ 12 l
               Buffer.EchoOn := True;
            else
               -- ESC [ 12 h
               Buffer.EchoOn := False;
            end if;
   
         when AP.DO_HOME=>
            -- ESC H (VT52 mode)
            Home (Buffer, ScrnCol, ScrnRow);
   
         when AP.DO_UP =>
            -- ESC A
            -- Cursor Up
            MoveUp (Buffer, ScrnCol, ScrnRow);
   
         when AP.DO_DOWN =>
            -- ESC B
            -- Cursor Down
            MoveDown (Buffer, ScrnCol, ScrnRow);
   
         when AP.DO_RIGHT =>
            -- ESC C
            -- Cursor Right
            MoveRight (Buffer, ScrnCol, ScrnRow);
   
         when AP.DO_LEFT =>
            -- ESC D (VT52 mode)
            -- Cursor Left
            MoveLeft (Buffer, ScrnCol, ScrnRow);
   
         when AP.DO_CUU =>
            -- ESC [ Pn A
            -- Cursor Up
            MoveUp (Buffer, ScrnCol, ScrnRow, Ansi.Arg (0));
   
         when AP.DO_CUD =>
            -- ESC [ Pn B
            -- Cursor Down
            MoveDown (Buffer, ScrnCol, ScrnRow, Ansi.Arg (0));
   
         when AP.DO_CUF =>
            -- ESC [ Pn C
            -- Cursor Forward
            MoveRight (Buffer, ScrnCol, ScrnRow, Ansi.Arg (0));
   
         when AP.DO_CUB =>
            -- ESC [ Pn D
            -- Cursor Backward
            MoveLeft (Buffer, ScrnCol, ScrnRow, Ansi.Arg (0));
   
         when AP.DO_CUP =>
            -- ESC [ PL ; Pc H or ESC [ PL ; Pc f
            if Buffer.DECOM then
               -- relative origin mode
               if  Ansi.Arg (0) in 1 .. Natural (Buffer.Regn_Size.Row) then
                  ScrnRow := Buffer.Regn_Base.Row 
                           + Scrn_Row (Ansi.Arg (0) - 1);
               else
                  ScrnRow := Buffer.Regn_Base.Row 
                           + Scrn_Row (Buffer.Regn_Size.Row - 1);
               end if;
               if Ansi.Arg (1) in 1 .. Natural (Buffer.Regn_Size.Col) then
                  ScrnCol := Buffer.Regn_Base.Col + Scrn_Col (Ansi.Arg (1) - 1);
                  ScrnCol := ScrnCol * Width (Buffer, ScrnCol, ScrnRow);
                  if not (ScrnCol in 0 .. Buffer.Regn_Base.Col 
                         + Scrn_Col (Buffer.Regn_Size.Col - 1)) then
                     ScrnCol := Buffer.Regn_Base.Col 
                              + Scrn_Col (Buffer.Regn_Size.Col - 1);
                  end if;
               else
                  ScrnCol := Buffer.Regn_Base.Col 
                           + Scrn_Col (Buffer.Regn_Size.Col - 1);
               end if;
            else
               -- absolute origin mode
               if  Ansi.Arg (0) in 1 .. Natural (Buffer.Scrn_Size.Row) then
                  ScrnRow := Scrn_Row (Ansi.Arg (0) - 1);
               else
                  ScrnRow := Buffer.Scrn_Size.Row - 1;
               end if;
               if Ansi.Arg (1) in 1 .. Natural (Buffer.Scrn_Size.Col) then
                  ScrnCol := Scrn_Col (Ansi.Arg (1) - 1);
                  ScrnCol := ScrnCol * Width (Buffer, ScrnCol, ScrnRow);
                  if not (ScrnCol in 0 .. Buffer.Scrn_Size.Col - 1) then
                     ScrnCol := Buffer.Scrn_Size.Col - 1;
                  end if;
               else
                  ScrnCol := Buffer.Scrn_Size.Col - 1;
               end if;
            end if;
   
         when AP.DO_IND =>
            -- ESC D (VT100 mode)
            -- Index
            PerformIND (Buffer, ScrnCol, ScrnRow, Style);
   
         when AP.DO_RI =>
            -- ESC M or ESC [ M or ESC I or ESC [ I
            -- Reverse Index
            PerformRI (Buffer, ScrnCol, ScrnRow, Style);
   
         when AP.DO_NEL =>
            -- ESC E
            -- Next Line
            PerformNEL (Buffer, ScrnCol, ScrnRow, Style);
   
         when AP.DO_DECI =>
            -- ESC 6 or ESC 9
           if Ansi.Arg (0) = 0 then
               -- ESC 6
               -- Back Index
              PerformBI (Buffer, ScrnCol, ScrnRow, Style);
            else
               -- ESC 9
               -- Forward Index
              PerformFI (Buffer, ScrnCol, ScrnRow, Style);
            end if;
   
         when AP.DO_EDE =>
            -- ESC J or [ J or ESC [ 0 J
            declare
               Selective  : Boolean     := False;
               EraseStyle : Real_Cell := Buffer.BlankStyle;
            begin
               EraseStyle.FgColor := Style.FgColor;
               EraseStyle.BgColor := Style.BgColor;
               if Buffer.ISOERM or (Ansi.Arg (0) = 0) then
                  -- selective
                  Selective := True;
               end if;
               for Col in ScrnCol .. Buffer.Scrn_Size.Col - 1 loop
                  FillRealCell (
                     Buffer, 
                     Real (Buffer, Col), 
                     RealRow,
                     ' ', 
                     False,
                     EraseStyle, 
                     Selective);
               end loop;
               if ScrnRow < Buffer.Scrn_Size.Row - 1 then
                  for Col in 0 .. Buffer.Scrn_Size.Col - 1 loop
                     for Row in ScrnRow + 1 .. Buffer.Scrn_Size.Row - 1 loop
                        FillRealCell (
                           Buffer, 
                           Real (Buffer, Col), 
                           Real (Buffer, Row),
                           ' ', 
                           False,
                           EraseStyle, 
                           Selective);
                        -- make line single width
                        Buffer.Real_Buffer (Real (Buffer, Col), 
                                            Real (Buffer, Row)).Size 
                           := Single_Width;
                     end loop;
                  end loop;
               end if;
               DrawScreen (Buffer, FromRow => ScrnRow);
            end;
   
         when AP.DO_EDB =>
            -- ESC  [ 1 J
            declare
               Selective  : Boolean     := False;
               EraseStyle : Real_Cell := Buffer.BlankStyle;
            begin
               EraseStyle.FgColor := Style.FgColor;
               EraseStyle.BgColor := Style.BgColor;
               if Buffer.ISOERM or (Ansi.Arg (0) = 0) then
                  -- selective
                  Selective := True;
               end if;
               if ScrnRow > 0 then
                  for Col in 0 .. Buffer.Scrn_Size.Col - 1 loop
                     for Row in 0 .. ScrnRow - 1 loop
                        FillRealCell (
                           Buffer, 
                           Real (Buffer, Col), 
                           Real (Buffer, Row), 
                           ' ', 
                           False,
                           EraseStyle,
                           Selective);
                        -- make line single width
                        Buffer.Real_Buffer (Real (Buffer, Col), 
                                            Real (Buffer, Row)).Size 
                           := Single_Width;
                     end loop;
                  end loop;
               end if;
               for Col in 0 .. ScrnCol loop
                  -- preserve size and selection status
                  FillRealCell (
                     Buffer, 
                     Real (Buffer, Col), 
                     RealRow,
                     ' ', 
                     False,
                     EraseStyle, 
                     Selective);
               end loop;
               DrawScreen (Buffer, ToRow => ScrnRow);
            end;
   
         when AP.DO_ED =>
            -- ESC [ 2 J
            declare
               Selective : Boolean := False;
            begin
               if Buffer.ISOERM or (Ansi.Arg (0) = 0) then
                  -- selective
                  Selective := True;
               end if;
               Buffer.BlankStyle.FgColor := Style.FgColor;
               Buffer.BlankStyle.BgColor := Style.BgColor;
               ClearScreenBuffer (Buffer, Selective);
               DrawScreen (Buffer);
               if Buffer.AnsiMode = PC then
                  Home (Buffer, ScrnCol, ScrnRow);
               end if;
            end;
   
         when AP.DO_ECH =>
            -- ESC [ Pn X
            declare
               Selective  : Boolean   := False;
               EraseStyle : Real_Cell := Buffer.BlankStyle;
               MaxMove    : Scrn_Col;
            begin
               Selective := Buffer.ISOERM;
               if Buffer.UseRegion 
               and then InRegion (Buffer, ScrnCol, ScrnRow) then
                  MaxMove := Buffer.Regn_Base.Col 
                           + Scrn_Col (Buffer.Regn_Size.Col) - 1 - ScrnCol;
               else
                  MaxMove := Buffer.Scrn_Size.Col - 1 - ScrnCol;
               end if;
               MaxMove := Min (Scrn_Col (Ansi.Arg (0)) 
                                 * Width (Buffer, ScrnCol, ScrnRow), 
                               MaxMove);
               EraseStyle.FgColor := Style.FgColor;
               EraseStyle.BgColor := Style.BgColor;
               for Col in ScrnCol .. ScrnCol + MaxMove loop
                  -- preserve size and selection status
                  FillRealCell (
                     Buffer, 
                     Real (Buffer, Col), 
                     RealRow, 
                     ' ', 
                     False, 
                     EraseStyle, 
                     Selective);
               end loop;
               DrawScreenRow (Buffer, ScrnRow);
            end;
   
         when AP.DO_ELE =>
            -- ESC K or ESC [ K or ESC [ 0 K
            declare
               Selective  : Boolean     := False;
               EraseStyle : Real_Cell := Buffer.BlankStyle;
            begin
               EraseStyle.FgColor := Style.FgColor;
               EraseStyle.BgColor := Style.BgColor;
               if Buffer.ISOERM or (Ansi.Arg (0) = 0) then
                  -- selective
                  Selective := True;
               end if;
               for Col in ScrnCol .. Buffer.Scrn_Size.Col - 1 loop
                  -- preserve size and selection status
                  FillRealCell (
                     Buffer, 
                     Real (Buffer, Col), 
                     RealRow, 
                     ' ', 
                     False, 
                     EraseStyle, 
                     Selective);
               end loop;
               DrawScreenRow (Buffer, ScrnRow);
            end;
   
         when AP.DO_ELB =>
            -- ESC [ 1 K
            declare
               Selective  : Boolean     := False;
               EraseStyle : Real_Cell := Buffer.BlankStyle;
            begin
               EraseStyle.FgColor := Style.FgColor;
               EraseStyle.BgColor := Style.BgColor;
               if Buffer.ISOERM or (Ansi.Arg (0) = 0) then
                  -- selective
                  Selective := True;
               end if;
               for Col in 0 .. ScrnCol loop
                  -- preserve size and selection status
                  FillRealCell (
                     Buffer, 
                     Real (Buffer, Col), 
                     RealRow, 
                     ' ', 
                     False, 
                     EraseStyle, 
                     Selective);
               end loop;
               DrawScreenRow (Buffer, ScrnRow);
            end;
   
         when AP.DO_EL =>
            -- ESC [ 2 K
            declare
               Selective  : Boolean := False;
               EraseStyle : Real_Cell := Buffer.BlankStyle;
            begin
               EraseStyle.FgColor := Style.FgColor;
               EraseStyle.BgColor := Style.BgColor;
               if Buffer.ISOERM or (Ansi.Arg (0) = 0) then
                  -- selective
                  Selective := True;
               end if;
               for Col in 0 .. Buffer.Scrn_Size.Col - 1 loop
                  -- preserve size and selection status
                  FillRealCell (
                     Buffer, 
                     Real (Buffer, Col), 
                     RealRow, 
                     ' ', 
                     False, 
                     EraseStyle, 
                     Selective);
               end loop;
               DrawScreenRow (Buffer, ScrnRow);
            end;

         when AP.DO_SGR =>
            -- ESC [ Ps ; ... ; Ps m
            -- Set Graphic Rendition
            case Ansi.Arg (0) is
               when AP.ATTR_RESET =>
                  Style.Bold      := False;
                  if BRIGHT_ON_BOLD_FG then
                     Dim (Style.FgColor);
                  end if;
                  if BRIGHT_ON_BOLD_BG then
                     Dim (Style.BgColor);
                  end if;
                  Style.Italic    := False;
                  Style.Underline := False;
                  Style.Strikeout := False;
                  Style.Inverse   := False;
                  Style.Flashing  := False;
                  Style.FgColor   := Buffer.InitSaveFg;
                  Style.BgColor   := Buffer.InitSaveBg;
               when AP.ATTR_BOLD =>
                  Style.Bold      := True;
                  if BRIGHT_ON_BOLD_FG then
                     Bright (Style.FgColor);
                  end if;
                  if BRIGHT_ON_BOLD_BG then
                     Bright (Style.BgColor);
                  end if;
               when AP.ATTR_UNDER =>
                  Style.Underline := True;
               when AP.ATTR_BLINK =>
                  Style.Flashing  := True;
               when AP.ATTR_NEG =>
                  Style.Inverse   := True;
               when AP.ATTR_INV =>
                  Style.Strikeout := True; -- use strikeout for concealed
               when AP.ATTR_ALL =>
                  Style.Bold      := True;
                  if BRIGHT_ON_BOLD_FG then
                     Bright (Style.FgColor);
                  end if;
                  if BRIGHT_ON_BOLD_BG then
                     Bright (Style.BgColor);
                  end if;
                  Style.Italic    := True;
                  Style.Underline := True;
                  Style.Strikeout := True;
                  Style.Inverse   := True;
                  Style.Flashing  := True;
               when AP.ATTR_NOT + AP.ATTR_BOLD =>
                  Style.Bold      := False;
                  if BRIGHT_ON_BOLD_FG then
                     Dim (Style.FgColor);
                  end if;
                  if BRIGHT_ON_BOLD_BG then
                     Dim (Style.BgColor);
                  end if;
               when AP.ATTR_NOT + AP.ATTR_UNDER =>
                  Style.Underline := False;
               when AP.ATTR_NOT + AP.ATTR_BLINK =>
                  Style.Flashing  := False;
               when AP.ATTR_NOT + AP.ATTR_NEG =>
                  Style.Inverse   := False;
               when AP.ATTR_NOT + AP.ATTR_INV =>
                  Style.Strikeout := False; -- use strikeout for concealed
               when AP.ATTR_NOT + AP.ATTR_ALL =>
                  Style.Bold      := False;
                  if BRIGHT_ON_BOLD_FG then
                     Dim (Style.FgColor);
                  end if;
                  if BRIGHT_ON_BOLD_BG then
                     Dim (Style.BgColor);
                  end if;
                  Style.Italic    := False;
                  Style.Underline := False;
                  Style.Strikeout := False;
                  Style.Inverse   := False;
                  Style.Flashing  := False;
               when others =>
                  null;
            end case;
            
         when AP.DO_SGRF =>
            -- ESC [ Ps ; ... ; Ps m
            -- Set Graphic Rendition Foreground color
            if BRIGHT_ON_BOLD_FG or BRIGHT_ON_BOLD_BG then
               case Ansi.Arg (0) is
                  when 0 =>
                     Style.FgColor := PC_Black;
                  when 1 =>
                     Style.FgColor := PC_Red;
                  when 2 =>
                     Style.FgColor := PC_Green;
                  when 3 =>
                     Style.FgColor := PC_Yellow;
                  when 4 =>
                     Style.FgColor := PC_Blue;
                  when 5 =>
                     Style.FgColor := PC_Magenta;
                  when 6 =>
                     Style.FgColor := PC_Cyan;
                  when 7 =>
                     Style.FgColor := PC_Gray;
                  when 9 =>
                     Style.FgColor := Buffer.InitSaveFg;
                  when others =>
                     null;
               end case;
            else
               case Ansi.Arg (0) is
                  when 0 =>
                     Style.FgColor := Black;
                  when 1 =>
                     Style.FgColor := Red;
                  when 2 =>
                     Style.FgColor := Green;
                  when 3 =>
                     Style.FgColor := Yellow;
                  when 4 =>
                     Style.FgColor := Blue;
                  when 5 =>
                     Style.FgColor := Magenta;
                  when 6 =>
                     Style.FgColor := Cyan;
                  when 7 =>
                     Style.FgColor := White;
                  when 9 =>
                     Style.FgColor := Buffer.InitSaveFg;
                  when others =>
                     null;
               end case;
            end if;
            if BRIGHT_ON_BOLD_FG and Style.Bold then
               Bright (Style.FgColor);
            end if;
            if BRIGHT_ON_BOLD_BG and Style.Bold then
               Bright (Style.BgColor);
            end if;
   
         when AP.DO_SGRB =>
            -- ESC [ Ps ; ... ; Ps m
            -- Set Graphic Rendition Background color
            if BRIGHT_ON_BOLD_FG or BRIGHT_ON_BOLD_BG then
               case Ansi.Arg (0) is
                  when 0 =>
                     Style.BgColor := PC_Black;
                  when 1 =>
                     Style.BgColor := PC_Red;
                  when 2 =>
                     Style.BgColor := PC_Green;
                  when 3 =>
                     Style.BgColor := PC_Yellow;
                  when 4 =>
                     Style.BgColor := PC_Blue;
                  when 5 =>
                     Style.BgColor := PC_Magenta;
                  when 6 =>
                     Style.BgColor := PC_Cyan;
                  when 7 =>
                     Style.BgColor := PC_Gray;
                  when 9 =>
                     Style.BgColor := Buffer.InitSaveBg;
                  when others =>
                     null;
               end case;
            else
               case Ansi.Arg (0) is
                  when 0 =>
                     Style.BgColor := Black;
                  when 1 =>
                     Style.BgColor := Red;
                  when 2 =>
                     Style.BgColor := Green;
                  when 3 =>
                     Style.BgColor := Yellow;
                  when 4 =>
                     Style.BgColor := Blue;
                  when 5 =>
                     Style.BgColor := Magenta;
                  when 6 =>
                     Style.BgColor := Cyan;
                  when 7 =>
                     Style.BgColor := White;
                  when 9 =>
                     Style.BgColor := Buffer.InitSaveBg;
                  when others =>
                     null;
               end case;
            end if;
            if BRIGHT_ON_BOLD_FG and Style.Bold then
               Bright (Style.FgColor);
            end if;
            if BRIGHT_ON_BOLD_BG and Style.Bold then
               Bright (Style.BgColor);
            end if;
   
         when AP.DO_DECSCA =>
            -- ESC [ Ps " q
            -- Selective Erase attribute
            case Ansi.Arg (0) is
               when 0 =>
                  Style.Erasable := True;
               when 1 =>
                  Style.Erasable := False;
               when 2 =>
                  Style.Erasable := True;
               when others =>
                  null;
            end case;
   
         when AP.DO_DOSRC =>
            -- ESC [ u
            -- in PC mode, this means restore cursor
            if  Buffer.PcCursSaved
            and Buffer.PcSaveCurs.Row < Buffer.Scrn_Size.Row
            and Buffer.PcSaveCurs.Col < Buffer.Scrn_Size.Col then
               ScrnRow := Buffer.PcSaveCurs.Row;
               ScrnCol := Buffer.PcSaveCurs.Col;
            end if;
   
         when AP.DO_DOSSM =>
            -- ESC [ = Ps h (private standard)
            case Ansi.Arg (0) is
               when 0 =>
                  -- 40*25 B&W;
                  Buffer.PcSaveSize := Buffer.Scrn_Size;
                  Buffer.PcSizeSaved := True;
                  Style.FgColor := White;
                  Style.BgColor := Black;
                  InitializeScreenColors (Buffer, White, Black);
                  ResizeScreen (Buffer, 40, 25, SetView => True);
                  Home (Buffer, ScrnCol, ScrnRow);
               when 1 =>
                  -- 40*25 Color;
                  Buffer.PcSaveSize := Buffer.Scrn_Size;
                  Buffer.PcSizeSaved := True;
                  ResizeScreen (Buffer, 40, 25, SetView => True);
                  Home (Buffer, ScrnCol, ScrnRow);
               when 2 =>
                  -- 80*25 B&W;
                  Buffer.PcSaveSize := Buffer.Scrn_Size;
                  Buffer.PcSizeSaved := True;
                  Style.FgColor := White;
                  Style.BgColor := Black;
                  InitializeScreenColors (Buffer, White, Black);
                  ResizeScreen (Buffer, 80, 25, SetView => True);
                  Home (Buffer, ScrnCol, ScrnRow);
               when 3 =>
                  -- 80*25 Color;
                  Buffer.PcSaveSize := Buffer.Scrn_Size;
                  Buffer.PcSizeSaved := True;
                  ResizeScreen (Buffer, 80, 25, SetView => True);
                  Home (Buffer, ScrnCol, ScrnRow);
               when 7 =>
                  Buffer.WrapOn := True;
               when others =>
                  null; -- graphics modes not implemented
            end case;
   
         when AP.DO_DOSRM =>
            -- ESC [ = Ps l (private standard)
            case Ansi.Arg (0) is
               when 0 =>
                  -- 40*25 B&W;
                  if Buffer.PcSizeSaved then
                     ResizeScreen (
                        Buffer,
                        Natural (Buffer.PcSaveSize.Col),
                        Natural (Buffer.PcSaveSize.Row),
                        SetView => True);
                     Home (Buffer, ScrnCol, ScrnRow);
                  end if;
               when 1 =>
                  -- 40*25 Color;
                  if Buffer.PcSizeSaved then
                     ResizeScreen (
                        Buffer,
                        Natural (Buffer.PcSaveSize.Col),
                        Natural (Buffer.PcSaveSize.Row),
                        SetView => True);
                     Home (Buffer, ScrnCol, ScrnRow);
                  end if;
               when 2 =>
                  -- 80*25 B&W;
                  if Buffer.PcSizeSaved then
                     ResizeScreen (
                        Buffer,
                        Natural (Buffer.PcSaveSize.Col),
                        Natural (Buffer.PcSaveSize.Row),
                        SetView => True);
                     Home (Buffer, ScrnCol, ScrnRow);
                  end if;
               when 3 =>
                  -- 80*25 Color;
                  if Buffer.PcSizeSaved then
                     ResizeScreen (
                        Buffer,
                        Natural (Buffer.PcSaveSize.Col),
                        Natural (Buffer.PcSaveSize.Row),
                        SetView => True);
                     Home (Buffer, ScrnCol, ScrnRow);
                  end if;
               when 7 =>
                  Buffer.WrapOn := False;
               when others =>
                  null; -- graphics modes not implemented
            end case;
   
         when AP.DO_DECAWM =>
            -- ESC [ ? 7 h or ESC [ ? 7 l (private standard)
            if Ansi.Arg (0) = 0 then
               -- ESC [ ? 7 l
               Buffer.WrapOn := False;
            else
               -- ESC [ ? 7 h
               Buffer.WrapOn := True;
            end if;
   
         when AP.DO_DA1 =>
            -- ESC [ c or ESC [ 0 c or ESC Z
            --
            -- vt52 ESC / Z
            --
            -- vt100 da esc [ ? 1; 2 c vt100  
            -- vt101 da esc [ ? 1; 0 c vt101  
            -- vt102 da esc [ ? 6 c vt102  
            -- vt220 da* csi ? 62; 1; 2; 6; 7; 8; 9 c vt220  
            -- vt320 da* csi ? 63; 1; 2; 6; 7; 8; 9 c vt320  
            -- vt420 da* csi ? 64; 1; 2; 6; 7; 8; 9; 15; 18; 19; 21 c vt420
            -- 1 = 132 columns. 
            -- 2 = printer port. 
            -- 6 = selective erase. 
            -- 7 = soft character set. 
            -- 8 = user-defined keys. 
            -- 9 = nrc sets. 
            -- 15 = dec technical set. 
            -- 18 = user windows. 
            -- 19 = two sessions. 
            -- 21 = horizontal scrolling.
            case Buffer.AnsiMode is
               when VT52 =>
                  SendString (
                     Buffer, 
                     ASCII.ESC & "/Z", 
                     Sent); -- ANSI/VT52 mode identifier
               when VT100 =>
                  SendString (
                     Buffer, 
                     AP.CSI (Buffer.BitMode) & "?1;2c", 
                     Sent); -- vt100 (with AVO)
               when VT101 =>
                  SendString (
                     Buffer, 
                     AP.CSI (Buffer.BitMode) & "?1;0c", 
                     Sent);
               when VT102 =>
                  SendString (
                     Buffer, 
                     AP.CSI (Buffer.BitMode) & "?6c", 
                     Sent);
               when VT220 =>
                  -- say we're a VT220, but only specify the advanced options
                  -- we do actually support - this may mean some programs don't
                  -- recognize us as a VT220, but that's probably correct - 
                  -- they would then expect us to be able to do all the VT220
                  -- functions.
                  SendString (
                     Buffer, 
                     AP.CSI (Buffer.BitMode) & "?62;1;2;6;8;9c", 
                     Sent);
               when VT320 =>
                  -- say we're a VT320, but only specify the advanced options
                  -- we do actually support - this may mean some programs don't
                  -- recognize us as a VT320, but that's probably correct - 
                  -- they would then expect us to be able to do all the VT320
                  -- functions.
                  SendString (
                     Buffer, 
                     AP.CSI (Buffer.BitMode) & "?63;1;2;6;8;9c", 
                     Sent);
               when VT420 =>
                  -- say we're a VT420, but only specify the advanced options
                  -- we do actually support - this may mean some programs don't
                  -- recognize us as a VT420, but that's probably correct - 
                  -- they would then expect us to be able to do all the VT420
                  -- functions.
                  SendString (
                     Buffer, 
                     AP.CSI (Buffer.BitMode) & "?64;1;2;6;8;9c", 
                     Sent);
               when others =>
                  -- must be PC mode => just say we're a VT100
                  SendString (
                     Buffer, 
                     AP.CSI (Buffer.BitMode) & "?1;2c", 
                     Sent); -- vt100 (with AVO)
            end case;
   
         when AP.DO_DA2 =>
            -- ESC [ > c or ESC [ > 0 c
            SendString (
               Buffer, 
               AP.CSI (Buffer.BitMode) & ">1;10;0c", 
               Sent); -- vt220 version 1.0 no options
   
         when AP.DO_DA3 =>
            -- ESC [ = c or ESC [ = 0 c
            SendString (
               Buffer, 
               AP.DCS (Buffer.BitMode) & "!|000" & AP.ST (Buffer.BitMode), 
               Sent); -- Unit ID = 000
   
         when AP.DO_DECCOLM =>
            -- ESC [ ? 3 h or ESC [ ? 3 l
            -- DEC Column Mode
            if Ansi.Arg (0) = 0 then
               -- ESC[ ? 3 l
               -- 80 column
               ResizeScreen (
                  Buffer, 
                  80, 
                  Natural (Buffer.Scrn_Size.Row), 
                  SetView => True);
               -- automatically enable the horizontal scroll bar if needed
               if Buffer.View_Size.Col /= 80 then
                  HorizontalScrollbar (Buffer, Yes);
                  ResizeClientArea (Buffer);
               end if;
            else
               -- ESC[ ? 3 h
               -- 132 column
               ResizeScreen (
                  Buffer, 
                  132, 
                  Natural (Buffer.Scrn_Size.Row), 
                  SetView => True);
               -- automatically enable the horizontal scroll bar if needed
               if Buffer.View_Size.Col /= 132 then
                  HorizontalScrollbar (Buffer, Yes);
                  ResizeClientArea (Buffer);
               end if;
            end if;
            Buffer.Regn_Base := (0, 0);
            Buffer.Regn_Size := (Regn_Col (Buffer.Scrn_Size.Col), 
                                 Regn_Row (Buffer.Scrn_Size.Row));
            ClearScreenBuffer (Buffer);
            Home (Buffer, ScrnCol, ScrnRow);
            UpdateScrollPositions (Buffer);
            DrawView (Buffer);
   
         when AP.DO_DECSCLM =>
            -- ESC [ ? 4 h or ESC [ ? 4 l
            -- DEC Smooth Scroll Mode
            if Ansi.Arg (0) = 0 then
               -- ESC [ ? 4 l
               -- jump scroll
               Buffer.SmoothScroll := False;
            else
               -- ESC [ ? 4 h
               -- smooth scroll
               Buffer.SmoothScroll := True;
            end if;
   
         when AP.DO_DECSCNM =>
            -- ESC [ ? 5 h or ESC [ ? 5 l
            if Ansi.Arg (0) = 0 then
               -- ESC [ ? 5 l
               -- screen normal
               if Buffer.FgBgReverse then
                  Buffer.FgBgReverse := False;
                  InvertScreenColors (Buffer);
                  declare
                     FgColor : Color_Type;
                     BgColor : Color_Type;
                  begin
                     FgColor := Style.FgColor;
                     BgColor := Style.BgColor;
                     Style.FgColor := BgColor;
                     Style.BgColor := FgColor;
                     FgColor := Buffer.BlankStyle.FgColor;
                     BgColor := Buffer.BlankStyle.BgColor;
                     Buffer.BlankStyle.FgColor := BgColor;
                     Buffer.BlankStyle.BgColor := FgColor;
                  end;
                  DrawScreen (Buffer);
               end if;
            else
               -- ESC [ ? 5 h
               -- screen reverse
               if not Buffer.FgBgReverse then
                  Buffer.FgBgReverse := True;
                  InvertScreenColors (Buffer);
                  declare
                     FgColor : Color_Type;
                     BgColor : Color_Type;
                  begin
                     FgColor := Style.FgColor;
                     BgColor := Style.BgColor;
                     Style.FgColor := BgColor;
                     Style.BgColor := FgColor;
                     FgColor := Buffer.BlankStyle.FgColor;
                     BgColor := Buffer.BlankStyle.BgColor;
                     Buffer.BlankStyle.FgColor := BgColor;
                     Buffer.BlankStyle.BgColor := FgColor;
                  end;
                  DrawScreen (Buffer);
               end if;
            end if;
   
         when AP.DO_DECOM =>
            -- ESC [ ? 6 h or ESC [ ? 6 l
            -- DEC Origin Mode
            if Ansi.Arg (0) = 0 then
               -- ESC [ ? 6 l
               -- absolute origin mode
               Buffer.DECOM := False;
            else
               -- ESC [ ? 6 h
               -- relative origin mode
               Buffer.DECOM := True;
               -- make sure current region is valid
               if  Buffer.Regn_Size.Col < 1 
               or  Buffer.Regn_Size.Row < 2
               or  Buffer.Regn_Base.Col + Scrn_Col (Buffer.Regn_Size.Col) 
                 > Buffer.Scrn_Size.Col
               or  Buffer.Regn_Base.Row + Scrn_Row (Buffer.Regn_Size.Row) 
                 > Buffer.Scrn_Size.Row
               then
                  -- region not valid - set region to full screen
                  Buffer.Regn_Base := (0, 0);
                  Buffer.Regn_Size := (Regn_Col (Buffer.Scrn_Size.Col), 
                                       Regn_Row (Buffer.Scrn_Size.Row));
               end if;
            end if;
            Home (Buffer, ScrnCol, ScrnRow);
   
         when AP.DO_DECINLM =>
            -- ESC [ ? 9 l
            -- interlace
            null;
   
         when AP.DO_LNM =>
            -- ESC [ 20 h or ESC [ 20 l
            if Ansi.Arg (0) = 0 then
               -- ESC [ 20 l
               -- received LF does not imply CR:
               Buffer.CRonLF := False;
               -- return CR on "Enter":
               Buffer.LFonCR := False;
            else
               -- ESC [ 20 h
               -- received LF does implicit CR:
               Buffer.CRonLF := True;
               -- return CRLF on "Enter":
               Buffer.LFonCR := True;
            end if;
   
         when AP.DO_DECALN =>
            for Col in 0 .. Buffer.Scrn_Size.Col - 1 loop
               for Row in 0 .. Buffer.Scrn_Size.Row - 1 loop
                  Buffer.Real_Buffer (Real (Buffer, Col), Real (Buffer, Row))
                     := Style;
                  if Bits ('E', Buffer.GLSet, Buffer.GRSet) then
                     Buffer.Real_Buffer (Real (Buffer, Col), 
                                         Real (Buffer, Row)).Bits := True;
                     Buffer.Real_Buffer (Real (Buffer, Col), 
                                         Real (Buffer, Row)).Char := 'E';
                  else
                     Buffer.Real_Buffer (Real (Buffer, Col), 
                                         Real (Buffer, Row)).Bits := False;
                     Buffer.Real_Buffer (Real (Buffer, Col), 
                                         Real (Buffer, Row)).Char 
                        := Char ('E', Buffer.GLSet, Buffer.GRSet);
                  end if;
                  -- TBD : this seems to be required for VTTEST compatibility
                  Buffer.Real_Buffer (Real (Buffer, Col), 
                                      Real (Buffer, Row)).Erasable := True;
               end loop;
            end loop;
            DrawScreen (Buffer);
   
         when AP.DO_DECSTBM =>
            -- ESC [ Pn ; Pn r or ESC [ r
            -- Set Top and Bottom Margin.
            -- Note that once set, there is no way to reset
            -- the Region flag via a control sequence, except
            -- by  doing a hard reset.
            if Ansi.Arg (0) < Ansi.Arg (1) then
               Buffer.Regn_Base.Col := 0;
               if Ansi.Arg (0) > 0 
               and Ansi.Arg (0) <= Natural (Buffer.Scrn_Size.Row) then
                  Buffer.Regn_Base.Row := Scrn_Row (Ansi.Arg (0)) - 1;
               else
                  Buffer.Regn_Base.Row := 0;
               end if;
               Buffer.Regn_Size.Col := Regn_Col (Buffer.Scrn_Size.Col);
               if Ansi.Arg (1) > 1 
               and Ansi.Arg (1) <= Natural (Buffer.Scrn_Size.Row) then
                  Buffer.Regn_Size.Row 
                     := Regn_Row (Ansi.Arg (1) 
                      - Natural (Buffer.Regn_Base.Row));
               else
                  Buffer.Regn_Size.Row 
                     := Regn_Row (Natural (Buffer.Scrn_Size.Row) 
                      - Natural (Buffer.Regn_Base.Row));
               end if;
            else
               Buffer.Regn_Base := (0, 0);
               Buffer.Regn_Size := (Regn_Col (Buffer.Scrn_Size.Col), 
                                    Regn_Row (Buffer.Scrn_Size.Row));
            end if;
            Buffer.UseRegion := True;
            Home (Buffer, ScrnCol, ScrnRow);
            DrawView (Buffer);
   
         when AP.DO_HTS =>
            -- ESC H or ESC [ H (VT100 mode)
            Buffer.TabStops (Natural (ScrnCol)) := True;
   
         when AP.DO_TBC =>
            -- ESC [ 0 g
            Buffer.TabStops (Natural (ScrnCol)) := False;
   
         when AP.DO_TBCALL =>
            -- ESC [ 3 g
            for Col in 0 .. MAX_COLUMNS - 1 loop
               Buffer.TabStops (Col) := False;
            end loop;
   
         when AP.DO_DECSC =>
            -- ESC 7
            Buffer.AnsiCursSaved := True;
            Buffer.AnsiSaveCurs  := (ScrnCol, ScrnRow);
            Buffer.AnsiSaveStyle := Style;
            Buffer.AnsiSaveMode  := Buffer.DECOM;
            Buffer.AnsiSaveWrap  := Buffer.WrapOn;
            Buffer.AnsiSaveGLSet := Buffer.GLSet;
            Buffer.AnsiSaveGLNum := Buffer.GLNum;
            Buffer.AnsiSaveGRSet := Buffer.GRSet;
            Buffer.AnsiSaveGRNum := Buffer.GRNum;
   
         when AP.DO_DECST8C =>
            -- ESC [ ? 5 W
            SetDefaultTabStops (Buffer, 8);
   
         when AP.DO_DECRC =>
            -- ESC 8
            if  Buffer.AnsiCursSaved
            and Buffer.AnsiSaveCurs.Row < Buffer.Scrn_Size.Row
            and Buffer.AnsiSaveCurs.Col < Buffer.Scrn_Size.Col then
               ScrnRow   := Buffer.AnsiSaveCurs.Row;
               ScrnCol   := Buffer.AnsiSaveCurs.Col;
               Style     := Buffer.AnsiSaveStyle;
               Buffer.WrapOn    := Buffer.AnsiSaveWrap;
               Buffer.DECOM     := Buffer.AnsiSaveMode;
               Buffer.GLSet     := Buffer.AnsiSaveGLSet;
               Buffer.GLNum     := Buffer.AnsiSaveGLNum;
               Buffer.GRSet     := Buffer.AnsiSaveGRSet;
               Buffer.GRNum     := Buffer.AnsiSaveGRNum;
            else
               Buffer.DECOM  := False;
               Home (Buffer, ScrnCol, ScrnRow);
               Style  := Buffer.BlankStyle;
               Buffer.WrapOn := False;
            end if;
   
         when AP.DO_SCS =>
            -- ESC ( Dscs or ESC ) Dscs or ESC * Dscs or ESC + Dscs
            if Ansi.Arg (0) = 0 then
               -- ESC ( Dscs
               -- G0 set
               SelectCharacterSet (
                  Buffer, 
                  Buffer.G0Set, 
                  Ansi.Arg (0), 
                  Ansi.Arg (2));
            elsif Ansi.Arg (0) = 1 then
               -- ESC ) Dscs
               -- G1 set
               SelectCharacterSet (
                  Buffer, 
                  Buffer.G1Set, 
                  Ansi.Arg (0), 
                  Ansi.Arg (2));
            elsif Ansi.Arg (0) = 2 then
               -- ESC * Dscs
               -- G2 set
               SelectCharacterSet (
                  Buffer, 
                  Buffer.G2Set, 
                  Ansi.Arg (0), 
                  Ansi.Arg (2));
            elsif Ansi.Arg (0) = 3 then
               -- ESC + Dscs
               -- G3 set
               SelectCharacterSet (
                  Buffer, 
                  Buffer.G3Set, 
                  Ansi.Arg (0), 
                  Ansi.Arg (2));
            end if;
   
         when AP.DO_DECDHL =>
            -- ESC # 3 or ESC # 4
            if Ansi.Arg (0) = 0 then
               -- ESC # 4 (double height bottom half)
               DoubleWidthLine (Buffer, ScrnCol, ScrnRow, Double_Height_Lower);
            else
               -- ESC # 3 (double height top half)
               DoubleWidthLine (Buffer, ScrnCol, ScrnRow, Double_Height_Upper);
            end if;
            DrawScreenRow (Buffer, ScrnRow);
   
         when AP.DO_DECLW =>
            -- ESC # 5 or ESC # 6
            if Ansi.Arg (0) = 0 then
               -- ESC # 5 (single width)
               SingleWidthLine (Buffer, ScrnCol, ScrnRow);
            else
               -- ESC # 6 (double width)
               DoubleWidthLine (Buffer, ScrnCol, ScrnRow);
            end if;
            DrawScreenRow (Buffer, ScrnRow);
   
         when AP.DO_IL =>
            -- ESC [ Pn L
            if InRegion (Buffer, ScrnCol, ScrnRow) then
               declare
                  SavedRegion : Boolean   := Buffer.UseRegion;
                  SavedBase   : Scrn_Pos  := Buffer.Regn_Base;
                  SavedSize   : Regn_Pos  := Buffer.Regn_Size;
                  FillStyle   : Real_Cell := Buffer.BlankStyle;
               begin
                  -- temporarily set region size to be from
                  -- the cursor position to region end, and
                  -- then scroll within region
                  FillStyle.FgColor := Style.FgColor;
                  FillStyle.BgColor := Style.BgColor;
                  Buffer.UseRegion     := True;
                  Buffer.Regn_Size.Row 
                     := Buffer.Regn_Size.Row 
                      - Regn_Row (ScrnRow - Buffer.Regn_Base.Row);
                  Buffer.Regn_Base.Row := ScrnRow;
                  ShiftDown (
                     Buffer,
                     FillStyle, 
                     Natural'Min (Ansi.Arg (0), 
                     Natural (Buffer.Regn_Size.Row)));
                  Buffer.UseRegion := SavedRegion;
                  Buffer.Regn_Base := SavedBase;
                  Buffer.Regn_Size := SavedSize;
                  Home (Buffer, ScrnCol);
               end;
            end if;
   
         when AP.DO_DL =>
            -- ESC [ Pn M
            if InRegion (Buffer, ScrnCol, ScrnRow) then
               declare
                  SavedRegion : Boolean   := Buffer.UseRegion;
                  SavedBase   : Scrn_Pos  := Buffer.Regn_Base;
                  SavedSize   : Regn_Pos  := Buffer.Regn_Size;
                  FillStyle   : Real_Cell := Buffer.BlankStyle;
               begin
                  FillStyle.FgColor := Style.FgColor;
                  FillStyle.BgColor := Style.BgColor;
                  -- temporarily set region size to be from
                  -- the cursor position to region end, and
                  -- then scroll within region
                  Buffer.UseRegion     := True;
                  Buffer.Regn_Size.Row 
                     := Buffer.Regn_Size.Row 
                      - Regn_Row (ScrnRow - Buffer.Regn_Base.Row);
                  Buffer.Regn_Base.Row := ScrnRow;
                  ShiftUp (
                     Buffer,
                     FillStyle, 
                     Natural'Min (Ansi.Arg (0), 
                     Natural (Buffer.Regn_Size.Row)));
                  Buffer.UseRegion := SavedRegion;
                  Buffer.Regn_Base := SavedBase;
                  Buffer.Regn_Size := SavedSize;
                  Home (Buffer, ScrnCol);
               end;
            end if;
   
         when AP.DO_ICH =>
            -- ESC [ Pn @
            -- Insert Character
            declare
               Col   : Scrn_Col := ScrnCol;
               Count : Natural := Ansi.Arg (0);
            begin
               if DoubleWidth (Buffer, ScrnCol, ScrnRow) then
                  Col := Col / 2;
               end if;
               if Buffer.UseRegion 
               and then InRegion (Buffer, ScrnCol, ScrnRow) then
                  Count := Natural'Min (
                     Count, 
                     Natural (Buffer.Regn_Size.Col - Regn (Buffer, ScrnCol)));
                  for i in 1 .. Count loop
                     for RegnCol in 
                     reverse Regn (Buffer, Col) .. Buffer.Regn_Size.Col - 2 loop
                        MoveRegnCell (
                           Buffer, 
                           RegnCol, 
                           Regn (Buffer, ScrnRow), 
                           RegnCol + 1, 
                           Regn (Buffer, ScrnRow));
                     end loop;
                     FillRegnCell (
                        Buffer, 
                        Regn (Buffer, Col), 
                        Regn (Buffer, ScrnRow),
                        ' ', 
                        False,
                        Buffer.BlankStyle);
                  end loop;
               else
                  Count := Natural'Min (
                     Count, 
                     Natural (Buffer.Scrn_Size.Col - ScrnCol));
                  for i in 1 .. Count loop
                     for ScrnCol in reverse Col .. Buffer.Scrn_Size.Col - 2 loop
                        MoveScrnCell (
                           Buffer, 
                           ScrnCol, 
                           ScrnRow, 
                           ScrnCol + 1, 
                           ScrnRow);
                     end loop;
                     FillScrnCell (
                        Buffer, 
                        Col, 
                        ScrnRow,
                        ' ', 
                        False,
                        Buffer.BlankStyle);
                  end loop;
               end if;
               DrawScreenRow (Buffer, ScrnRow);
            end;
   
         when AP.DO_DCH =>
            -- ESC [ Pn P
            -- Delete Character
            declare
               Col   : Scrn_Col := ScrnCol;
               Count : Natural  := Ansi.Arg (0);
            begin
               if DoubleWidth (Buffer, ScrnCol, ScrnRow) then
                  Col := Col / 2;
               end if;
               if Buffer.UseRegion 
               and then InRegion (Buffer, ScrnCol, ScrnRow) then
                  Count := Natural'Min (
                     Count, 
                     Natural (Buffer.Regn_Size.Col - Regn (Buffer, ScrnCol)));
                  for i in 1 .. Count loop
                     for RegnCol 
                     in Regn (Buffer, Col) .. Buffer.Regn_Size.Col - 2 loop
                        MoveRegnCell (
                           Buffer, RegnCol + 1, 
                           Regn (Buffer, ScrnRow), 
                           RegnCol, 
                           Regn (Buffer, ScrnRow));
                     end loop;
                     FillRegnCell (
                        Buffer, 
                        Buffer.Regn_Size.Col - 1, 
                        Regn (Buffer, ScrnRow),
                        ' ', 
                        False,
                        Buffer.BlankStyle);
                  end loop;
               else
                  Count := Natural'Min (
                     Count, 
                     Natural (Buffer.Scrn_Size.Col - ScrnCol));
                  for i in 1 .. Count loop
                     for ScrnCol in Col .. Buffer.Scrn_Size.Col - 2 loop
                        MoveScrnCell (
                           Buffer, 
                           ScrnCol + 1, 
                           ScrnRow, 
                           ScrnCol, 
                           ScrnRow);
                     end loop;
                     FillScrnCell (
                        Buffer, 
                        Buffer.Scrn_Size.Col - 1, 
                        ScrnRow,
                        ' ', 
                        False,
                        Buffer.BlankStyle);
                  end loop;
               end if;
               DrawScreenRow (Buffer, ScrnRow);
            end;
   
         when AP.DO_DECTCEM =>
            -- ESC [ ? 25 h or ESC ? 25 l
            if Ansi.Arg(0) = 0 then
               -- ESC [ ? 25 l
               -- cursor not visible
               Buffer.CursVisible := False;
            else
               -- ESC [ ? 25 h
               -- cursor visible
               Buffer.CursVisible := True;
            end if;
   
         when AP.DO_VTMODE =>
            -- ESC [ ? 2 l or ESC ? 2 h or ESC <
            -- or ESC [ " 61 p or ESC [ " 62 p or ESC [" 63 p or ESC [ " 64 p
            if Ansi.Arg (0) = AP.VT52 then
               -- ESC [ 2 l
               Buffer.AnsiMode := VT52;
               AP.SwitchParserMode (Buffer.AnsiParser, AP.VT52);
               AnsiReset (Buffer, ScrnCol, ScrnRow, Style);
            elsif Ansi.Arg(0) =  AP.VT100 then
               -- ESC < or ESC [ " 60 p
               Buffer.AnsiMode := VT100;
               AP.SwitchParserMode (Buffer.AnsiParser,  AP.VT100);
               AnsiReset (Buffer, ScrnCol, ScrnRow, Style);
            elsif Ansi.Arg(0) =  AP.VT420 then
               -- ESC [ 2 h
               -- or ESC [ " 6n p 
               -- or ESC [ " 6n; 0 p 
               -- or ESC [ " 6n ; 1 p 
               -- or ESC [ " 6n ; 2 p
               -- set mode to base Ansi mode - could be any mode !!!!
               if Buffer.AnsiMode /= Buffer.AnsiBase then
                  Buffer.AnsiMode := Buffer.AnsiBase;
                  AP.SwitchParserMode (Buffer.AnsiParser,  AP.VT420);
               end if;
               if Ansi.Arg (1) =  AP.VT7BIT then
                  Buffer.BitMode := False;
                  AP.SwitchParserMode (Buffer.AnsiParser,  AP.VT7BIT);
               elsif Ansi.Arg (1) =  AP.VT8BIT then
                  Buffer.BitMode := True;
                  AP.SwitchParserMode (Buffer.AnsiParser,  AP.VT8BIT);
               end if;
               AnsiReset (Buffer, ScrnCol, ScrnRow, Style);
            elsif Ansi.Arg (0) =  AP.VT7BIT then
               -- ESC sp F or ESC " 1 p
                  Buffer.BitMode := False;
               AP.SwitchParserMode (Buffer.AnsiParser,  AP.VT7BIT);
               AnsiReset (Buffer, ScrnCol, ScrnRow, Style);
            elsif Ansi.Arg (0) =  AP.VT8BIT then
               -- ESC sp G or or ESC " 0 p or ESC " 2 p
                  Buffer.BitMode := True;
               AP.SwitchParserMode (Buffer.AnsiParser,  AP.VT8BIT);
               AnsiReset (Buffer, ScrnCol, ScrnRow, Style);
            end if;
   
         when AP.DO_ANSICONF =>
            if Ansi.Arg (0) =  1 then
               -- ESC sp L
               -- TBD:
               null;
            elsif Ansi.Arg (0) =  2 then
               -- ESC sp M
               -- TBD:
               null;
            elsif Ansi.Arg (0) =  3 then
               -- ESC sp N
               -- TBD:
               null;
            end if;
   
         when AP.DO_DECPCTERM =>
            -- ESC [ code ; string ; ... p
            -- TBD:
            null;
   
         when AP.DO_DECCKM =>
            -- ESC [ ? 1 h or ESC ? 1 l
            if Ansi.Arg(0) = 0 then
               -- ESC [ ? 1 l
               -- cursor keys to generate ANSI cursor control sequences
               Buffer.DECCKM := False;
            else
               -- ESC [ ? 1 h
               -- cursor keys generate application control sequences
               Buffer.DECCKM := True;
            end if;
   
         when AP.DO_DECNKM =>
            -- ESC = or ESC > or ESC [ ? B h or ESC ? B l
            if Ansi.Arg(0) = 0 then
               -- ESC > or ESC [ ? B l
               -- numeric keypad generate numeric codes
               Buffer.DECNKM := False;
            else
               -- ESC = or ESC [ ? B h
               -- numeric keypad generate application control sequences
               Buffer.DECNKM := True;
            end if;
   
         when AP.DO_DECKPM =>
            -- ESC [ ? a h or ESC ? a l
            if Ansi.Arg(0) = 0 then
               -- ESC [ ? a l
               -- send character codes
               -- TBD: Not implemented yet
               Buffer.DECKPM := False;
            else
               -- ESC [ ? a h
               -- send key position reports
               -- TBD: Not implemented yet
               Buffer.DECKPM := True;
            end if;
   
         when AP.DO_CRM =>
            -- [ 3 h or ESC 3 l
            if Ansi.Arg(0) = 0 then
               -- ESC [ 3 l
               -- Control codes executed.
               -- Note that since CRM mode disables ANSI processing,
               -- we never receive this code in practice - Instead,
               -- CRM mode must be disabled by manually re-enabling
               -- ANSI processing.
               Buffer.DECCRM := False;
            else
               -- ESC [ 3 h
               -- Control codes displayed
               -- Note : a true VT100 can only change this from setup.
               -- Since we have to disable ANSI processing, there is
               -- no way to actually disable CRM mode except by
               -- manually re-enabling ANSI processing.
               Buffer.DECCRM       := True;
               Buffer.AnsiOnInput  := False;
               Buffer.AnsiOnOutput := False;
               Buffer.GLSet        := DEC_CONTROL;
               Buffer.GRSet        := DEC_CONTROL;
               Buffer.SingleShift  := False;
            end if;
   
         when AP.DO_DECARM =>
            -- [ ? 8 h or ESC ? 8 l
            if Ansi.Arg(0) = 0 then
               -- ESC [ ? 8 l
               -- do not allow keys to repeat
               Buffer.KeyRepeatOn := False;
            else
               -- ESC [ ? 8 h
               -- allow keys to repeat
               Buffer.KeyRepeatOn := True;
            end if;
   
         when AP.DO_DSROS =>
            -- ESC [ 5 n
            -- respond with DSR  (ESC [ Pn n)
            SendString (
               Buffer, 
               AP.CSI (Buffer.BitMode) & "0n", 
               Sent); -- no malfunction
   
         when AP.DO_DSRCPR =>
            -- ESC [ 6 n
            -- respond with CPR (ESC Pn ; Pn R)
            declare
               use Ada.Strings;
               use Ada.Strings.Fixed;
   
               Row : Natural := 0;
               Col : Natural := 0;
            begin
               if Buffer.DECOM then
                  -- relative origin mode
                  if  ScrnCol in Buffer.Regn_Base.Col 
                  .. Buffer.Regn_Base.Col + Scrn_Col (Buffer.Regn_Size.Col) - 1
                  and ScrnRow in Buffer.Regn_Base.Row 
                  .. Buffer.Regn_Base.Row + Scrn_Row (Buffer.Regn_Size.Row) - 1
                  then
                     Col := (Natural (ScrnCol - Buffer.Regn_Base.Col)
                          / Natural (Width (Buffer, ScrnCol, ScrnRow))) + 1;
                     Row := Natural (ScrnRow - Buffer.Regn_Base.Row) + 1;
                  end if;
               else
                  -- absolute origin mode
                  Col := (Natural (ScrnCol) 
                          / Natural (Width (Buffer, ScrnCol, ScrnRow)))
                       + 1;
                  Row := Natural (ScrnRow) + 1;
               end if;
               SendString (
                  Buffer, 
                  AP.CSI (Buffer.BitMode) & 
                     Trim (Natural'Image (Row), Both) & ";" & 
                     Trim (Natural'Image (Col), Both) & "R",
                  Sent);
            end;
   
         when AP.DO_DECLL =>
            -- ESC [ 0 q or ESC [ q or ESC [ (1 .. 4) q
            declare
               L1Text : String (1 ..3) := "   ";
               L2Text : String (1 ..3) := "   ";
               L3Text : String (1 ..3) := "   ";
               L4Text : String (1 ..3) := "   ";
            begin
               if Ansi.Arg (0) = 0 then
                  -- all LEDs off
                  Buffer.LED1 := False;
                  Buffer.LED2 := False;
                  Buffer.LED3 := False;
                  Buffer.LED4 := False;
               elsif Ansi.Arg (0) = 1 then
                  Buffer.LED1 := True;
               elsif Ansi.Arg (0) = 2 then
                  Buffer.LED2 := True;
               elsif Ansi.Arg (0) = 3 then
                  Buffer.LED3 := True;
               elsif Ansi.Arg (0) = 4 then
                  Buffer.LED4 := True;
               end if;
               if Buffer.LED1 then
                  L1Text := "L1 ";
               end if;
               if Buffer.LED2 then
                  L2Text := "L2 ";
               end if;
               if Buffer.LED3 then
                  L3Text := "L3 ";
               end if;
               if Buffer.LED4 then
                  L4Text := "L4 ";
               end if;
               Buffer.LEDText := To_Unbounded (
                  To_GString (L1Text & L2Text & L3Text & L4Text));
               Sizable_Panels.Text (
                  Buffer.Panel, 
                  To_GString (Buffer.TitleText) & " " 
                     & To_GString (Buffer.LEDText));
            end;
   
         when AP.DO_DECREQTPARM =>
            -- ESC [ x or ESC [ 0 x or ESC 1 x
            if Ansi.Arg (0) = 0 then
               SendString (Buffer, 
                  AP.CSI (Buffer.BitMode) &
                  "2;"&          -- this is a report, may report unsolicited
                  "1;" &         -- no parity
                  CharBits (Buffer) & ";" &  -- bits per character
                  "120;" &       -- xspeed
                  "120;" &       -- rspeed
                  "1;" &         -- clock multiplier
                  "0" &          -- flags
                  "x",
                  Sent);
            elsif Ansi.Arg (0) = 1 then
               SendString (Buffer,
                  AP.CSI (Buffer.BitMode) &
                  "3;"&          -- this is a report, only reporting on request
                  "1;" &         -- no parity
                  CharBits (Buffer) & ";" &  -- bits per character
                  "120;" &       -- xspeed
                  "120;" &       -- rspeed
                  "1;" &         -- clock multiplier
                  "0" &          -- flags
                  "x",
                  Sent);
            end if;
   
         when AP.DO_DECTSTMLT =>
            -- ESC [ y or 0 y
            -- TBD:
            null;
   
         when AP.DO_DECTSTPOW =>
            -- ESC [ 1 y
            -- TBD:
            null;
   
         when AP.DO_DECTSTRSP =>
            -- ESC [ 2 y
            -- TBD:
            null;
   
         when AP.DO_DECTSTPRN =>
            -- ESC [ 3 y
            -- TBD:
            null;
   
         when AP.DO_DECTSTBAR =>
            -- ESC [ 4 y
            -- TBD:
            null;
   
         when AP.DO_DECTSTRSM =>
            -- ESC [ 6 y
            -- TBD:
            null;
   
         when AP.DO_DECTST20 =>
            -- ESC [ 7 y
            -- TBD:
            null;
   
         when AP.DO_DECTSTBLU =>
            -- ESC [ 10 y
            -- TBD:
            null;
   
         when AP.DO_DECTSTRED =>
            -- ESC [ 11 y
            -- TBD:
            null;
   
         when AP.DO_DECTSTGRE =>
            -- ESC [ 12 y
            -- TBD:
            null;
   
         when AP.DO_DECTSTWHI =>
            -- ESC [ 13 y
            -- TBD:
            null;
   
         when AP.DO_DECTSTMA =>
            -- ESC [ 14 y
            -- TBD:
            null;
   
         when AP.DO_DECTSTME =>
            -- ESC [ 15 y
            -- TBD:
            null;
   
         when AP.DO_RIS =>
            -- ESC c
            -- reset to initial state
            HardReset (Buffer, ScrnCol, ScrnRow, Style);
   
         when AP.DO_DECSTR =>
            -- ESC [ ! p
            SoftReset (Buffer, ScrnCol, ScrnRow, Style);
   
         when AP.DO_HPA =>
            -- ESC [ Pn `
            -- Horizontal Position Absolute
            if Ansi.Arg (0) in 1 .. Natural (Buffer.Scrn_Size.Col) then
               ScrnCol := Scrn_Col (Ansi.Arg (0) - 1);
               ScrnCol := ScrnCol * Width (Buffer, ScrnCol, ScrnRow);
               if not (ScrnCol in 0 .. Buffer.Scrn_Size.Col - 1) then
                  ScrnCol := Buffer.Scrn_Size.Col - 1;
               end if;
            end if;
   
         when AP.DO_CBT =>
            -- ESC [ Pn Z
            -- Cursor Backwards Tabulation
            for i in 1 .. Ansi.Arg (0) loop
               PerformBT (Buffer, ScrnCol, ScrnRow, Style);
            end loop;
   
         when AP.DO_CHA =>
            -- ESC [ Pn G
            -- Cursor Character Absolute
            if Ansi.Arg (0) in 1 .. Natural (Buffer.Scrn_Size.Col) then
               ScrnCol := Scrn_Col (Ansi.Arg (0) - 1);
               ScrnCol := ScrnCol * Width (Buffer, ScrnCol, ScrnRow);
               if not (ScrnCol in 0 .. Buffer.Scrn_Size.Col - 1) then
                  ScrnCol := Buffer.Scrn_Size.Col - 1;
               end if;
            end if;
   
         when AP.DO_CHI =>
            -- ESC [ Pn I
            -- Cursor Forwards Tabulation
            for i in 1 .. Ansi.Arg (0) loop
               PerformHT (Buffer, ScrnCol, ScrnRow, Style);
            end loop;
   
         when AP.DO_CVA =>
            -- ESC [ Pn d
            -- Line (Vertical) Position Absolute
            if Ansi.Arg (0) in 1 .. Natural (Buffer.Scrn_Size.Row) then
               ScrnRow := Scrn_Row (Ansi.Arg (0) - 1);
            end if;
   
         when AP.DO_CNL =>
            -- ESC [ Pn E
            -- Cursor Next Line
            for i in 1 .. Ansi.Arg (0) loop
               PerformNEL (Buffer, ScrnCol, ScrnRow, Style);
            end loop;
   
         when AP.DO_CPL =>
            -- ESC [ Pn F
            -- Cursor Preceeding Line
            for i in 1 .. Ansi.Arg (0) loop
               PerformRI (Buffer, ScrnCol, ScrnRow, Style);
               Home (Buffer, ScrnCol);
            end loop;
   
         when AP.DO_SD =>
            -- ESC [ Pn S
            -- Scroll Down
            declare
               SavedRegion : Boolean   := Buffer.UseRegion;
               SavedBase   : Scrn_Pos  := Buffer.Regn_Base;
               SavedSize   : Regn_Pos  := Buffer.Regn_Size;
               FillStyle   : Real_Cell := Buffer.BlankStyle;
            begin
               -- temporarily set region size to be the
               -- whole screen, and then scroll within region
               FillStyle.FgColor := Style.FgColor;
               FillStyle.BgColor := Style.BgColor;
               Buffer.UseRegion     := True;
               Buffer.Regn_Base.Row := 0;
               Buffer.Regn_Size.Row := Regn_Row (Buffer.Scrn_Size.Row);
               ShiftDown (Buffer, FillStyle, Ansi.Arg (0));
               Buffer.UseRegion := SavedRegion;
               Buffer.Regn_Base := SavedBase;
               Buffer.Regn_Size := SavedSize;
            end;
   
         when AP.DO_SU =>
            -- ESC [ Pn T
            -- Scroll Up
            declare
               SavedRegion : Boolean   := Buffer.UseRegion;
               SavedBase   : Scrn_Pos  := Buffer.Regn_Base;
               SavedSize   : Regn_Pos  := Buffer.Regn_Size;
               FillStyle   : Real_Cell := Buffer.BlankStyle;
            begin
               -- temporarily set region size to be the
               -- whole screen, and then scroll within region
               FillStyle.FgColor := Style.FgColor;
               FillStyle.BgColor := Style.BgColor;
               Buffer.UseRegion     := True;
               Buffer.Regn_Base.Row := 0;
               Buffer.Regn_Size.Row := Regn_Row (Buffer.Scrn_Size.Row);
               ShiftUp (Buffer, FillStyle, Ansi.Arg (0));
               Buffer.UseRegion := SavedRegion;
               Buffer.Regn_Base := SavedBase;
               Buffer.Regn_Size := SavedSize;
            end;
   
         when AP.DO_SL =>
            -- ESC [ Pn Sp @
            -- Scroll Left
            declare
               SavedRegion : Boolean   := Buffer.UseRegion;
               FillStyle   : Real_Cell := Buffer.BlankStyle;
            begin
               -- temporarily reset region flag to enforce
               -- shifting whole screen
               Buffer.UseRegion := False;
               FillStyle.FgColor := Style.FgColor;
               FillStyle.BgColor := Style.BgColor;
               ShiftLeft (Buffer, FillStyle, Ansi.Arg (0));
               Buffer.UseRegion := SavedRegion;
            end;
   
         when AP.DO_SR =>
            -- ESC [ Pn Sp A
            -- Scroll Right
            declare
               SavedRegion : Boolean   := Buffer.UseRegion;
               FillStyle   : Real_Cell := Buffer.BlankStyle;
            begin
               -- temporarily reset region flag to enforce
               -- shifting whole screen
               Buffer.UseRegion := False;
               FillStyle.FgColor := Style.FgColor;
               FillStyle.BgColor := Style.BgColor;
               ShiftRight (Buffer, FillStyle, Ansi.Arg (0));
               Buffer.UseRegion := SavedRegion;
            end;
   
         when AP.DO_DECIC =>
            -- ESC [ Pn ' ~
            -- Insert Columns
            declare
               FillStyle : Real_Cell := Buffer.BlankStyle;
            begin
               FillStyle.FgColor := Style.FgColor;
               FillStyle.BgColor := Style.BgColor;
               ShiftRight (Buffer, FillStyle, Ansi.Arg (0));
            end;
   
         when AP.DO_DECDC =>
            -- ESC [ Pn ' }
            -- Delete Columns
            declare
               FillStyle : Real_Cell := Buffer.BlankStyle;
            begin
               FillStyle.FgColor := Style.FgColor;
               FillStyle.BgColor := Style.BgColor;
               ShiftLeft (Buffer, FillStyle, Ansi.Arg (0));
            end;
   
         when AP.DO_REP =>
            -- ESC [ Pn b
            -- Repeat last char Pn times
            declare
               Dummy : AP.Single_Result;
            begin
               if Buffer.ISOLastChar /= ASCII.NUL then
                  Dummy.Code := AP.DO_ECHO;
                  Dummy.Char := Buffer.ISOLastChar;
                  for i in 1 .. Ansi.Arg (0) loop
                     ProcessAnsi (
                        Buffer,
                        ScrnCol,
                        ScrnRow,
                        WrapNext,
                        Dummy,
                        Style,
                        Input);
                  end loop;
               end if;
            end;
   
         when AP.DO_PRNCL =>
            -- ESC [ ? 1 i
            -- Print Line containing Cursor (non-VT52 mode),
            Print (
               Buffer,
               Rows => True,
               FirstRow => Virt (Buffer, ScrnRow),
               LastRow  => Virt (Buffer, ScrnRow),
               KeepOpen => True);
   
         when AP.DO_PRNCL2 =>
            -- ESC V
            -- Print Line containing Cursor (VT52 mode),
            -- or Start of Guarded Area (other modes)
            if Buffer.AnsiMode /= VT52 then
               Style.Erasable := False;
            else
               Print (
                  Buffer,
                  Rows => True,
                  FirstRow => Virt (Buffer, ScrnRow),
                  LastRow  => Virt (Buffer, ScrnRow),
                  KeepOpen => True);
            end if;
   
         when AP.DO_DECPFF =>
            -- ESC [ ? 18 h or ESC [ ? 18 l
            -- Print Terminator
            if Ansi.Arg (0) = 0 then
               -- ESC [ ? 18 l
               -- no print terminator
               Buffer.DECPFF := False;
            else
               -- ESC [ ? 18 h
               -- FF as print terminator
               Buffer.DECPFF := True;
            end if;
   
         when AP.DO_DECPEX =>
            -- ESC [ ? 19 h or ESC [ ? 19 l
            -- PRint Extent
            if Ansi.Arg (0) = 0 then
               -- ESC [ ? 19 l
               -- Print extent is scrolling region
               Buffer.DECPEX := False;
            else
               -- ESC [ ? 19 h
               -- Print extent is full screen
               Buffer.DECPEX := True;
            end if;
   
         when AP.DO_AUTOPRN =>
            -- ESC [ ? 4 i or ESC [ ? 5 i
            -- Auto Print Mode
            if Ansi.Arg (0) = 0 then
               -- ESC [ ? 4 i
               -- AutoPrint off
               Buffer.PrintAuto := False;
            else
               -- ESC [ ? 5 i
               -- AutoPrint on
               Buffer.PrintAuto := True;
            end if;
   
         when AP.DO_PRNCTRL =>
            -- ESC [ 4 i or ESC [ 5 i
            -- Print Controller Mode - parsed, but ignored
            if Ansi.Arg (0) = 0 then
               -- ESC [ 4 i
               -- Print Controller Mode off
               Buffer.DECPRNCTRL := False;
            else
               -- ESC [ 5 i
               -- Print Controller Mode on
               Buffer.DECPRNCTRL := True;
            end if;
   
         when AP.DO_PRNHST =>
            -- ESC [ ? 8 i or ESC [ ? 9 i
            -- Communication from the printer port to the host 
            -- port - parsed but ignored
            if Ansi.Arg (0) = 0 then
               -- ESC [ ? 8 i
               -- Stop Printer To Host Session
               Buffer.DECPRNHST := False;
            else
               -- ESC [ ? 9 i
               -- Start Printer to Host Session
               Buffer.DECPRNHST := True;
            end if;
   
         when AP.DO_ASSGNPRN =>
            -- ESC [ ? 18 i
            -- Assign Printer to Active Host Session - parsed, but ignored
            null;
   
         when AP.DO_RELPRN =>
            -- ESC [ ? 19 i
            -- Release Printer - parsed, but ignored
            null;
   
         when AP.DO_PRNSCR =>
            -- ESC [ i or ESC [ 0 i
            -- Print screen (or the scrolling region)
            if Buffer.DECPEX then
               -- print screen
               Print (
                  Buffer,
                  Rows => True,
                  FirstRow => Virt (Buffer, Scrn_Row (0)),
                  LastRow  => Virt (Buffer, Buffer.Scrn_Size.Row - 1),
                  KeepOpen => False,
                  FormFeed => Buffer.DECPFF);
            else
               -- print scrolling region
               Print (
                  Buffer,
                  Rows => True,
                  FirstRow => Virt (Buffer, Regn_Row (0)),
                  LastRow  => Virt (Buffer, Buffer.Regn_Size.Row - 1),
                  KeepOpen => False,
                  FormFeed => Buffer.DECPFF);
            end if;
   
         when AP.DO_PRNDSP =>
            -- ESC [ ? 10 i
            -- Print Composed Display - currently interpreted as print screen
            Print (
               Buffer,
               Rows => True,
               FirstRow => Virt (Buffer, Scrn_Row (0)),
               LastRow  => Virt (Buffer, Buffer.Scrn_Size.Row - 1),
               KeepOpen => False,
               FormFeed => Buffer.DECPFF);
   
         when AP.DO_PRNALLPG =>
            -- ESC [ ? 11 i
            -- Print All Pages - currently interpreted as print entire buffer
            Print (
               Buffer,
               Rows => True,
               FirstRow => 0,
               LastRow  => Buffer.Virt_Used.Row,
               KeepOpen => False,
               FormFeed => Buffer.DECPFF);
   
         when AP.DO_EPA =>
            -- ESC W
            -- End of Guarded Area
            Style.Erasable := True;
   
         when AP.DO_ERM =>
            -- ESC [ 6 h or ESC [ 6 l
            if Ansi.Arg (0) = 0 then
               -- ESC [ 6 l
               Buffer.ISOERM := False;
            else
               -- ESC [ 6 h
               Buffer.ISOERM := True;
            end if;
   
         when AP.DO_DSRPRN =>
            -- ESC [ ? 15 n
            -- What is the printer status ? "I have no printer"
            SendString (Buffer, AP.CSI (Buffer.BitMode) & "?13n", Sent);
   
         when AP.DO_DSRUDK =>
            -- ESC [ ? 25 n
            -- Are user-defined keys locked or unlocked ?
            if Buffer.DECUDKLock then
               -- locked
               SendString (Buffer, AP.CSI (Buffer.BitMode) & "?21n", Sent);
            else
               -- unlocked
               SendString (Buffer, AP.CSI (Buffer.BitMode) & "?20n", Sent);
            end if;
   
         when AP.DO_DSRKB =>
            -- ESC [ ? 26 n
            -- What is the keyboard language ? "North American (1)"
            SendString (Buffer, AP.CSI (Buffer.BitMode) & "?27;1n", Sent);
   
         when AP.DO_DSRLOCATOR =>
            -- ESC [ ? 53 n or ESC ? 55 n
            -- What is the Locator Status ? "No locator"
            SendString (Buffer, AP.CSI (Buffer.BitMode) & "?53n", Sent);
   
         when AP.DO_DECBKM =>
            -- ESC [ ? 67 h or ESC [ ? 67 l
            if Ansi.Arg (0) = 0 then
               -- ESC [ ? 67 l
               Buffer.DECBKM := False;
            else
               -- ESC [ ? 67 h
               Buffer.DECBKM := True;
            end if;
   
         when AP.DO_DECKBUM =>
            -- ESC [ ? 68 h or ESC [ ? 68 l
            -- Keyboard Usage Mode. Note that since we do not
            -- have a Setup mode, the keyboard in use is assumed
            -- to be the one for the most recent NRC font mapped
            -- into G0.
            -- This means that Typewriter mode will only work if
            -- the corresponding font map has been selected into
            -- G0, even if the multinational or special graphic
            -- set has since been selected (since they are not
            -- NRC fonts).
            if Ansi.Arg (0) = 0 then
               -- ESC [ ? 68 l
               -- Typewriter mode
               Buffer.DECKBUM := False;
            else
               -- ESC [ ? 68 h
               -- Data Processing Mode
               Buffer.DECKBUM := True;
            end if;
   
         when AP.DO_KAM =>
            -- ESC [ ? 2 h or ESC [ ? 2 l
            if Ansi.Arg (0) = 0 then
               -- ESC [ ? 2 l
               Buffer.KeyLockOn := False;
            else
               -- ESC [ ? 2 h
               Buffer.KeyLockOn := True;
            end if;
   
         when AP.DO_DECUDK =>
            -- Define UDKs.
            if Ansi.Arg (0) = 0 or Ansi.Arg (0) = 1 then
               if Ansi.Arg (0) = 0 then
                  for i in DECUDK_Key loop
                     for j in DECUDK_Type loop
                        Buffer.DECUDK (i, j) := Null_String;
                     end loop;
                  end loop;
               end if;
               Buffer.DECUDKArg1 := Ansi.Arg (1);
               Buffer.DECUDKArg2 := Ansi.Arg (2);
            elsif Ansi.Arg (0) = -1 and Ansi.Arg (1) = -1 then
               -- end of UDKs
               if Buffer.DECUDKArg1 = 0 then
                  Buffer.DECUDKLock := True;
               else
                  Buffer.DECUDKLock := False;
               end if;
            elsif Ansi.Arg (0) = -1
            and Ansi.Arg (1) 
            in -Integer (DECUDK_Key'Last) .. Integer (DECUDK_Key'Last) then
               -- program a UDK
               if Buffer.DECUDKArg2 = 1 then
                  -- Unshifted function key
                  if Ansi.Arg (1) > 0 then
                     Buffer.DECUDK (DECUDK_Key (Ansi.Arg (1)), unshifted)
                        := GetParserString (Ansi.Arg (2), Ansi.Arg (3));
                  else
                     Buffer.DECUDK (DECUDK_Key (-Ansi.Arg (1)), alt_unshifted)
                        := GetParserString (Ansi.Arg (2), Ansi.Arg (3));
                  end if;
               elsif Buffer.DECUDKArg2 = 2 then
                  -- Shifted function key
                  if Ansi.Arg (1) > 0 then
                     Buffer.DECUDK (DECUDK_Key (Ansi.Arg (1)), shifted)
                        := GetParserString (Ansi.Arg (2), Ansi.Arg (3));
                  else
                     Buffer.DECUDK (DECUDK_Key (-Ansi.Arg (1)), alt_shifted)
                        := GetParserString (Ansi.Arg (2), Ansi.Arg (3));
                  end if;
               elsif Buffer.DECUDKArg2 = 3 then
                  -- Alternate unshifted function key
                  if Ansi.Arg (1) > 0 then
                     Buffer.DECUDK (DECUDK_Key (Ansi.Arg (1)), alt_unshifted)
                        := GetParserString (Ansi.Arg (2), Ansi.Arg (3));
                  else
                     Buffer.DECUDK (DECUDK_Key (-Ansi.Arg (1)), alt_unshifted)
                        := GetParserString (Ansi.Arg (2), Ansi.Arg (3));
                  end if;
               elsif Buffer.DECUDKArg2 = 4 then
                  -- Alternate shifted function key
                  if Ansi.Arg (1) > 0 then
                     Buffer.DECUDK (DECUDK_Key (Ansi.Arg (1)), alt_shifted)
                        := GetParserString (Ansi.Arg (2), Ansi.Arg (3));
                  else
                     Buffer.DECUDK (DECUDK_Key (-Ansi.Arg (1)), alt_shifted)
                        := GetParserString (Ansi.Arg (2), Ansi.Arg (3));
                  end if;
               end if;
            end if;
   
         when AP.DO_DECSNLS =>
            -- ESC [ Pn * |
            -- Lines per screen
            if Ansi.Arg (0) >= 1 and Ansi.Arg (0) <= 144 then
               ResizeScreen (
                  Buffer, 
                  Natural (Buffer.Scrn_Size.Col), 
                  Ansi.Arg (0), 
                  SetView => True);
               -- automatically enable the vertical scroll bar if needed
               if Natural (Buffer.View_Size.Row) /= Ansi.Arg (0) then
                  VerticalScrollbar (Buffer, Yes);
                  ResizeClientArea (Buffer);
               end if;
               UpdateScrollPositions (Buffer);
               DrawView (Buffer);
            end if;
   
         when AP.DO_DECSCPP =>
            -- ESC [ Pn $ |
            if Ansi.Arg (0) >= 1 and Ansi.Arg (0) <= 256 then
               ResizeScreen (
                  Buffer, 
                  Ansi.Arg (0), 
                  Natural (Buffer.Scrn_Size.Row), 
                  SetView => True);
               -- automatically enable the horizontal scroll bar if needed
               if Natural (Buffer.View_Size.Col) /= Ansi.Arg (0) then
                  HorizontalScrollbar (Buffer, Yes);
                  ResizeClientArea (Buffer);
               end if;
               UpdateScrollPositions (Buffer);
               DrawView (Buffer);
            end if;
   
         when AP.DO_DECSLPP =>
            -- ESC [ Pn t
            -- Lines per page. Currently same as lines per screen
            if Ansi.Arg (0) >= 1 and Ansi.Arg (0) <= 256 then
               ResizeScreen (
                  Buffer, 
                  Natural (Buffer.Scrn_Size.Col), 
                  Ansi.Arg (0), 
                  SetView => True);
               -- automatically enable the vertical scroll bar if needed
               if Natural (Buffer.View_Size.Row) /= Ansi.Arg (0) then
                  VerticalScrollbar (Buffer, Yes);
                  ResizeClientArea (Buffer);
               end if;
               UpdateScrollPositions (Buffer);
               DrawView (Buffer);
            end if;
   
         when AP.DO_DECSLRM =>
            -- ESC [ s or ESC [ Pl; Pr s
            -- in PC mode, Save Cursor
            -- in other modes, Set Left and Right Margin
            if Buffer.AnsiMode = PC then
               -- ESC [ s
               -- Save cursor
               Buffer.PcSaveCurs := (ScrnCol, ScrnRow);
               Buffer.PcCursSaved := True;
            else
               -- ESC [ Pl; Pr s
               -- Set Left and Right Margin. Note thet setting top 
               -- and bottom margin always also sets left and right 
               -- margin to 0, Buffer.Scrn_Size - 1. Therefore, you 
               -- must set top and bottom margin before setting
               -- left and right margin.
               -- Note also that once set, there is no way to reset
               -- the Region flag via a control sequence, except
               -- by doing a hard reset.
               if Buffer.DECVSSM then
                  if Ansi.Arg (0) < Ansi.Arg (1) then
                     if Ansi.Arg (0) > 0 
                     and Ansi.Arg (0) <= Natural (Buffer.Scrn_Size.Col) then
                        Buffer.Regn_Base.Col := Scrn_Col (Ansi.Arg (0)) - 1;
                     else
                        Buffer.Regn_Base.Col := 0;
                     end if;
                     if Ansi.Arg (1) > 1
                     and Ansi.Arg (1) <= Natural (Buffer.Scrn_Size.Col) then
                        Buffer.Regn_Size.Col 
                           := Regn_Col (Ansi.Arg (1) 
                              - Natural (Buffer.Regn_Base.Col));
                     else
                        Buffer.Regn_Size.Col 
                           := Regn_Col (Natural (Buffer.Scrn_Size.Col) 
                              - Natural (Buffer.Regn_Base.Col));
                     end if;
                  else
                     Buffer.Regn_Base.Col := 0;
                     Buffer.Regn_Size.Col := Regn_Col (Buffer.Scrn_Size.Col);
                  end if;
                  Buffer.UseRegion := True;
                  Home (Buffer, ScrnCol, ScrnRow);
               end if;
               DrawView (Buffer);
            end if;
   
         when AP.DO_DECVSSM =>
            -- ESC [ ? 69 h or ESC [ ? 69 l
            -- Vertical Split Screen Mode
            if Ansi.Arg (0) = 0 then
               -- ESC [ ? 69 l
               Buffer.DECVSSM := False;
            else
               -- ESC [ ? 69 h
               Buffer.DECVSSM := True;
            end if;
   
         when AP.DO_DECRQSS =>
            -- DCS $ q D...D ST
            -- Request Control Function Setting.
            -- Note that the VT240 manual says "0" means valid, "1" means 
            -- invalid in the response, but the VTTEST code wants the opposite.
            -- We use the VTTEST convention here.
            declare
              PS    : String (1 .. 1) := "0";
              DD    : String (1 .. 2) := "  ";
              DDLen : Natural         := 0;
            begin
               case Ansi.Arg (0) is
                  when AP.DO_SGR =>
                     PS := "1";
                  when AP.DO_VTMODE =>
                     PS := "1";
                  when AP.DO_DECSCPP =>
                     PS := "1";
                  when AP.DO_DECSLPP =>
                     PS := "1";
                  when AP.DO_DECSNLS =>
                     PS := "1";
                  when AP.DO_DECSLRM =>
                     PS := "1";
                  when AP.DO_DECSTBM =>
                     PS := "1";
                  when AP.DO_DECSCA =>
                     PS := "1";
                  when others =>
                     null;
               end case;
               if Ansi.Arg (1) in 0 .. Character'Pos (Character'Last) then
                  DD (1) := Character'Val (Ansi.Arg (1));
                  DDLen := 1;
                  if Ansi.Arg (2) in 0 .. Character'Pos (Character'Last) then
                     DD (2) := Character'Val (Ansi.Arg (2));
                     DDLen := 2;
                  end if;
               end if;
               SendString (Buffer, 
                  AP.DCS (Buffer.BitMode) & 
                  PS & 
                  "$r" & 
                  DD (1 .. DDLen) & AP.ST (Buffer.Bitmode), 
                  Sent);
            end;
 
         when AP.DO_DECCRA =>
            -- CSI Pts; Pls; Pbs; Prs; Pps; Ptd; Pld; Ppd $ v
            --
            -- Args[0] = SOURCE: top-line border
            -- Args[1] = SOURCE: left-column border
            -- Args[2] = SOURCE: bottom-line border
            --   Args[2] = 0 -> last line of the page
            -- Args[3] = SOURCE: right-column border
            --   Args[3] = 0 -> last column of the page
            -- Args[4] = SOURCE: page number
            -- Args[5] = DESTINATION: top-line border
            -- Args[6] = DESTINATION: left-column border
            -- Args[7] = DESTINATION: page number
            if Buffer.DECOM then
               -- relative origin mod4e
               declare
                  Pts : Regn_Row := 0;
                  Pls : Regn_Col := 0;
                  Pbs : Regn_Row := 0;
                  Prs : Regn_Col := 0;
                  Pps : Natural  := 0;
                  Ptd : Regn_Row := 0;
                  Pld : Regn_Col := 0;
                  Ppd : Natural  := 0;
               begin
                  if Ansi.Arg (0) in 1 .. Natural (Buffer.Regn_Size.Row) then
                     Pts := Regn_Row (Ansi.Arg (0) - 1);
                  end if;
                  if Ansi.Arg (1) in 1 .. Natural (Buffer.Regn_Size.Col) then
                     Pls := Regn_Col (Ansi.Arg (1) - 1);
                  end if;
                  if Ansi.Arg (2) in 1 .. Natural (Buffer.Regn_Size.Row) then
                     Pbs := Regn_Row (Ansi.Arg (2) - 1);
                  else
                     Pbs := Buffer.Regn_Size.Row - 1;
                  end if;
                  if Ansi.Arg (3) in 1 .. Natural (Buffer.Regn_Size.Col) then
                     Prs := Regn_Col (Ansi.Arg (3) - 1);
                  else
                     Prs := Buffer.Regn_Size.Col - 1;
                  end if;
                  Pps := Ansi.Arg (4);
                  if Ansi.Arg (5) in 1 .. Natural (Buffer.Regn_Size.Row) then
                     Ptd := Regn_Row (Ansi.Arg (5) - 1);
                  end if;
                  if Ansi.Arg (6) in 1 .. Natural (Buffer.Regn_Size.Col) then
                     Pld := Regn_Col (Ansi.Arg (6) - 1);
                  end if;
                  Ppd := Ansi.Arg (7);
                  -- TBD: temporarily ignore source and destination page 
                  --      numbers
                  -- TBD: how should the copy be done ? This will make a 
                  --      difference if the source and destination ranges
                  --      overlap
                  if Pls <= Prs and Pts <= Pbs then
                     for SrcRow in reverse Pts .. Pbs loop
                         for SrcCol in reverse Pls .. Prs loop
                           declare
                              DstCol : Regn_Col := Pld + SrcCol - Pls;
                              DstRow : Regn_Row := Ptd + SrcRow - Pts; 
                           begin
                              if  SrcCol in 0 .. Buffer.Regn_Size.Col
                              and SrcRow in 0 .. Buffer.Regn_Size.Row
                              and DstCol in 0 .. Buffer.Regn_Size.Col
                              and DstRow in 0 .. Buffer.Regn_Size.Row then
                                 MoveRegnCell (
                                    Buffer, 
                                    SrcCol, 
                                    SrcRow, 
                                    DstCol, 
                                    DstRow);
                              end if;
                           end;
                        end loop;
                     end loop;
                     DrawScreen (Buffer);
                  end if;
               end;
            else
               -- absolute origin mode
               declare
                  Pts : Scrn_Row := 0;
                  Pls : Scrn_Col := 0;
                  Pbs : Scrn_Row := 0;
                  Prs : Scrn_Col := 0;
                  Pps : Natural  := 0;
                  Ptd : Scrn_Row := 0;
                  Pld : Scrn_Col := 0;
                  Ppd : Natural  := 0;
               begin
                  if Ansi.Arg (0) in 1 .. Natural (Buffer.Scrn_Size.Row) then
                     Pts := Scrn_Row (Ansi.Arg (0) - 1);
                  end if;
                  if Ansi.Arg (1) in 1 .. Natural (Buffer.Scrn_Size.Col) then
                     Pls := Scrn_Col (Ansi.Arg (1) - 1);
                  end if;
                  if Ansi.Arg (2) in 1 .. Natural (Buffer.Scrn_Size.Row) then
                     Pbs := Scrn_Row (Ansi.Arg (2) - 1);
                  else
                     Pbs := Buffer.Scrn_Size.Row - 1;
                  end if;
                  if Ansi.Arg (3) in 1 .. Natural (Buffer.Scrn_Size.Col) then
                     Prs := Scrn_Col (Ansi.Arg (3) - 1);
                  else
                     Prs := Buffer.Scrn_Size.Col - 1;
                  end if;
                  Pps := Ansi.Arg (4);
                  if Ansi.Arg (5) in 1 .. Natural (Buffer.Scrn_Size.Row) then
                     Ptd := Scrn_Row (Ansi.Arg (5) - 1);
                  end if;
                  if Ansi.Arg (6) in 1 .. Natural (Buffer.Scrn_Size.Col) then
                     Pld := Scrn_Col (Ansi.Arg (6) - 1);
                  end if;
                  Ppd := Ansi.Arg (7);
                  -- TBD: temporarily ignore source and destination page
                  --      numbers
                  -- TBD: how should the copy be done ? This will make a
                  --      difference if the source and destination ranges
                  --      overlap
                  if Pls <= Prs and Pts <= Pbs then
                     for SrcRow in reverse Pts .. Pbs loop
                        for SrcCol in reverse Pls .. Prs loop
                           declare
                              DstCol : Scrn_Col := Pld + SrcCol - Pls;
                              DstRow : Scrn_Row := Ptd + SrcRow - Pts; 
                           begin
                              if  SrcCol in 0 .. Buffer.Scrn_Size.Col
                              and SrcRow in 0 .. Buffer.Scrn_Size.Row
                              and DstCol in 0 .. Buffer.Scrn_Size.Col
                              and DstRow in 0 .. Buffer.Scrn_Size.Row then
                                 MoveScrnCell (
                                    Buffer, 
                                    SrcCol, 
                                    SrcRow, 
                                    DstCol, 
                                    DstRow);
                              end if;
                           end;
                        end loop;
                     end loop;
                     DrawScreen (Buffer);
                  end if;
               end;
            end if;
            
         when AP.DO_DECERA =>
            -- CSI Pt; Pl; Pb; Pr $ z
            --
            -- Args[0] = top-line border
            -- Args[1] = left-column border
            -- Args[2] = bottom-line border
            --   Args[2] = 0 -> last line of the page
            -- Args[3] = right-column border
            --   Args[3] = 0 -> last column of the page
            if Buffer.DECOM then
               -- relative origin mod4e
               declare
                  Pt  : Regn_Row := 0;
                  Pl  : Regn_Col := 0;
                  Pb  : Regn_Row := 0;
                  Pr  : Regn_Col := 0;
               begin
                  if Ansi.Arg (0) in 1 .. Natural (Buffer.Regn_Size.Row) then
                     Pt := Regn_Row (Ansi.Arg (0) - 1);
                  end if;
                  if Ansi.Arg (1) in 1 .. Natural (Buffer.Regn_Size.Col) then
                     Pl  := Regn_Col (Ansi.Arg (1) - 1);
                  end if;
                  if Ansi.Arg (2) in 1 .. Natural (Buffer.Regn_Size.Row) then
                     Pb := Regn_Row (Ansi.Arg (2) - 1);
                  else
                     Pb := Buffer.Regn_Size.Row - 1;
                  end if;
                  if Ansi.Arg (3) in 1 .. Natural (Buffer.Regn_Size.Col) then
                     Pr := Regn_Col (Ansi.Arg (3) - 1);
                  else
                     Pr := Buffer.Regn_Size.Col - 1;
                  end if;
                  if Pl <= Pr and Pt <= Pb then
                     for Row in Pt .. Pb loop
                        for Col in Pl .. Pr loop
                           if  Col in 0 .. Buffer.Regn_Size.Col
                           and Row in 0 .. Buffer.Regn_Size.Row then
                              FillRegnCell (
                                 Buffer, 
                                 Col, 
                                 Row,
                                 ' ', 
                                 False,
                                 Style);
                           end if;
                        end loop;
                     end loop;
                     DrawScreen (Buffer);
                  end if;
               end;
            else
               -- absolute origin mod4e
               declare
                  Pt  : Scrn_Row := 0;
                  Pl  : Scrn_Col := 0;
                  Pb  : Scrn_Row := 0;
                  Pr  : Scrn_Col := 0;
               begin
                  if Ansi.Arg (0) in 1 .. Natural (Buffer.Scrn_Size.Row) then
                     Pt := Scrn_Row (Ansi.Arg (0) - 1);
                  end if;
                  if Ansi.Arg (1) in 1 .. Natural (Buffer.Scrn_Size.Col) then
                     Pl  := Scrn_Col (Ansi.Arg (1) - 1);
                  end if;
                  if Ansi.Arg (2) in 1 .. Natural (Buffer.Scrn_Size.Row) then
                     Pb := Scrn_Row (Ansi.Arg (2) - 1);
                  else
                     Pb := Buffer.Scrn_Size.Row - 1;
                  end if;
                  if Ansi.Arg (3) in 1 .. Natural (Buffer.Scrn_Size.Col) then
                     Pr := Scrn_Col (Ansi.Arg (3) - 1);
                  else
                     Pr := Buffer.Scrn_Size.Col - 1;
                  end if;
                  if Pl <= Pr and Pt <= Pb then
                     for Row in Pt .. Pb loop
                        for Col in Pl .. Pr loop
                           if  Col in 0 .. Buffer.Scrn_Size.Col
                           and Row in 0 .. Buffer.Scrn_Size.Row then
                              FillScrnCell (
                                 Buffer, 
                                 Col, 
                                 Row,
                                 ' ', 
                                 False,
                                 Style);
                           end if;
                        end loop;
                     end loop;
                     DrawScreen (Buffer);
                  end if;
               end;
            end if;
            
         when AP.DO_DECFRA =>
            -- CSI Pch; Pt; Pl; Pb; Pr $ x
            --
            -- Args[0] = fill character
            -- Args[1] = top-line border
            -- Args[2] = left-column border
            -- Args[3] = bottom-line border
            --   Args[3] = 0 -> last line of the page
            -- Args[4] = right-column border
            --   Args[4] = 0 -> last column of the page
            declare
               Ch : Character;
               Bt : Boolean;
            begin
               if Ansi.Arg (0) in 32 .. 126 
               or Ansi.Arg (0) in 160 .. 255 then
                  Ch := Character'Val (Ansi.Arg (0));
                  if Bits (Ch, Buffer.GLSet, Buffer.GRSet) then
                     Bt := True;
                  else
                     Bt := False;
                     Ch := Char (Ch, Buffer.GLSet, Buffer.GRSet);
                  end if;
                  if Buffer.DECOM then
                     -- relative origin mod4e
                     declare
                        Pt  : Regn_Row := 0;
                        Pl  : Regn_Col := 0;
                        Pb  : Regn_Row := 0;
                        Pr  : Regn_Col := 0;
                     begin
                        if Ansi.Arg (1) 
                        in 1 .. Natural (Buffer.Regn_Size.Row) then
                           Pt := Regn_Row (Ansi.Arg (1) - 1);
                        end if;
                        if Ansi.Arg (2) 
                        in 1 .. Natural (Buffer.Regn_Size.Col) then
                           Pl  := Regn_Col (Ansi.Arg (2) - 1);
                        end if;
                        if Ansi.Arg (3)
                        in 1 .. Natural (Buffer.Regn_Size.Row) then
                           Pb := Regn_Row (Ansi.Arg (3) - 1);
                        else
                           Pb := Buffer.Regn_Size.Row - 1;
                        end if;
                        if Ansi.Arg (4) 
                        in 1 .. Natural (Buffer.Regn_Size.Col) then
                           Pr := Regn_Col (Ansi.Arg (4) - 1);
                        else
                           Pr := Buffer.Regn_Size.Col - 1;
                        end if;
                        if Pl <= Pr and Pt <= Pb then
                           for Row in Pt .. Pb loop
                              for Col in Pl .. Pr loop
                                 if  Col in 0 .. Buffer.Regn_Size.Col
                                 and Row in 0 .. Buffer.Regn_Size.Row then
                                    FillRegnCell (
                                       Buffer, 
                                       Col, 
                                       Row,
                                       Ch,
                                       Bt, 
                                       Style);
                                 end if;
                              end loop;
                           end loop;
                           DrawScreen (Buffer);
                        end if;
                     end;
                  else
                     -- absolute origin mod4e
                     declare
                        Pt  : Scrn_Row := 0;
                        Pl  : Scrn_Col := 0;
                        Pb  : Scrn_Row := 0;
                        Pr  : Scrn_Col := 0;
                     begin
                        if Ansi.Arg (1)
                        in 1 .. Natural (Buffer.Scrn_Size.Row) then
                           Pt := Scrn_Row (Ansi.Arg (1) - 1);
                        end if;
                        if Ansi.Arg (2)
                        in 1 .. Natural (Buffer.Scrn_Size.Col) then
                           Pl  := Scrn_Col (Ansi.Arg (2) - 1);
                        end if;
                        if Ansi.Arg (3)
                        in 1 .. Natural (Buffer.Scrn_Size.Row) then
                           Pb := Scrn_Row (Ansi.Arg (3) - 1);
                        else
                           Pb := Buffer.Scrn_Size.Row - 1;
                        end if;
                        if Ansi.Arg (4)
                        in 1 .. Natural (Buffer.Scrn_Size.Col) then
                           Pr := Scrn_Col (Ansi.Arg (4) - 1);
                        else
                           Pr := Buffer.Scrn_Size.Col - 1;
                        end if;
                        if Pl <= Pr and Pt <= Pb then
                           for Row in Pt .. Pb loop
                              for Col in Pl .. Pr loop
                                 if  Col in 0 .. Buffer.Scrn_Size.Col
                                 and Row in 0 .. Buffer.Scrn_Size.Row then
                                    FillScrnCell (
                                       Buffer, 
                                       Col, 
                                       Row,
                                       Ch, 
                                       Bt,
                                       Style);
                                 end if;
                              end loop;
                           end loop;
                           DrawScreen (Buffer);
                        end if;
                     end;
                  end if;
               end if;
            end;
            
         when AP.DO_DECSERA =>
            -- CSI Pt; Pl; Pb; Pr $ {
            --
            -- Args[0] = top-line border
            -- Args[1] = left-column border
            -- Args[2] = bottom-line border
            --   Args[2] = 0 -> last line of the page
            -- Args[3] = right-column border
            --   Args[3] = 0 -> last column of the page
            if Buffer.DECOM then
               -- relative origin mod4e
               declare
                  Pt  : Regn_Row := 0;
                  Pl  : Regn_Col := 0;
                  Pb  : Regn_Row := 0;
                  Pr  : Regn_Col := 0;
               begin
                  if Ansi.Arg (0) in 1 .. Natural (Buffer.Regn_Size.Row) then
                     Pt := Regn_Row (Ansi.Arg (0) - 1);
                  end if;
                  if Ansi.Arg (1) in 1 .. Natural (Buffer.Regn_Size.Col) then
                     Pl  := Regn_Col (Ansi.Arg (1) - 1);
                  end if;
                  if Ansi.Arg (2) in 1 .. Natural (Buffer.Regn_Size.Row) then
                     Pb := Regn_Row (Ansi.Arg (2) - 1);
                  else
                     Pb := Buffer.Regn_Size.Row - 1;
                  end if;
                  if Ansi.Arg (3) in 1 .. Natural (Buffer.Regn_Size.Col) then
                     Pr := Regn_Col (Ansi.Arg (3) - 1);
                  else
                     Pr := Buffer.Regn_Size.Col - 1;
                  end if;
                  if Pl <= Pr and Pt <= Pb then
                     for Row in Pt .. Pb loop
                        for Col in Pl .. Pr loop
                           if  Col in 0 .. Buffer.Regn_Size.Col
                           and Row in 0 .. Buffer.Regn_Size.Row then
                              FillRegnCell (
                                 Buffer, 
                                 Col, 
                                 Row,
                                 ' ', 
                                 False,
                                 Style,
                                 Selective => True);
                           end if;
                        end loop;
                     end loop;
                     DrawScreen (Buffer);
                  end if;
               end;
            else
               -- absolute origin mod4e
               declare
                  Pt  : Scrn_Row := 0;
                  Pl  : Scrn_Col := 0;
                  Pb  : Scrn_Row := 0;
                  Pr  : Scrn_Col := 0;
               begin
                  if Ansi.Arg (0) in 1 .. Natural (Buffer.Scrn_Size.Row) then
                     Pt := Scrn_Row (Ansi.Arg (0) - 1);
                  end if;
                  if Ansi.Arg (1) in 1 .. Natural (Buffer.Scrn_Size.Col) then
                     Pl  := Scrn_Col (Ansi.Arg (1) - 1);
                  end if;
                  if Ansi.Arg (2) in 1 .. Natural (Buffer.Scrn_Size.Row) then
                     Pb := Scrn_Row (Ansi.Arg (2) - 1);
                  else
                     Pb := Buffer.Scrn_Size.Row - 1;
                  end if;
                  if Ansi.Arg (3) in 1 .. Natural (Buffer.Scrn_Size.Col) then
                     Pr := Scrn_Col (Ansi.Arg (3) - 1);
                  else
                     Pr := Buffer.Scrn_Size.Col - 1;
                  end if;
                  if Pl <= Pr and Pt <= Pb then
                     for Row in Pt .. Pb loop
                        for Col in Pl .. Pr loop
                           if  Col in 0 .. Buffer.Scrn_Size.Col
                           and Row in 0 .. Buffer.Scrn_Size.Row then
                              FillScrnCell (
                                 Buffer, 
                                 Col, 
                                 Row,
                                 ' ', 
                                 False,
                                 Style,
                                 Selective => True);
                           end if;
                        end loop;
                     end loop;
                     DrawScreen (Buffer);
                  end if;
               end;
            end if;
            
         when AP.DO_DECSACE =>
            -- CSI Ps * x
            --
            -- SET: change stream of character positions (Ps = 0 or 1)
            --   DECCARA or DECRARA affect the stream of character 
            --   positions that begins with the first position specified in 
            --   the DECCARA or DECRARA command, and ends with the second 
            --   character position specified.
            -- RESET: change rect area of character positions (Ps = 2)
            --   DECCARA and DECRARA affect all character positions in the 
            --   rectangular area. The DECCARA or DECRARA command specifies 
            --   the top-left and bottom-right corners.
            if Ansi.Arg (0) = 0 then
               Buffer.DECSACE := True; -- rectangle mode
            else
               Buffer.DECSACE := False; -- stream mode
            end if;
            
         when AP.DO_DECCARA =>
            -- CSI Pt; Pl; Pb; Pr; Ps1..Psn $ r
            --
            -- Args[0] = top-line border
            -- Args[1] = left-column border
            -- Args[2] = bottom-line border
            --   Args[2] = 0 -> last line of the page
            -- Args[3] = right-column border
            --   Args[3] = 0 -> last column of the page
            -- Args[4] = attributes to SET
            -- Args[5] = attributes to CLEAR
            --    (See ATTR_xxx in vtconst.h)
            --    Note: the attributes may be cleared and set in
            --      any order since there will be NO attributes
            --      set in BOTH Args[4] and Args[5].  The attributes
            --      to be set or cleared are Bold, Underline,
            --      Blinking, Negative, and Invisible.
            -- Args[n+1]..Args[VTARGS-1] = ATTR_NONE (-1)
            declare
               type Attributes is mod 256;

               Pt  : Scrn_Row := 0;
               Pl  : Scrn_Col := 0;
               Pb  : Scrn_Row := 0;
               Pr  : Scrn_Col := 0;
               Set : Attributes := 0;
               Clr : Attributes := 0;
               RealCol : Real_Col;
               RealRow : Real_Row;
            begin
               if Ansi.Arg (0) in 1 .. Natural (Buffer.Scrn_Size.Row) then
                  Pt := Scrn_Row (Ansi.Arg (0) - 1);
               end if;
               if Ansi.Arg (1) in 1 .. Natural (Buffer.Scrn_Size.Col) then
                  Pl  := Scrn_Col (Ansi.Arg (1) - 1);
               end if;
               if Ansi.Arg (2) in 1 .. Natural (Buffer.Scrn_Size.Row) then
                  Pb := Scrn_Row (Ansi.Arg (2) - 1);
               else
                  Pb := Buffer.Scrn_Size.Row - 1;
               end if;
               if Ansi.Arg (3) in 1 .. Natural (Buffer.Scrn_Size.Col) then
                  Pr := Scrn_Col (Ansi.Arg (3) - 1);
               else
                  Pr := Buffer.Scrn_Size.Col - 1;
               end if;
               Set := Attributes (Ansi.Arg (4));
               Clr := Attributes (Ansi.Arg (5));
               if Buffer.DECSACE then
                  -- rectangle mode
                  if Pl <= Pr and Pt <= Pb then
                     for Row in Pt .. Pb loop
                        for Col in Pl .. Pr loop
                           if  Col in 0 .. Buffer.Scrn_Size.Col
                           and Row in 0 .. Buffer.Scrn_Size.Row then
                              RealCol := Real (Buffer, Col);
                              RealRow := Real (Buffer, Row);
                              if (AP.ATTR_BOLD and Set) /= 0 then
                                 Buffer.Real_Buffer (RealCol, RealRow).Bold
                                    := True;
                              end if;
                              if (AP.ATTR_UNDER and Set) /= 0 then
                                 Buffer.Real_Buffer (RealCol, RealRow).Underline
                                    := True;
                              end if;
                              if (AP.ATTR_BLINK and Set) /= 0 then
                                 Buffer.Real_Buffer (RealCol, RealRow).Flashing
                                    := True;
                              end if;
                              if (AP.ATTR_NEG and Set) /= 0 then
                                 Buffer.Real_Buffer (RealCol, RealRow).Inverse
                                    := True;
                              end if;
                              if (AP.ATTR_BOLD and Clr) /= 0 then
                                 Buffer.Real_Buffer (RealCol, RealRow).Bold
                                    := False;
                              end if;
                              if (AP.ATTR_UNDER and Clr) /= 0 then
                                 Buffer.Real_Buffer (RealCol, RealRow).Underline
                                    := False;
                              end if;
                              if (AP.ATTR_BLINK and Clr) /= 0 then
                                 Buffer.Real_Buffer (RealCol, RealRow).Flashing 
                                    := False;
                              end if;
                              if (AP.ATTR_NEG and Clr) /= 0 then
                                 Buffer.Real_Buffer (RealCol, RealRow).Inverse
                                    := False;
                              end if;
                           end if;
                        end loop;
                     end loop;
                     DrawScreen (Buffer);
                  end if;
               else
                  -- stream mode
                  if Pl <= Pr and Pt <= Pb then
                     declare
                        Col : Scrn_Col := Pl;
                        Row : Scrn_Row := Pt;
                     begin
                        While ((Row < Pb) and (Col < Buffer.Scrn_Size.Col)) 
                        or    ((Row = Pb) and (Col <= Pr)) loop
                           RealCol := Real (Buffer, Col);
                           RealRow := Real (Buffer, Row);
                           if (AP.ATTR_BOLD and Set) /= 0 then
                              Buffer.Real_Buffer (RealCol, RealRow).Bold
                                 := True;
                           end if;
                           if (AP.ATTR_UNDER and Set) /= 0 then
                              Buffer.Real_Buffer (RealCol, RealRow).Underline
                                 := True;
                           end if;
                           if (AP.ATTR_BLINK and Set) /= 0 then
                              Buffer.Real_Buffer (RealCol, RealRow).Flashing
                                 := True;
                           end if;
                           if (AP.ATTR_NEG and Set) /= 0 then
                              Buffer.Real_Buffer (RealCol, RealRow).Inverse
                                 := True;
                           end if;
                           if (AP.ATTR_BOLD and Clr) /= 0 then
                              Buffer.Real_Buffer (RealCol, RealRow).Bold
                                 := False;
                           end if;
                           if (AP.ATTR_UNDER and Clr) /= 0 then
                              Buffer.Real_Buffer (RealCol, RealRow).Underline
                                 := False;
                           end if;
                           if (AP.ATTR_BLINK and Clr) /= 0 then
                              Buffer.Real_Buffer (RealCol, RealRow).Flashing
                                 := False;
                           end if;
                           if (AP.ATTR_NEG and Clr) /= 0 then
                              Buffer.Real_Buffer (RealCol, RealRow).Inverse
                                 := False;
                           end if;
                           Col := Col + 1;
                           if Col >= Buffer.Scrn_Size.Col then
                              Col := 0;
                              Row := Row + 1;
                           end if;
                        end loop;
                     end;
                     DrawScreen (Buffer);
                  end if;
               end if;
            end;
            
            
         when AP.DO_DECRARA =>
            -- CSI Pt; Pl; Pb; Pr; Ps1..Psn $ t
            --
            -- Args[0] = top-line border
            -- Args[1] = left-column border
            -- Args[2] = bottom-line border
            --   Args[2] = 0 -> last line of the page
            -- Args[3] = right-column border
            --   Args[3] = 0 -> last column of the page
            -- Args[4] = attributes to be reversed.  The attributes
            --   that can be reversed are Bold, Underline, Blinking,
            --   Negative, and Invisible.
            declare
               type Attributes is mod 256;
               
               Pt  : Scrn_Row := 0;
               Pl  : Scrn_Col := 0;
               Pb  : Scrn_Row := 0;
               Pr  : Scrn_Col := 0;
               Rev : Attributes := 0;
               RealCol : Real_Col;
               RealRow : Real_Row;
            begin
               if Ansi.Arg (0) in 1 .. Natural (Buffer.Scrn_Size.Row) then
                  Pt := Scrn_Row (Ansi.Arg (0) - 1);
               end if;
               if Ansi.Arg (1) in 1 .. Natural (Buffer.Scrn_Size.Col) then
                  Pl := Scrn_Col (Ansi.Arg (1) - 1);
               end if;
               if Ansi.Arg (2) in 1 .. Natural (Buffer.Scrn_Size.Row) then
                  Pb := Scrn_Row (Ansi.Arg (2) - 1);
               else
                  Pb := Buffer.Scrn_Size.Row - 1;
               end if;
               if Ansi.Arg (3) in 1 .. Natural (Buffer.Scrn_Size.Col) then
                  Pr := Scrn_Col (Ansi.Arg (3) - 1);
               else
                  Pr := Buffer.Scrn_Size.Col - 1;
               end if;
               Rev := Attributes (Ansi.Arg (4));
               if Buffer.DECSACE then
                  -- rectangle mode
                  if Pl <= Pr and Pt <= Pb then
                     for Row in Pt .. Pb loop
                        for Col in Pl .. Pr loop
                           if  Col in 0 .. Buffer.Scrn_Size.Col
                           and Row in 0 .. Buffer.Scrn_Size.Row then
                              RealCol := Real (Buffer, Col);
                              RealRow := Real (Buffer, Row);
                              if (AP.ATTR_BOLD and Rev) /= 0 then
                                 Buffer.Real_Buffer (RealCol, RealRow).Bold
                                    := not Buffer.Real_Buffer 
                                       (RealCol, RealRow).Bold;
                              end if;
                              if (AP.ATTR_UNDER and Rev) /= 0 then
                                 Buffer.Real_Buffer (RealCol, RealRow).Underline
                                    := not Buffer.Real_Buffer 
                                       (RealCol, RealRow).Underline;
                              end if;
                              if (AP.ATTR_BLINK and Rev) /= 0 then
                                 Buffer.Real_Buffer (RealCol, RealRow).Flashing
                                    := not Buffer.Real_Buffer 
                                       (RealCol, RealRow).Flashing;
                              end if;
                              if (AP.ATTR_NEG and Rev) /= 0 then
                                 Buffer.Real_Buffer (RealCol, RealRow).Inverse
                                    := not Buffer.Real_Buffer 
                                       (RealCol, RealRow).Inverse;
                              end if;
                           end if;
                        end loop;
                     end loop;
                     DrawScreen (Buffer);
                  end if;
               else
                  -- stream mode
                  if Pl <= Pr and Pt <= Pb then
                     declare
                        Col : Scrn_Col := Pl;
                        Row : Scrn_Row := Pt;
                     begin
                        While ((Row < Pb) and (Col < Buffer.Scrn_Size.Col)) 
                        or    ((Row = Pb) and (Col <= Pr)) loop
                           RealCol := Real (Buffer, Col);
                           RealRow := Real (Buffer, Row);
                           if (AP.ATTR_BOLD and Rev) /= 0 then
                              Buffer.Real_Buffer (RealCol, RealRow).Bold
                                 := not Buffer.Real_Buffer 
                                    (RealCol, RealRow).Bold;
                           end if;
                           if (AP.ATTR_UNDER and Rev) /= 0 then
                              Buffer.Real_Buffer (RealCol, RealRow).Underline
                                 := not Buffer.Real_Buffer 
                                    (RealCol, RealRow).Underline;
                           end if;
                           if (AP.ATTR_BLINK and Rev) /= 0 then
                              Buffer.Real_Buffer (RealCol, RealRow).Flashing
                                 := not Buffer.Real_Buffer 
                                    (RealCol, RealRow).Flashing;
                           end if;
                           if (AP.ATTR_NEG and Rev) /= 0 then
                              Buffer.Real_Buffer (RealCol, RealRow).Inverse
                                 := not Buffer.Real_Buffer 
                                    (RealCol, RealRow).Inverse;
                           end if;
                           Col := Col + 1;
                           if Col >= Buffer.Scrn_Size.Col then
                              Col := 0;
                              Row := Row + 1;
                           end if;
                        end loop;
                     end;
                     DrawScreen (Buffer);
                  end if;
               end if;
            end;

            
         when others =>
            if REPORT_UNKNOWN_ANSI then
               if Message_Box (Buffer.Panel,
                  "Unimplemented ANSI Sequence",
                  "Parser Code = " & To_GString (Integer'Image (Ansi.Code)),
                  Ok_Box,
                  Warning_Icon)
               = Yes then
                  null;
               end if;
            else
               WS.Beep;
            end if;
   
      end case;
   
      if WrapNext and then (ScrnRow /= OrigRow or else ScrnCol /= OrigCol) then
         -- ANSI processing has moved cursor, so reset wrap flag
         WrapNext := False;
      end if;
      if Ansi.Code = AP.DO_ECHO then
         -- last received was for echo, so
         -- save last character for Repeat
         Buffer.ISOLastChar := Ansi.Char;
      else
         -- last received was not for echo
         -- (it must have been a control
         -- sequence) so no last character
         Buffer.ISOLastChar := ASCII.NUL;
      end if;
   
   end ProcessAnsi;


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
         Draw     : in     Boolean := True)
   is
   begin
      if (Input and then Buffer.AnsiOnInput) 
      or (not Input and then Buffer.AnsiOnOutput) then
         -- put this character through the Ansi parser
         AP.ParseChar (Buffer.AnsiParser, Buffer.AnsiResult, Char);
         -- now process any results produced by the Ansi parser
         for I in 1 .. Buffer.AnsiResult.Count loop
            ProcessAnsi (
               Buffer,
               ScrnCol,
               ScrnRow,
               WrapNext,
               Buffer.AnsiResult.Result (I),
               Style,
               Draw);
            -- make sure cursor doesn't end up on
            -- the second half of a double width cell
            if DoubleWidth (Buffer, ScrnCol, ScrnRow)
            and then Real (Buffer, ScrnCol) mod 2 /= 0 then
               ScrnCol := ScrnCol - 1;
            end if;
         end loop;
      else
         Graphic_Buffer.ProcessChar (
            Graphic_Buffer.Graphic_Buffer (Buffer),
            ScrnCol,
            ScrnRow,
            WrapNext,
            Char,
            Style,
            Draw);
      end if;
   end ProcessChar;


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
         Draw     : in     Boolean := True)
   is
   begin
      if Str'Length > 0 then
         -- process as individual characters so that we
         -- can parse for ANSI escape sequences. Note
         -- that we could process the whole string in
         -- the ANSI parser, but this is easier.
         for CharIndex in Str'First .. Str'Last loop
            ProcessChar (
               Buffer,
               ScrnCol,
               ScrnRow,
               WrapNext,
               Str (CharIndex),
               Style,
               Input,
               Draw);
         end loop;
      end if;
   end ProcessStr;


   procedure ProcessKey (
         Buffer  : in out Ansi_Buffer;
         Special : in     Special_Key_Type;
         Key     : in     Character;
         Modifier: in     Modifier_Key_Type;
         Numeric : in     Boolean;
         Sent    :    out Boolean)
   is
      use type GWindows.Windows.Special_Key_Type;
      --use GWindows.Key_States;

      Scroll   : Natural;
      Char     : Character := Key;

      -- EchoAndSendChar : Echo and/or send the character,
      --                   depending on the flags.
      procedure EchoAndSendChar (
            Buffer   : in out Ansi_Buffer;
            Char     : in     Character;
            Modifier : in     Modifier_Key_Type;
            Echo     : in     Boolean;
            Send     : in     Boolean;
            Sent     :    out Boolean)
      is
      begin
         if Echo then
            UndrawCursor (Buffer);
            if Buffer.SingleStyle then
               -- Combined style means we always use output style
               ProcessChar (
                  Buffer,
                  Buffer.Input_Curs.Col,
                  Buffer.Input_Curs.Row,
                  Buffer.WrapNextIn,
                  Char,
                  Buffer.OutputStyle,
                  True);
            else
               -- for echo we use the separate input style
               ProcessChar (
                  Buffer,
                  Buffer.Input_Curs.Col,
                  Buffer.Input_Curs.Row,
                  Buffer.WrapNextIn,
                  Char,
                  Buffer.InputStyle,
                  True);
            end if;
            DrawCursor (Buffer);
         end if;
         if Send then
            -- send the key(s) to the key buffer
            SendKey (Buffer, None, Char, Modifier, Sent);
         else
            -- pretend we sent it
            Sent := True;
         end if;
      end EchoAndSendChar;

      -- EchoAndSendString : Echo and/or send the string,
      --                     depending on the flags.
      procedure EchoAndSendString (
            Buffer   : in out Ansi_Buffer;
            Str      : in     String;
            Modifier : in     Modifier_Key_Type;
            Echo     : in     Boolean;
            Send     : in     Boolean;
            Sent     :    out Boolean)
      is
      begin
         for i in Str'Range loop
            EchoAndSendChar (Buffer, Str (i), Modifier, Echo, Send, Sent);
         end Loop;
      end EchoAndSendString;

      -- SendApplicationKey : Send a an application key from the numeric 
      --                      keypad, depending on whether we are emulating 
      --                      a VT52 or some other terminal.
      --                      Not used in PC mode, which always just sends
      --                      the character, and does not do special numeric 
      --                      key processing.
      procedure SendApplicationKey (
            Buffer    : in out Ansi_Buffer;
            Modifier  : in     Modifier_Key_Type;
            VT52Code  : in     String;
            OtherCode : in     String;
            Sent      :    out Boolean) is
      begin
         if Buffer.AnsiMode = VT52 then
            EchoAndSendString (
               Buffer, 
               ASCII.ESC & VT52Code, 
               Modifier, 
               Echo => False, 
               Send => True,
               Sent => Sent);
         else
            EchoAndSendString (
               Buffer, 
               AP.SS3 (Buffer.BitMode) & OtherCode, 
               Modifier, 
               Echo => False, 
               Send => True,
               Sent => Sent);
         end if;
      end SendApplicationKey;
      
      -- SendNumericKey : Send a code from the numeric keypad, depending
      --                  on the current keypad mode, and also whether
      --                  we are emulating a VT52 or some other terminal.
      --                  Not used in PC mode, which always just sends the
      --                  character, and does not do special numeric key
      --                  processing.
      procedure SendNumericKey (
            Buffer    : in out Ansi_Buffer;
            Char      : in     Character;
            Modifier  : in     Modifier_Key_Type;
            VT52Code  : in     String;
            OtherCode : in     String;
            Sent      :    out Boolean)
      is
      begin
         if Buffer.DECNKM then
            SendApplicationKey (Buffer, Modifier, VT52Code, OtherCode, Sent);
         else
            EchoAndSendChar (
               Buffer, 
               Char, 
               Modifier, 
               Echo => Buffer.EchoOn, 
               Send => True,
               Sent => Sent);
         end if;
      end SendNumericKey;

      -- SendFKey : send the specified UDK sequence for
      --            the function key if it is not null,
      --            otherwise send the default function
      --            key sequence.
      procedure SendFKey (
            Buffer  : in out Ansi_Buffer;
            UKey    : in     DECUDK_Key;
            UType   : in     DECUDK_Type;
            Default : in     String;
            Sent    :    out Boolean)
      is
      begin
         if Length (Buffer.DECUDK (UKey, UType)) = 0 then
            -- no UDK - send default function key sequence
            SendString (Buffer, AP.CSI (Buffer.BitMode) & Default, Sent);
         else
            -- send UDK
            SendString (Buffer, To_String (Buffer.DECUDK (UKey, UType)), Sent);
         end if;
      end SendFKey;

      -- SendIfExtended : In PC mode, we only send special keys
      --                  when Extended Keys are enabled.
      procedure SendIfExtended (
         Buffer   : in out Ansi_Buffer;
         Special  : in     Special_Key_Type;
         Modifier : in     Modifier_Key_Type;
         Sent     :    out Boolean)
      is
      begin
         if Buffer.ExtendedKeysOn then
            SendKey (Buffer, Special, ASCII.NUL, Modifier, Sent);
         end if;
      end SendIfExtended;

      -- CursorWidth : Return the Width of the character cell containing 
      --               the input cursor.
      function CursorWidth (Buffer : in Ansi_Buffer) return Scrn_Col
      is
      begin
        return Width (Buffer, 
                      Buffer.Input_Curs.Col, 
                      Buffer.Input_Curs.Row);
      end CursorWidth;

      -- CursorDoubleWidth : Return true if the character cell containing 
      --                     the input cursor is double width.
      function CursorDoubleWidth (Buffer : in Ansi_Buffer) return Boolean
      is
      begin
         return DoubleWidth (Buffer, 
                             Buffer.Input_Curs.Col, 
                             Buffer.Input_Curs.Row);
      end CursorDoubleWidth;

   begin
      Sent := True; -- default is to return that we have sent it
      if Special = None 
      or Special = Number_Lock then
         if Modifier = Control and Char = ' ' then
            -- DEC keyboards treat this as a null
            Char := ASCII.NUL;
         end if;
         -- check for numeric keypad keys
         if Buffer.AnsiMode /= PC and then Numeric then
            -- VTxx mode and numeric keypad key - treat them specially
            case Char is
               when '0' =>
                  SendNumericKey (Buffer, Char, Modifier, "?p", "p", Sent);
               when '1' =>
                  SendNumericKey (Buffer, Char, Modifier, "?q", "q", Sent);
               when '2' =>
                  SendNumericKey (Buffer, Char, Modifier, "?r", "r", Sent);
               when '3' =>
                  SendNumericKey (Buffer, Char, Modifier, "?s", "s", Sent);
               when '4' =>
                  SendNumericKey (Buffer, Char, Modifier, "?t", "t", Sent);
               when '5' =>
                  SendNumericKey (Buffer, Char, Modifier, "?u", "u", Sent);
               when '6' =>
                  SendNumericKey (Buffer, Char, Modifier, "?v", "v", Sent);
               when '7' =>
                  SendNumericKey (Buffer, Char, Modifier, "?w", "w", Sent);
               when '8' =>
                  SendNumericKey (Buffer, Char, Modifier, "?x", "x", Sent);
               when '9' =>
                  SendNumericKey (Buffer, Char, Modifier, "?y", "y", Sent);
               when '+' =>
                  -- NOTE THIS !!! - in VT modes, we send ',' not '+'
                  SendNumericKey (Buffer, ',', Modifier, "?l", "l", Sent);
               when ASCII.CR =>
                  SendNumericKey (Buffer, Char, Modifier, "?M", "M", Sent);
               when '.' =>
                  SendNumericKey (Buffer, Char, Modifier, "?n", "n", Sent);
               when ASCII.NUL => -- must be Num Lock
                  if Buffer.VTKeysOn then
                     SendApplicationKey (Buffer, Modifier, "P", "P", Sent);
                  end if;
               when '/' =>
                  if Buffer.VTKeysOn then
                     SendApplicationKey (Buffer, Modifier, "Q", "Q", Sent);
                  else
                     EchoAndSendChar (
                        Buffer, 
                        Char, 
                        Modifier, 
                        Echo => Buffer.EchoOn, 
                        Send => True, 
                        Sent => Sent);
                  end if;
               when '*' =>
                  if Buffer.VTKeysOn then
                     SendApplicationKey (Buffer, Modifier, "R", "R", Sent);
                  else
                     EchoAndSendChar (
                        Buffer, 
                        Char, 
                        Modifier, 
                        Echo => Buffer.EchoOn, 
                        Send => True, 
                        Sent => Sent);
                  end if;
               when '-' =>
                  if Buffer.VTKeysOn then
                     if Modifier = Shift then
                        -- when we are using "-" to send PF4, Shift "-" on 
                        -- the numeric keypad is treated as just "-"
                        SendNumericKey (
                           Buffer, 
                           Char, 
                           No_Modifier, 
                           "?m", 
                           "m", 
                           Sent);
                     else
                        SendApplicationKey (Buffer, Modifier, "S", "S", Sent);
                     end if;
                  else
                     SendNumericKey (Buffer, Char, Modifier, "?m", "m", Sent);
                  end if;
               when others =>
                  EchoAndSendChar (
                     Buffer, 
                     Char, 
                     Modifier, 
                     Echo => Buffer.EchoOn, 
                     Send => True, 
                     Sent => Sent);
            end case;
         else
            -- check for other special cases
            if Buffer.LFasEOL
            and then Modifier = No_Modifier
            and then Char = ASCII.CR then
               -- if using LF as EOL and echo is on then we perform a CR,
               -- but only return an LF - note this means that with this
               -- option set we never actually return a plain CR. This
               -- option is mainly intended for the ADA Term_IO package,
               -- which uses LF as a line terminator.
               EchoAndSendChar (
                  Buffer, 
                  Char, 
                  Modifier, 
                  Echo => Buffer.EchoOn, 
                  Send => False, 
                  Sent => Sent);
               Char := ASCII.LF;
            end if;
            if not Buffer.DECBKM
            and then Modifier = No_Modifier
            and then Char = ASCII.BS then
               -- return DEL instead of BS
               Char := ASCII.DEL;
            end if;
            -- echo the key (and send the key to the key buffer)
            EchoAndSendChar (
               Buffer, 
               Char, 
               Modifier, 
               Echo => Buffer.EchoOn, 
               Send => True, 
               Sent => Sent);
            if Buffer.LFonCR and then Char = ASCII.CR then
               -- we sent a CR, so also send an LF (but do not echo)
               EchoAndSendChar (
                  Buffer, 
                  ASCII.LF, 
                  Modifier, 
                  Echo => False, 
                  Send => True, 
                  Sent => Sent);
            end if;
         end if;
      else
         case Special is
            -- process a special key
            when Up_Key =>
               if Buffer.UpDownView and not Buffer.CursorKeysOn then
                  UndrawCursor (Buffer);
                  ViewUp (Buffer, 1, Scroll);
                  DrawCursor (Buffer);
               elsif Buffer.CursorKeysOn then
                  UndrawCursor (Buffer);
                  if Buffer.Input_Curs.Row > 0 then
                     Buffer.Input_Curs.Row := Buffer.Input_Curs.Row - 1;
                  elsif Buffer.UpDownView then
                     -- Scroll view up if we can
                     ViewUp (Buffer, 1, Scroll);
                     Buffer.Input_Curs.Row := 0;
                  end if;
                  if CursorDoubleWidth (Buffer)
                  and then Real (Buffer, Buffer.Input_Curs.Col) mod 2 /= 0 then
                     Buffer.Input_Curs.Col := Buffer.Input_Curs.Col - 1;
                  end if;
                  -- processing has moved input cursor, so reset wrap flag
                  Buffer.WrapNextIn := False;
                  DrawCursor (Buffer);
               else
                  if Buffer.AnsiMode = PC then
                     -- PC mode : send as special key
                     -- requires user to use GetExtended
                     SendIfExtended (Buffer, Special, Modifier, Sent);
                  elsif Buffer.AnsiMode = VT52 then
                     SendString (
                        Buffer, 
                        ASCII.ESC & "A", 
                        Sent);
                  else
                     if Buffer.DECCKM then
                        SendString (
                           Buffer, 
                           AP.SS3 (Buffer.BitMode) & "A", 
                           Sent);
                     else
                        SendString (
                           Buffer, 
                           AP.CSI (Buffer.BitMode) & "A", 
                           Sent);
                     end if;
                  end if;
               end if;
            when Down_Key =>
               if Buffer.UpDownView and not Buffer.CursorKeysOn then
                  UndrawCursor (Buffer);
                  ViewDown (Buffer, 1, Scroll);
                  DrawCursor (Buffer);
               elsif Buffer.CursorKeysOn then
                  UndrawCursor (Buffer);
                  if Buffer.Input_Curs.Row < Buffer.Scrn_Size.Row - 1 then
                     Buffer.Input_Curs.Row := Buffer.Input_Curs.Row + 1;
                  elsif Buffer.UpDownView then
                     -- Scroll view down if we can
                     ViewDown (Buffer, 1, Scroll);
                     Buffer.Input_Curs.Row := Buffer.Scrn_Size.Row - 1;
                  end if;
                  if CursorDoubleWidth (Buffer)
                  and then Real (Buffer, Buffer.Input_Curs.Col) mod 2 /= 0 then
                     Buffer.Input_Curs.Col := Buffer.Input_Curs.Col - 1;
                  end if;
                  -- processing has moved input cursor, so reset wrap flag
                  Buffer.WrapNextIn := False;
                  DrawCursor (Buffer);
               else
                  if Buffer.AnsiMode = PC then
                     -- PC mode : send as special key
                     -- requires user to use GetExtended
                     SendIfExtended (Buffer, Special, Modifier, Sent);
                  elsif Buffer.AnsiMode = VT52 then
                     SendString (
                        Buffer, 
                        ASCII.ESC & "B", 
                        Sent);
                  else
                     if Buffer.DECCKM then
                        SendString (
                           Buffer, 
                           AP.SS3 (Buffer.BitMode) & "B", 
                           Sent);
                     else
                        SendString (
                           Buffer, 
                           AP.CSI (Buffer.BitMode) & "B", 
                           Sent);
                     end if;
                  end if;
               end if;
            when Left_Key =>
               if Buffer.CursorKeysOn then
                  UndrawCursor (Buffer);
                  if Buffer.Input_Curs.Col >= CursorWidth (Buffer)
                  then
                     Buffer.Input_Curs.Col 
                        := Buffer.Input_Curs.Col - CursorWidth (Buffer);
                  elsif Buffer.Input_Curs.Row > 0 then
                     if Buffer.LRWrap then
                        -- wrap to end of previous line
                        Last (
                           Buffer, 
                           Buffer.Input_Curs.Col, 
                           Buffer.Input_Curs.Row);
                        Buffer.Input_Curs.Row := Buffer.Input_Curs.Row - 1;
                     end if;
                  else
                     if Buffer.LRScroll then
                        -- Scroll screen up (if we can)
                        ScreenUp (Buffer, Buffer.BlankStyle, 1, Scroll);
                        if Scroll /= 0 then
                           Last (
                              Buffer, 
                              Buffer.Input_Curs.Col, 
                              Buffer.Input_Curs.Row);
                           Buffer.Input_Curs.Row := 0;
                        end if;
                     end if;
                  end if;
                  if CursorDoubleWidth (Buffer)
                  and then Real (Buffer, Buffer.Input_Curs.Col) mod 2 /= 0 then
                     Buffer.Input_Curs.Col := Buffer.Input_Curs.Col - 1;
                  end if;
                  -- processing has moved input cursor, so reset wrap flag
                  Buffer.WrapNextIn := False;
                  DrawCursor (Buffer);
               else
                  if Buffer.AnsiMode = PC then
                     -- PC mode : send as special key
                     -- requires user to use GetExtended
                     SendIfExtended (Buffer, Special, Modifier, Sent);
                  elsif Buffer.AnsiMode = VT52 then
                     SendString (Buffer, ASCII.ESC & "D", Sent);
                  else
                     if Buffer.DECCKM then
                        SendString (
                           Buffer, 
                           AP.SS3 (Buffer.BitMode) & "D", 
                           Sent);
                     else
                        SendString (
                           Buffer, 
                           AP.CSI (Buffer.BitMode) & "D", 
                           Sent);
                     end if;
                  end if;
               end if;
            when Right_Key =>
               if Buffer.CursorKeysOn then
                  UndrawCursor (Buffer);
                  if Buffer.Input_Curs.Col 
                  < Buffer.Scrn_Size.Col - CursorWidth (Buffer) then
                     Buffer.Input_Curs.Col 
                        := Buffer.Input_Curs.Col + CursorWidth (Buffer);
                  elsif Buffer.Input_Curs.Row < Buffer.Scrn_Size.Row - 1 then
                     if Buffer.LRWrap then
                        -- wrap to start of next line
                        Home (Buffer, Buffer.Input_Curs.Col);
                        Buffer.Input_Curs.Row := Buffer.Input_Curs.Row + 1;
                     end if;
                  else
                     if Buffer.LRScroll then
                        -- Scroll screen down (if we can)
                        ScreenDown (Buffer, Buffer.BlankStyle, 1, Scroll);
                        if Scroll /= 0 then
                           Home (Buffer, Buffer.Input_Curs.Col);
                           Buffer.Input_Curs.Row := Buffer.Scrn_Size.Row - 1;
                        end if;
                     end if;
                  end if;
                  if CursorDoubleWidth (Buffer)
                  and then Real (Buffer, Buffer.Input_Curs.Col) mod 2 /= 0 then
                     Buffer.Input_Curs.Col := Buffer.Input_Curs.Col - 1;
                  end if;
                  -- processing has moved input cursor, so reset wrap flag
                  Buffer.WrapNextIn := False;
                  DrawCursor (Buffer);
               else
                  if Buffer.AnsiMode = PC then
                     -- PC mode : send as special key
                     -- requires user to use GetExtended
                     SendIfExtended (Buffer, Special, Modifier, Sent);
                  elsif Buffer.AnsiMode = VT52 then
                     SendString (
                        Buffer, 
                        ASCII.ESC & "C", 
                        Sent);
                  else
                     if Buffer.DECCKM then
                        SendString (
                           Buffer, 
                           AP.SS3 (Buffer.BitMode) & "C", 
                           Sent);
                     else
                        SendString (
                           Buffer, 
                           AP.CSI (Buffer.BitMode) & "C", 
                           Sent);
                     end if;
                  end if;
               end if;
            when Page_Up =>
               if Buffer.PageView then
                  -- Scroll the view up a page, or as far as we can
                  UndrawCursor (Buffer);
                  ViewUp (Buffer, Natural (Buffer.Scrn_Size.Row), Scroll);
                  DrawCursor (Buffer);
               else
                  if Buffer.AnsiMode = PC then
                     -- PC mode : send as special key
                     -- requires user to use GetExtended
                     SendIfExtended (Buffer, Special, Modifier, Sent);
                  else
                     -- VTxx mode : editing keypad "Prev Screen"
                     SendString (Buffer, AP.CSI (Buffer.BitMode) & "5~", Sent);
                  end if;
               end if;
            when Page_Down =>
               if Buffer.PageView then
                  -- Scroll the view down a page, or as far as we can
                  UndrawCursor (Buffer);
                  ViewDown (Buffer, Natural (Buffer.Scrn_Size.Row), Scroll);
                  DrawCursor (Buffer);
               else
                  if Buffer.AnsiMode = PC then
                     -- PC mode : send as special key
                     -- requires user to use GetExtended
                     SendIfExtended (Buffer, Special, Modifier, Sent);
                  else
                     -- VTxx mode : editing keypad "Next Screen"
                     SendString (Buffer, AP.CSI (Buffer.BitMode) & "6~", Sent);
                  end if;
               end if;
            when Home_Key =>
               if Buffer.HomeEndView then
                  UndrawCursor (Buffer);
                  ViewUp (
                     Buffer, 
                     Natural (
                        Max (
                           Virt (Buffer, 
                           Buffer.Scrn_Size.Row), 
                           Buffer.Virt_Used.Row)), 
                     Scroll);
                  DrawCursor (Buffer);
               elsif Buffer.CursorKeysOn then
                  UndrawCursor (Buffer);
                  if not Buffer.HomeEndInLine then
                     Buffer.Input_Curs.Row := 0;
                  end if;
                  Home (Buffer, Buffer.Input_Curs.Col);
                  -- processing has moved input cursor, so reset wrap flag
                  Buffer.WrapNextIn := False;
                  DrawCursor (Buffer);
               else
                  if Buffer.AnsiMode = PC then
                     -- PC mode : send as special key
                     -- requires user to use GetExtended
                     SendIfExtended (Buffer, Special, Modifier, Sent);
                  else
                     -- VTxx mode : editing keypad "Find"
                     SendString (Buffer, AP.CSI (Buffer.BitMode) & "1~", Sent);
                  end if;
               end if;
            when End_Key =>
               if Buffer.HomeEndView then
                  UndrawCursor (Buffer);
                  ViewDown (
                     Buffer, 
                     Natural (
                        Max (
                           Virt (Buffer, Buffer.Scrn_Size.Row - 1) + 1, 
                           Buffer.Virt_Used.Row)), 
                     Scroll);
                  DrawCursor (Buffer);
               elsif Buffer.CursorKeysOn then
                  UndrawCursor (Buffer);
                  if not Buffer.HomeEndInLine then
                     Buffer.Input_Curs.Row := Buffer.Scrn_Size.Row - 1;
                  end if;
                  Last (Buffer, Buffer.Input_Curs.Col, Buffer.Input_Curs.Row);
                  -- processing has moved input cursor, so reset wrap flag
                  Buffer.WrapNextIn := False;
                  DrawCursor (Buffer);
               else
                  if Buffer.AnsiMode = PC then
                     -- send as special key
                     -- requires user to use GetExtended
                     SendIfExtended (Buffer, Special, Modifier, Sent);
                  else
                     -- editing keypad "Select"
                     SendString (Buffer, AP.CSI (Buffer.BitMode) & "4~", Sent);
                  end if;
               end if;
            when Insert =>
               if Buffer.AnsiMode = PC then
                  -- send as special key
                  -- requires user to use GetExtended
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- editing keypad "Insert Here"
                  SendString (Buffer, AP.CSI (Buffer.BitMode) & "2~", Sent);
               end if;
            when Delete =>
               if Buffer.AnsiMode = PC then
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- editing keypad "Remove"
                  SendString (Buffer, AP.CSI (Buffer.BitMode) & "3~", Sent);
               end if;
            when Scroll_Lock =>
               if Buffer.AnsiMode = PC then
                  -- PC mode : send as special key
                  -- requires user to use GetExtended
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- Scroll Lock (i.e. XON/XOFF)
                  if Buffer.NoScroll then
                     SendKey (Buffer, None, ASCII.DC1, Modifier, Sent); -- XON
                     Buffer.NoScroll := False;
                  else
                     SendKey (Buffer, None, ASCII.DC3, Modifier, Sent); -- XOFF
                     Buffer.NoScroll := True;
                  end if;
               end if;
            when F1 =>
               if Buffer.AnsiMode = PC then
                  -- PC mode : send as special key
                  -- requires user to use GetExtended
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- VTxxx mode
                  if Buffer.VTKeysOn then
                     -- F1 sends code or UDK only when in VT420 mode
                     if Buffer.AnsiMode = VT420 then
                        case modifier is
                           -- note that control F1 is treated as just F1
                           when No_Modifier | Control =>
                              SendFKey (Buffer, 1, unshifted, "11~", Sent);
                           when Shift | Control_Shift =>
                              SendFKey (Buffer, 1, shifted, "11;2~", Sent);
                           when Alt | Control_Alt =>
                              SendFKey (Buffer, 1, alt_unshifted, "11~", Sent);
                           when Shift_Alt | Control_Shift_Alt =>
                              SendFKey (Buffer, 1, alt_shifted, "11;2~", Sent);
                        end case;
                     end if;
                  else
                     -- treat F1 as PF1 from numeric keypad
                     if Buffer.AnsiMode = VT52 then
                        SendString (
                           Buffer, ASCII.ESC & "P", 
                           Sent);
                     else
                        SendString (
                           Buffer, 
                           AP.SS3 (Buffer.BitMode) & "P", 
                           Sent);
                     end if;
                  end if;
               end if;
            when F2 =>
               if Buffer.AnsiMode = PC then
                  -- PC mode : send as special key
                  -- requires user to use GetExtended
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- VTxxx mode
                  if Buffer.VTKeysOn then
                     -- F2 sends code or UDK only when in VT420 mode
                     if Buffer.AnsiMode = VT420 then
                        case modifier is
                           -- note that control F2 is treated as just F2
                           when No_Modifier | Control =>
                              SendFKey (Buffer, 2, unshifted, "12~", Sent);
                           when Shift | Control_Shift =>
                              SendFKey (Buffer, 2, shifted, "12;2~", Sent);
                           when Alt | Control_Alt =>
                              SendFKey (Buffer, 2, alt_unshifted, "12~", Sent);
                           when Shift_Alt | Control_Shift_Alt =>
                              SendFKey (Buffer, 2, alt_shifted, "12;2~", Sent);
                        end case;
                     end if;
                  else
                     -- treat F2 as PF2 from numeric keypad
                     if Buffer.AnsiMode = VT52 then
                        SendString (
                           Buffer, 
                           ASCII.ESC & "Q", 
                           Sent);
                     else
                        SendString (
                           Buffer, 
                           AP.SS3 (Buffer.BitMode) & "Q", 
                           Sent);
                     end if;
                  end if;
               end if;
            when F3 =>
               if Buffer.AnsiMode = PC then
                  -- PC mode : send as special key
                  -- requires user to use GetExtended
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- VTxxx mode
                  if Buffer.VTKeysOn then
                     -- F3 sends code or UDK only when in VT420 mode
                     if Buffer.AnsiMode = VT420 then
                        case modifier is
                           -- note that control F3 is treated as just F3
                           when No_Modifier | Control =>
                              SendFKey (Buffer, 3, unshifted, "13~", Sent);
                           when Shift | Control_Shift =>
                              SendFKey (Buffer, 3, shifted, "13;2~", Sent);
                           when Alt | Control_Alt =>
                              SendFKey (Buffer, 3, alt_unshifted, "13~", Sent);
                           when Shift_Alt | Control_Shift_Alt =>
                              SendFKey (Buffer, 3, alt_shifted, "13;2~", Sent);
                        end case;
                     end if;
                  else
                     -- treat F3 as PF3 from numeric keypad
                     if Buffer.AnsiMode = VT52 then
                        SendString (
                           Buffer, 
                           ASCII.ESC & "R", 
                           Sent);
                     else
                        SendString (
                           Buffer, 
                           AP.SS3 (Buffer.BitMode) & "R", 
                           Sent);
                     end if;
                  end if;
               end if;
            when F4 =>
               if Buffer.AnsiMode = PC then
                  -- PC mode : send as special key
                  -- requires user to use GetExtended
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- VTxxx mode
                  if Buffer.VTKeysOn then
                     -- F4 sends code or UDK only when in VT420 mode
                     if Buffer.AnsiMode = VT420 then
                        case modifier is
                           -- note that control F4 is treated as just F4
                           when No_Modifier | Control =>
                              SendFKey (Buffer, 4, unshifted, "14~", Sent);
                           when Shift | Control_Shift =>
                              SendFKey (Buffer, 4, shifted, "14;2~", Sent);
                           when Alt | Control_Alt =>
                              SendFKey (Buffer, 4, alt_unshifted, "14~", Sent);
                           when Shift_Alt | Control_Shift_Alt =>
                              SendFKey (Buffer, 4, alt_shifted, "14;2~", Sent);
                        end case;
                     end if;
                  else
                     -- treat F4 as PF4 from numeric keypad
                     if Buffer.AnsiMode = VT52 then
                        SendString (
                           Buffer, 
                           ASCII.ESC & "S", 
                           Sent);
                     else
                        SendString (
                           Buffer, 
                           AP.SS3 (Buffer.BitMode) & "S", 
                           Sent);
                     end if;
                  end if;
               end if;
            when F5 =>
               if Buffer.AnsiMode = PC then
                  -- PC mode : send as special key
                  -- requires user to use GetExtended
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- VTxx mode : send function key sequence or UDK
                  case modifier is
                     when No_Modifier =>
                        -- F5
                        if Buffer.AnsiMode = VT420 then
                           -- On a VT420, F5 sends a code 
                           SendFKey (Buffer, 5, unshifted, "15~", Sent);
                        else
                           -- Otherwise, F5 should not send a key sequence, 
                           -- except that CTRL-F5 should send ANSWERBACK. 
                           -- However, we use CTRL-F5 for F13, so we use plain 
                           -- old F5 to send ANSWERBACK
                           SendString (
                              Buffer, 
                              DEFAULT_ANSWERBACK, 
                              Sent);
                        end if;
                     when Shift =>
                        if Buffer.AnsiMode = VT420 then
                           SendFKey (Buffer, 5, shifted, "15;2~", Sent);
                        end if;
                     when Alt =>
                        if Buffer.AnsiMode = VT420 then
                           SendFKey (Buffer, 5, alt_unshifted, "15~", Sent);
                        end if;
                     when Shift_Alt =>
                        if Buffer.AnsiMode = VT420 then
                           SendFKey (Buffer, 5, alt_shifted, "15;2~", Sent);
                        end if;
                     when Control =>
                        -- control F5 is treated as F13
                        if Buffer.AnsiMode = VT420 then
                           -- F13 sends VT20 sequence
                           SendFKey (Buffer, 13, unshifted, "25~", Sent);
                        else
                           -- F13 sends LF
                           SendKey (Buffer, None, ASCII.LF, Modifier, Sent);
                        end if;
                     when Control_Shift =>
                        SendFKey (Buffer, 13, shifted, "25;2~", Sent);
                     when Control_Alt =>
                        SendFKey (Buffer, 13, alt_unshifted, "25~", Sent);
                     when Control_Shift_Alt =>
                        SendFKey (Buffer, 13, alt_shifted, "25;2~", Sent);
                     when others =>
                        -- send nothing.
                        null;
                  end case;
               end if;
            when F6 =>
               if Buffer.AnsiMode = PC then
                  -- PC mode : send as special key
                  -- requires user to use GetExtended
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- VTxx mode : send function key sequence or UDK
                  case modifier is
                     -- note that control F6 is treated as F14
                     when No_Modifier =>
                        SendFKey (Buffer, 6, unshifted, "17~", Sent);
                     when Shift =>
                        SendFKey (Buffer, 6, shifted, "17;2~", Sent);
                     when Alt =>
                        SendFKey (Buffer, 6, alt_unshifted, "17~", Sent);
                     when Shift_Alt =>
                        SendFKey (Buffer, 6, alt_shifted, "17;2~", Sent);
                     when Control =>
                        SendFKey (Buffer, 14, unshifted, "26~", Sent);
                     when Control_Shift =>
                        SendFKey (Buffer, 14, shifted, "26;2~", Sent);
                     when Control_Alt =>
                        SendFKey (Buffer, 14, alt_unshifted, "26~", Sent);
                     when Control_Shift_Alt =>
                        SendFKey (Buffer, 14, alt_shifted, "26;2~", Sent);
                  end case;
               end if;
            when F7 =>
               if Buffer.AnsiMode = PC then
                  -- PC mode : send as special key
                  -- requires user to use GetExtended
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- VTxx mode : send function key sequence or UDK
                  case modifier is
                     -- note that control F7 is treated as F15
                     when No_Modifier =>
                        SendFKey (Buffer, 7, unshifted, "18~", Sent);
                     when Shift =>
                        SendFKey (Buffer, 7, shifted, "18;2~", Sent);
                     when Alt =>
                        SendFKey (Buffer, 7, alt_unshifted, "18~", Sent);
                     when Shift_Alt =>
                        SendFKey (Buffer, 7, alt_shifted, "18;2~", Sent);
                     when Control =>
                        SendFKey (Buffer, 15, unshifted, "28~", Sent);
                     when Control_Shift =>
                        SendFKey (Buffer, 15, shifted, "28;2~", Sent);
                     when Control_Alt =>
                        SendFKey (Buffer, 15, alt_unshifted, "28~", Sent);
                     when Control_Shift_Alt =>
                        SendFKey (Buffer, 15, alt_shifted, "28;2~", Sent);
                  end case;
               end if;
            when F8 =>
               if Buffer.AnsiMode = PC then
                  -- PC mode : send as special key
                  -- requires user to use GetExtended
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- VTxx mode : send function key sequence or UDK
                  case modifier is
                     -- note that control F8 is treated as F16
                     when No_Modifier =>
                        SendFKey (Buffer, 8, unshifted, "19~", Sent);
                     when Shift =>
                        SendFKey (Buffer, 8, shifted, "19;2~", Sent);
                     when Alt =>
                        SendFKey (Buffer, 8, alt_unshifted, "19~", Sent);
                     when Shift_Alt =>
                        SendFKey (Buffer, 8, alt_shifted, "19;2~", Sent);
                     when Control =>
                        SendFKey (Buffer, 16, unshifted, "29~", Sent);
                     when Control_Shift =>
                        SendFKey (Buffer, 16, shifted, "29;2~", Sent);
                     when Control_Alt =>
                        SendFKey (Buffer, 16, alt_unshifted, "29~", Sent);
                     when Control_Shift_Alt =>
                        SendFKey (Buffer, 16, alt_shifted, "29;2~", Sent);
                  end case;
               end if;
            when F9 =>
               if Buffer.AnsiMode = PC then
                  -- PC mode : send as special key
                  -- requires user to use GetExtended
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- VTxx mode : send function key sequence or UDK
                  case modifier is
                     -- note that control F9 is treated as F17
                     when No_Modifier =>
                        SendFKey (Buffer, 9, unshifted, "20~", Sent);
                     when Shift =>
                        SendFKey (Buffer, 9, shifted, "20;2~", Sent);
                     when Alt =>
                        SendFKey (Buffer, 9, alt_unshifted, "20~", Sent);
                     when Shift_Alt =>
                        SendFKey (Buffer, 9, alt_shifted, "20;2~", Sent);
                     when Control =>
                        SendFKey (Buffer, 17, unshifted, "31~", Sent);
                     when Control_Shift =>
                        SendFKey (Buffer, 17, shifted, "31;2~", Sent);
                     when Control_Alt =>
                        SendFKey (Buffer, 17, alt_unshifted, "31~", Sent);
                     when Control_Shift_Alt =>
                        SendFKey (Buffer, 17, alt_shifted, "31;2~", Sent);
                  end case;
               end if;
            when F10 =>
               if Buffer.AnsiMode = PC then
                  -- PC mode : send as special key
                  -- requires user to use GetExtended
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- VTxx mode : send function key sequence or UDK
                  case modifier is
                     -- note that control F10 is treated as F18
                     when No_Modifier =>
                        SendFKey (Buffer, 10, unshifted, "21~", Sent);
                     when Shift =>
                        SendFKey (Buffer, 10, shifted, "21;2~", Sent);
                     when Alt =>
                        SendFKey (Buffer, 10, alt_unshifted, "21~", Sent);
                     when Shift_Alt =>
                        SendFKey (Buffer, 10, alt_shifted, "21;2~", Sent);
                     when Control =>
                        SendFKey (Buffer, 18, unshifted, "32~", Sent);
                     when Control_Shift =>
                        SendFKey (Buffer, 18, shifted, "32;2~", Sent);
                     when Control_Alt =>
                        SendFKey (Buffer, 18, alt_unshifted, "32~", Sent);
                     when Control_Shift_Alt =>
                        SendFKey (Buffer, 18, alt_shifted, "32;2~", Sent);
                  end case;
               end if;
            when F11 =>
               if Buffer.AnsiMode = PC then
                  -- PC mode : send as special key
                  -- requires user to use GetExtended
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- VTxx mode : send function key sequence or UDK
                  case modifier is
                     -- note that control F11 is treated as F19
                     when No_Modifier =>
                        -- F11
                        if Buffer.AnsiMode = VT420 then 
                           -- On a VT420, F11 sends a code 
                           SendFKey (Buffer, 11, unshifted, "23~", Sent);
                        else
                           -- Otherwise, F11 sends ESC
                           SendKey (Buffer, None, ASCII.ESC, Modifier, Sent);
                        end if;
                     when Shift =>
                        SendFKey (Buffer, 11, shifted, "23;2~", Sent);
                     when Alt =>
                        SendFKey (Buffer, 11, alt_unshifted, "23~", Sent);
                     when Shift_Alt =>
                        SendFKey (Buffer, 11, alt_shifted, "23;2~", Sent);
                     when Control =>
                        SendFKey (Buffer, 19, unshifted, "33~", Sent);
                     when Control_Shift =>
                        SendFKey (Buffer, 19, shifted, "33;2~", Sent);
                     when Control_Alt =>
                        SendFKey (Buffer, 19, alt_unshifted, "33~", Sent);
                     when Control_Shift_Alt =>
                        SendFKey (Buffer, 19, alt_shifted, "33;2~", Sent);
                  end case;
               end if;
            when F12 =>
               if Buffer.AnsiMode = PC then
                  -- PC mode : send as special key
                  -- requires user to use GetExtended
                  SendIfExtended (Buffer, Special, Modifier, Sent);
               else
                  -- VTxx mode : send function key sequence or UDK
                  case modifier is
                     -- note that control F12 is treated as F20
                     when No_Modifier =>
                        -- F12
                        if Buffer.AnsiMode = VT420 then 
                           -- On a VT420, F12 sends a code 
                           SendFKey (Buffer, 12, unshifted, "24~", Sent);
                        else
                           -- OTherwise, F12 sends BS
                           SendKey (Buffer, None, ASCII.BS, Modifier, Sent);
                        end if;
                     when Shift =>
                        SendFKey (Buffer, 12, shifted, "24;2~", Sent);
                     when Alt =>
                        SendFKey (Buffer, 12, alt_unshifted, "24~", Sent);
                     when Shift_Alt =>
                        SendFKey (Buffer, 12, alt_shifted, "24;2~", Sent);
                     when Control =>
                        SendFKey (Buffer, 20, unshifted, "34~", Sent);
                     when Control_Shift =>
                        SendFKey (Buffer, 20, shifted, "34;2~", Sent);
                     when Control_Alt =>
                        SendFKey (Buffer, 20, alt_unshifted, "34~", Sent);
                     when Control_Shift_Alt =>
                        SendFKey (Buffer, 20, alt_shifted, "34;2~", Sent);
                  end case;
               end if;
            when others =>
               -- not a special key, so it will be
               -- handled by normal key processing.
               Sent := False;
         end case;
      end if;
   end ProcessKey;


end Ansi_Buffer;
