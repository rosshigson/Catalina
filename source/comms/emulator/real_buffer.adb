-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 2.2                                   --
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
with Terminal_Types;

package body Real_Buffer is

   use Terminal_Types;

   --
   -- Functions to map between Virtual, View, Screen and Real row numbers.
   -- It is the responsibility of the caller to provide a valid row number, and
   -- to check that the result is contextually sensible (e.g. when mapping from
   -- Real to View, that the Real row number is actually on View).
   -- Otherwise the results will be incorrect.
   --

   function Real (
         Buffer : in Real_Buffer;
         Row    : in Virt_Row)
     return Real_Row is
   begin
      return Real_Row ((Integer (Row)
                      + Integer (Buffer.Virt_Base.Row))
         mod Integer (Buffer.Real_Used.Row));
   end Real;

   function Real (
         Buffer : in Real_Buffer;
         Row    : in View_Row)
     return Real_Row is
   begin
      return Real_Row ((Integer (Buffer.Virt_Base.Row)
                      + Integer (Buffer.View_Base.Row)
                      + Integer (Row))
         mod Integer (Buffer.Real_Used.Row));
   end Real;

   function Real (
         Buffer : in Real_Buffer;
         Row    : in Scrn_Row)
     return Real_Row is
   begin
      return Real_Row ((Integer (Buffer.Virt_Base.Row)
                      + Integer (Buffer.Scrn_Base.Row)
                      + Integer (Row))
         mod Integer (Buffer.Real_Used.Row));
   end Real;

   function Real (
         Buffer : in Real_Buffer;
         Row    : in Regn_Row)
     return Real_Row is
   begin
      return Real_Row ((Integer (Buffer.Virt_Base.Row)
                      + Integer (Buffer.Scrn_Base.Row)
                      + Integer (Buffer.Regn_Base.Row)
                      + Integer (Row))
         mod Integer (Buffer.Real_Used.Row));
   end Real;

   function Virt (
         Buffer : in Real_Buffer;
         Row    : in Real_Row)
     return Virt_Row is
   begin
      return Virt_Row ((Integer (Row)
                      - Integer (Buffer.Virt_Base.Row))
         mod Integer (Buffer.Real_Used.Row));
   end Virt;

   function Virt (
         Buffer : in Real_Buffer;
         Row    : in Scrn_Row)
     return Virt_Row is
   begin
      return Virt_Row ((Integer (Row)
                      + Integer (Buffer.Scrn_Base.Row))
         mod Integer (Buffer.Real_Used.Row));
   end Virt;

   function Virt (
         Buffer : in Real_Buffer;
         Row    : in View_Row)
     return Virt_Row is
   begin
      return Virt_Row ((Integer (Row)
                      + Integer (Buffer.View_Base.Row))
         mod Integer (Buffer.Real_Used.Row));
   end Virt;

   function Virt (
         Buffer : in Real_Buffer;
         Row    : in Regn_Row)
     return Virt_Row is
   begin
      return Virt_Row ((Integer (Row)
                      + Integer (Buffer.Scrn_Base.Row)
                      + Integer (Buffer.Regn_Base.Row))
         mod Integer (Buffer.Real_Used.Row));
   end Virt;

   function View (
         Buffer : in Real_Buffer;
         Row    : in Real_Row)
     return View_Row is
   begin
      return View_Row (((Integer (Row)
                       - Integer (Buffer.Virt_Base.Row)
                       - Integer (Buffer.View_Base.Row)) mod Integer (Buffer.Real_Used.Row))
        mod Integer (Buffer.View_Size.Row));
   end View;

   function View (
         Buffer : in Real_Buffer;
         Row    : in Scrn_Row)
     return View_Row is
   begin
      return View_Row (((Integer (Row)
                       + Integer (Buffer.Scrn_Base.Row)
                       - Integer (Buffer.View_Base.Row)) mod Integer (Buffer.Real_Used.Row))
         mod Integer (Buffer.View_Size.Row));
   end View;

   function View (
         Buffer : in Real_Buffer;
         Row    : in Virt_Row)
     return View_Row is
   begin
      return View_Row (((Integer (Row)
                       - Integer (Buffer.View_Base.Row)) mod Integer (Buffer.Real_Used.Row))
         mod Integer (Buffer.View_Size.Row));
   end View;

   function View (
         Buffer : in Real_Buffer;
         Row    : in Regn_Row)
     return View_Row is
   begin
      return View_Row (((Integer (Row)
                       + Integer (Buffer.Scrn_Base.Row)
                       + Integer (Buffer.Regn_Base.Row)
                       - Integer (Buffer.View_Base.Row)) mod Integer (Buffer.Real_Used.Row))
         mod Integer (Buffer.View_Size.Row));
   end View;

   function Scrn (
         Buffer : in Real_Buffer;
         Row    : in Real_Row)
     return Scrn_Row is
   begin
      return Scrn_Row (((Integer (Row)
                       - Integer (Buffer.Virt_Base.Row)
                       - Integer (Buffer.Scrn_Base.Row)) mod Integer (Buffer.Real_Used.Row))
         mod Integer (Buffer.Scrn_Size.Row));
   end Scrn;

   function Scrn (
         Buffer : in Real_Buffer;
         Row    : in View_Row)
     return Scrn_Row is
   begin
      return Scrn_Row (((Integer (Row)
                       + Integer (Buffer.View_Base.Row)
                       - Integer (Buffer.Scrn_Base.Row)) mod Integer (Buffer.Real_Used.Row))
         mod Integer (Buffer.Scrn_Size.Row));
   end Scrn;

   function Scrn (
         Buffer : in Real_Buffer;
         Row    : in Virt_Row)
     return Scrn_Row is
   begin
      return Scrn_Row (((Integer (Row)
                       - Integer (Buffer.Scrn_Base.Row)) mod Integer (Buffer.Real_Used.Row))
         mod Integer (Buffer.Scrn_Size.Row));
   end Scrn;

   function Scrn (
         Buffer : in Real_Buffer;
         Row    : in Regn_Row)
     return Scrn_Row is
   begin
      return Scrn_Row (((Integer (Row)
                       + Integer (Buffer.Regn_Base.Row)) mod Integer (Buffer.Real_Used.Row))
         mod Integer (Buffer.Scrn_Size.Row));
   end Scrn;

   function Regn (
         Buffer : in Real_Buffer;
         Row    : in Real_Row)
     return Regn_Row is
   begin
      return Regn_Row (((Integer (Row)
                       - Integer (Buffer.Virt_Base.Row)
                       - Integer (Buffer.Scrn_Base.Row)
                       - Integer (Buffer.Regn_Base.Row)) mod Integer (Buffer.Real_Used.Row))
         mod Integer (Buffer.Regn_Size.Row));
   end Regn;

   function Regn (
         Buffer : in Real_Buffer;
         Row    : in View_Row)
     return Regn_Row is
   begin
      return Regn_Row (((Integer (Row)
                       + Integer (Buffer.View_Base.Row)
                       - Integer (Buffer.Scrn_Base.Row)
                       - Integer (Buffer.Regn_Base.Row)) mod Integer (Buffer.Real_Used.Row))
         mod Integer (Buffer.Regn_Size.Row));
   end Regn;

   function Regn (
         Buffer : in Real_Buffer;
         Row    : in Virt_Row)
     return Regn_Row is
   begin
      return Regn_Row (((Integer (Row)
                       - Integer (Buffer.Scrn_Base.Row)
                       - Integer (Buffer.Regn_Base.Row)) mod Integer (Buffer.Real_Used.Row))
         mod Integer (Buffer.Regn_Size.Row));
   end Regn;

   function Regn (
         Buffer : in Real_Buffer;
         Row    : in Scrn_Row)
     return Regn_Row is
   begin
      return Regn_Row (((Integer (Row)
                       - Integer (Buffer.Regn_Base.Row)) mod Integer (Buffer.Real_Used.Row))
         mod Integer (Buffer.Regn_Size.Row));
   end Regn;


   -- Functions to map between Virtual, View, Screen and Real column numbers.
   -- It is the responsibility of the caller to provide a valid column
   -- number, and to check that the result is contextually sensible
   -- (e.g. when calling View, that the Real column number is actually
   -- currently on View). Otherwise the results are questionable.

   function Real (
         Buffer : in Real_Buffer;
         Col    : in Virt_Col)
     return Real_Col is
   begin
      return Real_Col ((Integer (Col)
                      + Integer (Buffer.Virt_Base.Col))
         mod Integer (Buffer.Real_Used.Col));
   end Real;

   function Real (
         Buffer : in Real_Buffer;
         Col    : in View_Col)
     return Real_Col is
   begin
      return Real_Col ((Integer (Buffer.Virt_Base.Col)
                      + Integer (Buffer.View_Base.Col)
                      + Integer (Col))
         mod Integer (Buffer.Real_Used.Col));
   end Real;

   function Real (
         Buffer : in Real_Buffer;
         Col    : in Scrn_Col)
     return Real_Col is
   begin
      return Real_Col ((Integer (Buffer.Virt_Base.Col)
                      + Integer (Buffer.Scrn_Base.Col)
                      + Integer (Col))
         mod Integer (Buffer.Real_Used.Col));
   end Real;

   function Real (
         Buffer : in Real_Buffer;
         Col    : in Regn_Col)
     return Real_Col is
   begin
      return Real_Col ((Integer (Buffer.Virt_Base.Col)
                      + Integer (Buffer.Scrn_Base.Col)
                      + Integer (Buffer.Regn_Base.Col)
                      + Integer (Col))
         mod Integer (Buffer.Real_Used.Col));
   end Real;

   function Virt (
         Buffer : in Real_Buffer;
         Col    : in Real_Col)
     return Virt_Col is
   begin
      return Virt_Col ((Integer (Col)
                      - Integer (Buffer.Virt_Base.Col))
         mod Integer (Buffer.Real_Used.Col));
   end Virt;

   function Virt (
         Buffer : in Real_Buffer;
         Col    : in Scrn_Col)
     return Virt_Col is
   begin
      return Virt_Col ((Integer (Col)
                      + Integer (Buffer.Scrn_Base.Col))
         mod Integer (Buffer.Real_Used.Col));
   end Virt;

   function Virt (
         Buffer : in Real_Buffer;
         Col    : in View_Col)
     return Virt_Col is
   begin
      return Virt_Col ((Integer (Col)
                      + Integer (Buffer.View_Base.Col))
         mod Integer (Buffer.Real_Used.Col));
   end Virt;

   function Virt (
         Buffer : in Real_Buffer;
         Col    : in Regn_Col)
     return Virt_Col is
   begin
      return Virt_Col ((Integer (Col)
                      + Integer (Buffer.Scrn_Base.Col)
                      + Integer (Buffer.Regn_Base.Col))
         mod Integer (Buffer.Real_Used.Col));
   end Virt;

   function View (
         Buffer : in Real_Buffer;
         Col    : in Real_Col)
     return View_Col is
   begin
      return View_Col (((Integer (Col)
                       - Integer (Buffer.Virt_Base.Col)
                       - Integer (Buffer.View_Base.Col)) mod Integer (Buffer.Real_Used.Col))
         mod Integer (Buffer.View_Size.Col));
   end View;

   function View (
         Buffer : in Real_Buffer;
         Col    : in Scrn_Col)
     return View_Col is
   begin
      return View_Col (((Integer (Col)
                       + Integer (Buffer.Scrn_Base.Col)
                       - Integer (Buffer.View_Base.Col)) mod Integer (Buffer.Real_Used.Col))
         mod Integer (Buffer.View_Size.Col));
   end View;

   function View (
         Buffer : in Real_Buffer;
         Col    : in Virt_Col)
     return View_Col is
   begin
      return View_Col (((Integer (Col)
                       - Integer (Buffer.View_Base.Col)) mod Integer (Buffer.Real_Used.Col))
         mod Integer (Buffer.View_Size.Col));
   end View;

   function View (
         Buffer : in Real_Buffer;
         Col    : in Regn_Col)
     return View_Col is
   begin
      return View_Col (((Integer (Col)
                       + Integer (Buffer.Scrn_Base.Col)
                       + Integer (Buffer.Regn_Base.Col)
                       - Integer (Buffer.View_Base.Col)) mod Integer (Buffer.Real_Used.Col))
         mod Integer (Buffer.View_Size.Col));
   end View;

   function Scrn (
         Buffer : in Real_Buffer;
         Col    : in Real_Col)
     return Scrn_Col is
   begin
      return Scrn_Col (((Integer (Col)
                       - Integer (Buffer.Virt_Base.Col)
                       - Integer (Buffer.Scrn_Base.Col)) mod Integer (Buffer.Real_Used.Col))
         mod Integer (Buffer.Scrn_Size.Col));
   end Scrn;

   function Scrn (
         Buffer : in Real_Buffer;
         Col    : in View_Col)
     return Scrn_Col is
   begin
      return Scrn_Col (((Integer (Col)
                       + Integer (Buffer.View_Base.Col)
                       - Integer (Buffer.Scrn_Base.Col)) mod Integer (Buffer.Real_Used.Col))
         mod Integer (Buffer.Scrn_Size.Col));
   end Scrn;

   function Scrn (
         Buffer : in Real_Buffer;
         Col    : in Virt_Col)
     return Scrn_Col is
   begin
      return Scrn_Col (((Integer (Col)
                       - Integer (Buffer.Scrn_Base.Col)) mod Integer (Buffer.Real_Used.Col))
         mod Integer (Buffer.Scrn_Size.Col));
   end Scrn;

   function Scrn (
         Buffer : in Real_Buffer;
         Col    : in Regn_Col)
     return Scrn_Col is
   begin
      return Scrn_Col (((Integer (Col)
                       + Integer (Buffer.Regn_Base.Col)) mod Integer (Buffer.Real_Used.Col))
         mod Integer (Buffer.Scrn_Size.Col));
   end Scrn;

   function Regn (
         Buffer : in Real_Buffer;
         Col    : in Real_Col)
     return Regn_Col is
   begin
      return Regn_Col (((Integer (Col)
                       - Integer (Buffer.Virt_Base.Col)
                       - Integer (Buffer.Scrn_Base.Col)
                       - Integer (Buffer.Regn_Base.Col)) mod Integer (Buffer.Real_Used.Col))
         mod Integer (Buffer.Regn_Size.Col));
   end Regn;

   function Regn (
         Buffer : in Real_Buffer;
         Col    : in View_Col)
     return Regn_Col is
   begin
      return Regn_Col (((Integer (Col)
                       + Integer (Buffer.View_Base.Col)
                       - Integer (Buffer.Scrn_Base.Col)
                       - Integer (Buffer.Regn_Base.Col)) mod Integer (Buffer.Real_Used.Col))
         mod Integer (Buffer.Regn_Size.Col));
   end Regn;

   function Regn (
         Buffer : in Real_Buffer;
         Col    : in Virt_Col)
     return Regn_Col is
   begin
      return Regn_Col (((Integer (Col)
                       - Integer (Buffer.Scrn_Base.Col)
                       - Integer (Buffer.Regn_Base.Col)) mod Integer (Buffer.Real_Used.Col))
         mod Integer (Buffer.Regn_Size.Col));
   end Regn;

   function Regn (
         Buffer : in Real_Buffer;
         Col    : in Scrn_Col)
     return Regn_Col is
   begin
      return Regn_Col (((Integer (Col)
                       - Integer (Buffer.Regn_Base.Col)) mod Integer (Buffer.Real_Used.Col))
         mod Integer (Buffer.Regn_Size.Col));
   end Regn;


   -- OnView : Is the row with the specified Real row number
   --          currently on the View ?
   function OnView (
         Buffer : in Real_Buffer;
         Row    : in Real_Row)
     return Boolean is
   begin
      return Virt (Buffer, Row) in Virt (Buffer, View_Row (0)) .. Virt (Buffer, Buffer.View_Size.Row - 1);
   end OnView;

   -- OnView : Is the row with the specified Screen row number
   --          currently on the View ?
   function OnView (
         Buffer : in Real_Buffer;
         Row    : in Scrn_Row)
     return Boolean is
   begin
      return Virt (Buffer, Row) in Virt (Buffer, View_Row (0)) .. Virt (Buffer, Buffer.View_Size.Row - 1);
   end OnView;

   -- OnView : Is the row with the specified
   --          Region row number currently on the View ?
   function OnView (
         Buffer : in Real_Buffer;
         Row    : in Regn_Row)
     return Boolean is
   begin
      return Virt (Buffer, Row) in Virt (Buffer, View_Row (0)) .. Virt (Buffer, Buffer.View_Size.Row - 1);
   end OnView;

   -- OnView : Is the column with the specified
   --          Real column number currently on the View ?
   function OnView (
         Buffer : in Real_Buffer;
         Col    : in Real_Col)
     return Boolean is
   begin
      return Virt (Buffer, Col) in Virt (Buffer, View_Col (0)) .. Virt (Buffer, Buffer.View_Size.Col - 1);
   end OnView;

   -- OnView : Is the column with the specified Screen column number
   --          currently on the View ?
   function OnView (
         Buffer : in Real_Buffer;
         Col    : in Scrn_Col)
     return Boolean is
   begin
      return Virt (Buffer, Col) in Virt (Buffer, View_Col (0)) .. Virt (Buffer, Buffer.View_Size.Col - 1);
   end OnView;

   -- OnView : Is the column with the specified Region column number
   --          currently on the View ?
   function OnView (
         Buffer : in Real_Buffer;
         Col    : in Regn_Col)
     return Boolean is
   begin
      return Virt (Buffer, Col) in Virt (Buffer, View_Col (0)) .. Virt (Buffer, Buffer.View_Size.Col - 1);
   end OnView;

   -- OnScreen : Is the row with the specified Real row number
   --            currently on the Screen ?
   function OnScreen (
         Buffer : in Real_Buffer;
         Row    : in Real_Row)
     return Boolean is
   begin
      return Virt (Buffer, Row) in Virt (Buffer, Scrn_Row (0)) .. Virt (Buffer, Buffer.Scrn_Size.Row - 1);
   end OnScreen;

   -- OnScreen : Is the column with the specified Real column number
   --            currently on the Screen ?
   function OnScreen (
         Buffer : in Real_Buffer;
         Col    : in Real_Col)
     return Boolean is
   begin
      return Virt (Buffer, Col) in Virt (Buffer, Scrn_Col (0)) .. Virt (Buffer, Buffer.Scrn_Size.Col - 1);
   end OnScreen;

   -- OnView : Is the position with the specified Real row and column
   --          number currently on the View ?
   function OnView (
         Buffer : in Real_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
     return Boolean is
   begin
      return OnView (Buffer, Row) and then OnView (Buffer, Col);
   end OnView;

   -- OnScreen : Is the position with the specified Real row and column
   --            number currently on the Screen ?
   function OnScreen (
         Buffer : in Real_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
     return Boolean is
   begin
      return OnScreen (Buffer, Row) and then OnScreen (Buffer, Col);
   end OnScreen;

   -- InRegion : Is the region valid and the real row
   --            within the region ?
   function InRegion (
         Buffer : in Real_Buffer;
         Row    : in Real_Row)
      return Boolean
   is
   begin
      if Buffer.Regn_Size.Col >= 1
      and then Buffer.Regn_Size.Row >= 2 then
         return Virt (Buffer, Row) in Virt (Buffer, Regn_Row (0)) .. Virt (Buffer, Buffer.Regn_Size.Row - 1);
      else
         return False;
      end if;
   end InRegion;

   -- InRegion : Is the region valid and the real column
   --            within the region ?
   function InRegion (
         Buffer : in Real_Buffer;
         Col    : in Real_Col)
      return Boolean is
   begin
      if Buffer.Regn_Size.Col >= 1
      and then Buffer.Regn_Size.Row >= 2 then
         return Virt (Buffer, Col) in Virt (Buffer, Regn_Col (0)) .. Virt (Buffer, Buffer.Regn_Size.Col - 1);
      else
         return False;
      end if;
   end InRegion;

   -- InRegion : Is the region valid and the real row and column
   --            within the region ?
   function InRegion (
         Buffer : in Real_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
     return Boolean is
   begin
      return Buffer.Regn_Size.Col >= 1
      and then Buffer.Regn_Size.Row >= 2
      and then InRegion (Buffer, Row)
      and then InRegion (Buffer, Col);
   end InRegion;

   -- InRegion : Is the region valid and the screen row and column
   --            within the region ?
   function InRegion (
         Buffer : in Real_Buffer;
         Col    : in Scrn_Col;
         Row    : in Scrn_Row)
      return Boolean is
   begin
      return Buffer.Regn_Size.Col >= 1
      and then Buffer.Regn_Size.Row >= 2
      and then Col in Buffer.Regn_Base.Col .. Buffer.Regn_Base.Col + Scrn_Col (Buffer.Regn_Size.Col - 1)
      and then Row in Buffer.Regn_Base.Row .. Buffer.Regn_Base.Row + Scrn_Row (Buffer.Regn_Size.Row - 1);
   end InRegion;


   -- BufferCell : Return a pointer to the specified TermBuffer cell.
   --              Will only work after TermBuffer has been created.
   function BufferCell (
         Buffer : in Real_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
      return Real_Cell_Access is
   begin
      return Buffer.Real_Buffer (Col, Row)'Access;
   end BufferCell;

   function BufferCell (
         Buffer : in Real_Buffer;
         Col    : in Virt_Col;
         Row    : in Virt_Row)
      return Real_Cell_Access is
   begin
      return Buffer.Real_Buffer (Real (Buffer, Col), Real (Buffer, Row))'Access;
   end BufferCell;

   function BufferCell (
         Buffer : in Real_Buffer;
         Col    : in Scrn_Col;
         Row    : in Scrn_Row)
      return Real_Cell_Access is
   begin
      return Buffer.Real_Buffer (Real (Buffer, Col), Real (Buffer, Row))'Access;
   end BufferCell;

   function BufferCell (
         Buffer : in Real_Buffer;
         Col    : in View_Col;
         Row    : in View_Row)
      return Real_Cell_Access is
   begin
      return Buffer.Real_Buffer (Real (Buffer, Col), Real (Buffer, Row))'Access;
   end BufferCell;

   function BufferCell (
         Buffer : in Real_Buffer;
         Col    : in Regn_Col;
         Row    : in Regn_Row)
      return Real_Cell_Access is
   begin
      return Buffer.Real_Buffer (Real (Buffer, Col), Real (Buffer, Row))'Access;
   end BufferCell;


   -- CalculateScrnScroll : Calculate scroll required to get
   --                       specified virtual row on screen.
   function CalculateScreenScroll (
         Buffer : in Real_Buffer;
         Row    : in Virt_Row)
     return Integer
   is
      UsedRows : Virt_Row := Max (Virt (Buffer, Buffer.Scrn_Size.Row), Buffer.Virt_Used.Row);
      FirstRow : Virt_Row := Virt (Buffer, Scrn_Row (0));
      LastRow  : Virt_Row;
      VirtRow  : Virt_Row := Row;
      Scroll   : Integer  := 0;
   begin
      if UsedRows > 0 then
         if FirstRow + Virt_Row (Buffer.Scrn_Size.Row) <= UsedRows then
            LastRow := Virt (Buffer, Buffer.Scrn_Size.Row - 1);
            -- make sure row is used
            VirtRow := Min (VirtRow, UsedRows - 1);
            -- calculate minimum scroll required to put virtual row on scrn
            if VirtRow < FirstRow then
               Scroll := Integer (VirtRow - FirstRow);
            elsif VirtRow > LastRow then
               Scroll := Integer (VirtRow - LastRow);
            end if;
         else
            Scroll := Integer (UsedRows - FirstRow - Virt_Row (Buffer.Scrn_Size.Row));
         end if;
      else
         -- put screen at top of virtual buffer
         Scroll := -Integer (FirstRow);
      end if;
      return Scroll;
   end CalculateScreenScroll;


   -- CalculateViewScroll : Calculate scroll required to get
   --                       specified screen row on view.
   function CalculateViewScroll (
         Buffer : in Real_Buffer;
         Row    : in Virt_Row)
     return Integer
   is
      UsedRows : Virt_Row := Max (Virt (Buffer, Buffer.Scrn_Size.Row), Buffer.Virt_Used.Row);
      FirstRow : Virt_Row := Virt (Buffer, View_Row (0));
      LastRow  : Virt_Row;
      VirtRow  : Virt_Row := Row;
      Scroll   : Integer  := 0;
   begin
      if UsedRows > 0 then
         if FirstRow + Virt_Row (Buffer.View_Size.Row) <= UsedRows then
            LastRow  := Virt (Buffer, Buffer.View_Size.Row - 1);
            -- make sure screen row is used
            VirtRow := Min (VirtRow, UsedRows - 1);
            -- calculate minimum scroll required to put screen row on view
            if VirtRow < FirstRow then
               Scroll := Integer (VirtRow - FirstRow);
            elsif VirtRow > LastRow then
               Scroll := Integer (VirtRow - LastRow);
            end if;
            -- make sure resulting view is valid
            LastRow  := Virt_Row (Integer (LastRow) + Scroll);
            if LastRow > UsedRows - 1 then
               -- scroll minimum number of rows required to make view valid
               Scroll := Scroll - Integer( Min (LastRow - VirtRow,
                                                LastRow - (UsedRows - 1)));
            end if;
         else
            Scroll := Integer (UsedRows - FirstRow - Virt_Row (Buffer.View_Size.Row));
         end if;
      else
         -- put view at top of virtual buffer
         Scroll := -Integer (FirstRow);
      end if;
      return Scroll;
   end CalculateViewScroll;


   -- RowsBelowScrn : Calculate number of Virtual rows beneath
   --                 bottom of screen (e.g. if we want to scroll
   --                 screen down).
   function RowsBelowScreen (
         Buffer : in Real_Buffer)
      return Natural
   is
      LastScrnRow : Virt_Row := Virt (Buffer, Buffer.Scrn_Size.Row - 1);
   begin
      if Natural (Buffer.Real_Used.Row) > Natural (LastScrnRow + 1) then
         return Natural (Buffer.Real_Used.Row) - Natural (LastScrnRow + 1);
      else
         return 0;
      end if;
   end RowsBelowScreen;

   -- RowsBelowView : Calculate number of Screen rows beneath
   --                 bottom of view (e.g. if we want to scroll
   --                 view down).
   function RowsBelowView (
         Buffer : in Real_Buffer)
      return Natural
   is
      LastScrnRow : Virt_Row := Virt (Buffer, Buffer.Scrn_Size.Row - 1);
      LastViewRow : Virt_Row := Virt (Buffer, Buffer.View_Size.Row - 1);
   begin
      -- note the use of Buffer.Virt_Used.Row instead of Buffer.Real_Used.Row,
      -- and the fact that we allow the view to extend down as far
      -- as the bottom of the current screen, even if these rows
      -- are not yet used
      if Buffer.Virt_Used.Row > LastViewRow + 1 then
         if LastScrnRow > LastViewRow then
            return Natural'Max (
               Natural (Buffer.Virt_Used.Row - (LastViewRow + 1)),
               Natural (LastScrnRow - LastViewRow));
         else
            return Natural (Buffer.Virt_Used.Row - (LastViewRow + 1));
         end if;
      else
         if LastScrnRow > LastViewRow then
            return Natural (LastScrnRow - LastViewRow);
         else
            return 0;
         end if;
      end if;
   end RowsBelowView;

   -- ColsRightOfView : Calculate number of Screen rows to the
   --                   right of view (e.g. if we want to scroll
   --                   view right).
   function ColsRightOfView (
         Buffer : in Real_Buffer)
      return Natural
   is
   begin
      -- note the use of Buffer.Virt_Used.Row instead of Buffer.Real_Used.Row
      if Natural (Buffer.Scrn_Size.Col)
      > Natural (Buffer.View_Base.Col) + Natural ( Buffer.View_Size.Col) then
         return Natural (Buffer.Scrn_Size.Col)
              - (Natural (Buffer.View_Base.Col) + Natural (Buffer.View_Size.Col));
      else
         return 0;
      end if;
   end ColsRightOfView;

   --
   -- UpdateUsedRows : Set the row in the Virtual buffer as used, if
   --                  larger than the virtual row currently used.
   --                  Return true if this sets a new value in the
   --                  number of virtual rows used.
   procedure UpdateUsedRows (
         Buffer  : in out Real_Buffer;
         Row     : in     Virt_Row;
         Updated :    out Boolean)
   is
   begin
      if Buffer.Virt_Used.Row >= Virt_Row (Buffer.Real_Used.Row) then
         -- virtual buffer already fully used
         Updated := False;
      elsif Row + 1 > Buffer.Virt_Used.Row then
         -- more of virtual buffer is being used
         if Natural (Row) + 1 > Natural (Buffer.Real_Used.Row) then
            Buffer.Virt_Used.Row := Virt_Row (Buffer.Real_Used.Row);
         else
            Buffer.Virt_Used.Row := Row + 1;
         end if;
         Updated := True;
      else
         -- no more of virtual buffer is being used
         Updated := False;
      end if;
   end UpdateUsedRows;


   -- UpdateUsedRows : Set the number of rows in the Virtual buffer
   --                  actually used to indicate that the specified
   --                  screen row is now in use. Return true if this
   --                  sets a new value in the number of virtual rows
   --                  used.
   procedure UpdateUsedRows (
         Buffer  : in out Real_Buffer;
         Row     : in     Scrn_Row;
         Updated :    out Boolean)
   is
   begin
      if Buffer.Virt_Used.Row >= Virt_Row (Buffer.Real_Used.Row) then
         -- virtual buffer already fully used
         Updated := False;
      elsif (Natural (Buffer.Scrn_Base.Row) + Natural (Row) + 1)
      > Natural (Buffer.Virt_Used.Row) then
         -- more of virtual buffer is being used
         if Natural (Buffer.Scrn_Base.Row) + Natural (Row) + 1
         > Natural (Buffer.Real_Used.Row) then
            Buffer.Virt_Used.Row := Virt_Row (Buffer.Real_Used.Row);
         else
            Buffer.Virt_Used.Row := Virt_Row (Natural (Buffer.Scrn_Base.Row)
               + Natural (Row) + 1);
         end if;
         Updated := True;
      else
         -- no more of virtual buffer is being used
         Updated := False;
      end if;
   end UpdateUsedRows;



   -- Less_Than : Compare two positions within virtual buffer.
   function Less_Than (
         Buffer : in Real_Buffer;
         Left   : Real_Pos;
         Right  : Real_Pos)
     return Boolean is
   begin
      return (Natural (Virt (Buffer, Left.Row)) * Natural (Buffer.Real_Used.Col)
           + Natural (Virt (Buffer, Left.Col))
         <   Natural (Virt (Buffer, Right.Row)) * Natural (Buffer.Real_Used.Col)
           + Natural (Virt (Buffer, Right.Col)));

   end Less_Than;


   --
   -- Add, Sub : Add or Subtract Real buffer references, ensuring the
   --            result is within the bounds of the real buffer.
   function Add (
         Buffer : in Real_Buffer;
         Left   : in Real_Row;
         Right  : in Integer)
     return Real_Row is
   begin
      return Real_Row ((Integer (Left) + Right)
         mod Integer (Buffer.Real_Used.Row));
   end Add;

   function Add (
         Buffer : in Real_Buffer;
         Left   : in Real_Col;
         Right  : in Integer)
     return Real_Col is
   begin
      return Real_Col ((Integer (Left) + Right)
         mod Integer (Buffer.Real_Used.Col));
   end Add;

   function Sub (
         Buffer : in Real_Buffer;
         Left   : in Real_Row;
         Right  : in Integer)
     return Real_Row is
   begin
      return Real_Row ((Integer (Left) - Right)
         mod Integer (Buffer.Real_Used.Row));
   end Sub;

   function Sub (
         Buffer : in Real_Buffer;
         Left   : in Real_Col;
         Right  : in Integer)
     return Real_Col is
   begin
      return Real_Col ((Integer (Left) - Right)
         mod Integer (Buffer.Real_Used.Col));
   end Sub;

   function Sub (
         Buffer : in Real_Buffer;
         Left   : in Real_Row;
         Right  : in Real_Row)
     return Natural is
   begin
      return Natural ((Integer (Left) - Integer (Right))
         mod Integer (Buffer.Real_Used.Row));
   end Sub;

   function Sub (
         Buffer : in Real_Buffer;
         Left   : in Real_Col;
         Right  : in Real_Col)
     return Natural is
   begin
      return Natural ((Integer (Left) - Integer (Right))
         mod Integer (Buffer.Real_Used.Col));
   end Sub;


   procedure Resize (
         Buffer   : in out Real_Buffer;
         VirtCols : in     Virt_Col;
         VirtRows : in     Virt_Row;
         ScrnCols : in     Scrn_Col;
         ScrnRows : in     Scrn_Row;
         ViewCols : in     View_Col;
         ViewRows : in     View_Row;
         Default  : in     Real_Cell)
   is
      procedure Free
      is new Ada.Unchecked_Deallocation (Buffer_Types.Real_Buffer, Real_Buffer_Access);

      RealCols   : Real_Col;
      RealRows   : Real_Row;
      NewBuff    : Real_Buffer_Access;
      CopyCols   : Virt_Col;
      CopyRows   : Virt_Row;
      FirstRow   : Virt_Row;
      ScrnSize   : Scrn_Pos;
      ViewSize   : View_Pos;
      Adjustment : Integer;
      VirtPos    : Virt_Pos;
      Size       : Row_Size;
   begin
      if VirtCols > 0 and VirtRows > 0 then
         -- view and screen cannot be bigger than virtual buffer size
         ScrnSize.Col := Min (ScrnCols, Scrn_Col (VirtCols));
         ScrnSize.Row := Min (ScrnRows, Scrn_Row (VirtRows));
         ViewSize.Col := Min (ViewCols, View_Col (VirtCols));
         ViewSize.Row := Min (ViewRows, View_Row (VirtRows));
         -- if the current real buffer size is big enough, use it
         RealCols  := Max (Real_Col (VirtCols), Buffer.Real_Size.Col);
         RealRows  := Max (Real_Row (VirtRows), Buffer.Real_Size.Row);
         if RealRows /= Buffer.Real_Size.Row or RealCols /= Buffer.Real_Size.Col
         or Buffer.Virt_Base.Row /= 0 or Buffer.Virt_Base.Col /= 0
         or VirtRows < Buffer.Virt_Used.Row then
            -- existing buffer not large enough, or the virtual buffer
            -- needs to be reset to resize it, so allocate new buffer
            NewBuff := new Buffer_Types.Real_Buffer (0 .. RealCols - 1, 0 .. RealRows - 1);
            -- initialize the new buffer
            for Row in 0 .. RealRows - 1 loop
               for Col in 0 .. RealCols - 1 loop
                  NewBuff (Col, Row) := Default;
               end loop;
            end loop;
            -- copy over whatever we can from old buffer (if one exists).
            -- Note the implicit reset of virtual base, which we need to
            -- do to extend the buffer. Note also we fix any references
            -- on the cursor stacks. Note finally that we copy the bottom
            -- part of the buffer (as presumably being the latest part) in
            -- case the buffer is getting smaller.
            if Buffer.Real_Buffer /= null then
               if Buffer.Virt_Used.Col > 0 and Buffer.Virt_Used.Row > 0 then
                  CopyCols  := Min (Buffer.Virt_Used.Col, VirtCols);
                  CopyRows  := Min (Buffer.Virt_Used.Row, VirtRows);
                  FirstRow  := Buffer.Virt_Used.Row - CopyRows;
                  for Row in 0 .. CopyRows - 1 loop
                     for Col in 0 .. CopyCols - 1 loop
                        NewBuff (Real_Col (Col), Real_Row (Row)) :=
                           Buffer.Real_Buffer (Real (Buffer, Col), Real (Buffer, FirstRow + Row));
                     end loop;
                  end loop;
                  -- adjust saved cursors for implicit reset of virtual base,
                  -- if the position still exists. If not, set to nearest
                  -- position (don't change the wrap flag).
                  if Buffer.Input_Stack.Top > 0 then
                     for I in 0 .. Buffer.Input_Stack.Top - 1 loop
                        VirtPos := (Virt (Buffer, Buffer.Input_Stack.Item (I).Real.Col),
                                    Virt (Buffer, Buffer.Input_Stack.Item (I).Real.Row));
                        if VirtPos.Row >= FirstRow then
                           Buffer.Input_Stack.Item (I).Real
                              := (Real_Col (VirtPos.Col), Real_Row (VirtPos.Row - FirstRow));
                        else
                           Buffer.Input_Stack.Item (I).Real
                              := (Real_Col (VirtPos.Col), Real_Row (0));
                        end if;
                     end loop;
                  end if;
                  if Buffer.Output_Stack.Top > 0 then
                     for I in 0 .. Buffer.Output_Stack.Top - 1 loop
                        VirtPos := (Virt (Buffer, Buffer.Output_Stack.Item (I).Real.Col),
                                    Virt (Buffer, Buffer.Output_Stack.Item (I).Real.Row));
                        if VirtPos.Row >= FirstRow then
                           Buffer.Output_Stack.Item (I).Real
                              := (Real_Col (VirtPos.Col), Real_Row (VirtPos.Row - FirstRow));
                        else
                           Buffer.Output_Stack.Item (I).Real
                              := (Real_Col (VirtPos.Col), Real_Row (0));
                        end if;
                     end loop;
                  end if;
                  -- fix screen base
                  Buffer.Scrn_Base.Row := Buffer.Scrn_Base.Row - FirstRow;
                  -- adjust screen and view base for implicit reset of virtual base
                  Buffer.Virt_Base  := (0, 0);
               end if;
               Free (Buffer.Real_Buffer);
            end if;
            Buffer.Real_Size  := (RealCols, RealRows);
            Buffer.Real_Buffer := NewBuff;
         else
            -- initialize new cells now being used, being careful
            -- to preserve the cell size of any existing rows if
            -- the buffer is being made wider. We use the cell size
            -- of the first cell in the row, assuming all cells in
            -- the row are the same size.
            for Row in 0 .. Real_Row (VirtRows - 1) loop
               Size := Buffer.Real_Buffer (0, Row).Size;
               for Col in Buffer.Real_Used.Col .. Real_Col (VirtCols - 1) loop
                  Buffer.Real_Buffer (Col, Row) := Default;
                  Buffer.Real_Buffer (Col, Row).Size := Size;
               end loop;
            end loop;
            for Row in Buffer.Real_Used.Row .. Real_Row (VirtRows - 1) loop
               for Col in 0 .. Real_Col (VirtCols - 1) loop
                  Buffer.Real_Buffer (Col, Row) := Default;
               end loop;
            end loop;
         end if;
         -- update size of screen and view
         Buffer.Scrn_Size := ScrnSize;
         Buffer.View_Size := ViewSize;
         -- update size of real buffer used by virtual buffer
         Buffer.Real_Used := (Real_Col (VirtCols), Real_Row (VirtRows));
         -- columns used of virtual buffer is always same as screen
         Buffer.Virt_Used.Col  := Virt_Col (Buffer.Scrn_Size.Col);
         -- Rows used of virtual buffer is at most all rows of real buffer
         Buffer.Virt_Used.Row  := Min (
            Buffer.Virt_Used.Row,
            Virt_Row (Buffer.Real_Used.Row));
         -- fix up view references that may now be too large for the new buffer
         Buffer.View_Base.Col  := Min (
            Buffer.View_Base.Col,
            Virt_Col (Buffer.Real_Used.Col) - Virt_Col (Buffer.View_Size.Col));
         Buffer.View_Base.Row  := Min (
            Buffer.View_Base.Row,
            Virt_Row (Buffer.Real_Used.Row) - Virt_Row (Buffer.View_Size.Row));
         -- fix up region references that may be too large for the new buffer
         Buffer.Regn_Base.Col := Min (
            Buffer.Regn_Base.Col,
            Buffer.Scrn_Size.Col - 1);
         Buffer.Regn_Base.Row := Min (
            Buffer.Regn_Base.Row,
            Buffer.Scrn_Size.Row - 1);
         if Buffer.Regn_Size.Col < 1 or Buffer.Regn_Size.Row < 2 then
            -- region is too small to be valid, so make it the whole screen
            Buffer.Regn_Base.Col := 0;
            Buffer.Regn_Base.Row := 0;
            Buffer.Regn_Size.Col := Regn_Col (Buffer.Scrn_Size.Col);
            Buffer.Regn_Size.Row := Regn_Row (Buffer.Scrn_Size.Row);
         else
            Buffer.Regn_Size.Col := Min (
               Regn_Col (Buffer.Scrn_Size.Col) - Regn_Col (Buffer.Regn_Base.Col),
               Regn_Col (Buffer.Scrn_Size.Col));
            Buffer.Regn_Size.Row := Min (
               Regn_Row (Buffer.Scrn_Size.Row) - Regn_Row (Buffer.Regn_Base.Row),
               Regn_Row (Buffer.Scrn_Size.Row));
         end if;
         -- fix up screen references that may now be too large for the
         -- new buffer, preserving input cursor position
         if Integer (Buffer.Scrn_Base.Col) + Integer (Buffer.Scrn_Size.Col)
         > Integer (Buffer.Real_Used.Col)  then
            Adjustment := Integer (Buffer.Scrn_Base.Col)
                        + Integer (Buffer.Scrn_Size.Col)
                        - Integer (Buffer.Real_Used.Col);
            Adjustment := Integer'Min (Adjustment, Integer (Buffer.Scrn_Base.Col));
            Buffer.Scrn_Base.Col  := Buffer.Scrn_Base.Col - Virt_Col (Adjustment);
            Buffer.Input_Curs.Col := Buffer.Input_Curs.Col + Scrn_Col (Adjustment);
         end if;
         if Integer (Buffer.Scrn_Base.Row) + Integer (Buffer.Scrn_Size.Row)
         > Integer (Buffer.Real_Used.Row)  then
            Adjustment := Integer (Buffer.Scrn_Base.Row)
                        + Integer (Buffer.Scrn_Size.Row)
                        - Integer (Buffer.Real_Used.Row);
            Adjustment  := Integer'Min (Adjustment, Integer (Buffer.Scrn_Base.Row));
            Buffer.Scrn_Base.Row  := Buffer.Scrn_Base.Row - Virt_Row (Adjustment);
            Buffer.Input_Curs.Row := Buffer.Input_Curs.Row + Scrn_Row (Adjustment);
         end if;
         -- fix up input cursor references that may now be off the screen,
         -- preserving input cursor position if possible
         if Integer (Buffer.Input_Curs.Col) > Integer (Buffer.Scrn_Size.Col - 1) then
            Adjustment := Integer'Min (
               Integer (Buffer.Input_Curs.Col) - Integer (Buffer.Scrn_Size.Col - 1),
               Integer (Buffer.Real_Used.Col) - Integer (Buffer.Scrn_Base.Col) - Integer (Buffer.Scrn_Size.Col));
            Buffer.Scrn_Base.Col  := Buffer.Scrn_Base.Col + Virt_Col (Adjustment);
            Buffer.Input_Curs.Col := Buffer.Input_Curs.Col - Scrn_Col (Adjustment);
         end if;
         if Integer (Buffer.Input_Curs.Row) > Integer (Buffer.Scrn_Size.Row - 1) then
            Adjustment := Integer'Min (
               Integer (Buffer.Input_Curs.Row) - Integer (Buffer.Scrn_Size.Row - 1),
               Integer (Buffer.Real_Used.Row) - Integer (Buffer.Scrn_Base.Row) - Integer (Buffer.Scrn_Size.Row));
            Buffer.Scrn_Base.Row  := Buffer.Scrn_Base.Row + Virt_Row (Adjustment);
            Buffer.Input_Curs.Row := Buffer.Input_Curs.Row - Scrn_Row (Adjustment);
         end if;
         -- make sure all input cursor references are in screen range, in case
         -- we have not been able to adjust screen base sufficiently to
         -- accomodate the old input cursor position.
         Buffer.Input_Curs.Col := Min (Buffer.Input_Curs.Col, Buffer.Scrn_Size.Col - 1);
         Buffer.Input_Curs.Row := Min (Buffer.Input_Curs.Row, Buffer.Scrn_Size.Row - 1);
         -- make sure all output cursor references are in screen range,
         -- but do not adjust screen, which might make the input cursor
         -- invalid again
         Buffer.Output_Curs.Col := Min (Buffer.Output_Curs.Col, Buffer.Scrn_Size.Col - 1);
         Buffer.Output_Curs.Row := Min (Buffer.Output_Curs.Row, Buffer.Scrn_Size.Row - 1);
      end if;
   end Resize;


   procedure Initialize (
         Buffer  : in out Real_Buffer;
         Default : in     Real_Cell)
   is
   begin
      if Buffer.Real_Buffer /= null then
         for Row in 0 .. Buffer.Real_Used.Row - 1 loop
            for Col in 0 .. Buffer.Real_Used.Col - 1 loop
               Buffer.Real_Buffer (Col, Row) := Default;
            end loop;
         end loop;
      end if;
      Buffer.Sel_Valid := False;
   end Initialize;


   procedure ResetOffsets (
         Buffer : in out Real_Buffer)
   is
   begin
      Buffer.Input_Curs  := (0, 0);
      Buffer.Output_Curs := (0, 0);
      Buffer.Scrn_Base   := (0, 0);
      Buffer.View_Base   := (0, 0);
      Buffer.Virt_Base   := (0, 0);
      Buffer.Virt_Used.Row  := 0;
   end ResetOffsets;


   procedure Free (
         Buffer : in out Real_Buffer)
   is
      procedure Free
      is new Ada.Unchecked_Deallocation (Buffer_Types.Real_Buffer, Real_Buffer_Access);
   begin
      if Buffer.Real_Buffer /= null then
         Free (Buffer.Real_Buffer);
         Buffer.Real_Buffer := null;
         Buffer.Real_Size := (0, 0);
      end if;
   end Free;


end Real_Buffer;
