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

with Ada.Unchecked_Deallocation;
with GWindows.Drawing;
with GWindows.Application;
with Interfaces.C;
with GWindows.Colors;
with Common_Dialogs;
with Terminal_Internal_Types;
with Font_Maps;

package body View_Buffer is

   package CD renames Common_Dialogs;

   use Terminal_Internal_Types;
   use Font_Maps;

   SMOOTH_SCROLL_DELAY  : constant := 0.02;


   task body Flashing_Task_Type
   is
      Stopflag : Boolean := False;
      MyBuffer : View_Buffer_Access;
   begin
      accept Start (Buffer : in View_Buffer_Access)
      do
         MyBuffer := Buffer;
      end Start;
      while not Stopflag loop
         select
            accept Stop
            do
               Stopflag := True;
            end Stop;
         or
            when MyBuffer.CursFlashOff =>
            delay 0.3;
            MyBuffer.CursFlashOff := False;
            MyBuffer.TextFlashOff := False;
         or
            when not MyBuffer.CursFlashOff =>
            delay 0.7;
            MyBuffer.CursFlashOff := True;
            MyBuffer.TextFlashOff := True;
         end select;
      end loop;
      -- when exiting, make sure cursor is not permanently disabled
      MyBuffer.CursFlashOff := False;
      MyBuffer.TextFlashOff := False;
   end Flashing_Task_Type;


   procedure Free_Flashing_Task (
         Buffer  : in out View_Buffer)
   is
      procedure Free
      is new Ada.Unchecked_Deallocation (Flashing_Task_Type, Flashing_Task_Pointer);

   begin
      if Buffer.Flasher /= null then
         Buffer.Flasher.Stop;
         -- give the flasher a chance to stop
         loop
            delay 0.1;
            exit when Buffer.Flasher.all'Terminated;
         end loop;
         Free (Buffer.Flasher);
         Buffer.Flasher := null;
      end if;
   end Free_Flashing_Task;



   -- FlashControl : Start or Stop the flashing task as necesary.
   procedure FlashControl (
         Buffer    : in out View_Buffer;
         CursFlash : in     Boolean;
         TextFlash : in     Boolean)
   is
   begin
      if (TextFlash and not Buffer.TextFlashing)
      or (CursFlash and not Buffer.CursFlashing) then
         -- start a new cursor/text flashing task
         if Buffer.Flasher = null then
            Buffer.Flasher := new Flashing_Task_Type;
            Buffer.Flasher.Start (Buffer'unchecked_access);
         end if;
      elsif not TextFlash and not CursFlash then
         -- stop the cursor/text flashing task
         Free_Flashing_Task (Buffer);
      end if;
      Buffer.CursFlashing  := CursFlash;
      Buffer.TextFlashing  := TextFlash;
   end FlashControl;


   -- ResizeClientArea : Resize window to fit Client area. The size changes
   --                    depending on the selected Font, and also whether
   --                    the Menus and Scrollbars are on display.
   procedure ResizeClientArea (
         Buffer    : in out View_Buffer)
   is
      use GWindows.Application;

      Width  : Integer := Buffer.CellSize.Width * Integer (Buffer.View_Size.Col);
      Height : Integer := Buffer.CellSize.Height * Integer (Buffer.View_Size.Row);
   begin
      Client_Area_Size (Buffer.Panel, Width, Height);
      Get_Canvas (Buffer.Panel, Buffer.Canvas);
      Fill_Rectangle (
         Buffer.Canvas,
         (0, 0, Desktop_Width, Desktop_Height),
         GWindows.Colors.COLOR_BACKGROUND);
      Client_Area_Size (Buffer.Panel, Width, Height);
      Get_Canvas (Buffer.Panel, Buffer.Canvas);
   end ResizeClientArea;


   procedure BitBltDown (
         Buffer  : in out View_Buffer;
         FromCol : in     View_Col := 0;
         FromRow : in     View_Row := 0;
         ToCol   : in     View_Col := MAX_COLUMNS;
         ToRow   : in     View_Row := MAX_ROWS;
         Rows    : in     Natural  := 1;
         BgColor : in     Color_Type)
   is
      BlankRect  : GT.Rectangle_Type;
      BlankBrush : GDO.Brush_Type;
      LastCol : View_Col := ToCol;
      LastRow : View_Row := ToRow;
   begin
      if LastCol > Buffer.View_Size.Col - 1 then
         LastCol := Buffer.View_Size.Col - 1;
      end if;
      if LastRow > Buffer.View_Size.Row - 1 then
         LastRow := Buffer.View_Size.Row - 1;
      end if;
      if Rows < Natural (Buffer.View_Size.Row) then
         Background_Mode (Buffer.Canvas, GWindows.Drawing.Opaque);
         if Buffer.SmoothScroll then
            -- do it line by line
            GDO.Create_Solid_Brush (BlankBrush, BgColor);
            BlankRect.Left   := Integer (FromCol) * Buffer.CellSize.Width;
            BlankRect.Top    := Integer (FromRow) * Buffer.CellSize.Height;
            BlankRect.Right  := Integer (LastCol + 1) * Buffer.CellSize.Width;
            BlankRect.Bottom := Integer (FromRow) * Buffer.CellSize.Height + 1;
            for i in 1 .. Rows * Buffer.CellSize.Height loop
               BitBlt (
                  Buffer.Canvas,
                  Integer (FromCol) * Buffer.CellSize.Width,
                  Integer (FromRow) * Buffer.CellSize.Height + 1,
                  Integer (LastCol - FromCol + 1) * Buffer.CellSize.Width,
                  Integer (LastRow - FromRow + 1) * Buffer.CellSize.Height - 1,
                  Buffer.Canvas,
                  Integer (FromCol) * Buffer.CellSize.Width,
                  Integer (FromRow) * Buffer.CellSize.Height);
               Fill_Rectangle (Buffer.Canvas, BlankRect, BlankBrush);
               Redraw (Buffer.Panel, Redraw_Now => True);
               delay SMOOTH_SCROLL_DELAY;
            end loop;
            GDO.Delete (BlankBrush);
         else
            -- do it in one hit
            BitBlt (
               Buffer.Canvas,
               Integer (FromCol) * Buffer.CellSize.Width,
               (Integer (FromRow) + Rows) * Buffer.CellSize.Height,
               Integer (LastCol - FromCol + 1) * Buffer.CellSize.Width,
               (Integer (LastRow - FromRow + 1) - Rows) * Buffer.CellSize.Height,
               Buffer.Canvas,
               Integer (FromCol) * Buffer.CellSize.Width,
               Integer (FromRow) * Buffer.CellSize.Height);
         end if;
      end if;
   end BitBltDown;


   procedure BitBltUp (
         Buffer  : in out View_Buffer;
         FromCol : in     View_Col := 0;
         FromRow : in     View_Row := 0;
         ToCol   : in     View_Col := MAX_COLUMNS;
         ToRow   : in     View_Row := MAX_ROWS;
         Rows    : in     Natural  := 1;
         BgColor : in     Color_Type)
   is
      BlankRect  : GT.Rectangle_Type;
      BlankBrush : GDO.Brush_Type;
      LastCol : View_Col := ToCol;
      LastRow : View_Row := ToRow;
   begin
      if LastCol > Buffer.View_Size.Col - 1 then
         LastCol := Buffer.View_Size.Col - 1;
      end if;
      if LastRow > Buffer.View_Size.Row - 1 then
         LastRow := Buffer.View_Size.Row - 1;
      end if;
      if Rows < Natural (Buffer.View_Size.Row) then
         Background_Mode (Buffer.Canvas, GWindows.Drawing.Opaque);
         if Buffer.SmoothScroll then
            -- do it line by line
            GDO.Create_Solid_Brush (BlankBrush, BgColor);
            BlankRect.Left   := Integer (FromCol) * Buffer.CellSize.Width;
            BlankRect.Top    := Integer (LastRow + 1) * Buffer.CellSize.Height - 1;
            BlankRect.Right  := Integer (LastCol + 1) * Buffer.CellSize.Width;
            BlankRect.Bottom := Integer (LastRow + 1) * Buffer.CellSize.Height;
            for i in 1 .. Rows * Buffer.CellSize.Height loop
               BitBlt (
                  Buffer.Canvas,
                  Integer (FromCol) * Buffer.CellSize.Width,
                  Integer (FromRow) * Buffer.CellSize.Height,
                  Integer (LastCol - FromCol + 1) * Buffer.CellSize.Width,
                  Integer (LastRow - FromRow + 1) * Buffer.CellSize.Height - 1,
                  Buffer.Canvas,
                  Integer (FromCol) * Buffer.CellSize.Width,
                  Integer (FromRow) * Buffer.CellSize.Height + 1);
               Fill_Rectangle (Buffer.Canvas, BlankRect, BlankBrush);
               Redraw (Buffer.Panel, Redraw_Now => True);
               delay SMOOTH_SCROLL_DELAY;
            end loop;
         else
            BitBlt (
               Buffer.Canvas,
               Integer (FromCol) * Buffer.CellSize.Width,
               Integer (FromRow) * Buffer.CellSize.Height,
               Integer (LastCol - FromCol + 1) * Buffer.CellSize.Width,
               (Integer (LastRow - FromRow + 1) - Integer (Rows)) * Buffer.CellSize.Height,
               Buffer.Canvas,
               Integer (FromCol) * Buffer.CellSize.Width,
               (Integer (FromRow) + Rows) * Buffer.CellSize.Height);
         end if;
      end if;
   end BitBltUp;


   -- BlankRectangle : Blank a Rectangle.
   procedure BlankRectangle (
         Buffer  : in out View_Buffer;
         X       : in     Integer;
         Y       : in     Integer;
         Width   : in     Integer;
         Height  : in     Integer;
         Color   : in     Color_Type)
   is
      BlankRect  : GT.Rectangle_Type;
      BlankBrush : GDO.Brush_Type;
   begin
      BlankRect.Left   := X;
      BlankRect.Top    := Y;
      BlankRect.Right  := BlankRect.Left + Width;
      BlankRect.Bottom := BlankRect.Top + Height;
      GDO.Create_Solid_Brush (BlankBrush, Color);
      Fill_Rectangle (Buffer.Canvas, BlankRect, BlankBrush);
      GDO.Delete (BlankBrush);
   end BlankRectangle;


   -- OutputBlank: Low level output routine. Draw blanks on the
   --              current view. The size of the blank is
   --              adjusted for the cell width and start column.
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
         Clip    : in     Boolean     := False)
   is
      Color : Color_Type;
      Width : Integer;
   begin
      if Cells > 0 then
         if Inverse then
            Color := FgColor;
         else
            Color := BgColor;
         end if;
         if Size = Single_Width then
            if clip then
               Width := Cells * Buffer.CellSize.Width;
            else
               Width := (Cells - 1) * Buffer.CellSize.Width + Buffer.BlankSize.Width;
            end if;
         else
            if Left then
               -- cell is left (first) half of double width char
               if Clip then
                  Width := 2 * Cells * Buffer.CellSize.Width;
               else
                  Width := (2 * (Cells - 1) + 1) * Buffer.CellSize.Width + Buffer.BlankSize.Width;
               end if;
            else
               -- cell is right (second) half of double width char,
               -- so adjust accordingly
               if Clip then
                  Width := 2 * (Cells - 1) * Buffer.CellSize.Width + Buffer.CellSize.Width;
               else
                  Width := 2 * (Cells - 1) * Buffer.CellSize.Width + Buffer.BlankSize.Width;
               end if;
            end if;
         end if;
         BlankRectangle (
            Buffer,
            Integer (ViewCol) * Buffer.CellSize.Width,
            Integer (ViewRow) * Buffer.CellSize.Height,
            Width,
            Buffer.BlankSize.Height,
            Color);
      end if;
   end OutputBlank;


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
         Output : in     String)
   is
      use GWindows.Drawing;

      X : Integer := StartX;
      Y : Integer := StartY;
   begin
      if Buffer.FontFixed then
         -- align left
         Horizontal_Text_Alignment (Buffer.Canvas, Left);
         Put (Buffer.Canvas, X, Y, To_GString (Output));
      else
         -- align center
         Horizontal_Text_Alignment (Buffer.Canvas, Center);
         X := X + Buffer.CellSize.Width / 2;
         for i in Output'Range loop
            Put (Buffer.Canvas, X, Y, To_GString (Output (i .. i)));
            X := X + Buffer.CellSize.Width;
         end loop;
      end if;
   end OutputAligned;


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
         Erase     : in     Boolean    := False)
   is
      use GWindows.Drawing;
      use GWindows.Application;

      Output      : String (1 .. 1);
      Fg          : Color_Type;
      Bg          : Color_Type;
      ClipWidth   : Integer;
      ClipHeight  : Integer;

      -- DrawDoubleWidthText : Draw an image of a character on the canvas
      --                       (in a scratchpad area that is normally
      --                       unused) as double width text. This is
      --                       so that it can be modified and displayed on
      --                       the visible part of the canvas. Used for
      --                       both double height and width characters.
      --                       The text is constructed at the location
      --                       (Desktop_Width + SCRATCHPAD_OFFSET, 0) and
      --                       and must be BitBlt-ed or StretchBlt-ed
      --                       to it's final destination. The RasterOp
      --                       indicates how the drawn text is combined
      --                       with what is already in the scratchpad
      --                       area.
      procedure DrawDoubleWidthText (
            Buffer   : in out View_Buffer;
            FgColor  : in Color_Type;
            BgColor  : in Color_Type;
            Output   : in String;
            RasterOp : in Interfaces.C.unsigned := SRCCOPY)
      is
      begin
         Text_Color (Buffer.Canvas, FgColor);
         Background_Color (Buffer.Canvas, BgColor);
         Background_Mode (Buffer.Canvas, GWindows.Drawing.Opaque);
         BlankRectangle (
            Buffer,
            Desktop_Width + SCRATCHPAD_OFFSET,
            SCRATCHPAD_OFFSET,
            2 * Buffer.BlankSize.Width,
            Buffer.BlankSize.Height,
            BgColor);
         OutputAligned (
            Buffer,
            Desktop_Width + SCRATCHPAD_OFFSET,
            SCRATCHPAD_OFFSET,
            Output);
         StretchBlt (
            Buffer.Canvas,
            Desktop_Width + SCRATCHPAD_OFFSET,
            0,
            2 * Buffer.BlankSize.Width,
            Buffer.BlankSize.Height,
            Buffer.Canvas,
            Desktop_Width + SCRATCHPAD_OFFSET,
            SCRATCHPAD_OFFSET,
            Buffer.BlankSize.Width,
            Buffer.BlankSize.Height,
            RasterOp);
      end DrawDoubleWidthText;

      -- SetDoubleClipSize : set clip size for double width characters.
      procedure SetDoubleClipSize (
         Buffer  : in out View_Buffer)
      is
      begin
         if Clip then
            ClipWidth  := 2 * Buffer.CellSize.Width;
            ClipHeight := Buffer.CellSize.Height;
         else
            ClipWidth  := 2 * Buffer.BlankSize.Width;
            ClipHeight := Buffer.BlankSize.Height;
         end if;
      end SetDoubleClipSize;

   begin
      if Buffer.TextFlashing and then Flashing and then Buffer.TextFlashOff then
         -- just blank the cell, clipping to the character cell size
         OutputBlank (
            Buffer,
            ViewCol,
            ViewRow,
            Size,
            Left,
            FgColor,
            BgColor,
            Inverse,
            1,
            True);
      else
         if Inverse then
            Fg := BgColor;
            Bg := FgColor;
         else
            Fg := FgColor;
            Bg := BgColor;
         end if;
         if not Buffer.StockFont then
            -- use font based on style
            Select_Object (
               Buffer.Canvas,
               Buffer.Fonts (Bold, Italic, Strikeout, Underline));
         else
            -- use default font
            Select_Object (Buffer.Canvas, Buffer.DefaultFont);
         end if;
         -- Erase old character first if explictly requested,
         -- or if it is supposed to be opaque and it is either
         -- an italic char or the font is not fixed
         if (Erase or (Opaque and (Italic or not Buffer.FontFixed))) then
            OutputBlank (
               Buffer,
               ViewCol,
               ViewRow,
               Size,
               Left,
               FgColor,
               BgColor,
               Inverse,
               1,
               True);
         end if;
         if Bits then
            -- draw a special bitmapped character. Note that
            -- unlike normal characters, bitmapped chars are
            -- always cell size, and are not different even
            -- when italic or bold, so they never "overhang"
            -- into the next character cell. This means that
            -- they never need to be clipped. However, the
            -- previous character (which may not be a special
            -- bitmapped character) may partly overwrite them,
            -- and this must be preserved.
            SetStretchMode (Buffer.Canvas);
            Background_Mode (Buffer.Canvas, GWindows.Drawing.Opaque);
            Horizontal_Text_Alignment (Buffer.Canvas, GWindows.Drawing.Left);
            if Size = Double_Width then
               if Opaque or Erase then
                  StretchGraphicChar (
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     0,
                     0,
                     CELL_WIDTH,
                     CELL_HEIGHT,
                     Char,
                     Fg,
                     Bg,
                     SRCCOPY);
              else
                  StretchGraphicChar (
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     0,
                     0,
                     CELL_WIDTH,
                     CELL_HEIGHT,
                     Char,
                     Black,
                     White,
                     SRCCOPY);
                  BitBlt (
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     SRCAND);
                  StretchGraphicChar (
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     0,
                     0,
                     CELL_WIDTH,
                     CELL_HEIGHT,
                     Char,
                     Fg,
                     Black,
                     SRCPAINT);
                  BitBlt (
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     SRCCOPY);
              end if;
            elsif Size = Double_Height_Upper then
               if Opaque or Erase then
                  StretchGraphicChar (
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     0,
                     CELL_HEIGHT / 2,
                     CELL_WIDTH,
                     CELL_HEIGHT / 2,
                     Char,
                     Fg,
                     Bg,
                     SRCCOPY);
              else
                  StretchGraphicChar (
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     0,
                     CELL_HEIGHT / 2,
                     CELL_WIDTH,
                     CELL_HEIGHT / 2,
                     Char,
                     Black,
                     White,
                     SRCCOPY);
                  BitBlt (
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     SRCAND);
                  StretchGraphicChar (
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     0,
                     CELL_HEIGHT / 2,
                     CELL_WIDTH,
                     CELL_HEIGHT / 2,
                     Char,
                     Fg,
                     Black,
                     SRCPAINT);
                  BitBlt (
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     SRCCOPY);
              end if;
            elsif Size = Double_Height_Lower then
               if Opaque or Erase then
                  StretchGraphicChar (
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     0,
                     0,
                     CELL_WIDTH,
                     CELL_HEIGHT / 2,
                     Char,
                     Fg,
                     Bg,
                     SRCCOPY);
               else
                  StretchGraphicChar (
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     0,
                     0,
                     CELL_WIDTH,
                     CELL_HEIGHT / 2,
                     Char,
                     Black,
                     White,
                     SRCCOPY);
                  BitBlt (
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     SRCAND);
                  StretchGraphicChar (
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     0,
                     0,
                     CELL_WIDTH,
                     CELL_HEIGHT / 2,
                     Char,
                     Fg,
                     Black,
                     SRCPAINT);
                  BitBlt (
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     2 * Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     SRCCOPY);
               end if;
            else -- Size = Single_Width
               if Opaque or Erase then
                  StretchGraphicChar (
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     0,
                     0,
                     CELL_WIDTH,
                     CELL_HEIGHT,
                     Char,
                     Fg,
                     Bg,
                     SRCCOPY);
              else
                  StretchGraphicChar (
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     0,
                     0,
                     CELL_WIDTH,
                     CELL_HEIGHT,
                     Char,
                     Black,
                     White,
                     SRCCOPY);
                  BitBlt (
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     SRCAND);
                  StretchGraphicChar (
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     0,
                     0,
                     CELL_WIDTH,
                     CELL_HEIGHT,
                     Char,
                     Fg,
                     Black,
                     SRCPAINT);
                  BitBlt (
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     Buffer.CellSize.Width,
                     Buffer.CellSize.Height,
                     Buffer.Canvas,
                     Desktop_Width + Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     SRCCOPY);
              end if;
            end if;
         else
            -- draw a normal character. Note that normal chars
            -- often have "overhang" when italic or bold -
            -- i.e.  they can run on into the next character
            -- cell. This means that we have to simulate the
            -- effect of "opaque" or "transparent" font rendering
            -- when displaying them double height or width. Also,
            -- note that the previous character may have partly
            -- overwritten them, and this must be preserved.
            Output (1) := Char;
            if Size = Double_Width then
               SetDoubleClipSize (Buffer);
               if Opaque or Erase then
                  DrawDoubleWidthText (Buffer, Fg, Bg, Output, SRCCOPY);
                  BitBlt (
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     ClipWidth,
                     ClipHeight,
                     Buffer.Canvas,
                     Desktop_Width + SCRATCHPAD_OFFSET,
                     0,
                     SRCCOPY);
               else
                  DrawDoubleWidthText (Buffer, Black, White, Output, SRCCOPY);
                  BitBlt (
                     Buffer.Canvas,
                     Desktop_Width + SCRATCHPAD_OFFSET,
                     0,
                     ClipWidth,
                     ClipHeight,
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     SRCAND);
                  DrawDoubleWidthText (Buffer, Fg, Black, Output, SRCPAINT);
                  BitBlt (
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     ClipWidth,
                     ClipHeight,
                     Buffer.Canvas,
                     Desktop_Width + SCRATCHPAD_OFFSET,
                     0,
                     SRCCOPY);
               end if;
            elsif Size = Double_Height_Upper then
               SetDoubleClipSize (Buffer);
               if Opaque or Erase then
                  DrawDoubleWidthText (Buffer, Fg, Bg, Output, SRCCOPY);
                  StretchBlt (
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     ClipWidth,
                     ClipHeight,
                     Buffer.Canvas,
                     Desktop_Width + SCRATCHPAD_OFFSET,
                     0,
                     ClipWidth,
                     ClipHeight / 2,
                     SRCCOPY);
               else
                  DrawDoubleWidthText (Buffer, Black, White, Output, SRCCOPY);
                  StretchBlt (
                     Buffer.Canvas,
                     Desktop_Width + SCRATCHPAD_OFFSET,
                     0,
                     ClipWidth,
                     ClipHeight / 2,
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     ClipWidth,
                     ClipHeight,
                     SRCAND);
                  DrawDoubleWidthText (Buffer, Fg, Black, Output, SRCPAINT);
                  StretchBlt (
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     ClipWidth,
                     ClipHeight,
                     Buffer.Canvas,
                     Desktop_Width + SCRATCHPAD_OFFSET,
                     0,
                     ClipWidth,
                     ClipHeight / 2,
                     SRCCOPY);
               end if;
            elsif Size = Double_Height_Lower then
               SetDoubleClipSize (Buffer);
               if Opaque or Erase then
                  DrawDoubleWidthText (Buffer, Fg, Bg, Output, SRCCOPY);
                  StretchBlt (
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     ClipWidth,
                     ClipHeight,
                     Buffer.Canvas,
                     Desktop_Width + SCRATCHPAD_OFFSET,
                     Buffer.CellSize.Height / 2,
                     ClipWidth,
                     ClipHeight / 2,
                     SRCCOPY);
               else
                  DrawDoubleWidthText (Buffer, Black, White, Output, SRCCOPY);
                  StretchBlt (
                     Buffer.Canvas,
                     Desktop_Width + SCRATCHPAD_OFFSET,
                     Buffer.CellSize.Height / 2,
                     ClipWidth,
                     ClipHeight / 2,
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     ClipWidth,
                     ClipHeight,
                     SRCAND);
                  DrawDoubleWidthText (Buffer, Fg, Black, Output, SRCPAINT);
                  StretchBlt (
                     Buffer.Canvas,
                     Integer (ViewCol) * Buffer.CellSize.Width,
                     Integer (ViewRow) * Buffer.CellSize.Height,
                     ClipWidth,
                     ClipHeight,
                     Buffer.Canvas,
                     Desktop_Width + SCRATCHPAD_OFFSET,
                     Buffer.CellSize.Height / 2,
                     ClipWidth,
                     ClipHeight / 2,
                     SRCCOPY);
               end if;
            else -- Size = Single_Width
               Text_Color (Buffer.Canvas, Fg);
               Background_Color (Buffer.Canvas, Bg);
               if Opaque then
                  Background_Mode (Buffer.Canvas, GWindows.Drawing.Opaque);
               else
                  Background_Mode (Buffer.Canvas, GWindows.Drawing.Transparent);
               end if;
               OutputAligned (
                  Buffer,
                  Integer (ViewCol) * Buffer.CellSize.Width,
                  Integer (ViewRow) * Buffer.CellSize.Height,
                  Output);
            end if;
         end if;
      end if;
      Select_Object (Buffer.Canvas, Buffer.DefaultFont);
   end OutputChar;


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
         Underline : in     Boolean    := False)
   is
      use GWindows.Drawing;
   begin
      if Buffer.TextFlashing and then Flashing and then Buffer.TextFlashOff then
         OutputBlank (
            Buffer,
            ViewCol,
            ViewRow,
            Size,
            Left,
            FgColor,
            BgColor,
            Inverse,
            Line'Length,
            True);
      else
         if Opaque and then not Buffer.FontFixed then
            -- must blank old characters first
            OutputBlank (
               Buffer,
               ViewCol,
               ViewRow,
               Size,
               Left,
               FgColor,
               BgColor,
               Inverse,
               Line'Length);
         end if;
         if Inverse then
            Text_Color (Buffer.Canvas, BgColor);
            Background_Color (Buffer.Canvas, FgColor);
         else
            Text_Color (Buffer.Canvas, FgColor);
            Background_Color (Buffer.Canvas, BgColor);
         end if;
         if not Buffer.StockFont then
            -- use font based on style
            Select_Object (
               Buffer.Canvas,
               Buffer.Fonts (Bold, Italic, Strikeout, Underline));
         else
            -- use default font
            Select_Object (Buffer.Canvas, Buffer.DefaultFont);
         end if;
         if Opaque then
            Background_Mode (Buffer.Canvas, GWindows.Drawing.Opaque);
         else
            Background_Mode (Buffer.Canvas, GWindows.Drawing.Transparent);
         end if;
         OutputAligned (
            Buffer,
            Integer (ViewCol) * Buffer.CellSize.Width,
            Integer (ViewRow) * Buffer.CellSize.Height,
            Line);
      end if;
      Select_Object (Buffer.Canvas, Buffer.DefaultFont);
   end OutputStr;


   function Output_Size  (
         Buffer : in View_Buffer;
         Str    : in String)
      return GT.Size_Type
   is
      Size : GT.Size_Type := (0, 0);
   begin
      Size := Text_Output_Size (Buffer.Canvas, To_GString (Str));
      Size.Width := Size.Width - GetOverhang (Buffer.Canvas);
      return Size;
   end;


   -- LargerThanCellSize : True if the character in the buffer
   --                      may be larger than the font cell size.
   --                      This can be true if it is an italic
   --                      or bold character. In such cases,
   --                      rendering adjacent characters
   --                      requires special treatment.
   function LargerThanCellSize (
         Buffer  : in View_Buffer;
         Col     : in Real_Col;
         Row     : in Real_Row)
     return Boolean
   is
      pragma Inline (LargerThanCellSize);
   begin
      if Buffer.Real_Buffer (Col, Row).Italic or else Buffer.Real_Buffer (Col, Row).Bold then
         -- character may be larger than normal, unless
         -- it is a special graphic character, which are
         -- not rendered differently when italic or bold
         return Buffer.Real_Buffer (Col, Row).Bits = False;
      else
         return False;
      end if;
   end LargerThanCellSize;


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
         ViewRow : in     View_Row := 0)
   is
      use GWindows.Colors;

      RealRow  : Real_Row         := Real (Buffer, ViewRow);
      RealCol  : Real_Col         := Real (Buffer, ViewCol);
      PrevCol  : Real_Col;
      NextCol  : Real_Col;
      ThisCell : Real_Cell_Access := BufferCell (Buffer, RealCol, RealRow);
      PrevCell : Real_Cell_Access;
      NextCell : Real_Cell_Access;
      Opaque   : Boolean;

   begin
      if  ViewRow < Buffer.View_Size.Row
      and ViewCol < Buffer.View_Size.Col then
         if DoubleWidth (Buffer, RealCol, RealRow) and then RealCol mod 2 /= 0 then
            -- second half of a double width cell - do not draw anything
            -- unless it is the first cell on view, in which case draw
            -- a single blank cell, but with the color and selection
            -- of the previous cell. Really, we should fully draw
            -- the second half of the previous cell.
            if ViewCol = 0 then
               PrevCell := BufferCell (Buffer, RealCol - 1, RealRow);
               OutputBlank (
                  Buffer,
                  ViewCol,
                  ViewRow,
                  PrevCell.Size,
                  False,
                  PrevCell.FgColor,
                  PrevCell.BgColor,
                  PrevCell.Inverse xor PrevCell.Selected,
                  1);
            end if;
         else
            -- normal width cell, or first half of a double
            -- width cell, so draw the character as normal
            Opaque := True;
            OutputChar (
               Buffer,
               ViewCol,
               ViewRow,
               ThisCell.Char,
               ThisCell.Bits,
               ThisCell.Size,
               True,
               ThisCell.FgColor,
               ThisCell.BgColor,
               Opaque,
               ThisCell.Italic,
               ThisCell.Bold,
               ThisCell.Inverse xor ThisCell.Selected,
               ThisCell.Flashing,
               ThisCell.Strikeout,
               ThisCell.Underline);
            if Buffer.RedrawPrev then
               -- special case: if preceeding char may be larger
               -- than the cell size, then redraw it transparently
               if ViewCol >= View_Col (Width (Buffer, RealCol, RealRow)) then
                  PrevCol := RealCol - Real_Col (Width (Buffer, RealCol, RealRow));
                  if LargerThanCellSize (Buffer, PrevCol, RealRow) then
                     PrevCell := BufferCell (Buffer, PrevCol, RealRow);
                     Opaque := False;
                     OutputChar (
                        Buffer,
                        View (Buffer, PrevCol),
                        ViewRow,
                        PrevCell.Char,
                        PrevCell.Bits,
                        PrevCell.Size,
                        True,
                        PrevCell.FgColor,
                        PrevCell.BgColor,
                        Opaque,
                        PrevCell.Italic,
                        PrevCell.Bold,
                        PrevCell.Inverse xor PrevCell.Selected,
                        PrevCell.Flashing,
                        PrevCell.Strikeout,
                        PrevCell.Underline);
                  end if;
               end if;
            end if;
            if Buffer.RedrawNext then
               -- special case: if this char may be larger
               -- than cell size, or BlankSize is wider than
               -- CellSize, then redraw next char, which may
               -- have been partly overwritten by writing
               -- the character the cursor is on. We rewrite
               -- it transparently if we can (i.e. unless it
               -- is double width).
               if ViewCol < Buffer.View_Size.Col - View_Col (Width (Buffer, RealCol, RealRow)) then
                  if LargerThanCellSize (Buffer, RealCol, RealRow)
                  or Buffer.BlankSize.Width > Buffer.CellSize.Width then
                     NextCol := RealCol + Real_Col (Width (Buffer, RealCol, RealRow));
                     NextCell := BufferCell (Buffer, NextCol, RealRow);
                     if DoubleWidth (Buffer, RealCol, RealRow) then
                        -- first output next character opaque,
                        -- but clip the output to cell size
                        Opaque := True;
                        OutputChar (
                           Buffer,
                           View (Buffer, NextCol),
                           ViewRow,
                           NextCell.Char,
                           NextCell.Bits,
                           NextCell.Size,
                           True,
                           NextCell.FgColor,
                           NextCell.BgColor,
                           Opaque,
                           NextCell.Italic,
                           NextCell.Bold,
                           NextCell.Inverse xor NextCell.Selected,
                           NextCell.Flashing,
                           NextCell.Strikeout,
                           NextCell.Underline,
                           Clip => True);
                        -- then output the original character again,
                        -- but this time transparently
                        Opaque := False;
                        OutputChar (
                           Buffer,
                           View (Buffer, RealCol),
                           ViewRow,
                           ThisCell.Char,
                           ThisCell.Bits,
                           ThisCell.Size,
                           True,
                           ThisCell.FgColor,
                           ThisCell.BgColor,
                           Opaque,
                           ThisCell.Italic,
                           ThisCell.Bold,
                           ThisCell.Inverse xor ThisCell.Selected,
                           ThisCell.Flashing,
                           ThisCell.Strikeout,
                           ThisCell.Underline);
                     else
                        -- just output the next character transparently
                        Opaque := False;
                        OutputChar (
                           Buffer,
                           View (Buffer, NextCol),
                           ViewRow,
                           NextCell.Char,
                           NextCell.Bits,
                           NextCell.Size,
                           True,
                           NextCell.FgColor,
                           NextCell.BgColor,
                           Opaque,
                           NextCell.Italic,
                           NextCell.Bold,
                           NextCell.Inverse xor NextCell.Selected,
                           NextCell.Flashing,
                           NextCell.Strikeout,
                           NextCell.Underline);
                     end if;
                  end if;
               end if;
            end if;
         end if;
      end if;
   end DrawChar;


   -- UndrawCursor : Undraw the input cursor if it is on view.
   procedure UndrawCursor (
         Buffer  : in out View_Buffer;
         Now     : in     Boolean := False)
   is
      RealRow     : Real_Row := Real (Buffer, Buffer.Input_Curs.Row);
      RealCol     : Real_Col := Real (Buffer, Buffer.Input_Curs.Col);
      CursorRect  : GT.Rectangle_Type;
      CursorBrush : GDO.Brush_Type;
   begin
      if Buffer.CursDrawn then
         if OnView (Buffer, RealCol, RealRow) then
            -- Cursor is (or should be) on view, so
            -- redraw the character the cursor was on
            if Buffer.CursorBar or Buffer.InsertOn then
               -- Undraw cursor bar drawn on left
               -- side of cell the cursor is on
               CursorRect.Left
                  := Integer (View (Buffer, Buffer.Input_Curs.Col)) * Buffer.CellSize.Width;
               CursorRect.Top
                  := Integer (View (Buffer, Buffer.Input_Curs.Row)) * Buffer.CellSize.Height;
               CursorRect.Right  := CursorRect.Left + 2;
               CursorRect.Bottom := CursorRect.Top + Buffer.CellSize.Height;
               GDO.Create_Solid_Brush (
                  CursorBrush,
                  Buffer.Real_Buffer (RealCol, RealRow).BgColor);
               Fill_Rectangle (Buffer.Canvas, CursorRect, CursorBrush);
               GDO.Delete (CursorBrush);
            end if;
            DrawChar (Buffer, View (Buffer, RealCol), View (Buffer, RealRow));
            Redraw (Buffer.Panel, Redraw_Now => Now);
         end if;
         Buffer.CursDrawn := False;
      end if;
   end UndrawCursor;


   -- DrawCursor : Draw the input cursor if on the current View.
   procedure DrawCursor (
         Buffer  : in out View_Buffer;
         Now     : in     Boolean := True)
   is
      use GWindows.Colors;

      RealRow     : Real_Row  := Real (Buffer, Buffer.Input_Curs.Row);
      RealCol     : Real_Col  := Real (Buffer, Buffer.Input_Curs.Col);
      RealCell    : Real_Cell_Access := BufferCell (Buffer, RealCol, RealRow);
      FgColor     : GWindows.Colors.Color_Type;
      BgColor     : GWindows.Colors.Color_Type;
      Inverse     : Boolean;
      CursorRect  : GT.Rectangle_Type;
      CursorBrush : GDO.Brush_Type;

   begin
      if Buffer.HaveFocus and Buffer.CursVisible and OnView (Buffer, RealCol, RealRow) then
         -- Cursor is (or should be) on the screen
         Inverse := RealCell.Inverse xor RealCell.Selected;
         -- must find a good color for cursor - just
         -- inverting is not good enough, and also
         -- we must take care of the case where the
         -- character is the selected cursor color
         if Inverse then
            if RealCell.FgColor = Buffer.CursorColor then
               FgColor := Buffer.CursorColor;
               BgColor := RealCell.FgColor;
            elsif RealCell.BgColor = Buffer.CursorColor then
               FgColor := RealCell.BgColor;
               BgColor := Buffer.CursorColor;
            else
               FgColor := RealCell.FgColor;
               BgColor := Buffer.CursorColor;
            end if;
         else
            if RealCell.BgColor = Buffer.CursorColor then
               FgColor := Buffer.CursorColor;
               BgColor := RealCell.FgColor;
            elsif RealCell.FgColor = Buffer.CursorColor then
               FgColor := RealCell.BgColor;
               BgColor := Buffer.CursorColor;
            else
               FgColor := RealCell.FgColor;
               BgColor := Buffer.CursorColor;
            end if;
         end if;
         if Buffer.CursorBar or Buffer.InsertOn then
            -- draw cursor by putting inverse bar
            -- on left side of cell the cursor is on
            CursorRect.Left
               := Integer (View (Buffer, Buffer.Input_Curs.Col)) * Buffer.CellSize.Width;
            CursorRect.Top
               := Integer (View (Buffer, Buffer.Input_Curs.Row)) * Buffer.CellSize.Height;
            CursorRect.Right  := CursorRect.Left + 2;
            CursorRect.Bottom := CursorRect.Top + Buffer.CellSize.Height;
            GDO.Create_Solid_Brush (CursorBrush, BgColor);
            Fill_Rectangle (Buffer.Canvas, CursorRect, CursorBrush);
            GDO.Delete (CursorBrush);
         else
            -- draw cursor by drawing the inverse of the character
            -- the cursor is currently on
            if DoubleWidth (Buffer, RealCol, RealRow) and then RealCol mod 2 /= 0 then
               -- cursor is on second half of a double width cell -
               -- do not draw it unless it is the first cell on view,
               -- in which case draw a single blank cell using the
               -- cursor colors. Really, we should fully draw the
               -- second half of the previous cell.
               if View (Buffer, RealCol) = 0 then
                  OutputBlank (
                     Buffer,
                     View (Buffer, RealCol),
                     View (Buffer, RealRow),
                     Double_Width,
                     False,
                     FgColor,
                     BgColor,
                     False,
                     1);
               end if;
            else
               OutputChar (
                  Buffer,
                  View (Buffer, RealCol),
                  View (Buffer, RealRow),
                  RealCell.Char,
                  RealCell.Bits,
                  RealCell.Size,
                  True,
                  FgColor,
                  BgColor,
                  True,
                  RealCell.Italic,
                  RealCell.Bold,
                  False,
                  RealCell.Flashing,
                  RealCell.Strikeout,
                  RealCell.Underline);
            end if;
         end if;
         Redraw (Buffer.Panel, Redraw_Now => Now);
         Buffer.CursDrawn := True;
      end if;
   end DrawCursor;


   -- DrawViewRow: Draw a row, starting from a column on the current View.
   procedure DrawViewRow (
         Buffer  : in out View_Buffer;
         ViewCol : in     View_Col := 0;
         ViewRow : in     View_Row := 0)
   is
      use GWindows.Colors;

      RealRow   : Real_Row  := Real (Buffer, ViewRow);
      RealCol   : Real_Col  := Real (Buffer, ViewCol);
      PrevCol   : Real_Col;
      NextCol   : Real_Col;
      ThisCell  : Real_Cell_Access;
      PrevCell  : Real_Cell_Access;
      NextCell  : Real_Cell_Access;
      Line      : String (1 .. Integer (Buffer.View_Size.Col));
      Length    : Natural;
      FgColor   : GWindows.Colors.Color_Type;
      BgColor   : GWindows.Colors.Color_Type;
      Bits      : Boolean;
      Italic    : Boolean;
      Bold      : Boolean;
      Inverse   : Boolean;
      Flashing  : Boolean;
      Strikeout : Boolean;
      Underline : Boolean;
      Selected  : Boolean;
      SaveNext  : Boolean;

   begin
      if  ViewRow < Buffer.View_Size.Row
      and ViewCol < Buffer.View_Size.Col then
         if Buffer.FontFrozen and then not DoubleWidth (Buffer, RealCol, RealRow) then
            -- the font is fixed and single width so we may
            -- be able to draw multiple characters at once -
            -- we stop if we strike graphic characters, or
            -- the combination of italic and bold
            loop
               exit when RealCol > Real (Buffer, Buffer.View_Size.Col - 1)
               or else Buffer.Real_Buffer (RealCol, RealRow).Bits;
               ThisCell  := BufferCell (Buffer, RealCol, RealRow);
               Line (1)  := ThisCell.Char;
               Length    := 1;
               FgColor   := ThisCell.FgColor;
               BgColor   := ThisCell.BgColor;
               Bits      := ThisCell.Bits;
               Italic    := ThisCell.Italic;
               Bold      := ThisCell.Bold;
               Inverse   := ThisCell.Inverse;
               Flashing  := ThisCell.Flashing;
               Strikeout := ThisCell.Strikeout;
               Underline := ThisCell.Underline;
               Selected  := ThisCell.Selected;
               -- special case: if char italic draw non-italic space first
               if Italic then
                  OutputBlank (
                     Buffer,
                     View (Buffer, RealCol),
                     ViewRow,
                     ThisCell.Size,
                     RealCol mod 2 = 0,
                     FgColor,
                     BgColor,
                     Inverse xor Selected,
                     1);
               end if;
               -- even though the font may be frozen, bold and italic
               -- together does not space correctly with some fonts, so
               -- we stop if we hit this combination
               if not (Bold and Italic) then
                  loop
                     NextCol := RealCol + Real_Col (Length);
                     if View (Buffer, RealCol) + View_Col (Length) < Buffer.View_Size.Col
                     and then not Buffer.Real_Buffer (NextCol, RealRow).Bits then
                        NextCell := BufferCell (Buffer, NextCol, RealRow);
                        if       FgColor   = NextCell.FgColor
                        and then BgColor   = NextCell.BgColor
                        and then Bits      = NextCell.Bits
                        and then Italic    = NextCell.Italic
                        and then Bold      = NextCell.Bold
                        and then Inverse   = NextCell.Inverse
                        and then Selected  = NextCell.Selected
                        and then Flashing  = NextCell.Flashing
                        and then Strikeout = NextCell.Strikeout
                        and then Underline = NextCell.Underline then
                           Line (Length + 1) := NextCell.Char;
                           Length := Length + 1;
                        else
                           exit;
                        end if;
                     else
                        exit;
                     end if;
                  end loop;
               end if;
               -- now draw the characters
               OutputStr (
                  Buffer,
                  View (Buffer, RealCol),
                  ViewRow,
                  Line (1 .. Length),
                  Buffer.Real_Buffer (RealCol, RealRow).Size,
                  False,
                  FgColor,
                  BgColor,
                  True,
                  Italic,
                  Bold,
                  Inverse xor Selected,
                  Flashing,
                  Strikeout,
                  Underline);
               -- special case: if preceeding char may be larger
               -- than cell size, then redraw it transparently
               if View (Buffer, RealCol) >= View_Col (Width (Buffer, RealCol, RealRow)) then
                  PrevCol := RealCol - Real_Col (Width (Buffer, RealCol, RealRow));
                  if LargerThanCellSize (Buffer, PrevCol, RealRow) then
                     PrevCell := BufferCell (Buffer, PrevCol, RealRow);
                     OutputChar (
                        Buffer,
                        View (Buffer, PrevCol),
                        ViewRow,
                        PrevCell.Char,
                        PrevCell.Bits,
                        PrevCell.Size,
                        False,
                        PrevCell.FgColor,
                        PrevCell.BgColor,
                        False,
                        PrevCell.Italic,
                        PrevCell.Bold,
                        PrevCell.Inverse xor PrevCell.Selected,
                        PrevCell.Flashing,
                        PrevCell.Strikeout,
                        PrevCell.Underline);
                  end if;
               end if;
               RealCol := RealCol + Real_Col (Length);
            end loop;
            if RealCol <= Real (Buffer, Buffer.View_Size.Col - 1) then
               -- we must have found graphic characters, so we must
               -- continue character by character. While we do so,
               -- we temporarily disable the RedrawNext flag.
               SaveNext := Buffer.RedrawNext;
               Buffer.RedrawNext := False;
               for Col in View (Buffer, RealCol) .. Buffer.View_Size.Col - 1 loop
                  DrawChar (Buffer, Col, ViewRow);
               end loop;
               Buffer.RedrawNext := SaveNext;
            end if;
         else
            -- the font is not fixed or not single width so we draw
            -- the row character by character.  While we do so,
            -- we temporarily disable the RedrawNext flag.
            SaveNext := Buffer.RedrawNext;
            Buffer.RedrawNext := False;
            for Col in ViewCol .. Buffer.View_Size.Col - 1 loop
               DrawChar (Buffer, Col, ViewRow);
            end loop;
            Buffer.RedrawNext := SaveNext;
         end if;
      end if;
   end DrawViewRow;


   -- DrawView : Draw specified view rows. Default is all view rows.
   procedure DrawView (
         Buffer  : in out View_Buffer;
         FromRow : in     View_Row := 0;
         ToRow   : in     View_Row := MAX_ROWS;
         Now     : in     Boolean  := True)
   is
      LastRow : View_Row := ToRow;
   begin
      if LastRow > Buffer.View_Size.Row - 1 then
         LastRow := Buffer.View_Size.Row - 1;
      end if;
      for Row in FromRow .. LastRow loop
         DrawViewRow (Buffer, 0, Row);
      end loop;
      Redraw (Buffer.Panel, Redraw_Now => Now);
   end DrawView;


   -- DrawScreenRow : Draw specified screen row if it is on view.
   procedure DrawScreenRow (
         Buffer  : in out View_Buffer;
         Row     : in     Scrn_Row := 0;
         Now     : in     Boolean  := True)
   is
   begin
      if OnView (Buffer, Row) then
         DrawViewRow (Buffer, 0, View (Buffer, Row));
         Redraw (Buffer.Panel, Redraw_Now => Now);
      end if;
   end DrawScreenRow;


   -- DrawScreen : Draw specified screen rows if they are on view.
   --              Default is all screen rows.
   procedure DrawScreen (
         Buffer  : in out View_Buffer;
         FromRow : in     Scrn_Row := 0;
         ToRow   : in     Scrn_Row := MAX_ROWS;
         Now     : in     Boolean  := True)
   is
      LastRow : Scrn_Row := ToRow;
   begin
      if LastRow > Buffer.Scrn_Size.Row - 1 then
         LastRow := Buffer.Scrn_Size.Row - 1;
      end if;
      if OnView (Buffer, FromRow) then
         If OnView (Buffer, LastRow) then
            DrawView (Buffer, View (Buffer, FromRow), View (Buffer, LastRow), Now);
         else
            DrawView (Buffer, View (Buffer, FromRow), Buffer.View_Size.Row - 1, Now);
         end if;
      elsif OnView (Buffer, LastRow) then
         DrawView (Buffer, 0, View (Buffer, LastRow), Now);
      end if;
   end DrawScreen;


   -- ClearEOL : Clear line to EOL. Accepts location so it can be
   --            used with Input or Output Cursor.
   procedure ClearEOL (
         Buffer  : in out View_Buffer;
         ScrnCol : in out Scrn_Col;
         ScrnRow : in out Scrn_Row)
   is
      RealRow : Real_Row := Real (Buffer, ScrnRow);
   begin
      for RealCol in Real (Buffer, ScrnCol) .. Real (Buffer, Buffer.Scrn_Size.Col - 1) loop
         Buffer.Real_Buffer (RealCol, RealRow)      := Buffer.OutputStyle;
         Buffer.Real_Buffer (RealCol, RealRow).Char := ' ';
         Buffer.Real_Buffer (RealCol, RealRow).Bits := False;
      end loop;
      if OnView (Buffer, ScrnRow) then
         UndrawCursor (Buffer);
         if OnView (Buffer, ScrnCol) then
            DrawViewRow (Buffer, View (Buffer, ScrnCol), View (Buffer, ScrnRow));
         else
            DrawViewRow (Buffer, 0, View (Buffer, ScrnRow));
         end if;
         DrawCursor (Buffer);
         Redraw (Buffer.Panel, Redraw_Now => True);
      end if;
   end ClearEOL;


   -- CreateFontsByType : Create a stock font. We can't do much with
   --                     stock fonts, but at least they're always
   --                     available. Note that the font size is
   --                     only meaningful when printing, since we
   --                     cannot choose the size of the stock font.
   procedure CreateFontsByType (
         Buffer  : in out View_Buffer;
         Font    : in     Font_Type;
         Size    : in     Integer)
   is
      TestSize : GT.Size_Type := (0, 0);
   begin
      Buffer.FontType   := Font;
      Buffer.FontSize   := Size;
      Buffer.StockFont  := True;
      Buffer.FontFixed  := True;
      Buffer.FontFrozen := True;
      GDO.Delete (Buffer.DefaultFont);
      GDO.Create_Stock_Font (Buffer.DefaultFont, Font);
      Select_Object (Buffer.Canvas, Buffer.DefaultFont);
      Buffer.CellSize  := Output_Size (Buffer, "X");
      Buffer.BlankSize := Buffer.CellSize;
      TestSize  := Output_Size (Buffer, "i");
      Buffer.FontFixed := Buffer.CellSize.Width = TestSize.Width;
      TestSize  := Output_Size (Buffer, "j");
      Buffer.FontFixed := Buffer.FontFixed and Buffer.CellSize.Width = TestSize.Width;
      TestSize  := Output_Size (Buffer, "W");
      Buffer.FontFixed := Buffer.FontFixed and Buffer.CellSize.Width = TestSize.Width;
      TestSize  := Output_Size (Buffer, " ");
      Buffer.FontFixed := Buffer.FontFixed and Buffer.CellSize.Width = TestSize.Width;
   end CreateFontsByType;


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
         CharSet : in     Charset_Type)
   is
      use type GT.Size_Type;

      TestFont  : GDO.Font_Type;
      SmallSize : GT.Size_Type   := (0, 0);
      LargeSize : GT.Size_Type   := (0, 0);

      -- SmallAndLargeSizes : update the smallest and largest cell
      --                      sizes by calculating the size of each
      --                      character in the test string.
      procedure SmallAndLargeSizes is
         Test : constant String := "AaDdOoQqXxIiJjYyWwMmGg _"; -- representative characters
         Size : GT.Size_Type;
         Line : String (1 .. 1);
      begin
         for i in Test'Range loop
            Line (1) := Test (i);
            Size := Output_Size (Buffer, Line);
            if Size.Width < SmallSize.Width then
               SmallSize.Width := Size.Width;
            end if;
            if Size.Height < SmallSize.Height then
               SmallSize.Height := Size.Height;
            end if;
            if Size.Width > LargeSize.Width then
               LargeSize.Width := Size.Width;
            end if;
            if Size.Height > LargeSize.Height then
               LargeSize.Height := Size.Height;
            end if;
         end loop;
      end SmallAndLargeSizes;

   begin
      Buffer.FontSize    := Size;
      Buffer.FontCharSet := CharSet;
      Buffer.FontName    := To_Unbounded (Font);
      Buffer.StockFont   := False;
      GDO.Delete (Buffer.DefaultFont);
      GDO.Create_Stock_Font (Buffer.DefaultFont, System_Font);
      Select_Object (Buffer.Canvas, Buffer.DefaultFont);
      -- first, calculate the basic size of the font (note
      -- we try both the non-underlined and underlined fonts,
      -- in case the height of one is larger than the other)
      CD.Create_Font_With_Charset (
         TestFont,
         Font,
         Point_Size (Buffer.Canvas, Size),
         Underline => False,
         Character_Set => CharSet);
      Select_Object (Buffer.Canvas, TestFont);
      -- calculate cell size for this
      -- font size using normal font
      SmallSize := Output_Size (Buffer, "X");
      LargeSize := SmallSize;
      SmallAndLargeSizes;
      Select_Object (Buffer.Canvas, Buffer.DefaultFont);
      GDO.Delete (TestFont);
      CD.Create_Font_With_Charset (
         TestFont,
         Font,
         Point_Size (Buffer.Canvas, Size),
         Underline => True,
         Character_Set => CharSet);
      Select_Object (Buffer.Canvas, TestFont);
      -- calculate cell size for this
      -- font size using underline font
      SmallAndLargeSizes;
      Buffer.CellSize := LargeSize;
      -- the font is fixed by char if all
      -- these characters are the same width
      Buffer.FontFixed  := (SmallSize.Width = LargeSize.Width);
      -- Assume the font is frozen (i.e. all characters
      -- are the same width even if different styles)
      Buffer.FontFrozen := Buffer.FontFixed;
      Select_Object (Buffer.Canvas, Buffer.DefaultFont);
      GDO.Delete (TestFont);
      -- now create and check all the font variants
      for Italic in False .. True loop
         for Strike in False .. True loop
            for Under in False .. True loop
               -- create non-bold font for this variant
               GDO.Delete (Buffer.Fonts (False, Italic, Strike, Under));
               CD.Create_Font_With_Charset (
                  Buffer.Fonts (False, Italic, Strike, Under),
                  Font,
                  Point_Size (Buffer.Canvas, Size),
                  Italics => Italic,
                  Strike_Out => Strike,
                  Underline => Under,
                  Character_Set => CharSet);
               -- create bold font for this variant
               GDO.Delete (Buffer.Fonts (True, Italic, Strike, Under));
               CD.Create_Font_With_Charset (
                  Buffer.Fonts (True, Italic, Strike, Under),
                  Font,
                  Point_Size (Buffer.Canvas, Size),
                  Weight => GDO.FW_BOLD,
                  Italics => Italic,
                  Strike_Out => Strike,
                  Underline => Under,
                  Character_Set => CharSet);
               -- calculate cell size for this
               -- variant using non-bold font
               Select_Object (
                  Buffer.Canvas,
                  Buffer.Fonts (False, Italic, Strike, Under));
               SmallAndLargeSizes;
               -- check for overhang, which makes
               -- bold and italic characters larger
               LargeSize.Width := Integer'Max (
                  LargeSize.Width,
                  GetMaxWidth (Buffer.Canvas) + GetOverhang (Buffer.Canvas));
               -- calculate cell size for this
               -- variant using bold font
               Select_Object (
                  Buffer.Canvas,
                  Buffer.Fonts (True, Italic, Strike, Under));
               SmallAndLargeSizes;
               -- check for overhang, which makes
               -- bold and italic characters larger
               LargeSize.Width := Integer'Max (
                  LargeSize.Width,
                  GetMaxWidth (Buffer.Canvas) + GetOverhang (Buffer.Canvas));
               Select_Object (Buffer.Canvas, Buffer.DefaultFont);
               -- update whether the font is still frozen with this style
               Buffer.FontFrozen := Buffer.FontFrozen and SmallSize.Width = LargeSize.Width;
            end loop;
         end loop;
      end loop;
      -- Buffer.BlankSize is the size of the largest character -
      -- it may be wider than Buffer.CellSize, but not wider
      -- than 2 * Cellsize, since we redraw only the next
      -- character after blanking. It must be the same
      -- height as Buffer.CellSize.
      Buffer.BlankSize.Width  := Integer'Min (LargeSize.Width, 2 * Buffer.CellSize.Width);
      Buffer.BlankSize.Height := Buffer.CellSize.Height;
      -- calculate the cell sizes for all the supported font
      -- sizes, for when we resize the window by font size
      for TestSize in MIN_FONT_SIZE .. MAX_FONT_SIZE loop
         CD.Create_Font_With_Charset (
            TestFont,
            To_Gstring (Buffer.FontName),
            Point_Size (Buffer.Canvas, TestSize),
            Underline => False,
            Character_Set => CharSet);
         Select_Object (Buffer.Canvas, TestFont);
         -- calculate cell size for this
         -- font size using normal font
         SmallSize := Output_Size (Buffer, "X");
         LargeSize := SmallSize;
         SmallAndLargeSizes;
         Select_Object (Buffer.Canvas, Buffer.DefaultFont);
         GDO.Delete (TestFont);
         CD.Create_Font_With_Charset (
            TestFont,
            To_GString (Buffer.FontName),
            Point_Size (Buffer.Canvas, TestSize),
            Underline => True,
            Character_Set => CharSet);
         Select_Object (Buffer.Canvas, TestFont);
         -- calculate cell size for this
         -- font size using underline font
         SmallAndLargeSizes;
         Buffer.FontCellSize (TestSize) := LargeSize;
         Select_Object (Buffer.Canvas, Buffer.DefaultFont);
         GDO.Delete (TestFont);
      end loop;
   end CreateFontsByName;


   -- SelectFont : Open the "Choose Font" dialog box. Initialize
   --              it with the current font and style. Update
   --              the current font and style with whatever is
   --              selected.
   procedure SelectFont (
      Buffer : in out View_Buffer)
   is

      Success     : Boolean                     := False;
      Color       : GWindows.Colors.Color_Type  := Buffer.OutputStyle.FgColor;
      Size        : Integer                     := Buffer.FontSize;
      Psize       : Integer                     := 0;
      Bold        : Boolean                     := Buffer.OutputStyle.Bold;
      Italic      : Boolean                     := Buffer.OutputStyle.Italic;
      Underline   : Boolean                     := Buffer.OutputStyle.Underline;
      Strikeout   : Boolean                     := Buffer.OutputStyle.Strikeout;
      CharSet     : Charset_Type                := CD.ANSI_CHARSET;
      FontName    : Unbounded_String            := Null_String;

   begin
      -- initialize dialog box using font based on current output style
      Bold      := Buffer.OutputStyle.Bold;
      Italic    := Buffer.OutputStyle.Italic;
      Strikeout := Buffer.OutputStyle.StrikeOut;
      Underline := Buffer.OutputStyle.Underline;
      -- choose a new font
      CD.Choose_Font_With_Effects (
         Buffer.Panel,
         Buffer.Canvas,
         Buffer.Fonts (Bold, Italic, Strikeout, Underline),
         Buffer.AnyFont,
         Psize,
         Success,
         Color,
         MIN_FONT_SIZE,
         MAX_FONT_SIZE);
      -- get details about the selected font (we do not use the
      -- font itself, but instead create all variants of the
      -- font from just the selected font name, size and charset)
      if Success then
         CD.FontDetails (
            Buffer.Fonts (Bold, Italic, Strikeout, Underline),
            FontName,
            Size,
            Bold,
            Italic,
            Underline,
            Strikeout,
            CharSet);
         -- use the selected font attributes to update the output style
         Buffer.OutputStyle.FgColor   := Color;
         Buffer.OutputStyle.Bold      := Bold;
         Buffer.OutputStyle.Italic    := Italic;
         Buffer.OutputStyle.Underline := Underline;
         Buffer.OutputStyle.Strikeout := Strikeout;
         -- recreate all font variants from the font name
         CreateFontsByName (Buffer, To_GString (FontName), Psize / 10, CharSet);
         -- changing font sizes may resize the client area
         ResizeClientArea (Buffer);
         DrawView (Buffer, Now => True);
      end if;
   end SelectFont;


   procedure Resize_Canvas (
      Buffer : in out View_Buffer)
   is
   begin
      Resize_Canvas (
         Buffer.Panel,
         GWindows.Application.Desktop_Width + SCRATCHPAD_OFFSET + SCRATCHPAD_SIZE,
         GWindows.Application.Desktop_Height,
         False);
   end Resize_Canvas;

end View_Buffer;
