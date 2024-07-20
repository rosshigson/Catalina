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

package body Screen_Buffer is

   -- InitializeBufferColors : Set the fg and bg color of all the
   --                          cells in the real buffer. Note that
   --                          new cells will use the BlankStyle
   --                          colors. Therefore, to make this
   --                          permanent even if the buffer is
   --                          scrolled, set BlankStyle to the
   --                          same colors.
   procedure InitializeBufferColors (
         Buffer  : in out Screen_Buffer;
         FgColor : in     Color_Type;
         BgColor : in     Color_Type)
   is
      Cell : Real_Cell_Access;
   begin
      if Buffer.Real_Buffer /= null then
         for RealRow in 0 .. Buffer.Real_Used.Row - 1 loop
            for RealCol in 0 .. Buffer.Real_Used.Col - 1 loop
               Cell := BufferCell (Buffer, RealCol, RealRow);
               Cell.FgColor := FgColor;
               Cell.BgColor := BgColor;
            end loop;
         end loop;
      end if;
   end InitializeBufferColors;


   -- InitializeScreenColors : Set the fg and bg color of all the
   --                          cells on the screen. Note that the
   --                          rest of the buffer, and new cells
   --                          will use the BlankStyle colors.
   procedure InitializeScreenColors (
         Buffer  : in out Screen_Buffer;
         FgColor : in     Color_Type;
         BgColor : in     Color_Type)
   is
      Cell : Real_Cell_Access;
   begin
      if Buffer.Real_Buffer /= null then
         for ScrnRow in 0 .. Buffer.Scrn_Size.Row - 1 loop
            for ScrnCol in 0 .. Buffer.Scrn_Size.Col - 1 loop
               Cell := BufferCell (Buffer, ScrnCol, ScrnRow);
               Cell.FgColor := FgColor;
               Cell.BgColor := BgColor;
            end loop;
         end loop;
      end if;
   end InitializeScreenColors;


   -- InvertScreenColors : Reverse the fg and bg color of
   --                      all the cells on the screen
   procedure InvertScreenColors (
         Buffer : in out Screen_Buffer)
   is
      Cell    : Real_Cell_Access;
      FgColor : Color_Type;
      BgColor : Color_Type;
   begin
      if Buffer.Real_Buffer /= null then
         for ScrnRow in 0 .. Buffer.Scrn_Size.Row - 1 loop
            for ScrnCol in 0 .. Buffer.Scrn_Size.Col - 1 loop
               Cell := BufferCell (Buffer, ScrnCol, ScrnRow);
               FgColor := Cell.FgColor;
               BgColor := Cell.BgColor;
               Cell.FgColor := BgColor;
               Cell.BgColor := FgColor;
            end loop;
         end loop;
      end if;
   end InvertScreenColors;


   -- ClearScreenBuffer: Clear the screen to the current defaults
   --                    as indicated by BlankStyle. If Selective
   --                    is set, then only Erasable cells are
   --                    affected.
   procedure ClearScreenBuffer (
         Buffer    : in out Screen_Buffer;
         Selective : in     Boolean := False)
   is
      Cell : Real_Cell_Access;
   begin
      if Buffer.Real_Buffer /= null then
         Buffer.BlankStyle.Char := ' ';
         Buffer.BlankStyle.Bits := False;
         for ScrnRow in 0 .. Buffer.Scrn_Size.Row - 1 loop
            for ScrnCol in 0 .. Buffer.Scrn_Size.Col - 1 loop
               Cell := BufferCell (Buffer, ScrnCol, ScrnRow);
               if not Selective or else Cell.Erasable then
                  Cell.all := Buffer.BlankStyle;
               end if;
            end loop;
         end loop;
      end if;
   end ClearScreenBuffer;


   -- DoubleHeight : return True if the real cell is double height
   function DoubleHeight (
         Buffer : in Screen_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
      return Boolean
   is
      Cell : Real_Cell_Access;
   begin
      Cell := BufferCell (Buffer, Col, Row);
      return  Cell.Size = Double_Height_Upper
      or else Cell.Size = Double_Height_Lower;
   end DoubleHeight;


   -- DoubleHeight : return True if the screen cell is double height
   function DoubleHeight (
         Buffer : in Screen_Buffer;
         Col    : in Scrn_Col;
         Row    : in Scrn_Row)
      return Boolean
   is
   begin
      return DoubleHeight (Buffer, Real (Buffer, Col), Real (Buffer, Row));
   end DoubleHeight;


   -- DoubleWidth : return True if the real cell is double width
   function DoubleWidth (
         Buffer : in Screen_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
      return Boolean
   is
   begin
      return Buffer.Real_Buffer (Col, Row).Size /= Single_Width;
   end DoubleWidth;


   -- DoubleWidth : return True if the screen cell is double width
   function DoubleWidth (
         Buffer : in Screen_Buffer;
         Col    : in Scrn_Col;
         Row    : in Scrn_Row)
      return Boolean
   is
   begin
      return DoubleWidth (Buffer, Real (Buffer, Col), Real (Buffer, Row));
   end DoubleWidth;


   -- Width : return width of real cell (i.e. either 1 or 2)
   function Width (
         Buffer : in Screen_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
      return Natural
   is
   begin
      if DoubleWidth (Buffer, Col, Row) then
         return 2;
      else
         return 1;
      end if;
   end Width;


   -- Width : return width of screen cell (i.e. either 1 or 2)
   function Width (
         Buffer : in Screen_Buffer;
         Col    : in Scrn_Col;
         Row    : in Scrn_Row)
      return Scrn_Col
   is
   begin
      return Scrn_Col (Width (Buffer, Real (Buffer, Col), Real (Buffer, Row)));
   end Width;


   -- Height : return height of real cell (i.e. either 1 or 2)
   function Height (
         Buffer : in Screen_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
      return Natural
   is
   begin
      if DoubleHeight (Buffer, Col, Row) then
         return 2;
      else
         return 1;
      end if;
   end Height;


   -- Height : return height of screen cell (i.e. either 1 or 2)
   function Height (
         Buffer : in Screen_Buffer;
         Col    : in Scrn_Col;
         Row    : in Scrn_Row)
      return Scrn_Row
   is
   begin
      return Scrn_Row (Height (Buffer, Real (Buffer, Col), Real (Buffer, Row)));
   end Height;


   -- DoubleWidthLine : Turn a single width line into a double width line.
   --                   Note the use of spare cells to save characters.
   --                   Adjusts column position as required.
   procedure DoubleWidthLine (
         Buffer  : in out Screen_Buffer;
         RealCol : in out Real_Col;
         RealRow : in out Real_Row;
         Size    : in     Row_Size := Double_Width)
   is
      Tmp : Real_Cell;
   begin
      if not DoubleWidth (Buffer, RealCol, RealRow) then
         -- scramble unscrambled line
         for Col in reverse 1 .. Real (Buffer, Buffer.Scrn_Size.Col - 1) loop
            if Col mod 2 = 0  then
               Tmp := Buffer.Real_Buffer (Col, RealRow);
               Buffer.Real_Buffer (Col, RealRow) := Buffer.Real_Buffer (Col / 2, RealRow);
               Buffer.Real_Buffer (Col / 2, RealRow) := Tmp;
            end if;
         end loop;
         -- adjust column position
         if RealCol * 2 <= Real (Buffer, Buffer.Scrn_Size.Col - 1) then
            RealCol := RealCol * 2;
         else
            RealCol := Real (Buffer, Buffer.Scrn_Size.Col - 1);
         end if;
      end if;
      for Col in 0 .. Real (Buffer, Buffer.Scrn_Size.Col - 1) loop
         Buffer.Real_Buffer (Col, RealRow).Size := Size;
      end loop;
   end DoubleWidthLine;


   -- DoubleWidthLine : Turn a single width line into a double width line.
   --                   Note the use of spare cells to save characters.
   --                   Adjusts column position as required.
   procedure DoubleWidthLine (
         Buffer  : in out Screen_Buffer;
         ScrnCol : in out Scrn_Col;
         ScrnRow : in out Scrn_Row;
         Size    : in     Row_Size := Double_Width)
   is
      RealCol : Real_Col;
      RealRow : Real_Row;
   begin
      RealCol := Real (Buffer, ScrnCol);
      RealRow := Real (Buffer, ScrnRow);
      DoubleWidthLine (Buffer, RealCol, RealRow, Size);
      ScrnCol := Scrn (Buffer, RealCol);
      ScrnRow := Scrn (Buffer, RealRow);
   end DoubleWidthLine;


   -- SingleWidthLine : Turn a double width line into a single width line.
   --                   Note the recovery of characters from spare cells.
   --                   Adjusts column position as required.
   procedure SingleWidthLine (
         Buffer  : in out Screen_Buffer;
         RealCol : in out Real_Col;
         RealRow : in out Real_Row;
         Size    : in     Row_Size := Single_Width)
   is
      Tmp : Real_Cell;
   begin
      if DoubleWidth (Buffer, RealCol, RealRow) then
         -- unscramble scrambled line
         for Col in 1 .. Real (Buffer, Buffer.Scrn_Size.Col - 1) loop
            if Col mod 2 = 0  then
               Tmp := Buffer.Real_Buffer (Col, RealRow);
               Buffer.Real_Buffer (Col, RealRow) := Buffer.Real_Buffer (Col / 2, RealRow);
               Buffer.Real_Buffer (Col / 2, RealRow) := Tmp;
            end if;
         end loop;
         -- adjust column position
         RealCol := RealCol / 2;
      end if;
      for Col in 0 .. Real (Buffer, Buffer.Scrn_Size.Col - 1) loop
         Buffer.Real_Buffer (Col, RealRow).Size := Size;
      end loop;
   end SingleWidthLine;


   -- SingleWidthLine : Turn a double width line into a single width line.
   --                   Note the recovery of characters from spare cells.
   --                   Adjusts column position as required.
   procedure SingleWidthLine (
         Buffer  : in out Screen_Buffer;
         ScrnCol : in out Scrn_Col;
         ScrnRow : in out Scrn_Row;
         Size    : in     Row_Size := Single_Width)
   is
      RealCol : Real_Col;
      RealRow : Real_Row;
   begin
      RealCol := Real (Buffer, ScrnCol);
      RealRow := Real (Buffer, ScrnRow);
      SingleWidthLine (Buffer, RealCol, RealRow, Size);
      ScrnCol := Scrn (Buffer, RealCol);
      ScrnRow := Scrn (Buffer, RealRow);
   end SingleWidthLine;


   -- FillRealCell : Fill a real cell using the given char, style
   --                and current character set, preserving the
   --                current cell size and selection status.
   --                If Selective is set, only erasable cells
   --                are affected. Note that this procedure
   --                does NOT take double width rows into
   --                account - see the FillScrnCell and
   --                FillRegnCell for this.
   procedure FillRealCell (
         Buffer    : in out Screen_Buffer;
         RealCol   : in     Real_Col;
         RealRow   : in     Real_Row;
         Ch        : in     Character;
         Bits      : in     Boolean;
         Style     : in     Real_Cell;
         Selective : in     Boolean := False)
   is
      Cell     : Real_Cell_Access := BufferCell (Buffer, RealCol, RealRow);
      Size     : Row_Size         := Cell.Size;
      Selected : Boolean          := Cell.Selected;
   begin
      if not Selective or else Cell.Erasable then
         Cell.all      := Style;
         Cell.Size     := Size;
         Cell.Selected := Selected;
         Cell.Char     := Ch;
         Cell.Bits     := Bits;
      end if;
   end FillRealCell;


   -- Unscramble : unscramble a scrambled reference. See
   --              also SingleWidthLine and DoubleWidthLine.
   function Unscramble (
         Buffer  : in Screen_Buffer;
         RealCol : in Real_Col)
      return Real_Col
   is
      TempCol : Real_Col := RealCol;
   begin
      if TempCol * 2 <= Real (Buffer, Buffer.Scrn_Size.Col - 1) then
         TempCol := TempCol * 2;
      else
         while TempCol mod 2 = 0 loop
            TempCol := TempCol / 2;
         end loop;
      end if;
      return TempCol;
   end Unscramble;


   -- FillScrnCell : Fill screen cell using the given char, style
   --                and current character set, preserving the
   --                current cell size and selection status.
   --                If Selective is set, only erasable cells
   --                are affected. This procedure takes into
   --                account whether the cell is double width
   --                or not, and adjusts the real buffer column
   --                references accordingly.
   procedure FillScrnCell (
         Buffer     : in out Screen_Buffer;
         ScrnCol    : in     Scrn_Col;
         ScrnRow    : in     Scrn_Row;
         Ch         : in     Character;
         Bits       : in     Boolean;
         Style      : in     Real_Cell;
         Selective  : in     Boolean := False)
   is
      RealCol : Real_Col := Real (Buffer, ScrnCol);
      RealRow : Real_Row := Real (Buffer, ScrnRow);
   begin
      if DoubleWidth (Buffer, RealCol, RealRow) then
         -- double width line - unscramble real cell reference
         RealCol := Unscramble (Buffer, RealCol);
      end if;
      FillRealCell (Buffer, RealCol, RealRow, Ch, Bits, Style, Selective);
   end FillScrnCell;


   -- FillRegnCell : Fill region cell using the given char, style
   --                and current character set, preserving the
   --                current cell size and selection status.
   --                If Selective is set, only erasable cells
   --                are affected. This procedure takes into
   --                account whether the cell is double width
   --                or not, and adjusts the real buffer column
   --                references accordingly.
   procedure FillRegnCell (
         Buffer     : in out Screen_Buffer;
         RegnCol    : in     Regn_Col;
         RegnRow    : in     Regn_Row;
         Ch         : in     Character;
         Bits       : in     Boolean;
         Style      : in     Real_Cell;
         Selective  : in     Boolean := False)
   is
      RealCol : Real_Col := Real (Buffer, RegnCol);
      RealRow : Real_Row := Real (Buffer, RegnRow);
   begin
      if DoubleWidth (Buffer, RealCol, RealRow) then
         -- double width line - unscramble real cell reference
         RealCol := Unscramble (Buffer, RealCol);
      end if;
      FillRealCell (Buffer, RealCol, RealRow, Ch, Bits, Style, Selective);
   end FillRegnCell;


   -- MoveLeft: Update screen position to reflect a move
   --           of Cols character cells to the left. If the
   --           position is in the current region then it
   --           stays in the region. If the position cannot
   --           be moved as many Cols as requested, it is
   --           moved as far as possible.
   --
   procedure MoveLeft (
         Buffer  : in     Screen_Buffer;
         ScrnCol : in out Scrn_Col;
         ScrnRow : in out Scrn_Row;
         Cols    : in     Natural := 1)
   is
      MaxMove : Scrn_Col;
   begin
      if Buffer.UseRegion and then InRegion (Buffer, ScrnCol, ScrnRow) then
         MaxMove := ScrnCol - Buffer.Regn_Base.Col;
      else
         MaxMove := ScrnCol;
      end if;
      ScrnCol := ScrnCol - Min (Scrn_Col (Cols) * Width (Buffer, ScrnCol, ScrnRow), MaxMove);
   end MoveLeft;


   -- MoveRight: Update screen position to reflect a move
   --            of Cols character cells to the right. If the
   --            position is in the current region then it
   --            stays in the region. If the position cannot
   --            be moved as many Cols as requested, it is
   --            moved as far as possible.
   procedure MoveRight (
         Buffer  : in     Screen_Buffer;
         ScrnCol : in out Scrn_Col;
         ScrnRow : in out Scrn_Row;
         Cols    : in     Natural := 1)
   is
      MaxMove : Scrn_Col;
   begin
      if Buffer.UseRegion and then InRegion (Buffer, ScrnCol, ScrnRow) then
         MaxMove := Buffer.Regn_Base.Col + Scrn_Col (Buffer.Regn_Size.Col) - 1 - ScrnCol;
      else
         MaxMove := Buffer.Scrn_Size.Col - 1 - ScrnCol;
      end if;
      ScrnCol := ScrnCol + Min (Scrn_Col (Cols) * Width (Buffer, ScrnCol, ScrnRow), MaxMove);
   end MoveRight;


   -- MoveUp: Update screen position to reflect a move
   --         of Rows character cells upwards. If the
   --         position is in the current region then it
   --         stays in the region. If the position cannot
   --         be moved as many Rows as requested, it is
   --         moved as far as possible.
   procedure MoveUp (
         Buffer  : in     Screen_Buffer;
         ScrnCol : in out Scrn_Col;
         ScrnRow : in out Scrn_Row;
         Rows    : in     Natural := 1)
   is
      MaxMove : Scrn_Row;
   begin
      if Buffer.UseRegion and then InRegion (Buffer, ScrnCol, ScrnRow) then
         MaxMove := ScrnRow - Buffer.Regn_Base.Row;
      else
         MaxMove := ScrnRow;
      end if;
      ScrnRow := ScrnRow - Min (Scrn_Row (Rows), MaxMove);
   end MoveUp;


   -- MoveDown: Update screen position to reflect a move
   --           of Rows character cells downwards. If the
   --           position is in the current region then it
   --           stays in the region. If the position cannot
   --           be moved as many Rows as requested, it is
   --           moved as far as possible.
   procedure MoveDown (
         Buffer  : in     Screen_Buffer;
         ScrnCol : in out Scrn_Col;
         ScrnRow : in out Scrn_Row;
         Rows    : in     Natural := 1)
   is
      MaxMove : Scrn_Row;
   begin
      if Buffer.UseRegion and then InRegion (Buffer, ScrnCol, ScrnRow) then
         MaxMove := Buffer.Regn_Base.Row + Scrn_Row (Buffer.Regn_Size.Row) - 1 - ScrnRow;
      else
         MaxMove := Buffer.Scrn_Size.Row - 1 - ScrnRow;
      end if;
      ScrnRow := ScrnRow + Min (Scrn_Row (Rows), MaxMove);
   end MoveDown;


   -- Home : Set the column variable to the home position.
   procedure Home (
         Buffer  : in     Screen_Buffer;
         ScrnCol : in out Scrn_Col)
   is
   begin
      if Buffer.UseRegion then
         ScrnCol := Buffer.Regn_Base.Col;
      else
         ScrnCol := 0;
      end if;
   end Home;


   -- Home : Set the column and row variables to the home position.
   procedure Home (
         Buffer  : in     Screen_Buffer;
         ScrnCol : in out Scrn_Col;
         ScrnRow : in out Scrn_Row)
   is
   begin
      if Buffer.UseRegion then
         ScrnCol := Buffer.Regn_Base.Col;
         ScrnRow := Buffer.Regn_Base.Row;
      else
         ScrnCol := 0;
         ScrnRow := 0;
      end if;
   end Home;


   -- Last : Set the column variable to the last position.
   procedure Last (
         Buffer  : in     Screen_Buffer;
         ScrnCol : in out Scrn_Col;
         ScrnRow : in out Scrn_Row)
   is
   begin
      if Buffer.UseRegion and then InRegion (Buffer, ScrnCol, ScrnRow) then
         ScrnCol := Buffer.Regn_Base.Col + Scrn_Col (Buffer.Regn_Size.Col) - 1;
      else
         ScrnCol := Buffer.Scrn_Size.Col - 1;
      end if;
   end Last;


   -- MoveRealCell : Move the contents of one real buffer cell
   --                to another, preserving selected status of
   --                the destination cell, and also the size of
   --                the destination cell if requested. Note
   --                that this procedure does NOT take double
   --                width source or destination rows into
   --                account - see MoveScrnCell and MoveRegnCells
   --                for this.
   procedure MoveRealCell (
         Buffer   : in out Screen_Buffer;
         SrcCol   : in     Real_Col;
         SrcRow   : in     Real_Row;
         DstCol   : in     Real_Col;
         DstRow   : in     Real_Row;
         SaveSize : in     Boolean := True)
   is
      Size     : Row_Size;
      Selected : Boolean;
   begin
      if SaveSize then
         Size := Buffer.Real_Buffer (DstCol, DstRow).Size;
      end if;
      Selected := Buffer.Real_Buffer (DstCol, DstRow).Selected;
      Buffer.Real_Buffer (DstCol, DstRow) := Buffer.Real_Buffer (SrcCol, SrcRow);
      Buffer.Real_Buffer (DstCol, DstRow).Selected := Selected;
      if SaveSize then
         Buffer.Real_Buffer (DstCol, DstRow).Size := Size;
      end if;
   end MoveRealCell;


   -- MoveScrnCell : Move the contents of one screen cell to
   --                another, preserving selected status of
   --                the destination cell, and also the size of
   --                the destination cell if requested. This
   --                procedure takes into account whether the
   --                source or destination row is double width
   --                or not, and adjusts the real buffer column
   --                references accordingly.
   procedure MoveScrnCell (
         Buffer   : in out Screen_Buffer;
         SrcCol   : in     Scrn_Col;
         SrcRow   : in     Scrn_Row;
         DstCol   : in     Scrn_Col;
         DstRow   : in     Scrn_Row;
         SaveSize : in     Boolean := True)
   is
      RealSrcCol : Real_Col := Real (Buffer, SrcCol);
      RealSrcRow : Real_Row := Real (Buffer, SrcRow);
      RealDstCol : Real_Col := Real (Buffer, DstCol);
      RealDstRow : Real_Row := Real (Buffer, DstRow);
   begin
      if DoubleWidth (Buffer, RealSrcCol, RealSrcRow) then
         -- double width line - unscramble real cell reference
         RealSrcCol := Unscramble (Buffer, RealSrcCol);
      end if;
      if DoubleWidth (Buffer, RealDstCol, RealDstRow) then
         -- double width line - unscramble real cell reference
         RealDstCol := Unscramble (Buffer, RealDstCol);
      end if;
      MoveRealCell (Buffer, RealSrcCol, RealSrcRow, RealDstCol, RealDstRow);
   end MoveScrnCell;


   -- MoveRegnCell : Move the contents of one region cell
   --                to another, preserving selected status of
   --                the destination cell, and also the size of
   --                the destination cell if requested. This
   --                procedure takes into account whether the
   --                source or destination row is double width
   --                or not, and adjusts the real buffer column
   --                references accordingly.
   procedure MoveRegnCell (
         Buffer   : in out Screen_Buffer;
         SrcCol   : in     Regn_Col;
         SrcRow   : in     Regn_Row;
         DstCol   : in     Regn_Col;
         DstRow   : in     Regn_Row;
         SaveSize : in     Boolean := True)
   is
      RealSrcCol : Real_Col := Real (Buffer, SrcCol);
      RealSrcRow : Real_Row := Real (Buffer, SrcRow);
      RealDstCol : Real_Col := Real (Buffer, DstCol);
      RealDstRow : Real_Row := Real (Buffer, DstRow);
   begin
      if DoubleWidth (Buffer, RealSrcCol, RealSrcRow) then
         -- double width line - unscramble real cell reference
         RealSrcCol := Unscramble (Buffer, RealSrcCol);
      end if;
      if DoubleWidth (Buffer, RealDstCol, RealDstRow) then
         -- double width line - unscramble real cell reference
         RealDstCol := Unscramble (Buffer, RealDstCol);
      end if;
      MoveRealCell (Buffer, RealSrcCol, RealSrcRow, RealDstCol, RealDstRow);
   end MoveRegnCell;


end Screen_Buffer;
