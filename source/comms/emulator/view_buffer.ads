-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 1.9                                   --
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
with GWindows.Drawing_Objects;
with Sizable_Panels;
with Terminal_Types;
with Terminal_Internal_Types;
with Buffer_Types;
with Screen_Buffer;

package View_Buffer is

   use Sizable_Panels;
   use Terminal_Types;
   use Terminal_Internal_Types;
   use Buffer_Types;
   use Screen_Buffer;

   package GT  renames GWindows.Types;
   package GDO renames GWindows.Drawing_Objects;


   SCRATCHPAD_SIZE      : constant := 100;     -- for double width characters
   SCRATCHPAD_OFFSET    : constant := 100;     -- for double width characters

   type Size_Type_Array is array (MIN_FONT_SIZE .. MAX_FONT_SIZE) of GT.Size_Type;

   type View_Buffer;

   type View_Buffer_Access is access all View_Buffer;

   -- task type to flash cursor and text
   task type Flashing_Task_Type
   is
      entry Start (Buffer : in View_Buffer_Access);
      entry Stop;
   end Flashing_Task_Type;

   type Flashing_Task_Pointer is access Flashing_Task_Type;


   type View_Buffer is new Screen_Buffer.Screen_Buffer with record

      CellSize       : GT.Size_Type := (0, 0); -- normal char size (for drawing)
      BlankSize      : GT.Size_Type := (0, 0); -- maximum char size (for erasing)

      Panel          : Sizable_Panel_Type;
      Canvas         : Drawing_Canvas_Type;

      DefaultFont    : GDO.Font_Type;
      DefaultBrush   : GDO.Brush_Type;

      AnyFont        : Boolean     := False; -- allow selection of any screen fonts
      Fonts          : Font_Type_Array;
      FontCellSize   : Size_Type_Array;
      FontFixed      : Boolean := True; -- cell size not dependent on character
      FontFrozen     : Boolean := True; -- cell size not dependent on style

      FontType       : Font_Type         := DEFAULT_FONT_TYPE;
      FontName       : Unbounded_String  := To_Unbounded ("");
      PrintFontName  : Unbounded_String  := To_Unbounded ("");
      FontSize       : Natural           := 0;
      FontCharSet    : Charset_Type      := GDO.ANSI_CHARSET;
      StockFont      : Boolean           := False;
      RedrawPrev     : Boolean           := True; -- redraw previous char on output
      RedrawNext     : Boolean           := True; -- redraw next char on output

      -- input cursor (i.e. the visible one)
      CursorColor    : Color_Type := DEFAULT_CURS_COLOR;
      CursorBar      : Boolean    := False; -- cursor is a vertical bar
      CursVisible    : Boolean    := True;  -- cursor is visible
      HaveFocus      : Boolean    := True;  -- terminal window has focus
      InsertOn       : Boolean    := False; -- text input insert
   
      CursFlashing   : Boolean    := False; -- Do NOT set this to True - Use FlashControl
      TextFlashing   : Boolean    := False; -- Do NOT set this to True - Use FlashControl
      CursFlashOff   : Boolean    := False;
      TextFlashOff   : Boolean    := False;
      CursDrawn      : Boolean    := False;
      TextDrawn      : Boolean    := False;
      SmoothScroll   : Boolean    := False;

      InputStyle     : Real_Cell;          -- style used on input (e.g. echo)
      OutputStyle    : Real_Cell;          -- style used on output

      SingleStyle    : Boolean     := True;  -- same style for input and output
      SingleCursor   : Boolean     := True;  -- same cursor for input and output

      Flasher        : Flashing_Task_Pointer;

   end record;
 

   procedure Free_Flashing_Task (
         Buffer  : in out View_Buffer);

   -- FlashControl : Start or Stop the flashing task as necesary.
   procedure FlashControl (
         Buffer    : in out View_Buffer;
         CursFlash : in     Boolean;
         TextFlash : in     Boolean);


   -- ResizeClientArea : Resize window to fit Client area. The size changes
   --                    depending on the selected Font, and also whether
   --                    the Menus and Scrollbars are on display.
   procedure ResizeClientArea (
         Buffer    : in out View_Buffer);


   -- BitBltUp : Use BitBlt to move a region of the view up
   --            the specified number of rows. Supports soft
   --            scrolling. Fills empty space with BgColor.
   procedure BitBltUp (
         Buffer  : in out View_Buffer;
         FromCol : in     View_Col := 0;
         FromRow : in     View_Row := 0;
         ToCol   : in     View_Col := MAX_COLUMNS;
         ToRow   : in     View_Row := MAX_ROWS;
         Rows    : in     Natural  := 1;
         BgColor : in     Color_Type);


   -- BitBltDown : Use BitBlt to move a region of the view down
   --              the specified number of rows. Supports soft
   --              scrolling. Fills empty space with BgColor.
   procedure BitBltDown (
         Buffer  : in out View_Buffer;
         FromCol : in     View_Col := 0;
         FromRow : in     View_Row := 0;
         ToCol   : in     View_Col := MAX_COLUMNS;
         ToRow   : in     View_Row := MAX_ROWS;
         Rows    : in     Natural  := 1;
         BgColor : in     Color_Type);


   -- BlankRectangle : Set the specified rectangle to the specified
   --                  color.
   procedure BlankRectangle (
         Buffer  : in out View_Buffer;
         X       : in     Integer;
         Y       : in     Integer;
         Width   : in     Integer;
         Height  : in     Integer;
         Color   : in     Color_Type);


   -- OutputBlank: Draw blanks on the current view. The size of
   --              the blank is adjusted for the cell width and
   --              start column.
   procedure OutputBlank (
         Buffer  : in out View_Buffer;
         ViewCol : in     View_Col;
         ViewRow : in     View_Row;
         Size    : in     Row_Size;
         Left    : in     Boolean;
         FgColor : in     Color_Type;
         BgColor : in     Color_Type;
         Inverse : in     Boolean     := False;
         Cells   : in     Natural     := 1;
         Clip    : in     Boolean     := False);


   -- OutputAligned : Output a string, adjusting alignment and
   --                 position for variable fonts if necessary.
   --                 Put the whole string in one hit if fonts
   --                 are fixed by character, or character by
   --                 character if not. Only suitable for single
   --                 width lines. Double width lines must
   --                 always be output character by character.
   procedure OutputAligned (
         Buffer : in out View_Buffer;
         StartX : in     Integer;
         StartY : in     Integer;
         Output : in     String);


   -- OutputChar : Low level output routine for characters.
   --              Performs stretching of double width and double
   --              height characters. Clip restricts the output to
   --              a double cell size, and only applies when drawing
   --              double width characters. Erase can be used to
   --              force the cell to be erased before drawing.
   procedure OutputChar (
         Buffer    : in out View_Buffer;
         ViewCol   : in     View_Col;
         ViewRow   : in     View_Row;
         Char      : in     Character;
         Bits      : in     Boolean;
         Size      : in     Row_Size;
         Left      : in     Boolean;
         FgColor   : in     Color_Type;
         BgColor   : in     Color_Type;
         Opaque    : in     Boolean    := True;
         Italic    : in     Boolean    := False;
         Bold      : in     Boolean    := False;
         Inverse   : in     Boolean    := False;
         Flashing  : in     Boolean    := False;
         Strikeout : in     Boolean    := False;
         Underline : in     Boolean    := False;
         Clip      : in     Boolean    := False;
         Erase     : in     Boolean    := False);


   -- OutputStr : Low level output routine. Performs font mapping.
   --             Note that OutputStr is not used unless the whole
   --             string to be output is single width, so we do not
   --             need to do any stretching of characters.
   procedure OutputStr (
         Buffer    : in out View_Buffer;
         ViewCol   : in     View_Col;
         ViewRow   : in     View_Row;
         Line      : in     String;
         Size      : in     Row_Size;
         Left      : in     Boolean;
         FgColor   : in     Color_Type;
         BgColor   : in     Color_Type;
         Opaque    : in     Boolean    := True;
         Italic    : in     Boolean    := False;
         Bold      : in     Boolean    := False;
         Inverse   : in     Boolean    := False;
         Flashing  : in     Boolean    := False;
         Strikeout : in     Boolean    := False;
         Underline : in     Boolean    := False);


    -- OutputSize : Calculate the size of the specified string
    --              when drawn on the canvas.
    function Output_Size  (
         Buffer  : in View_Buffer;
         Str     : in String)
      return GT.Size_Type;


   -- DrawChar: Draw a character on the current view. If the 
   --           RedrawNext flag is true, also rewrite the next 
   --           character if it may have been overwritten. If 
   --           the RedrawPrev is true, also rewrite the previous
   --           character if it may have been overwritten. These 
   --           flags would usually be set unless we know we are 
   --           about to write the next character in any case, or 
   --           we do not care about the display quality, or we 
   --           know we are using a font with no overhang for 
   --           italic or bold characters.
   procedure DrawChar (
         Buffer  : in out View_Buffer;
         ViewCol : in     View_Col := 0;
         ViewRow : in     View_Row := 0);


   -- UndrawCursor : Undraw the input cursor if it is on view.
   procedure UndrawCursor (
         Buffer  : in out View_Buffer;
         Now     : in     Boolean := False);


   -- DrawCursor : Draw the input cursor if on the current View.
   procedure DrawCursor (
         Buffer  : in out View_Buffer;
         Now     : in     Boolean := True);


   -- DrawViewRow: Draw a row, starting from a column on the current View.
   procedure DrawViewRow (
         Buffer  : in out View_Buffer;
         ViewCol : in     View_Col := 0;
         ViewRow : in     View_Row := 0);


   -- DrawView : Draw specified view rows. Default is all view rows.
   procedure DrawView (
         Buffer  : in out View_Buffer;
         FromRow : in     View_Row := 0;
         ToRow   : in     View_Row := MAX_ROWS;
         Now     : in     Boolean  := True);
   

   -- DrawScreenRow : Draw specified screen row if it is on view.
   procedure DrawScreenRow (
         Buffer  : in out View_Buffer;
         Row     : in     Scrn_Row := 0;
         Now     : in     Boolean  := True);


   -- DrawScreen : Draw specified screen rows if they are on view.
   --              Default is all screen rows.
   procedure DrawScreen (
         Buffer  : in out View_Buffer;
         FromRow : in     Scrn_Row := 0;
         ToRow   : in     Scrn_Row := MAX_ROWS;
         Now     : in     Boolean  := True);


   -- ClearEOL : Clear line to EOL. Accepts location so it can be
   --            used with Input or Output Cursor.
   procedure ClearEOL (
         Buffer  : in out View_Buffer;
         ScrnCol : in out Scrn_Col;
         ScrnRow : in out Scrn_Row);


   -- CreateFontsByType : Create a stock font. We can't do much with
   --                     stock fonts, but at least they're always
   --                     available. Note that the font size is
   --                     only meaningful when printing, since we
   --                     cannot choose the size of the stock font.
   procedure CreateFontsByType (
         Buffer  : in out View_Buffer;
         Font    : in     Font_Type;
         Size    : in     Integer);


   -- CreateFontsByName : Create a named font (and all its variants).
   --                     Check whether the font is fixed by character
   --                     and style, and calculate the actual size of
   --                     characters rendered with each font variant.
   --                     We do this instead of relying on the font
   --                     metrics because the metrics for some fonts
   --                     are incorrect, especially "shareware" fonts.
   procedure CreateFontsByName (
         Buffer  : in out View_Buffer;
         Font    : in     GWindows.GString;
         Size    : in     Integer;
         CharSet : in     Charset_Type);


   -- SelectFont : Open the "Choose Font" dialog box. Initialize
   --              it with the current font and style. Update
   --              the current font and style with whatever is
   --              selected.
   procedure SelectFont (
      Buffer : in out View_Buffer);



   procedure Resize_Canvas (
      Buffer : in out View_Buffer);


end View_Buffer;
