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

with GWindows.Types;
with GWindows.Drawing;
with GWindows.Drawing_Objects;
with Common_Dialogs;
with Interfaces.C;
with Terminal_Internal_Types;
with Buffer_Types;
with Scroll_Buffer;
with Font_Maps;

package Graphic_Buffer is

   use Terminal_Internal_Types;
   use Buffer_Types;
   use Scroll_Buffer;
   use Font_Maps;

   package GT  renames GWindows.Types;
   package GD  renames GWindows.Drawing;
   package GDO renames GWindows.Drawing_Objects;
   package CD  renames Common_Dialogs;
   package IC  renames Interfaces.C;


   type Graphic_Buffer is new Scroll_Buffer.Scroll_Buffer with record

      -- character processing flags:

      EchoOn         : Boolean  := True;  -- text input echo
      WrapOn         : Boolean  := False; -- text input wrap at EOL
      IgnoreCR       : Boolean  := False; -- do not process CR
      IgnoreLF       : Boolean  := False; -- do not process LF
      LFonCR         : Boolean  := False; -- CR key does CR, but returns CRLF
      CRonLF         : Boolean  := False; -- received LF performs CRLF
      FFisLF         : Boolean  := False; -- FF does same as LF
      LFasEOL        : Boolean  := False; -- CR key does CRLF, but returns LF
      WrapNextIn     : Boolean  := False; -- next input char will cause wrap
      WrapNextOut    : Boolean  := False; -- next output char will cause wrap
      ScrollOnPut    : Boolean  := True;  -- View set to Screen on new output
      Pasting        : Boolean  := False; -- True while pasting a string

      -- character font maps:

      GLSet          : Font_Map := WIN_DEFAULT;
      GLNum          : Natural  := 0;
      GRSet          : Font_Map := WIN_DEFAULT;
      GRNum          : Natural  := 0;
      G0Set          : Font_Map := DEC_MULTINATIONAL;
      G1Set          : Font_Map := DEC_MULTINATIONAL;
      G2Set          : Font_Map := DEC_MULTINATIONAL;
      G3Set          : Font_Map := DEC_MULTINATIONAL;
      PrintAuto      : Boolean  := False; -- Auto Print Mode

      -- printer and print document related flags and values:
      
      PrintChosenOk  : Boolean  := False; -- Printer chosen
      PrintCanvas    : GD.Printer_Canvas_Type;
      PrintDocOpen   : Boolean  := False; -- Document currently open
      PrintRowsUsed  : Natural  := 0;
      PrintColsUsed  : Natural  := 0;
      PrintWidth     : Natural  := 0;
      PrintHeight    : Natural  := 0;
      PrintStartX    : Natural  := 0;
      PrintStartY    : Natural  := 0;
      PrintStopX     : Natural  := 0;
      PrintStopY     : Natural  := 0;
      PrintSettings  : CD.DEVMODE;
      PrintFlags     : IC.unsigned  := 0;
      PrintFromPage  : Natural  := 1;
      PrintToPage    : Natural  := 1;
      PrintCopies    : Natural  := 1;
      PrintCellSize  : GT.Size_Type  := (0, 0);
      PrintFonts     : Font_Type_Array;
      PrintStockFont : GDO.Font_Type;
   
      -- page setup related flags and values

      PageSetupOk    : Boolean  := False; -- Page setup performed
      PageGeometryOk : Boolean  := False; -- Page geometry calculated
      PageFlags      : IC.unsigned  := 0;
      PageSize       : GT.Point_Type  := (0, 0);
      PageMargins    : GT.Rectangle_Type  := (0, 0, 0, 0);
      PageCols       : Natural  := 0;
      PageRows       : Natural  := 0;

      -- file load/save related flags and values:
   
      FileName       : Unbounded_String;

   end record;


   -- ProcessChar : Process a character, which may be either a graphic
   --               or non-graphic character.
   procedure ProcessChar (
         Buffer   : in out Graphic_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         WrapNext : in out Boolean;
         Char     : in     Character;
         Style    : in out Real_Cell;
         Input    : in     Boolean := True;
         Draw     : in     Boolean := True);


   -- ProcessStr : Process a string, which may contain either graphic
   --              or non-graphic characters.
   procedure ProcessStr (
         Buffer   : in out Graphic_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         WrapNext : in out Boolean;
         Str      : in     String;
         Style    : in out Real_Cell;
         Input    : in     Boolean := True;
         Draw     : in     Boolean := True);


   -- ForceWrap : This procedure can be used to force a cursor wrap.
   --             This is necessary if we need to force the cursor
   --             to the correct location, even though it would not
   --             normally wrap until the next character is processed.
   procedure ForceWrap (
         Buffer   : in out Graphic_Buffer;
         ScrnCol  : in out Scrn_Col;
         ScrnRow  : in out Scrn_Row;
         WrapNext : in out Boolean;
         Style    : in out Real_Cell);


   -- CopySelection : make a copy of the current selection
   --                 in a new clipboard buffer. Note that
   --                 we end each line with a CRLF unless
   --                 the DEC_CONTROL font is in use.
   procedure Copyselection (
         Buffer : in out Graphic_Buffer;
         Clip   : in out WS.Clipboard_Data_Access;
         Length : in out Natural);


   -- PasteSelection : paste copy buffer at the current buffer position
   --                  (PasteToBuff) and/or to the keyboard (PasteToKybd).
   --                  Convert CRs into CR/LFs when writing to the buffer,
   --                  but not the keyboard. Turn AutoLF off while pasting.
   --                  Do not write CR or LF if we wrap on the write.
   --                  Accepts location so it can be used with input or
   --                  output cursor, and style so it can be used with
   --                  input or output style.
   procedure PasteSelection (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         WrapNext : in out Boolean;
         Style    : in out Real_Cell;
         From     : in     WS.Clipboard_Data_Access;
         Length   : in     Natural);


   -- LoadBufferFromFile : Load a file into the buffer. Accepts location
   --                      so it can be used with Input or Output Cursor,
   --                      and with Input or Output style.
   procedure LoadBufferFromFile (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         WrapNext : in out Boolean;
         Style    : in out Real_Cell;
         FileName : in     Unbounded_String);
   

   -- OpenFile : Open the "Open File" dialog box to allow the
   --            uset to select a file, then load the buffer
   --            from that file.
   procedure OpenFile (
         Buffer       : in out Graphic_Buffer);


   -- SaveBufferToFile : Save the whole buffer to the specified file.
   --                    Note that each rows is terminated by a CRLF
   --                    unless the DEC_CONTROL font is in use.
   procedure SaveBufferToFile (
         Buffer       : in out Graphic_Buffer;
         FileName     : in     Unbounded_String;
         Check_Exists : in     Boolean           := False);


   -- SaveAsFile : Open the "Save As" dialog box to allow the user
   --              to specify a file name. Then save the buffer to
   --              that filename.
   procedure SaveAsFile (
         Buffer : in out Graphic_Buffer);


   -- SaveFile : If a Filename is already known, save the buffer
   --            as a file. Otherwise open the "Save As" dialog
   --            box.
   procedure SaveFile (
         Buffer : in out Graphic_Buffer);


   -- Print : Print specified Char (if not ASCII.NUL) or the
   --         specified rows (if Rows is True), or the current
   --         selection (if there is one) or the whole buffer.
   --         if KeepOpen is True, then do not close the print
   --         document - new prints will be added to the open
   --         document. If FormFeed is True, end the page after
   --         this print (always the case when KeepOpen is False).
   procedure Print (
         Buffer   : in out Graphic_Buffer;
         Char     : in     Character := ASCII.NUL;
         Rows     : in     Boolean   := False;
         FirstRow : in     Virt_Row  := 0;
         LastRow  : in     Virt_Row  := 0;
         FormFeed : in     Boolean   := False;
         KeepOpen : in     Boolean   := False);


   -- PageSetup : Open the "Page Setup" dialog box.
   procedure PageSetup (
         Buffer : in out Graphic_Buffer);


   -- PerformBS : Perform Backspace processing. Accepts location
   --             so it can be used with Input Cursor or Output Cursor
   procedure PerformBS (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True);


   -- PerformCR : Perform Carriage Return processing. Accepts location so it
   --             can be used with Input Cursor or Output Cursor
   procedure PerformCR (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True);


   -- PerformBEL : Perform Bell processing. Accepts location so it
   --             can be used with Input Cursor or Output Cursor
   procedure PerformBEL (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True);


   -- PerformHT : Perform Horizontal Tab processing. Accepts location so it
   --             can be used with Input Cursor or Output Cursor
   procedure PerformHT (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True);


   -- PerformBT : Perform Backwards Tab processing. Accepts location so it
   --             can be used with Input Cursor or Output Cursor
   procedure PerformBT (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True);


   -- PerformLF : Perform Line Feed processing. Accepts location so it can be
   --             used with Input Cursor or Output Cursor.
   procedure PerformLF (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True);


   -- PerformFF : Perform Form Feed processing. Accepts location
   --             so it can be used with Input Cursor or Output Cursor
   procedure PerformFF (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True);


   -- PerformNEL : Perform New Line processing. Accepts location
   --             so it can be used with Input Cursor or Output Cursor
   procedure PerformNEL (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True);


   -- PerformRI : Perform Reverse Index processing. Accepts location
   --             so it can be used with Input Cursor or Output Cursor
   procedure PerformRI (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True);


   -- PerformIND : Perform Index processing. Accepts location so it
   --              can be used with Input Cursor or Output Cursor
   procedure PerformIND (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True);


   -- PerformBI : Perform Back Index processing. Accepts location so
   --             it can be used with Input Cursor or Output Cursor
   procedure PerformBI (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True);


   -- PerformFI : Perform Forward Index processing. Accepts location so
   --             it can be used with Input Cursor or Output Cursor
   procedure PerformFI (
         Buffer   : in out Graphic_Buffer;
         Col      : in out Scrn_Col;
         Row      : in out Scrn_Row;
         Style    : in out Real_Cell;
         Draw     : in     Boolean  := True);


end Graphic_Buffer;
