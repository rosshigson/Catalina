-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 0.9                                   --
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

--
-- Define the most basic type of buffer for the terminal screen.
-- This buffer supports a real and a virtual buffer, and independent view and 
-- screen. It also supports screen regions, input and output cursors, a current 
-- selection and separate stacks for input and output cursors.
--
-- Note that it is very inefficient to use the column mapping too much - it is
-- better to get the real buffer location of the first column, and then just
-- increment it as required for each column in the row - provided columns
-- do not wrap, this is quite safe. It is not safe to do this with rows (other
-- than real rows) since rows DO wrap.

with Buffer_Types;

package Real_Buffer is

   use Buffer_Types;


   type Real_Buffer is tagged limited record

      Real_Size    : Real_Pos := (0, 0); -- size of real buffer (max_col + 1, max_row + 1)
      Real_Used    : Real_Pos := (0, 0); -- size in use (may be smaller than real size)
   
      Virt_Base    : Real_Pos := (0, 0); -- base of virtual buffer in real buffer
      Virt_Used    : Virt_Pos := (0, 0); -- size of virtual buffer in use (rows only)
   
      Scrn_Base    : Virt_Pos := (0, 0); -- base of screen within virtual buffer
      Scrn_Size    : Scrn_Pos := (0, 0);
   
      Regn_Base    : Scrn_Pos := (0, 0); -- base of region within screen buffer
      Regn_Size    : Regn_Pos := (0, 0);
   
      View_Base    : Virt_Pos := (0, 0); -- base of view within virtual buffer
      View_Size    : View_Pos := (0, 0);
   
      Input_Curs   : Scrn_Pos := (0, 0); -- input cursor position in region
      Output_Curs  : Scrn_Pos := (0, 0); -- output cursor position in region
                   
      Sel_Type     : Selection_Type := ByRow;
      Sel_Valid    : Boolean  := False;  -- true if there is a valid selection
      Sel_Start    : Real_Pos := (0, 0); -- first selected cell in real buffer
      Sel_End      : Real_Pos := (0, 0); -- last selected cell in real buffer
   
      Input_Stack  : Cursor_Stack (MAX_CURS_STACK_SIZE); -- input cursor stack
      Output_Stack : Cursor_Stack (MAX_CURS_STACK_SIZE); -- output cursor stack

      Real_Buffer  : Real_Buffer_Access := null; -- the buffer !
      
   end record;

   -- Functions to map between Buffer, View, Screen and Real row numbers.
   -- It is the responsibility of the caller to provide a valid row number,
   -- and to check that the result is contextually sensible (e.g. when calling
   -- View, that the Real row number is actually currently on View). OTherwise
   -- the results are questionable.

   function Real (
         Buffer : in Real_Buffer;
         Row    : in Virt_Row)
     return Real_Row;

   function Real (
         Buffer : in Real_Buffer;
         Row    : in View_Row)
     return Real_Row;

   function Real (
         Buffer : in Real_Buffer;
         Row    : in Scrn_Row)
     return Real_Row;

   function Real (
         Buffer : in Real_Buffer;
         Row    : in Regn_Row)
     return Real_Row;

   function Virt (
         Buffer : in Real_Buffer;
         Row    : in Real_Row)
     return Virt_Row;

   function Virt (
         Buffer : in Real_Buffer;
         Row    : in Scrn_Row)
     return Virt_Row;

   function Virt (
         Buffer : in Real_Buffer;
         Row    : in View_Row)
     return Virt_Row;

   function Virt (
         Buffer : in Real_Buffer;
         Row    : in Regn_Row)
     return Virt_Row;

   function View (
         Buffer : in Real_Buffer;
         Row    : in Real_Row)
     return View_Row;

   function View (
         Buffer : in Real_Buffer;
         Row    : in Scrn_Row)
     return View_Row;

   function View (
         Buffer : in Real_Buffer;
         Row    : in Virt_Row)
     return View_Row;

   function View (
         Buffer : in Real_Buffer;
         Row    : in Regn_Row)
     return View_Row;

   function Scrn (
         Buffer : in Real_Buffer;
         Row    : in Real_Row)
     return Scrn_Row;

   function Scrn (
         Buffer : in Real_Buffer;
         Row    : in View_Row)
     return Scrn_Row;

   function Scrn (
         Buffer : in Real_Buffer;
         Row    : in Virt_Row)
     return Scrn_Row;

   function Scrn (
         Buffer : in Real_Buffer;
         Row    : in Regn_Row)
     return Scrn_Row;

   function Regn (
         Buffer : in Real_Buffer;
         Row    : in Real_Row)
     return Regn_Row;

   function Regn (
         Buffer : in Real_Buffer;
         Row    : in View_Row)
     return Regn_Row;

   function Regn (
         Buffer : in Real_Buffer;
         Row    : in Virt_Row)
     return Regn_Row;

   function Regn (
         Buffer : in Real_Buffer;
         Row    : in Scrn_Row)
     return Regn_Row;

   -- Functions to map between Virtual, View, Screen and Real column numbers.
   -- It is the responsibility of the caller to provide a valid column number,
   -- and to check that the result is contextually sensible (e.g. when calling
   -- View, that the Real column number is actually currently on View). OTherwise
   -- the results are questionable.

   function Real (
         Buffer : in Real_Buffer;
         Col    : in Virt_Col)
     return Real_Col;

   function Real (
         Buffer : in Real_Buffer;
         Col    : in View_Col)
     return Real_Col;

   function Real (
         Buffer : in Real_Buffer;
         Col    : in Scrn_Col)
     return Real_Col;

   function Real (
         Buffer : in Real_Buffer;
         Col    : in Regn_Col)
     return Real_Col;

   function Virt (
         Buffer : in Real_Buffer;
         Col    : in Real_Col)
     return Virt_Col;

   function Virt (
         Buffer : in Real_Buffer;
         Col    : in Scrn_Col)
     return Virt_Col;

   function Virt (
         Buffer : in Real_Buffer;
         Col    : in View_Col)
     return Virt_Col;

   function Virt (
         Buffer : in Real_Buffer;
         Col    : in Regn_Col)
     return Virt_Col;

   function View (
         Buffer : in Real_Buffer;
         Col    : in Real_Col)
     return View_Col;

   function View (
         Buffer : in Real_Buffer;
         Col    : in Scrn_Col)
     return View_Col;

   function View (
         Buffer : in Real_Buffer;
         Col    : in Virt_Col)
     return View_Col;

   function View (
         Buffer : in Real_Buffer;
         Col    : in Regn_Col)
     return View_Col;

   function Scrn (
         Buffer : in Real_Buffer;
         Col    : in Real_Col)
     return Scrn_Col;

   function Scrn (
         Buffer : in Real_Buffer;
         Col    : in View_Col)
     return Scrn_Col;

   function Scrn (
         Buffer : in Real_Buffer;
         Col    : in Virt_Col)
     return Scrn_Col;

   function Scrn (
         Buffer : in Real_Buffer;
         Col    : in Regn_Col)
     return Scrn_Col;

   function Regn (
         Buffer : in Real_Buffer;
         Col    : in Real_Col)
     return Regn_Col;

   function Regn (
         Buffer : in Real_Buffer;
         Col    : in View_Col)
     return Regn_Col;

   function Regn (
         Buffer : in Real_Buffer;
         Col    : in Virt_Col)
     return Regn_Col;

   function Regn (
         Buffer : in Real_Buffer;
         Col    : in Scrn_Col)
     return Regn_Col;


   -- OnView and OnScreen functions indicate whether the specified
   -- row, column or position is on the view or the screen.

   function OnView (
         Buffer : in Real_Buffer;
         Row    : in Real_Row)
     return Boolean;

   function OnView (
         Buffer : in Real_Buffer;
         Row    : in Scrn_Row)
     return Boolean;

   function OnView (
         Buffer : in Real_Buffer;
         Row    : in Regn_Row)
     return Boolean;

   function OnView (
         Buffer : in Real_Buffer;
         Col    : in Real_Col)
     return Boolean;

   function OnView (
         Buffer : in Real_Buffer;
         Col    : in Scrn_Col)
     return Boolean;

   function OnView (
         Buffer : in Real_Buffer;
         Col    : in Regn_Col)
     return Boolean;

   function OnScreen (
         Buffer : in Real_Buffer;
         Row    : in Real_Row)
     return Boolean;

   function OnScreen (
         Buffer : in Real_Buffer;
         Col    : in Real_Col)
     return Boolean;

   function OnView (
         Buffer : in Real_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
     return Boolean;

   function OnScreen (
         Buffer : in Real_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
     return Boolean;

   -- InRegion : Is the region valid and the specified row and
   --            column within the region ?
   function InRegion (
         Buffer : in Real_Buffer;
         Row    : in Real_Row)
     return Boolean;

   function InRegion (
         Buffer : in Real_Buffer;
         Col    : in Real_Col)
     return Boolean;

   function InRegion (
         Buffer : in Real_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
     return Boolean;

   function InRegion (
         Buffer : in Real_Buffer;
         Col    : in Scrn_Col;
         Row    : in Scrn_Row)
      return Boolean;

   -- BufferCell : Return a pointer to the specified TermBuffer cell.
   --                  Will only work after TermBuffer has been created.
   function BufferCell (
         Buffer : in Real_Buffer;
         Col    : in Real_Col;
         Row    : in Real_Row)
      return Real_Cell_Access;

   function BufferCell (
         Buffer : in Real_Buffer;
         Col    : in Virt_Col;
         Row    : in Virt_Row)
      return Real_Cell_Access;

   function BufferCell (
         Buffer : in Real_Buffer;
         Col    : in Scrn_Col;
         Row    : in Scrn_Row)
      return Real_Cell_Access;

   function BufferCell (
         Buffer : in Real_Buffer;
         Col    : in View_Col;
         Row    : in View_Row)
      return Real_Cell_Access;

   function BufferCell (
         Buffer : in Real_Buffer;
         Col    : in Regn_Col;
         Row    : in Regn_Row)
      return Real_Cell_Access;


   --
   -- CalculateScreenScroll : Calculate scroll required to get
   --                         specified virtual row on screen.
   function CalculateScreenScroll (
         Buffer : in Real_Buffer;
         Row    : in Virt_Row)
     return Integer;

   --
   -- CalculateViewScroll : Calculate scroll required to get
   --                       specified screen row on view.
   --                       Minimize unused rows on view.
   function CalculateViewScroll (
         Buffer : in Real_Buffer;
         Row    : in Virt_Row) 
      return Integer;


   -- Other useful View/Screen/Virtual Buffer calculation functions:

   --
   -- RowsBelowScreen : Calculate number of Virtual rows beneath
   --                   bottom of screen (e.g. if we want to scroll
   --                   screen down).
   function RowsBelowScreen (
         Buffer : in Real_Buffer)
      return Natural;


   --
   -- RowsBelowView : Calculate number of Screen rows beneath
   --                 bottom of view (e.g. if we want to scroll
   --                 view down).
   function RowsBelowView (
         Buffer : in Real_Buffer)
      return Natural;


   --
   -- ColsRightOfView : Calculate number of Screen rows to the
   --                   right of view (e.g. if we want to scroll
   --                   view right).
   function ColsRightOfView (
         Buffer : in Real_Buffer)
      return Natural;


   --
   -- UpdateUsedRows : Set the row in the Virtual buffer as used, if
   --                  larger than the virtual row currently used.
   --                  Return true if this sets a new value in the
   --                  number of virtual rows used.
   procedure UpdateUsedRows (
         Buffer  : in out Real_Buffer;
         Row     : in     Virt_Row;
         Updated :    out Boolean);


   --
   -- UpdateUsedRows : Set the row in the Virtual buffer corresponding
   --                  to the screen row as used, if larger than the
   --                  virtual row currently used. Return true if this
   --                  sets a new value in the number of virtual rows
   --                  used.
   procedure UpdateUsedRows (
         Buffer  : in out Real_Buffer;
         Row     : in     Scrn_Row;
         Updated :    out Boolean);


   --
   -- Less_Than : Compare two positions within real buffer.
   function Less_Than (
         Buffer : in Real_Buffer;
         Left   : in Real_Pos;
         Right  : in Real_Pos)
     return Boolean;


   --
   -- Add, Sub : Add or Subtract Real buffer references, ensuring the
   --            result is within the bounds of the real buffer.
   function Add (
         Buffer : in Real_Buffer;
         Left   : in Real_Row;
         Right  : in Integer)
     return Real_Row;

   function Add (
         Buffer : in Real_Buffer;
         Left   : in Real_Col;
         Right  : in Integer)
     return Real_Col;

   function Sub (
         Buffer : in Real_Buffer;
         Left   : in Real_Row;
         Right  : in Integer)
     return Real_Row;

   function Sub (
         Buffer : in Real_Buffer;
         Left   : in Real_Col;
         Right  : in Integer)
     return Real_Col;

   function Sub (
         Buffer : in Real_Buffer;
         Left   : in Real_Row;
         Right  : in Real_Row)
     return Natural;

   function Sub (
         Buffer : in Real_Buffer;
         Left   : in Real_Col;
         Right  : in Real_Col)
     return Natural;


   --
   -- Buffer management functions, to allocate, initialize and free buffers.
   -- Note that the ReSize must be called at least once before any other
   -- function will work as expected.
   --

   -- Resize: Resize the virtual buffer to accomodate a new size
   --         of virtual rows, as well as a new screen and view
   --         size. Adjust the size of the real buffer if required,
   --         and fix up all other buffer offsets and sizes.
   --         If an old buffer exists, retain as much as possible
   --         of the data it contains.
   procedure Resize (
         Buffer   : in out Real_Buffer;
         Virtcols : in     Virt_Col;
         Virtrows : in     Virt_Row;
         Scrncols : in     Scrn_Col;
         Scrnrows : in     Scrn_Row;
         Viewcols : in     View_Col;
         Viewrows : in     View_Row;
         Default  : in     Real_Cell);

   
   -- Initialize: Set the contents of the virtual buffer cells to the
   --             default value provided. Also invalidate any current
   --             selection.
   procedure Initialize (
         Buffer  : in out Real_Buffer;
         Default : in     Real_Cell);

   -- ResetOffsets : Reset the virtual buffer, Screen, View and Region
   --                offsets to the start of the real buffer. Also
   --                initialize the input and output cursors.
   procedure ResetOffsets (
         Buffer : in out Real_Buffer);

   -- Free : Free the buffer.
   procedure Free (
         Buffer : in out Real_Buffer);

end Real_Buffer;
