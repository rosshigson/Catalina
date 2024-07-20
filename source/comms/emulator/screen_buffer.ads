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

with Buffer_Types;
with Real_Buffer;
with Terminal_Types;

package Screen_Buffer is

   use Buffer_Types;
   use Terminal_Types;

   type Screen_Buffer is new Real_Buffer.Real_Buffer with record

      BlankStyle : Real_Cell;          -- style used on clear screen
      UseRegion  : Boolean    := False;

   end record;
 

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
         BgColor : in     Color_Type);
   
   
   -- InitializeScreenColors : Set the fg and bg color of all the
   --                          cells on the screen. Note that the
   --                          rest of the buffer, and new cells
   --                          will use the BlankStyle colors.
   procedure InitializeScreenColors (
         Buffer  : in out Screen_Buffer;
         FgColor : in     Color_Type;
         BgColor : in     Color_Type);
   
   
   -- InvertScreenColors : Reverse the fg and bg color of
   --                      all the cells on the screen
   procedure InvertScreenColors (
         Buffer : in out Screen_Buffer);
   

   -- ClearScreenBuffer: Clear the screen to the current defaults
   --                    as indicated by BlankStyle. If Selective
   --                    is set, then only Erasable cells are
   --                    affected.
   procedure ClearScreenBuffer (
         Buffer    : in out Screen_Buffer;
         Selective : in     Boolean := False);

   
   -- DoubleHeight : return True if the real cell is double height
   function DoubleHeight (
         Buffer : in Screen_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
      return Boolean;

      
   -- DoubleHeight : return True if the screen cell is double height
   function DoubleHeight (
         Buffer : in Screen_Buffer;
         Col    : in Scrn_Col;
         Row    : in Scrn_Row)
      return Boolean;


   -- DoubleWidth : return True if the real cell is double width
   function DoubleWidth (
         Buffer : in Screen_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
      return Boolean;

      
   -- DoubleWidth : return True if the screen cell is double width
   function DoubleWidth (
         Buffer : in Screen_Buffer;
         Col    : in Scrn_Col;
         Row    : in Scrn_Row)
      return Boolean;

      
   -- Width : return width of real cell (i.e. either 1 or 2)
   function Width (
         Buffer : in Screen_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
      return Natural;
      

   -- Width : return width of screen cell (i.e. either 1 or 2)
   function Width (
         Buffer : in Screen_Buffer;
         Col    : in Scrn_Col;
         Row    : in Scrn_Row)
      return Scrn_Col;

      
   -- Height : return height of real cell (i.e. either 1 or 2)
   function Height (
         Buffer : in Screen_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
      return Natural;

      
   -- Height : return height of screen cell (i.e. either 1 or 2)
   function Height (
         Buffer : in Screen_Buffer;
         Col    : in Scrn_Col;
         Row    : in Scrn_Row)
      return Scrn_Row;

      
   -- DoubleWidthLine : Turn a single width line into a double width line.
   --                   Note the use of spare cells to save characters.
   --                   Adjusts column position as required.
   procedure DoubleWidthLine (
         Buffer  : in out Screen_Buffer;
         RealCol : in out Real_Col;
         RealRow : in out Real_Row;
         Size    : in     Row_Size := Double_Width);

   
   -- DoubleWidthLine : Turn a single width line into a double width line.
   --                   Note the use of spare cells to save characters.
   --                   Adjusts column position as required.
   procedure DoubleWidthLine (
         Buffer  : in out Screen_Buffer;
         ScrnCol : in out Scrn_Col;
         ScrnRow : in out Scrn_Row;
         Size    : in     Row_Size := Double_Width);

   
   -- SingleWidthLine : Turn a double width line into a single width line.
   --                   Note the recovery of characters from spare cells.
   --                   Adjusts column position as required.
   procedure SingleWidthLine (
         Buffer  : in out Screen_Buffer;
         RealCol : in out Real_Col;
         RealRow : in out Real_Row;
         Size    : in     Row_Size := Single_Width);

   
   -- SingleWidthLine : Turn a double width line into a single width line.
   --                   Note the recovery of characters from spare cells.
   --                   Adjusts column position as required.
   procedure SingleWidthLine (
         Buffer  : in out Screen_Buffer;
         ScrnCol : in out Scrn_Col;
         ScrnRow : in out Scrn_Row;
         Size    : in     Row_Size := Single_Width);

   
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
         Selective : in     Boolean := False);

   
   -- Unscramble : unscramble a scrambled reference. See
   --              also SingleWidthLine and DoubleWidthLine.
   function Unscramble (
         Buffer  : in Screen_Buffer;
         RealCol : in Real_Col)
      return Real_Col;

      
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
         Selective  : in     Boolean := False);
   

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
         Selective  : in     Boolean := False);

   
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
         Cols    : in     Natural := 1);

   
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
         Cols    : in     Natural := 1);

   
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
         Rows    : in     Natural := 1);


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
         Rows    : in     Natural := 1);


   -- Home : Set the column variable to the home position.
   procedure Home (
         Buffer  : in     Screen_Buffer;
         ScrnCol : in out Scrn_Col);


   -- Home : Set the column and row variables to the home position.
   procedure Home (
         Buffer  : in     Screen_Buffer;
         ScrnCol : in out Scrn_Col;
         ScrnRow : in out Scrn_Row);


   -- Last : Set the column variable to the last position.
   procedure Last (
         Buffer  : in     Screen_Buffer;
         ScrnCol : in out Scrn_Col;
         ScrnRow : in out Scrn_Row);
   
   
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
         SaveSize : in     Boolean := True);


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
         SaveSize : in     Boolean := True);
   

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
         SaveSize : in     Boolean := True);

   
end Screen_Buffer;
