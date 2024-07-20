-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 0.1                                   --
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

package body Gnat_Io is

   package Integer_Io is new Term_Io.Integer_Io (Integer);

   ---------
   -- Get --
   ---------

   procedure Get (
         X :    out Integer ) is
   begin
      Integer_Io.Get (X, 0);
   end Get;

   ---------
   -- Get --
   ---------

   procedure Get (
         C :    out Character ) is
   begin
      Term_Io.Get (C);
   end Get;

   --------------
   -- Get_Line --
   --------------

   procedure Get_Line (
         Item : in out String;
         Last :    out Natural ) is
   begin
      Term_Io.Get_Line (Item, Last);
   end Get_Line;

   --------------
   -- New_Line --
   --------------

   procedure New_Line (
         File    : File_Type;
         Spacing : Positive  := 1 ) is
   begin
      Term_Io.New_Line (File, Term_Io.Positive_Count (Spacing));
   end New_Line;

   --------------
   -- New_Line --
   --------------

   procedure New_Line (
         Spacing : Positive := 1 ) is
   begin
      Term_Io.New_Line (Term_Io.Positive_Count (Spacing));
   end New_Line;

   ---------
   -- Put --
   ---------

   procedure Put (
         File : File_Type;
         X    : Integer    ) is
   begin
      Integer_Io.Put (File, X);
   end Put;

   ---------
   -- Put --
   ---------

   procedure Put (
         X : Integer ) is
   begin
      Integer_Io.Put (X);
   end Put;

   ---------
   -- Put --
   ---------

   procedure Put (
         File : File_Type;
         C    : Character  ) is
   begin
      Term_Io.Put (File, C);
   end Put;

   ---------
   -- Put --
   ---------

   procedure Put (
         C : Character ) is
   begin
      Term_Io.Put (C);
   end Put;

   ---------
   -- Put --
   ---------

   procedure Put (
         File : File_Type;
         S    : String     ) is
   begin
      Term_Io.Put (File, S);
   end Put;

   ---------
   -- Put --
   ---------

   procedure Put (
         S : String ) is
   begin
      Term_Io.Put (S);
   end Put;

   --------------
   -- Put_Line --
   --------------

   procedure Put_Line (
         File : File_Type;
         S    : String     ) is
   begin
      Term_Io.Put_Line (File, S);
   end Put_Line;

   --------------
   -- Put_Line --
   --------------

   procedure Put_Line (
         S : String ) is
   begin
      Term_Io.Put_Line (S);
   end Put_Line;

   ----------------
   -- Set_Output --
   ----------------

   procedure Set_Output (
         File : File_Type ) is
   begin
      Term_Io.Set_Output (File);
   end Set_Output;

   --------------------
   -- Standard_Error --
   --------------------

   function Standard_Error return File_Type is
   begin
      return Term_Io.Standard_Error;
   end Standard_Error;

   ---------------------
   -- Standard_Output --
   ---------------------

   function Standard_Output return File_Type is
   begin
      return Term_Io.Standard_Output;
   end Standard_Output;

end Gnat_Io;

