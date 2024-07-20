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

with Terminal_Emulator;

package Terminal_Emulator.Option_Parser is

   MAX_OPTION_STRING : constant           := 1024;
   MAX_OPTION_LENGTH : constant           := 32;
   MAX_ADDED_OPTIONS : constant           := 20;
   DEFAULT_LEAD_CHAR : constant Character := ASCII.NUL;

   type Option_Type is
         (True_Option,  -- i.e. "/Option". If present, binary result is set to true
          False_Option, -- i.e. "/Option". If present, binary result is set to false
          Bool_Option,  -- i.e. "/Option" and "/NoOption". If either present, binary result set.
          Num_Option,   -- i.e. "/Option=int". If present, natural result set.
          Dbl_Option,   -- i.e. "/Option=int,int". If present, two natural results set.
          Col_Option,   -- i.e. "/Option=color". If present, color result set.
          Str_Option);  -- i.e. "/Option="string". If present, string result set (null terminated).

   subtype Option_String is String (1 .. MAX_OPTION_LENGTH);

   subtype String_Result is String (1 .. MAX_OPTION_STRING);

   type Access_Bool is access all Boolean;
   type Access_Nat  is access all Natural;
   type Access_Col  is access all Color_Type;
   type Access_Str  is access all String_Result;

   Dummy_Bool : aliased Boolean;
   Dummy_Num1 : aliased Natural;
   Dummy_Num2 : aliased Natural;
   Dummy_Col  : aliased Color_Type;
   Dummy_Str  : aliased String_Result;

   type Parser_Type is limited private;

   procedure CreateParser (
         Parser       : in out Parser_Type;
         Term         : in out Terminal;
         ExtraOptions : in     Natural     := 0;
         LeadChar     : in     Character   := DEFAULT_LEAD_CHAR);

   procedure DeleteParser (
         Parser : in out Parser_Type);

   procedure AddOption (
         Parser : in out Parser_Type;
         Oname  : in     String;
         Omin   : in     Natural;
         Otype  : in     Option_Type;
         Added  :    out Boolean;
         Bool   : in     Access_Bool := Dummy_Bool'Access;
         Num1   : in     Access_Nat  := Dummy_Num1'Access;
         Num2   : in     Access_Nat  := Dummy_Num2'Access;
         Col    : in     Access_Col  := Dummy_Col'Access;
         Str    : in     Access_Str  := Dummy_Str'Access);

   procedure Parse (
         Parser  : in out Parser_Type;
         Options : in     String;
         First   : in     Natural;
         Last    :    out Natural;
         Ok      :    out Boolean);

private

   type Added_Option is
      record
         Otype : Option_Type   := True_Option;
         Oname : Option_String;
         Olen  : Natural       := 0;
         Omin  : Natural       := 0;
         Bool  : Access_Bool   := Dummy_Bool'Access;
         Num1  : Access_Nat    := Dummy_Num1'Access;
         Num2  : Access_Nat    := Dummy_Num2'Access;
         Col   : Access_Col    := Dummy_Col'Access;
         Str   : Access_Str    := Dummy_Str'Access;
      end record;


   type Added_Option_Array is array (Natural range <>) of Added_Option;

   type Parser_Record
         (Extra : Natural) is
      record
         Term         : Terminal;
         LeadChar     : Character                       := DEFAULT_LEAD_CHAR;
         ExtraOptions : Natural                         := 0;
         Addedcount   : Natural                         := 0;
         Addedoption  : Added_Option_Array (1 .. Extra);
      end record;

   type Parser_Type is access Parser_Record;

end Terminal_Emulator.Option_Parser;
