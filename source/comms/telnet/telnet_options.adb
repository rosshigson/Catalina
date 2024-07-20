-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 0.6                                   --
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
with Ada.Unchecked_Conversion;

package body Telnet_Options is

   function To_Code 
   is new Ada.Unchecked_Conversion (Option_Type, Eight_Bits);
      
   function To_Code 
   is new Ada.Unchecked_Conversion (Action_Type, Eight_Bits);
      
   function To_Type 
   is new Ada.Unchecked_Conversion (Eight_Bits, Option_Type);
      
   function To_Type 
   is new Ada.Unchecked_Conversion (Eight_Bits, Action_Type);
      

   -- option/action manipulation functions/procedures:
   

   procedure Reset (
      Options : in out Option_Tables_Type)
   is
   begin
      Options.Local_Pending     := (others => False);
      Options.Local_Count       := 0;
      Options.Local_In_Effect   := (others => False);
      Options.Remote_Pending    := (others => False);
      Options.Remote_Count      := 0;
      Options.Remote_In_Effect  := (others => False);
   end Reset;


   function Valid_Option (
         Option : in    Eight_Bits)
      return Boolean
   is 
      X : Option_Type;
   begin
      X := To_Type (Option);
      return X'Valid;
   exception
      when others =>
         return False;
   end Valid_Option;


   function Option (
         Option : in    Eight_Bits)
      return Option_Type
   is
   begin
      return To_Type (Option);
   end Option;


   function Code (
         Option : in    Option_Type)
      return Eight_Bits
   is
   begin
      return To_Code (Option);
   end Code;
         

   function Text (
         Option : in    Option_Type)
      return String
   is
   begin
      return Option_Type'Image (Option);
   end Text;
         

   function Valid_Action (
         Action : in    Eight_Bits)
      return Boolean
   is
      X : Action_Type;
   begin
      X := To_Type (Action);
      return X'Valid;
   exception
      when others =>
         return False;
   end Valid_Action;


   function Action (
         Action : in    Eight_Bits)
      return Action_Type
   is
   begin
      return To_Type (Action); 
   end Action;
   

   function Code (
         Action : in    Action_Type)
      return Eight_Bits
   is
   begin
      return To_Code (Action);
   end Code;
         

   function Text (
         Action : in    Action_Type)
      return String
   is
   begin
      return Action_Type'Image (Action);
   end Text;
         

end Telnet_Options;
