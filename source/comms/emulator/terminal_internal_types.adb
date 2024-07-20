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

with GWindows.GStrings.Unbounded;
with Ada.Unchecked_Conversion;

package body Terminal_Internal_Types is
   

   type Mod32 is mod 2**32;

   function To_Mod32 is new Ada.Unchecked_Conversion (Color_Type, Mod32);

   function To_Color is new Ada.Unchecked_Conversion (Mod32, Color_Type);

   -- Bright : Make the color bright (used when bold is turned on)
   procedure Bright (Color : in out Color_Type) is
   begin
      Color := To_Color (To_Mod32 (Color) or 16#404040#);
   end Bright;


   -- Dim : Make the color dim (used when bold is turned off)
   procedure Dim (Color : in out Color_Type) is
   begin
      Color := To_Color (To_Mod32 (Color) and 16#BFBFBF#);
   end Dim;

            
   -- function To_Unbounded (
   --       Str : in String)
   --    return Unbounded_String
   -- is
   --   pragma Inline (To_UnboundeD);
   -- begin
   --    return GWindows.GStrings.To_GString_Unbounded (
   --       GWindows.GStrings.To_GString_From_String (Str));
   -- end To_Unbounded;


   function To_Unbounded (
         GStr : in GWindows.GString)
      return Unbounded_String
   is
      pragma Inline (To_UnboundeD);
   begin
      return  GWindows.GStrings.To_GString_Unbounded (GStr);
   end To_Unbounded;


   function To_GString (
         UStr : Unbounded_String)
      return GWindows.GString
   is
      pragma Inline (To_GString);
   begin
      return GWindows.GStrings.To_GString_From_Unbounded (UStr);
   end To_GString;


   function To_GString (
         Str : String)
      return GWindows.GString
   is
      pragma Inline (To_GString);
   begin
      return GWindows.GStrings.To_GString_From_String (Str);
   end To_GString;

   -- To_String : convert an unbound string to a String - works
   --             in both wide and non-wide environments.
   function To_String (
         UStr : Unbounded_String)
      return String
   is
      pragma Inline (To_String);
   begin
      return GWindows.GStrings.To_String (To_GString (UStr));
   end To_String;


   -- Length : get the length of an unbounded string.
   function Length (
         UStr : Unbounded_String)
      return Natural
   is
      pragma Inline (Length);
   begin
      return GWindows.GStrings.Unbounded.Length (UStr);
   end Length;


end Terminal_Internal_Types;
