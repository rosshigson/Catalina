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

package body Buffer_Types is

   -- utility functions
   function Max (
         Left,
         Right : Real_Row)
     return Real_Row is
      pragma Inline (Max);
   begin
      return Real_Row'Max (Left, Right);
   end Max;

   function Min (
         Left,
         Right : Real_Row)
     return Real_Row is
      pragma Inline (Min);
   begin
      return Real_Row'Min (Left, Right);
   end Min;

   function Max (
         Left,
         Right : Real_Col)
     return Real_Col is
      pragma Inline (Max);
   begin
      return Real_Col'Max (Left, Right);
   end Max;

   function Min (
         Left,
         Right : Real_Col)
     return Real_Col is
      pragma Inline (Min);
   begin
      return Real_Col'Min (Left, Right);
   end Min;

   function Max (
         Left,
         Right : Virt_Row)
     return Virt_Row is
      pragma Inline (Max);
   begin
      return Virt_Row'Max (Left, Right);
   end Max;

   function Min (
         Left,
         Right : Virt_Row)
     return Virt_Row is
      pragma Inline (Min);
   begin
      return Virt_Row'Min (Left, Right);
   end Min;

   function Max (
         Left,
         Right : Virt_Col)
     return Virt_Col is
      pragma Inline (Max);
   begin
      return Virt_Col'Max (Left, Right);
   end Max;

   function Min (
         Left,
         Right : Virt_Col)
     return Virt_Col is
      pragma Inline (Min);
   begin
      return Virt_Col'Min (Left, Right);
   end Min;

   function Max (
         Left,
         Right : Scrn_Row)
     return Scrn_Row is
      pragma Inline (Max);
   begin
      return Scrn_Row'Max (Left, Right);
   end Max;

   function Min (
         Left,
         Right : Scrn_Row)
     return Scrn_Row is
      pragma Inline (Min);
   begin
      return Scrn_Row'Min (Left, Right);
   end Min;

   function Max (
         Left,
         Right : Scrn_Col)
     return Scrn_Col is
      pragma Inline (Max);
   begin
      return Scrn_Col'Max (Left, Right);
   end Max;

   function Min (
         Left,
         Right : Scrn_Col)
     return Scrn_Col is
      pragma Inline (Min);
   begin
      return Scrn_Col'Min (Left, Right);
   end Min;

   function Max (
         Left,
         Right : View_Row)
     return View_Row is
      pragma Inline (Max);
   begin
      return View_Row'Max (Left, Right);
   end Max;

   function Min (
         Left,
         Right : View_Row)
     return View_Row is
      pragma Inline (Min);
   begin
      return View_Row'Min (Left, Right);
   end Min;

   function Max (
         Left,
         Right : View_Col)
     return View_Col is
      pragma Inline (Max);
   begin
      return View_Col'Max (Left, Right);
   end Max;

   function Min (
         Left,
         Right : View_Col)
     return View_Col is
      pragma Inline (Min);
   begin
      return View_Col'Min (Left, Right);
   end Min;

   function Max (
         Left,
         Right : Regn_Row)
     return Regn_Row is
      pragma Inline (Max);
   begin
      return Regn_Row'Max (Left, Right);
   end Max;

   function Min (
         Left,
         Right : Regn_Row)
     return Regn_Row is
      pragma Inline (Min);
   begin
      return Regn_Row'Min (Left, Right);
   end Min;

   function Max (
         Left,
         Right : Regn_Col)
     return Regn_Col is
      pragma Inline (Max);
   begin
      return Regn_Col'Max (Left, Right);
   end Max;

   function Min (
         Left,
         Right : Regn_Col)
     return Regn_Col is
      pragma Inline (Min);
   begin
      return Regn_Col'Min (Left, Right);
   end Min;

end Buffer_Types;
