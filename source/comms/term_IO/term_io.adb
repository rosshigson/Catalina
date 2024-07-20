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

with Ada.Characters.Handling;
with Ada.Unchecked_Deallocation;

with Terminal_Types;
with Terminal_Emulator.Option_Parser;

package body Term_IO is

   use Terminal_Types;
   use Terminal_Emulator;
   use Ada.Characters.Handling;

   -- Note : For full Text_IO semantic equivalence, set the following four flags to True.

   SEPARATE_STD_IN_OUT  : constant Boolean := False;  -- True => separate StdOut window

   SEPARATE_STD_OUT_ERR : constant Boolean := False;  -- True => separate StdErr window

   NO_ANSI_ON_DEFAULTS  : constant Boolean := False;  -- True => no ANSI parsing on default files

   STRICT_LRM_DEFAULTS  : constant Boolean := False;  -- True => Strict LRM semantics on default files


   DEFAULT_FONTNAME     : constant String := "Lucida Console";

   DEFAULT_FONTSIZE     : constant := 10;

   DEFAULT_VIRTUAL_ROWS : constant := 100;

   DEFAULT_KEYBUF_SIZE  : constant := 1024;

   OPEN_CREATES_TERM    : constant Boolean := True; -- False => must use Create

   ECHO_PM              : constant Boolean := True; -- False => PM returned but no effect


   procedure Free is
   new Ada.Unchecked_Deallocation (Term_File, File_Type);

   -----------------
   -- MakeVisible --
   -----------------

   -- MakeVisible : make the terminal visible if it is not already
   procedure MakeVisible (
         File : in out File_Type) is
   begin
      if not File.Visible then
         SetWindowOptions (File.Real.Term, Visible => Yes);
         File.Visible := True;
      end if;
   end MakeVisible;

   -----------
   -- Close --
   -----------

   procedure Close (
         File : in out File_Type) is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         else
            Close (File.Real.Term);
            Free (File);
         end if;
      else
         Ada.Text_IO.Close (File.File);
      end if;
   end Close;

   ---------
   -- Col --
   ---------

   function Col (
         File : in     File_Type)
     return Positive_Count is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         end if;
         return File.Col;
      else
         return Ada.Text_IO.Col (File.File);
      end if;
   end Col;

   ---------
   -- Col --
   ---------

   function Col return Positive_Count is
   begin
      return Col (Current_Out);
   end Col;

   ------------
   -- Create --
   ------------

   procedure Create (
         File : in out File_Type;
         Mode : in     File_Mode := Out_File;
         Name : in     String    := "";
         Form : in     String    := "") is
      Parser  : Option_Parser.Parser_Type;
      Parsed  : Boolean;
      Added   : Boolean;
      Lastpos : Natural;
   begin
      if File /= null then
         raise Status_Error;
      end if;
      File := new Term_File;
      File.Mode := Mode;
      File.Self := File;
      File.Real := File;
      if Form'Length >= 7
      and then (Form (Form'First .. Form'First + 6) = "TERM_IO") then
         File.Terminal := True;
         File.Visible  := False;
         File.Formlen  := Natural'Min (Form'Length, MAX_FORM_LENGTH);
         for I in 1 .. File.Formlen loop
            File.Form (I) := Form (Form'First + I - 1);
         end loop;
         Open (
            File.Real.Term,
            Title => Name,
            Font => DEFAULT_FONTNAME,
            Size => DEFAULT_FONTSIZE,
            VirtualRows => DEFAULT_VIRTUAL_ROWS,
            MainMenu => No,
            TransferMenu => No,
            Visible => No);
         SetKeyOptions (
            File.Real.Term,
            SetSize => Yes,
            Size => DEFAULT_KEYBUF_SIZE);
         SetEditingOptions (
            File.Real.Term,
            Wrap => Yes);
         SetOtherOptions (
            File.Real.Term,
            UseLFasEOL => Yes,
            AutoCRonLF => Yes);
         SetCursorOptions (
            File.Real.Term,
            Visible => Yes,
            Flashing => Yes);
         SetCursorColor (
            File.Real.Term,
            Yellow);
         if File.Formlen > 7 then
            Option_Parser.Createparser (
               Parser,
               File.Real.Term,
               Extraoptions => 1);
            Option_Parser.Addoption (
               Parser,
               "Strict",
               3,
               Option_Parser.Bool_Option,
               Added,
               Bool => File.Strict'Unchecked_Access);
            Option_Parser.Parse (
               Parser,
               File.Form (1 .. File.Formlen),
               8,
               Lastpos,
               Parsed);
            Option_Parser.Deleteparser (Parser);
            if File.Strict and File.Mode /= In_File then
               -- if using strict LRM semantics, lock keyboard
               -- and disable key buffer for non-input terminals
               SetKeyOptions (
                  File.Real.Term,
                  Locked => Yes,
                  SetSize => Yes,
                  Size => 0);
               -- also make the input cursor invisible (since
               -- it is no use)
               SetCursorOptions (
                  File.Real.Term,
                  Visible => No,
                  Flashing => No);
            end if;
         end if;
         MakeVisible (File);
      else
         File.Terminal := False;
         Ada.Text_IO.Create (File.File, Mode, Name, Form);
      end if;
   end Create;

   -------------------
   -- Current_Error --
   -------------------

   function Current_Error return File_Type is
   begin
      return Current_Err;
   end Current_Error;

   -------------------
   -- Current_Error --
   -------------------

   function Current_Error return File_Access is
   begin
      return Current_Err.Self'Access;
   end Current_Error;

   -------------------
   -- Current_Input --
   -------------------

   function Current_Input return File_Type is
   begin
      return Current_In;
   end Current_Input;

   -------------------
   -- Current_Input --
   -------------------

   function Current_Input return File_Access is
   begin
      return Current_In.Self'Access;
   end Current_Input;

   --------------------
   -- Current_Output --
   --------------------

   function Current_Output return File_Type is
   begin
      return Current_Out;
   end Current_Output;

   --------------------
   -- Current_Output --
   --------------------

   function Current_Output return File_Access is
   begin
      return Current_Out.Self'Access;
   end Current_Output;

   ------------
   -- Delete --
   ------------

   procedure Delete (
         File : in out File_Type) is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         else
            raise Use_Error;
         end if;
      else
         Ada.Text_IO.Delete (File.File);
      end if;
   end Delete;

   -----------------
   -- End_Of_File --
   -----------------

   function End_Of_File (
         File : in     File_Type)
     return Boolean is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            if File.Strict then
               raise Status_Error;
            else
               -- If we are not using strict LRM semantics, we
               -- return EOF if the terminal has been closed.
               return True;
            end if;
         elsif File.Strict and then File.Mode /= In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an ouptut (or append) terminal
            raise Mode_Error;
         end if;
         -- If we are using strict LRM semantics, then for terminals
         -- the "end of file" condition never occurs. This is
         -- because if the terminal is closed (which is the only
         -- possible reason for an EOF condition), then the LRM says
         -- that a status error must result, and so we never
         -- get the chance to return a "true" value here.
         return False;
      else
         return Ada.Text_IO.End_Of_File (File.File);
      end if;
   end End_Of_File;

   -----------------
   -- End_Of_File --
   -----------------

   function End_Of_File return Boolean is
   begin
      return End_Of_File (Current_Out);
   end End_Of_File;

   -----------------
   -- End_Of_Line --
   -----------------

   function End_Of_Line (
         File : in     File_Type)
     return Boolean is
      Char : Character;
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode /= In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an ouptut (or append) terminal
            raise Mode_Error;
         end if;
         if File.Mode = In_File then
            Get (File.Real.Term, Char);
            UnGet (File.Real.Term, Char);
            return (Char = LM);
         else
            -- for output files (using non-strict LRM semantics),
            -- return True if at the last column on the line.
            return (File.Col = File.Line_Length);
         end if;
      else
         return Ada.Text_IO.End_Of_Line (File.File);
      end if;
   end End_Of_Line;

   -----------------
   -- End_Of_Line --
   -----------------

   function End_Of_Line return Boolean is
   begin
      return End_Of_Line (Current_In);
   end End_Of_Line;

   -----------------
   -- End_Of_Page --
   -----------------

   function End_Of_Page (
         File : in     File_Type)
     return Boolean is
      Char : Character;
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode /= In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an ouptut (or append) terminal
            raise Mode_Error;
         end if;
         if File.Strict then
            -- when using strict LRM semantics, we check if the
            -- next unread characters are LM followed by PM
            if not File.Before_LM then
               Get (File.Real.Term, Char);
               if Char /= LM then
                  UnGet (File.Real.Term, Char);
                  return False;
               else -- Char = LM
                  File.Before_LM := True;
               end if;
            end if;
            Get (File.Real.Term, Char);
            UnGet (File.Real.Term, Char);
            return Char = PM;
         elsif File.Mode = Out_File then
            -- for output files (using non-strict LRM semantics),
            -- return True if at the last column on the last
            -- line.
            return (File.Col  = File.Line_Length)
               and (File.Line = File.Page_Length);
         else
            -- for input files (using non-strict LRM semantics),
            -- then "end of page" condition never occurs
            return False;
         end if;
      else
         return Ada.Text_IO.End_Of_Page (File.File);
      end if;
   end End_Of_Page;

   -----------------
   -- End_Of_Page --
   -----------------

   function End_Of_Page return Boolean is
   begin
      return End_Of_Page (Current_In);
   end End_Of_Page;

   -----------
   -- Flush --
   -----------

   procedure Flush (
         File : in out File_Type) is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if File.Strict and then File.Mode = In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an input terminal
            raise Mode_Error;
         else
            -- make terminal visible, otherwise nothing
            MakeVisible (File.Real);
         end if;
      else
         Ada.Text_IO.Flush (File.File);
      end if;
   end Flush;

   -----------
   -- Flush --
   -----------

   procedure Flush is
   begin
      Flush (Current_Out);
   end Flush;

   ----------
   -- Form --
   ----------

   function Form (
         File : in     File_Type)
     return String is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         end if;
         if File.Formlen > 0 then
            return File.Form (1 .. File.Formlen);
         else
            return Null_Str;
         end if;
      else
         return Ada.Text_IO.Form (File.File);
      end if;
   end Form;

   ---------
   -- Get --
   ---------

   procedure Get (
         File : in     File_Type;
         Item :    out Character) is
      Char : Character;
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode /= In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an ouptut (or append) terminal
            raise Mode_Error;
         end if;
         MakeVisible (File.Real);
         if File.Before_LM then
            File.Before_LM := False;
            File.Col := 1;
            File.Line := File.Line + 1;
         end if;
         loop
            Get (File.Real.Term, Char);
            if Char = LM then
               File.Line := File.Line + 1;
               File.Col := 1;
            elsif Char = PM then
               if ECHO_PM then
                  Put (File.Real.Term, PM);
               end if;
               File.Page := File.Page + 1;
               File.Line := 1;
            else
               Item := Char;
               File.Col := File.Col + 1;
               exit;
            end if;
            if not File.Strict and then File.Mode = Out_File then
               -- if we are not using strict semantics, and
               -- this is an output file, then we return all
               -- characters, including LM and PM.
               exit;
            end if;
         end loop;
      else
         Ada.Text_IO.Get (File.File, Item);
      end if;
   end Get;

   ---------
   -- Get --
   ---------

   procedure Get (
         Item :    out Character) is
   begin
      Get (Current_In, Item);
   end Get;

   ---------
   -- Get --
   ---------

   procedure Get (
         File : in     File_Type;
         Item :    out String) is
      Char : Character;
      J    : Natural;
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode /= In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an ouptut (or append) terminal
            raise Mode_Error;
         end if;
         MakeVisible (File.Real);
         if File.Before_LM then
            File.Before_LM := False;
            File.Col := 1;
            File.Line := File.Line + 1;
         end if;
         J := Item'First;
         while J <= Item'Last loop
            Get (File.Real.Term, Char);
            if Char = LM then
               File.Line := File.Line + 1;
               File.Col := 1;
               if not File.Strict and then File.Mode = Out_File then
                  -- if we are not using strict semantics, and
                  -- this is an output file, then we return all
                  -- characters, including LM and PM.
                  Item (J) := Char;
                  J := J + 1;
               end if;
            elsif Char = PM then
               if ECHO_PM then
                  Put (File.Real.Term, PM);
               end if;
               File.Page := File.Page + 1;
               File.Line := 1;
               if not File.Strict and then File.Mode = Out_File then
                  -- if we are not using strict semantics, and
                  -- this is an output file, then we return all
                  -- characters, including LM and PM.
                  Item (J) := Char;
                  J := J + 1;
               end if;
            else
               Item (J) := Char;
               J := J + 1;
               File.Col := File.Col + 1;
            end if;
         end loop;
      else
         Ada.Text_IO.Get (File.File, Item);
      end if;
   end Get;

   ---------
   -- Get --
   ---------

   procedure Get (
         Item :    out String) is
   begin
      Get (Current_In, Item);
   end Get;

   -------------------
   -- Get_Immediate --
   -------------------

   procedure Get_Immediate (
         File : in     File_Type;
         Item :    out Character) is
      Char : Character;
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode /= In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an ouptut (or append) terminal
            raise Mode_Error;
         end if;
         MakeVisible (File.Real);
         if File.Before_LM then
            File.Before_LM := False;
            Char := LM;
         else
            Get (File.Real.Term, Char);
         end if;
         Item := Char;
      else
         Ada.Text_IO.Get_Immediate (File.File, Item);
      end if;
   end Get_Immediate;

   -------------------
   -- Get_Immediate --
   -------------------

   procedure Get_Immediate (
         Item :    out Character) is
   begin
      Get_Immediate (Current_In, Item);
   end Get_Immediate;

   -------------------
   -- Get_Immediate --
   -------------------

   procedure Get_Immediate (
         File      : in     File_Type;
         Item      :    out Character;
         Available :    out Boolean) is
      Char  : Character;
      Ready : Boolean;
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode /= In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an ouptut (or append) terminal
            raise Mode_Error;
         end if;
         MakeVisible (File.Real);
         if File.Before_LM then
            File.Before_LM := False;
            Available := True;
            Char := LM;
         else
            Peek (File.Real.Term, Char, Ready);
            if Ready then
               Available := True;
               Get (File, Item);
            else
               Item := ASCII.NUL;
               Available := False;
            end if;
         end if;
      else
         Ada.Text_IO.Get_Immediate (File.File, Item, Available);
      end if;
   end Get_Immediate;

   -------------------
   -- Get_Immediate --
   -------------------

   procedure Get_Immediate (
         Item      :    out Character;
         Available :    out Boolean) is
   begin
      Get_Immediate (Current_In, Item, Available);
   end Get_Immediate;

   --------------
   -- Get_Line --
   --------------

   procedure Get_Line (
         File : in     File_Type;
         Item :    out String;
         Last :    out Natural) is
      Char : Character;
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode /= In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an ouptut (or append) terminal
            raise Mode_Error;
         end if;
         Last := Item'First - 1;
         if Last >= Item'Last then
            return;
         end if;
         MakeVisible (File.Real);
         if File.Before_LM then
            File.Before_LM := False;
         else
            loop
               Get (File.Real.Term, Char);
               exit when Char = LM;
               Last := Last + 1;
               Item (Last) := Char;
               if Last = Item'Last then
                  File.Col := File.Col + Count (Item'Length);
                  return;
               end if;
            end loop;
         end if;
         File.Line := File.Line + 1;
         File.Col := 1;
         --
         -- NOTE: following lines removed to avoid waiting for extra character
         --
         -- Get (File.Real.Term, Char);
         -- if Char = PM then
         --    if ECHO_PM then
         --       Put (File.Real.Term, PM);
         --    end if;
         --    File.Line := 1;
         --    File.Page := File.Page + 1;
         -- else
         --    UnGet (File.Real.Term, Char);
         -- end if;
      else
         Ada.Text_IO.Get_Line (File.File, Item, Last);
      end if;
   end Get_Line;

   --------------
   -- Get_Line --
   --------------

   procedure Get_Line (
         Item :    out String;
         Last :    out Natural) is
   begin
      Get_Line (Current_In, Item, Last);
   end Get_Line;

   -------------
   -- Is_Open --
   -------------

   function Is_Open (
         File : in     File_Type)
     return Boolean is
   begin
      if File = null then
         return False;
      elsif File.Terminal then
         return not Closed (File.Real.Term);
      else
         return Ada.Text_IO.Is_Open (File.File);
      end if;
   end Is_Open;

   ----------
   -- Line --
   ----------

   function Line (
         File : in     File_Type)
     return Positive_Count is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         end if;
         return File.Line;
      else
         return Ada.Text_IO.Line (File.File);
      end if;
   end Line;

   ----------
   -- Line --
   ----------

   function Line return Positive_Count is
   begin
      return Line (Current_Out);
   end Line;

   -----------------
   -- Line_Length --
   -----------------

   function Line_Length (
         File : in     File_Type)
     return Count is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode = In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an input terminal
            raise Mode_Error;
         end if;
         return File.Line_Length;
      else
         return Ada.Text_IO.Line_Length (File.File);
      end if;
   end Line_Length;

   -----------------
   -- Line_Length --
   -----------------

   function Line_Length return Count is
   begin
      return Line_Length (Current_Out);
   end Line_Length;

   ----------------
   -- Look_Ahead --
   ----------------

   procedure Look_Ahead (
         File        : in     File_Type;
         Item        :    out Character;
         End_Of_Line :    out Boolean) is
      Char : Character;
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode /= In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an ouptut (or append) terminal
            raise Mode_Error;
         end if;
         if File.Before_LM then
            End_Of_Line := True;
            Item := ASCII.NUL;
         else
            if File.Mode = In_File then
               Get (File.Real.Term, Char);
               if (Char = LM) or else (Char = PM) then
                  End_Of_Line := True;
                  Item := ASCII.NUL;
               else
                  End_Of_Line := False;
                  Item := Char;
               end if;
            else
               if File.Col = File.Line_Length then
                  -- for output files (using non-strict LRM semantics),
                  -- End_Of_Line is true when at the last column on the line.
                  End_Of_Line := True;
                  Item := ASCII.NUL;
               else
                  -- must read a character to see if at End_Of_Line
                  Get (File.Real.Term, Char);
                  End_Of_Line := (File.Col = File.Line_Length) or (Char = LM) or (Char = PM);
                  Item := Char;
               end if;
            end if;
         end if;
      else
         Ada.Text_IO.Look_Ahead (File.File, Item, End_Of_Line);
      end if;
   end Look_Ahead;

   ----------------
   -- Look_Ahead --
   ----------------

   procedure Look_Ahead (
         Item        :    out Character;
         End_Of_Line :    out Boolean) is
   begin
      Look_Ahead (Current_In, Item, End_Of_Line);
   end Look_Ahead;

   ----------
   -- Mode --
   ----------

   function Mode (
         File : in     File_Type)
     return File_Mode is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         end if;
         return File.Mode;
      else
         return Ada.Text_IO.Mode (File.File);
      end if;
   end Mode;

   ----------
   -- Name --
   ----------

   function Name (
         File : in     File_Type)
     return String is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         else
            raise Use_Error;
         end if;
         -- return Null_Str;
      else
         return Ada.Text_IO.Name (File.File);
      end if;
   end Name;

   --------------
   -- New_Line --
   --------------

   procedure New_Line (
         File    : in     File_Type;
         Spacing : in     Positive_Count := 1) is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if not Spacing'Valid  then
         raise Constraint_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode = In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an input terminal
            raise Mode_Error;
         end if;
         MakeVisible (File.Real);
         for I in 1 .. Spacing loop
            Put (File.Real.Term, LM);
            File.Line := File.Line + 1;
            if File.Page_Length /= 0
            and then File.Line > File.Page_Length then
               if File.Strict then
                  -- if we are using strict LRM semantics,
                  -- we have to do a new page here. We don't
                  -- do this for non-strict terminals, which
                  -- scroll instead.
                  Put (File.Real.Term, PM);
               end if;
               File.Line := 1;
               File.Page := File.Page + 1;
            end if;
         end loop;
         File.Col := 1;
      else
         Ada.Text_IO.New_Line (File.File, Spacing);
      end if;
   end New_Line;

   --------------
   -- New_Line --
   --------------

   procedure New_Line (
         Spacing : in     Positive_Count := 1) is
   begin
      New_Line (Current_Out, Spacing);
   end New_Line;

   --------------
   -- New_Page --
   --------------

   procedure New_Page (
         File : in     File_Type) is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode = In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an input terminal
            raise Mode_Error;
         end if;
         MakeVisible (File.Real);
         if File.Col /= 1 or else File.Line = 1 then
            Put (File.Real.Term, LM);
         end if;
         Put (File.Real.Term, PM);
         File.Page := File.Page + 1;
         File.Line := 1;
         File.Col := 1;
      else
         Ada.Text_IO.New_Page (File.File);
      end if;
   end New_Page;

   --------------
   -- New_Page --
   --------------

   procedure New_Page is
   begin
      New_Page (Current_Out);
   end New_Page;

   ----------
   -- Open --
   ----------

   procedure Open (
         File : in out File_Type;
         Mode : in     File_Mode;
         Name : in     String;
         Form : in     String    := "") is
   begin
      if File /= null then
         raise Status_Error;
      end if;
      if (OPEN_CREATES_TERM and Form'Length >= 7)
      and then (Form (Form'First .. Form'First + 6) = "TERM_IO") then
         Create (File, Mode, Name, Form);
      else
         File.Terminal := False;
         Ada.Text_IO.Open (File.File, Mode, Name, Form);
      end if;
   end Open;

   ----------
   -- Page --
   ----------

   function Page (
         File : in     File_Type)
     return Positive_Count is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         end if;
         return File.Page;
      else
         return Ada.Text_IO.Col (File.File);
      end if;
   end Page;

   ----------
   -- Page --
   ----------

   function Page return Positive_Count is
   begin
      return Page (Current_Out);
   end Page;

   -----------------
   -- Page_Length --
   -----------------

   function Page_Length (
         File : in     File_Type)
     return Count is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode /= In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an ouptut (or append) terminal
            raise Mode_Error;
         end if;
         return File.Page_Length;
      else
         return Ada.Text_IO.Page_Length (File.File);
      end if;
   end Page_Length;

   -----------------
   -- Page_Length --
   -----------------

   function Page_Length return Count is
   begin
      return Page_Length (Current_Out);
   end Page_Length;

   ---------
   -- Put --
   ---------

   procedure Put (
         File : in     File_Type;
         Item : in     Character) is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode = In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an input terminal
            raise Mode_Error;
         end if;
         MakeVisible (File.Real);
         if File.Line_Length /= 0
         and then File.Col > File.Line_Length then
            New_Line (File);
         end if;
         Put (File.Real.Term, Item);
         File.Col := File.Col + 1;
      else
         Ada.Text_IO.Put (File.File, Item);
      end if;
   end Put;

   ---------
   -- Put --
   ---------

   procedure Put (
         Item : in     Character) is
   begin
      Put (Current_Out, Item);
   end Put;

   ---------
   -- Put --
   ---------

   procedure Put (
         File : in     File_Type;
         Item : in     String) is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode = In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an input terminal
            raise Mode_Error;
         end if;
         MakeVisible (File.Real);
         if Item'Length > 0 then
            if File.Line_Length /= 0 then
               for J in Item'Range loop
                  Put (File, Item (J));
               end loop;
            else
               Put (File.Real.Term, Item);
               File.Col := File.Col + Item'Length;
            end if;
         end if;
      else
         Ada.Text_IO.Put (File.File, Item);
      end if;
   end Put;

   ---------
   -- Put --
   ---------

   procedure Put (
         Item : in     String) is
   begin
      Put (Current_Out, Item);
   end Put;

   --------------
   -- Put_Line --
   --------------

   procedure Put_Line (
         File : in     File_Type;
         Item : in     String) is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode = In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an input terminal
            raise Mode_Error;
         end if;
         MakeVisible (File.Real);
         if File.Line_Length /= 0 then
            Put (File, Item);
            New_Line (File);
            return;
         end if;
         declare
            Ilen   : constant Natural := Item'Length;
            Buffer :          String (1 .. Ilen + 2);
            Plen   :          Natural;
         begin
            Buffer (1 .. Ilen) := Item;
            Buffer (Ilen + 1) := LM;
            if File.Page_Length /= 0
            and then File.Line > File.Page_Length then
               if File.Strict then
                  -- if we are using strict LRM semantics then we
                  -- have to add a page mark here. We don't do
                  -- this for non-strict terminals, which scroll
                  -- instead.
                  Buffer (Ilen + 2) := PM;
                  Plen := Ilen + 2;
               else
                  Plen := Ilen + 1;
               end if;
               File.Line := 1;
               File.Page := File.Page + 1;
            else
               Plen := Ilen + 1;
               File.Line := File.Line + 1;
            end if;
            Put (File.Real.Term, Buffer (1 .. Plen));
            File.Col := 1;
         end;
      else
         Ada.Text_IO.Put_Line (File.File, Item);
      end if;
   end Put_Line;

   --------------
   -- Put_Line --
   --------------

   procedure Put_Line (
         Item : in     String) is
   begin
      Put_Line (Current_Out, Item);
   end Put_Line;

   -----------
   -- Reset --
   -----------

   procedure Reset (
         File : in out File_Type;
         Mode : in     File_Mode) is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         else
            if (File = Current_In or File = Current_Out or File = Current_Err)
            and then Mode /= File.Mode then
               raise Mode_Error;
            else
               MakeVisible (File.Real);
               ClearBuffer (File.Real.Term);
               File.Mode := Mode;
               File.Col  := 1;
               File.Page := 1;
               File.Line := 1;
               File.Line_Length := 0;
               File.Page_Length := 0;
               File.Before_LM := False;
            end if;
         end if;
      else
         Ada.Text_IO.Reset (File.File, Mode);
      end if;
   end Reset;

   -----------
   -- Reset --
   -----------

   procedure Reset (
         File : in out File_Type) is
   begin
      Reset (File, File.Mode);
   end Reset;

   -------------
   -- Set_Col --
   -------------

   procedure Set_Col (
         File : in     File_Type;
         To   : in     Positive_Count) is
      Char : Character;
   begin
      if File = null then
         raise Status_Error;
      end if;
      if not To'Valid then
         raise Constraint_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         end if;
         MakeVisible (File.Real);
         if File.Strict then
            if File.Mode = In_File then
               -- when using strict LRM semantics on input terminals,
               -- read characters until the column number matches the
               -- requested column
               if File.Col /= To then
                  loop
                     Get (File.Real.Term, Char);
                     if Char = LM then
                        File.Line := File.Line + 1;
                        File.Col := 1;
                     elsif Char = PM then
                        if ECHO_PM then
                           Put (File.Real.Term, PM);
                        end if;
                        File.Page := File.Page + 1;
                        File.Line := 1;
                        File.Col := 1;
                     else
                        File.Col := File.Col + 1;
                     end if;
                     if File.Col = To then
                        exit;
                     end if;
                  end loop;
               end if;
            else
               -- when using strict LRM semantics on output terminals,
               -- do a new line if the column is less then the requested
               -- column, then print spaces until the column matches the
               -- requested column
               if File.Line_Length /= 0
               and then To > File.Line_Length then
                  raise Layout_Error;
               end if;
               if To < File.Col then
                  New_Line (File);
               end if;
               while File.Col < To loop
                  Put (File, ' ');
               end loop;
            end if;
         else
            -- when not using strict LRM semantics, go straight
            -- to the requested column and current line number
            -- on any terminal type
            SetPos (
               File.Real.Term,
               Integer (To) - 1,
               Integer (File.Line) - 1);
            File.Col := To;
         end if;
      else
         Ada.Text_IO.Set_Col (File.File, To);
      end if;
   end Set_Col;

   -------------
   -- Set_Col --
   -------------

   procedure Set_Col (
         To : in     Positive_Count) is
   begin
      Set_Col (Current_Out, To);
   end Set_Col;

   ---------------
   -- Set_Error --
   ---------------

   procedure Set_Error (
         File : in     File_Type) is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if File.Mode = In_File then
            raise Mode_Error;
         elsif Closed (File.Real.Term) then
            raise Status_Error;
         end if;
      else
         Ada.Text_IO.Set_Error (File.File);
      end if;
      Current_Err := File;
   end Set_Error;

   ---------------
   -- Set_Input --
   ---------------

   procedure Set_Input (
         File : in     File_Type) is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if File.Mode /= In_File then
            raise Mode_Error;
         elsif Closed (File.Real.Term) then
            raise Status_Error;
         end if;
      else
         Ada.Text_IO.Set_Input (File.File);
      end if;
      Current_In := File;
   end Set_Input;

   --------------
   -- Set_Line --
   --------------

   procedure Set_Line (
         File : in     File_Type;
         To   : in     Positive_Count) is
      Char : Character;
   begin
      if File = null then
         raise Status_Error;
      end if;
      if not To'Valid then
         raise Constraint_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         end if;
         MakeVisible (File.Real);
         if File.Strict then
            if File.Mode = In_File then
               -- when using strict LRM semantics on input terminals,
               -- skip lines until the current line matches the requested
               -- line
               while To /= File.Line loop
                  Skip_Line (File);
                  if To /= File.Line then
                     -- NOTE: must check explicitly for LM followed by PM,
                     -- since we have disabled this in Skip_Line to
                     -- avoid waiting for the extra character. But here
                     -- we have to do this or we will never see the PM.
                     Get (File.Real.Term, Char);
                     if Char = PM then
                        if ECHO_PM then
                           Put (File.Real.Term, PM);
                        end if;
                        File.Page := File.Page + 1;
                        File.Line := 1;
                     else
                        -- not a PM, so unget it and keep skipping
                        UnGet (File.Real.Term, Char);
                     end if;
                  end if;
               end loop;
            else
               -- when using strict LRM semantics on output terminals,
               -- we do a new_page if the line requested is less than
               -- the current line, and then new lines until the line
               -- number matches the requested line
               if File.Page_Length /= 0
               and then To > File.Page_Length then
                  raise Layout_Error;
               end if;
               if To < File.Line then
                  New_Page (File);
               end if;
               while File.Line < To loop
                  New_Line (File);
               end loop;
            end if;
         else
            -- when not using strict LRM semantics, go straight
            -- to the requested line and current column number
            -- on any terminal type
            SetPos (
               File.Real.Term,
               Integer (File.Col) - 1,
               Integer (To) - 1);
            File.Line := To;
         end if;
      else
         Ada.Text_IO.Set_Line (File.File, To);
      end if;
   end Set_Line;

   --------------
   -- Set_Line --
   --------------

   procedure Set_Line (
         To : in     Positive_Count) is
   begin
      Set_Line (Current_Out, To);
   end Set_Line;

   ---------------------
   -- Set_Line_Length --
   ---------------------

   procedure Set_Line_Length (
         File : in     File_Type;
         To   : in     Count) is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if not To'Valid then
         raise Constraint_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode = In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an input terminal
            raise Mode_Error;
         end if;
         File.Line_Length := To;
         if File.Line_Length > 0 and File.Page_Length > 0 then
            SetScreenSize (
               File.Real.Term,
               Integer (File.Line_Length),
               Integer (File.Page_Length));
         end if;
      else
         Ada.Text_IO.Set_Line_Length (File.File, To);
      end if;
   end Set_Line_Length;

   ---------------------
   -- Set_Line_Length --
   ---------------------

   procedure Set_Line_Length (
         To : in     Count) is
   begin
      Set_Line_Length (Current_Out, To);
   end Set_Line_Length;

   ----------------
   -- Set_Output --
   ----------------

   procedure Set_Output (
         File : in     File_Type) is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if File.Mode = In_File then
            raise Mode_Error;
         elsif Closed (File.Real.Term) then
            raise Status_Error;
         end if;
      else
         Ada.Text_IO.Set_Output (File.File);
      end if;
      Current_Out := File;
   end Set_Output;

   ---------------------
   -- Set_Page_Length --
   ---------------------

   procedure Set_Page_Length (
         File : in     File_Type;
         To   : in     Count) is
   begin
      if File = null then
         raise Status_Error;
      end if;
      if not To'Valid then
         raise Constraint_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode = In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an input terminal
            raise Mode_Error;
         end if;
         File.Page_Length := To;
         if File.Line_Length > 0 and File.Page_Length > 0 then
            SetScreenSize (
               File.Real.Term,
               Integer (File.Line_Length),
               Integer (File.Page_Length));
         end if;
      else
         Ada.Text_IO.Set_Page_Length (File.File, To);
      end if;
   end Set_Page_Length;

   ---------------------
   -- Set_Page_Length --
   ---------------------

   procedure Set_Page_Length (
         To : in     Count) is
   begin
      Set_Page_Length (Current_Out, To);
   end Set_Page_Length;

   ---------------
   -- Skip_Line --
   ---------------

   procedure Skip_Line (
         File    : in     File_Type;
         Spacing : in     Positive_Count := 1) is
      Char : Character;
   begin
      if File = null then
         raise Status_Error;
      end if;
      if not Spacing'Valid then
         raise Constraint_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode /= In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an ouptut (or append) terminal
            raise Mode_Error;
         end if;
         MakeVisible (File.Real);
         for L in 1 .. Spacing loop
            if File.Before_LM then
               File.Before_LM := False;
            else
               if File.Mode = In_File then
                  -- For input files, we read lines. This is true
                  -- for both strict LRM and non-strict semantics.
                  loop
                     Get (File.Real.Term, Char);
                     if File.Strict then
                        exit when Char = LM;
                     else
                        -- if we are using strict LRM semantics, we should
                        -- never see a PM except if it is preceeded by an
                        -- LM. However this may occur with terminals.
                        exit when Char = LM or else Char = PM;
                     end if;
                  end loop;
               else
                  -- For output files, we output an LM. This can only
                  -- occur when we are not using strict LRM semantics.
                  Put (File.Real.Term, LM);
               end if;
            end if;
            File.Col := 1;
            File.Line := File.Line + 1;
            if not File.Strict and Char = PM then
               if ECHO_PM then
                  Put (File.Real.Term, PM);
               end if;
               File.Page := File.Page + 1;
               File.Line := 1;
            end if;
            --
            -- NOTE: following lines removed to avoid waiting for extra char
            --
            -- Get (File.Real.Term, Char);
            -- if Char = PM then
            --    if ECHO_PM then
            --       Put (File.Real.Term, PM);
            --    end if;
            --    File.Page := File.Page + 1;
            --    File.Line := 1;
            -- else
            --    UnGet (File.Real.Term, Char);
            -- end if;
         end loop;
      else
         Ada.Text_IO.Skip_Line (File.File, Spacing);
      end if;
   end Skip_Line;

   ---------------
   -- Skip_Line --
   ---------------

   procedure Skip_Line (
         Spacing : in     Positive_Count := 1) is
   begin
      Skip_Line (Current_In, Spacing);
   end Skip_Line;

   ---------------
   -- Skip_Page --
   ---------------

   procedure Skip_Page (
         File : in     File_Type) is
      Char : Character;
   begin
      if File = null then
         raise Status_Error;
      end if;
      if File.Terminal then
         if Closed (File.Real.Term) then
            raise Status_Error;
         elsif File.Strict and then File.Mode /= In_File then
            -- if we are using strict LRM semantics, then this
            -- cannot be done to an ouptut (or append) terminal
            raise Mode_Error;
         end if;
         MakeVisible (File.Real);
         if File.Mode = In_File then
            -- For input files, we read until we see a PM.
            -- This is true for both strict LRM and non-strict
            -- semantics.
            loop
               Get (File.Real.Term, Char);
               exit when (Char = PM);
            end loop;
            if ECHO_PM then
               Put (File.Real.Term, PM);
            end if;
            File.Page := File.Page + 1;
            File.Line := 1;
            File.Col  := 1;
         else
            -- For output files, we do a new page. This can only
            -- occur when we are not using strict LRM semantics.
            New_Page (File);
         end if;
      else
         Ada.Text_IO.Skip_Page (File.File);
      end if;
   end Skip_Page;

   ---------------
   -- Skip_Page --
   ---------------

   procedure Skip_Page is
   begin
      Skip_Page (Current_In);
   end Skip_Page;

   --------------------
   -- Standard_Error --
   --------------------

   function Standard_Error return File_Type is
   begin
      return Standard_Err;
   end Standard_Error;

   --------------------
   -- Standard_Error --
   --------------------

   function Standard_Error return File_Access is
   begin
      return Standard_Err'Access;
   end Standard_Error;

   --------------------
   -- Standard_Input --
   --------------------

   function Standard_Input return File_Type is
   begin
      return Standard_In;
   end Standard_Input;

   --------------------
   -- Standard_Input --
   --------------------

   function Standard_Input return File_Access is
   begin
      return Standard_In'Access;
   end Standard_Input;

   ---------------------
   -- Standard_Output --
   ---------------------

   function Standard_Output return File_Type is
   begin
      return Standard_Out;
   end Standard_Output;

   ---------------------
   -- Standard_Output --
   ---------------------

   function Standard_Output return File_Access is
   begin
      return Standard_Out'Access;
   end Standard_Output;




   -----------------
   -- SkipBlanks  --
   -----------------

   procedure SkipBlanks (
         File : in     File_Type) is
      Char : Character;
   begin
      loop
         Get (File, Char);
         exit when Char /= ' ' and then Char /= ASCII.HT;
      end loop;
      UnGet (File.Real.Term, Char);
      File.Col := File.Col - 1;
   end SkipBlanks;

   -----------------
   -- AcceptChar  --
   -----------------

   procedure AcceptChar (
         File : in     File_Type;
         Char :        Character;
         Buf  :    out String;
         Ptr  : in out Natural) is
   begin
      File.Col := File.Col + 1;
      if Ptr = Buf'Last then
         raise Data_Error;
      else
         Ptr := Ptr + 1;
         Buf (Ptr) := Char;
      end if;
   end AcceptChar;

   -----------------
   -- GetLiteral  --
   -----------------

   procedure Getliteral (
         File : in     File_Type;
         Buf  :    out String;
         Len  :    out Natural) is
      Char : Character;
   begin
      Len := 0;
      SkipBlanks (File);
      Get (File.Real.Term, Char);
      if Char = ''' then
         AcceptChar (File, Char, Buf, Len);
         Get (File.Real.Term, Char);
         if Character'Pos (Char) in 16#20# .. 16#7E#
         or else Character'Pos (Char) >= 16#80# then
            AcceptChar (File, Char, Buf, Len);
            Get (File.Real.Term, Char);
            if Char = ''' then
               AcceptChar (File, Char, Buf, Len);
            else
               UnGet (File.Real.Term, Char);
            end if;
         else
            UnGet (File.Real.Term, Char);
         end if;
      else
         if not Is_Letter (Char) then
            UnGet (File.Real.Term, Char);
            return;
         end if;
         loop
            AcceptChar (File, To_Upper (Char), Buf, Len);
            Get (File.Real.Term, Char);
            exit when not Is_Letter (Char)
            and then not Is_Digit (Char)
            and then Char /= '_';
            exit when Char = '_'
            and then Buf (Len) = '_';
         end loop;
         UnGet (File.Real.Term, Char);
      end if;
   end Getliteral;

   -----------
   -- Load  --
   -----------

   procedure Load (
         File   :        File_Type;
         Buf    :    out String;
         Ptr    : in out Integer;
         Char1  :        Character;
         Loaded :    out Boolean) is
      Char : Character;
   begin
      Get (File.Real.Term, Char);
      if Char = Char1 then
         AcceptChar (File, Char, Buf, Ptr);
         Loaded := True;
      else
         UnGet (File.Real.Term, Char);
         Loaded := False;
      end if;
   end Load;

   -----------
   -- Load  --
   -----------

   procedure Load (
         File   :        File_Type;
         Buf    :    out String;
         Ptr    : in out Integer;
         Char1  :        Character;
         Char2  :        Character;
         Loaded :    out Boolean) is
      Char : Character;
   begin
      Get (File.Real.Term, Char);
      if Char = Char1 or else Char = Char2 then
         AcceptChar (File, Char, Buf, Ptr);
         Loaded := True;
      else
         UnGet (File.Real.Term, Char);
         Loaded := False;
      end if;
   end Load;

   ------------------
   -- Load_Digits  --
   ------------------

   procedure Load_Digits (
         File   :        File_Type;
         Buf    :    out String;
         Ptr    : in out Integer;
         Loaded :    out Boolean) is
      Char        : Character;
      After_Digit : Boolean;
   begin
      Get (File.Real.Term, Char);
      if not Is_Digit (Char) then
         Loaded := False;
      else
         Loaded := True;
         After_Digit := True;
         loop
            AcceptChar (File, Char, Buf, Ptr);
            Get (File.Real.Term, Char);
            if Is_Digit (Char) then
               After_Digit := True;
            elsif Char = '_' and then After_Digit then
               After_Digit := False;
            else
               exit;
            end if;
         end loop;
      end if;
      UnGet (File.Real.Term, Char);
   end Load_Digits;

   ---------------------------
   -- Load_Extended_Digits  --
   ---------------------------

   procedure Load_Extended_Digits (
         File   :        File_Type;
         Buf    :    out String;
         Ptr    : in out Integer;
         Loaded :    out Boolean) is
      Char        : Character;
      After_Digit : Boolean   := False;
   begin
      Loaded := False;
      loop
         Get (File.Real.Term, Char);
         if Is_Hexadecimal_Digit (Char) then
            After_Digit := True;
         elsif Char = '_' and then After_Digit then
            After_Digit := False;
         else
            exit;
         end if;
         AcceptChar (File, Char, Buf, Ptr);
         Loaded := True;
      end loop;
      UnGet (File.Real.Term, Char);
   end Load_Extended_Digits;

   -----------------
   -- GetInteger  --
   -----------------

   procedure Getinteger (
      File : in     File_Type;
      Buf  :    out String;
      Ptr  : in out Natural) is
      Hash_Loc : Natural;
      Loaded   : Boolean;
      Notused  : Boolean;
   begin
      SkipBlanks (File);
      Load (File, Buf, Ptr, '+', '-', Notused);
      Load_Digits (File, Buf, Ptr, Loaded);
      if Loaded then
         Load (File, Buf, Ptr, '#', ':', Loaded);
         if Loaded then
            Hash_Loc := Ptr;
            Load_Extended_Digits (File, Buf, Ptr, Notused);
            Load (File, Buf, Ptr, Buf (Hash_Loc), Notused);
         end if;
         Load (File, Buf, Ptr, 'E', 'e', Loaded);
         if Loaded then
            Load (File, Buf, Ptr, '+', '-', Notused);
            Load_Digits (File, Buf, Ptr, Notused);
         end if;
      end if;
   end Getinteger;

   --------------
   -- GetReal  --
   --------------

   procedure Getreal (
         File : in     File_Type;
         Buf  :    out String;
         Ptr  : in out Natural) is
      Loaded  : Boolean;
      Notused : Boolean;
   begin
      SkipBlanks (File);
      Load (File, Buf, Ptr, '+', '-', Notused);
      Load (File, Buf, Ptr, '.', Loaded);
      if Loaded then
         Load_Digits (File, Buf, Ptr, Loaded);
         if not Loaded then
            return;
         end if;
      else
         Load_Digits (File, Buf, Ptr, Loaded);
         if not Loaded then
            return;
         end if;
         Load (File, Buf, Ptr, '#', ':', Loaded);
         if Loaded then
            Load (File, Buf, Ptr, '.', Loaded);
            if Loaded then
               Load_Extended_Digits (File, Buf, Ptr, Notused);
            else
               Load_Extended_Digits (File, Buf, Ptr, Notused);
               Load (File, Buf, Ptr, '.', Loaded);
               if Loaded then
                  Load_Extended_Digits (File, Buf, Ptr, Notused);
               end if;
               Load (File, Buf, Ptr, '#', ':', Notused);
            end if;
         else
            Load (File, Buf, Ptr, '.', Loaded);
            if Loaded then
               Load_Digits (File, Buf, Ptr, Notused);
            end if;
         end if;
      end if;
      Load (File, Buf, Ptr, 'E', 'e', Loaded);
      if Loaded then
         Load (File, Buf, Ptr, '+', '-', Notused);
         Load_Digits (File, Buf, Ptr, Notused);
      end if;
   end Getreal;

   ----------------
   -- Decimal_IO --
   ----------------

   package body Decimal_IO is

      package Ada_Decimal_IO is new Ada.Text_IO.Decimal_IO (Num);

      ---------
      -- Get --
      ---------

      procedure Get (
            File  : in     File_Type;
            Item  :    out Num;
            Width : in     Field     := 0) is
         Str : String (1 .. Field'Last);
         Len : Natural                  := 0;
      begin
         if File = null then
            raise Status_Error;
         end if;
         if File.Terminal then
            if Closed (File.Real.Term) then
               raise Status_Error;
            elsif File.Strict and then File.Mode /= In_File then
               -- if we are using strict LRM semantics, then this
               -- cannot be done to an ouptut (or append) terminal
               raise Mode_Error;
            end if;
            MakeVisible (File.Real);
            Getreal (File, Str, Len);
            declare
               pragma Unsuppress (Range_Check);
            begin
               Item := Num'Value (Str (1 .. Len));
            exception
               when Constraint_Error =>
                  raise Data_Error;
            end;
         else
            Ada_Decimal_IO.Get (File.File, Item, Width);
         end if;
      end Get;

      ---------
      -- Get --
      ---------

      procedure Get (
            Item  :    out Num;
            Width : in     Field := 0) is
      begin
         Get (Current_In, Item, Width);
      end Get;

      ---------
      -- Get --
      ---------

      procedure Get (
            From : in     String;
            Item :    out Num;
            Last :    out Positive) is
      begin
         Ada_Decimal_IO.Get (From, Item, Last);
      end Get;

      ---------
      -- Put --
      ---------

      procedure Put (
            File : in     File_Type;
            Item : in     Num;
            Fore : in     Field     := Default_Fore;
            Aft  : in     Field     := Default_Aft;
            Exp  : in     Field     := Default_Exp) is
         Str : String (1 .. Natural'Max (Fore + Aft + Exp + 4, Field'Last));
         Pos : Natural;
      begin
         if File = null then
            raise Status_Error;
         end if;
         if File.Terminal then
            if Closed (File.Real.Term) then
               raise Status_Error;
            elsif File.Strict and then File.Mode = In_File then
               -- if we are using strict LRM semantics, then this
               -- cannot be done to an input terminal
               raise Mode_Error;
            end if;
            MakeVisible (File.Real);
            if File.Line_Length /= 0
            and then File.Col > File.Line_Length then
               New_Line (File);
            end if;
            Ada_Decimal_IO.Put (Str, Item, Aft, Exp);
            Pos := Str'Last;
            while Pos > Str'First
            and then (Str (Pos - 1) /= ' ') loop
               Pos := Pos - 1;
            end loop;
            Put (File.Real.Term, Str (Pos .. Str'Last));
         else
            Ada_Decimal_IO.Put (File.File, Item, Fore, Aft, Exp);
         end if;
      end Put;

      ---------
      -- Put --
      ---------

      procedure Put (
            Item : in     Num;
            Fore : in     Field := Default_Fore;
            Aft  : in     Field := Default_Aft;
            Exp  : in     Field := Default_Exp) is
      begin
         Put (Current_Out, Item, Fore, Aft, Exp);
      end Put;

      ---------
      -- Put --
      ---------

      procedure Put (
            To   :    out String;
            Item : in     Num;
            Aft  : in     Field  := Default_Aft;
            Exp  : in     Field  := Default_Exp) is
      begin
         Ada_Decimal_IO.Put (To, Item, Aft, Exp);
      end Put;

   end Decimal_IO;

   --------------------
   -- Enumeration_IO --
   --------------------

   package body Enumeration_IO is

      package Ada_Enumeration_IO is new Ada.Text_IO.Enumeration_IO (Enum);

      ---------
      -- Get --
      ---------

      procedure Get (
            File : in     File_Type;
            Item :    out Enum) is
         Str : String (1 .. Natural'Max (Field'Last, Enum'Width));
         Len : Natural                                            := 0;
      begin
         if File = null then
            raise Status_Error;
         end if;
         if File.Terminal then
            if Closed (File.Real.Term) then
               raise Status_Error;
            elsif File.Strict and then File.Mode /= In_File then
               -- if we are using strict LRM semantics, then this
               -- cannot be done to an ouptut (or append) terminal
               raise Mode_Error;
            end if;
            MakeVisible (File.Real);
            Getliteral (File, Str, Len);
            declare
               pragma Unsuppress (Range_Check);
            begin
               Item := Enum'Value (Str (1 .. Len));
            exception
               when Constraint_Error =>
                  raise Data_Error;
            end;
         else
            Ada_Enumeration_IO.Get (File.File, Item);
         end if;
      end Get;

      ---------
      -- Get --
      ---------

      procedure Get (
            Item :    out Enum) is
      begin
         Get (Current_In, Item);
      end Get;

      ---------
      -- Get --
      ---------

      procedure Get (
            From : in     String;
            Item :    out Enum;
            Last :    out Positive) is
      begin
         Ada_Enumeration_IO.Get (From, Item, Last);
      end Get;

      ---------
      -- Put --
      ---------

      procedure Put (
            File  : in     File_Type;
            Item  : in     Enum;
            Width : in     Field     := Default_Width;
            Set   : in     Type_Set  := Default_Setting) is
         Str : String (1 .. Natural'Max (Enum'Width, Field'Last));
         Pos : Natural;
      begin
         if File = null then
            raise Status_Error;
         end if;
         if File.Terminal then
            if Closed (File.Real.Term) then
               raise Status_Error;
            elsif File.Strict and then File.Mode = In_File then
               -- if we are using strict LRM semantics, then this
               -- cannot be done to an input terminal
               raise Mode_Error;
            end if;
            MakeVisible (File.Real);
            if File.Line_Length /= 0
            and then File.Col > File.Line_Length then
               New_Line (File);
            end if;
            Ada_Enumeration_IO.Put (Str, Item, Set);
            Pos := 1;
            while Pos < Str'Last and then Str (Pos + 1) /= ' ' loop
               Pos := Pos + 1;
            end loop;
            Put (File.Real.Term, Str (1 .. Pos));
         else
            Ada_Enumeration_IO.Put (File.File, Item, Width, Set);
         end if;
      end Put;

      ---------
      -- Put --
      ---------

      procedure Put (
            Item  : in     Enum;
            Width : in     Field    := Default_Width;
            Set   : in     Type_Set := Default_Setting) is
      begin
         Put (Current_Out, Item, Width, Set);
      end Put;

      ---------
      -- Put --
      ---------

      procedure Put (
            To   :    out String;
            Item : in     Enum;
            Set  : in     Type_Set := Default_Setting) is
      begin
         Ada_Enumeration_IO.Put (To, Item, Set);
      end Put;

   end Enumeration_IO;

   --------------
   -- Fixed_IO --
   --------------

   package body Fixed_IO is

      package Ada_Fixed_IO is new Ada.Text_IO.Fixed_IO (Num);

      ---------
      -- Get --
      ---------

      procedure Get (
            File  : in     File_Type;
            Item  :    out Num;
            Width : in     Field     := 0) is
         Str : String (1 .. Field'Last);
         Len : Natural                  := 0;
      begin
         if File = null then
            raise Status_Error;
         end if;
         if File.Terminal then
            if Closed (File.Real.Term) then
               raise Status_Error;
            elsif File.Strict and then File.Mode /= In_File then
               -- if we are using strict LRM semantics, then this
               -- cannot be done to an ouptut (or append) terminal
               raise Mode_Error;
            end if;
            MakeVisible (File.Real);
            Getreal (File, Str, Len);
            declare
               pragma Unsuppress (Range_Check);
            begin
               Item := Num'Value (Str (1 .. Len));
            exception
               when Constraint_Error =>
                  raise Data_Error;
            end;
         else
            Ada_Fixed_IO.Get (File.File, Item, Width);
         end if;
      end Get;

      ---------
      -- Get --
      ---------

      procedure Get (
            Item  :    out Num;
            Width : in     Field := 0) is
      begin
         Get (Current_In, Item, Width);
      end Get;

      ---------
      -- Get --
      ---------

      procedure Get (
            From : in     String;
            Item :    out Num;
            Last :    out Positive) is
      begin
         Ada_Fixed_IO.Get (From, Item, Last);
      end Get;

      ---------
      -- Put --
      ---------

      procedure Put (
            File : in     File_Type;
            Item : in     Num;
            Fore : in     Field     := Default_Fore;
            Aft  : in     Field     := Default_Aft;
            Exp  : in     Field     := Default_Exp) is
         Str : String (1 .. Natural'Max (Fore + Aft + Exp + 4, Field'Last));
         Pos : Natural;
      begin
         if File = null then
            raise Status_Error;
         end if;
         if File.Terminal then
            if Closed (File.Real.Term) then
               raise Status_Error;
            elsif File.Strict and then File.Mode = In_File then
               -- if we are using strict LRM semantics, then this
               -- cannot be done to an input terminal
               raise Mode_Error;
            end if;
            MakeVisible (File.Real);
            if File.Line_Length /= 0
            and then File.Col > File.Line_Length then
               New_Line (File);
            end if;
            Ada_Fixed_IO.Put (Str, Item, Aft, Exp);
            Pos := Str'Last;
            while Pos > Str'First and then (Str (Pos - 1) /= ' ') loop
               Pos := Pos - 1;
            end loop;
            Put (File.Real.Term, Str (Pos .. Str'Last));
         else
            Ada_Fixed_IO.Put (File.File, Item, Fore, Aft, Exp);
         end if;
      end Put;

      ---------
      -- Put --
      ---------

      procedure Put (
            Item : in     Num;
            Fore : in     Field := Default_Fore;
            Aft  : in     Field := Default_Aft;
            Exp  : in     Field := Default_Exp) is
      begin
         Put (Current_Out, Item, Fore, Aft, Exp);
      end Put;

      ---------
      -- Put --
      ---------

      procedure Put (
            To   :    out String;
            Item : in     Num;
            Aft  : in     Field  := Default_Aft;
            Exp  : in     Field  := Default_Exp) is
      begin
         Ada_Fixed_IO.Put (To, Item, Aft, Exp);
      end Put;

   end Fixed_IO;

   --------------
   -- Float_IO --
   --------------

   package body Float_IO is

      package Ada_Float_IO is new Ada.Text_IO.Float_IO (Num);

      ---------
      -- Get --
      ---------

      procedure Get (
            File  : in     File_Type;
            Item  :    out Num;
            Width : in     Field     := 0) is
         Str : String (1 .. Field'Last);
         Len : Natural                  := 0;
      begin
         if File = null then
            raise Status_Error;
         end if;
         if File.Terminal then
            if Closed (File.Real.Term) then
               raise Status_Error;
            elsif File.Strict and then File.Mode /= In_File then
               -- if we are using strict LRM semantics, then this
               -- cannot be done to an ouptut (or append) terminal
               raise Mode_Error;
            end if;
            MakeVisible (File.Real);
            Getreal (File, Str, Len);
            declare
               pragma Unsuppress (Range_Check);
            begin
               Item := Num'Value (Str (1 .. Len));
            exception
               when Constraint_Error =>
                  raise Data_Error;
            end;
         else
            Ada_Float_IO.Get (File.File, Item, Width);
         end if;
      end Get;

      ---------
      -- Get --
      ---------

      procedure Get (
            Item  :    out Num;
            Width : in     Field := 0) is
      begin
         Get (Current_In, Item, Width);
      end Get;

      ---------
      -- Get --
      ---------

      procedure Get (
            From : in     String;
            Item :    out Num;
            Last :    out Positive) is
      begin
         Ada_Float_IO.Get (From, Item, Last);
      end Get;

      ---------
      -- Put --
      ---------

      procedure Put (
            File : in     File_Type;
            Item : in     Num;
            Fore : in     Field     := Default_Fore;
            Aft  : in     Field     := Default_Aft;
            Exp  : in     Field     := Default_Exp) is
         Str : String (1 .. Natural'Max (Fore + Aft + Exp + 4, Field'Last));
         Pos : Natural;
      begin
         if File = null then
            raise Status_Error;
         end if;
         if File.Terminal then
            if Closed (File.Real.Term) then
               raise Status_Error;
            elsif File.Strict and then File.Mode = In_File then
               -- if we are using strict LRM semantics, then this
               -- cannot be done to an input terminal
               raise Mode_Error;
            end if;
            MakeVisible (File.Real);
            if File.Line_Length /= 0
            and then File.Col > File.Line_Length then
               New_Line (File);
            end if;
            Ada_Float_IO.Put (Str, Item, Aft, Exp);
            Pos := Str'Last;
            while Pos > Str'First
            and then (Str (Pos - 1) /= ' ') loop
               Pos := Pos - 1;
            end loop;
            Put (File.Real.Term, Str (Pos .. Str'Last));
         else
            Ada_Float_IO.Put (File.File, Item, Fore, Aft, Exp);
         end if;
      end Put;

      ---------
      -- Put --
      ---------

      procedure Put (
            Item : in     Num;
            Fore : in     Field := Default_Fore;
            Aft  : in     Field := Default_Aft;
            Exp  : in     Field := Default_Exp) is
      begin
         Put (Current_Out, Item, Fore, Aft, Exp);
      end Put;

      ---------
      -- Put --
      ---------

      procedure Put (
            To   :    out String;
            Item : in     Num;
            Aft  : in     Field  := Default_Aft;
            Exp  : in     Field  := Default_Exp) is
      begin
         Ada_Float_IO.Put (To, Item, Aft, Exp);
      end Put;

   end Float_IO;

   ----------------
   -- Integer_IO --
   ----------------

   package body Integer_IO is

      package Ada_Integer_IO is new Ada.Text_IO.Integer_IO (Num);

      ---------
      -- Get --
      ---------

      procedure Get (
            File  : in     File_Type;
            Item  :    out Num;
            Width : in     Field     := 0) is
         Str : String (1 .. Field'Last);
         Len : Natural                  := 0;
      begin
         if File = null then
            raise Status_Error;
         end if;
         if File.Terminal then
            if Closed (File.Real.Term) then
               raise Status_Error;
            elsif File.Strict and then File.Mode /= In_File then
               -- if we are using strict LRM semantics, then this
               -- cannot be done to an ouptut (or append) terminal
               raise Mode_Error;
            end if;
            MakeVisible (File.Real);
            Getinteger (File, Str, Len);
            declare
               pragma Unsuppress (Range_Check);
            begin
               Item := Num'Value (Str (1 .. Len));
            exception
               when Constraint_Error =>
                  raise Data_Error;
            end;
         else
            Ada_Integer_IO.Get (File.File, Item, Width);
         end if;
      end Get;

      ---------
      -- Get --
      ---------

      procedure Get (
            Item  :    out Num;
            Width : in     Field := 0) is
      begin
         Get (Current_In, Item, Width);
      end Get;

      ---------
      -- Get --
      ---------

      procedure Get (
            From : in     String;
            Item :    out Num;
            Last :    out Positive) is
      begin
         Ada_Integer_IO.Get (From, Item, Last);
      end Get;

      ---------
      -- Put --
      ---------

      procedure Put (
            File  : in     File_Type;
            Item  : in     Num;
            Width : in     Field       := Default_Width;
            Base  : in     Number_Base := Default_Base) is
         Str : String (1 .. Natural'Max (Field'Last, Width));
         Pos : Natural;
      begin
         if File = null then
            raise Status_Error;
         end if;
         if File.Terminal then
            if Closed (File.Real.Term) then
               raise Status_Error;
            elsif File.Strict and then File.Mode = In_File then
               -- if we are using strict LRM semantics, then this
               -- cannot be done to an input terminal
               raise Mode_Error;
            end if;
            MakeVisible (File.Real);
            if File.Line_Length /= 0
            and then File.Col > File.Line_Length then
               New_Line (File);
            end if;
            Ada_Integer_IO.Put (Str, Item, Base);
            Pos := Str'Last;
            while Pos > Str'First
            and then (Str (Pos - 1) /= ' ' or Str'Last - Pos + 1 < Width) loop
               Pos := Pos - 1;
            end loop;
            Put (File.Real.Term, Str (Pos .. Str'Last));
         else
            Ada_Integer_IO.Put (File.File, Item, Width, Base);
         end if;
      end Put;

      ---------
      -- Put --
      ---------

      procedure Put (
            Item  : in     Num;
            Width : in     Field       := Default_Width;
            Base  : in     Number_Base := Default_Base) is
      begin
         Put (Current_Out, Item, Width, Base);
      end Put;

      ---------
      -- Put --
      ---------

      procedure Put (
            To   :    out String;
            Item : in     Num;
            Base : in     Number_Base := Default_Base) is
      begin
         Ada_Integer_IO.Put (To, Item, Base);
      end Put;

   end Integer_IO;

   ----------------
   -- Modular_IO --
   ----------------

   package body Modular_IO is

      package Ada_Modular_IO is new Ada.Text_IO.Modular_IO (Num);

      ---------
      -- Get --
      ---------

      procedure Get (
            File  : in     File_Type;
            Item  :    out Num;
            Width : in     Field     := 0) is
         Str : String (1 .. Field'Last);
         Len : Natural                  := 0;
      begin
         if File = null then
            raise Status_Error;
         end if;
         if File.Terminal then
            if Closed (File.Real.Term) then
               raise Status_Error;
            elsif File.Strict and then File.Mode /= In_File then
               -- if we are using strict LRM semantics, then this
               -- cannot be done to an ouptut (or append) terminal
               raise Mode_Error;
            end if;
            MakeVisible (File.Real);
            Getinteger (File, Str, Len);
            declare
               pragma Unsuppress (Range_Check);
            begin
               Item := Num'Value (Str (1 .. Len));
            exception
               when Constraint_Error =>
                  raise Data_Error;
            end;
         else
            Ada_Modular_IO.Get (File.File, Item, Width);
         end if;
      end Get;

      ---------
      -- Get --
      ---------

      procedure Get (
            Item  :    out Num;
            Width : in     Field := 0) is
      begin
         Get (Current_In, Item, Width);
      end Get;

      ---------
      -- Get --
      ---------

      procedure Get (
            From : in     String;
            Item :    out Num;
            Last :    out Positive) is
      begin
         Ada_Modular_IO.Get (From, Item, Last);
      end Get;

      ---------
      -- Put --
      ---------

      procedure Put (
            File  : in     File_Type;
            Item  : in     Num;
            Width : in     Field       := Default_Width;
            Base  : in     Number_Base := Default_Base) is
         Str : String (1 .. Natural'Max (Field'Last, Width));
         Pos : Natural;
      begin
         if File = null then
            raise Status_Error;
         end if;
         if File.Terminal then
            if Closed (File.Real.Term) then
               raise Status_Error;
            elsif File.Strict and then File.Mode = In_File then
               -- if we are using strict LRM semantics, then this
               -- cannot be done to an input terminal
               raise Mode_Error;
            end if;
            MakeVisible (File.Real);
            if File.Line_Length /= 0
            and then File.Col > File.Line_Length then
               New_Line (File);
            end if;
            Ada_Modular_IO.Put (Str, Item, Base);
            Pos := Str'Last;
            while Pos > Str'First
            and then (Str (Pos - 1) /= ' ' or Str'Last - Pos + 1 < Width) loop
               Pos := Pos - 1;
            end loop;
            Put (File.Real.Term, Str (Pos .. Str'Last));
         else
            Ada_Modular_IO.Put (File.File, Item, Width, Base);
         end if;
      end Put;

      ---------
      -- Put --
      ---------

      procedure Put (
            Item  : in     Num;
            Width : in     Field       := Default_Width;
            Base  : in     Number_Base := Default_Base) is
      begin
         Put (Current_Out, Item, Width, Base);
      end Put;

      ---------
      -- Put --
      ---------

      procedure Put (
            To   :    out String;
            Item : in     Num;
            Base : in     Number_Base := Default_Base) is
      begin
         Ada_Modular_IO.Put (To, Item, Base);
      end Put;

   end Modular_IO;

begin -- Term_IO
   -- set up Standard Input terminal
   Standard_In.Terminal := True;
   Standard_In.Visible  := False;
   Standard_In.Mode := In_File;
   Standard_In.Self := Standard_In;
   Standard_In.Real := Standard_In;
   Open (
      Standard_In.Term,
      Title => "Standard Input",
      Font => DEFAULT_FONTNAME,
      Size => DEFAULT_FONTSIZE,
      VirtualRows => DEFAULT_VIRTUAL_ROWS,
      MainMenu => No,
      Visible => No);
   SetKeyOptions (
      Standard_In.Term,
      SetSize => Yes,
      Size => DEFAULT_KEYBUF_SIZE);
   SetWindowOptions (
      Standard_In.Term,
      CloseProgram => Yes);
   SetEditingOptions (
      Standard_In.Term,
      Wrap => Yes);
   SetOtherOptions (
      Standard_In.Term,
      UseLFasEOL => Yes,
      AutoCRonLF => Yes);
   SetCursorOptions (
      Standard_In.Term,
      Visible => Yes,
      Flashing => Yes);
   SetCursorColor (
      Standard_In.Term,
      Yellow);
   if NO_ANSI_ON_DEFAULTS then
      SetAnsiOptions (
         Standard_In.Term,
         OnOutput => No,
         OnInput => No);
   end if;
   if STRICT_LRM_DEFAULTS then
      Standard_In.Strict := True;
   end if;

   -- set up Standard Output terminal
   Standard_Out.Terminal := True;
   Standard_Out.Visible  := False;
   Standard_Out.Mode := Out_File;
   Standard_Out.Self := Standard_Out;
   if SEPARATE_STD_IN_OUT then
      Standard_Out.Real := Standard_Out;
      Open (
         Standard_Out.Term,
         Title => "Standard Output",
         Font => DEFAULT_FONTNAME,
         Size => DEFAULT_FONTSIZE,
         VirtualRows => DEFAULT_VIRTUAL_ROWS,
         MainMenu => No,
         Visible => No);
      -- disable keyboard
      SetKeyOptions (
         Standard_Out.Term,
         Locked => Yes,
         SetSize => Yes,
         Size => 0);
      SetWindowOptions (
         Standard_Out.Term,
         CloseProgram => Yes);
      SetEditingOptions (
         Standard_Out.Term,
         Wrap => Yes);
      SetOtherOptions (
         Standard_Out.Term,
         UseLFasEOL => Yes,
         AutoCRonLF => Yes);
      -- disable input cursor
      SetCursorOptions (
         Standard_Out.Term,
         Visible => No,
         Flashing => No);
      if NO_ANSI_ON_DEFAULTS then
         SetAnsiOptions (
            Standard_Out.Term,
            OnOutput => No,
            OnInput => No);
      end if;
      if STRICT_LRM_DEFAULTS then
         Standard_Out.Strict := True;
      end if;
   else
      Standard_Out.Real := Standard_In;
      SetTitleOptions (
         Standard_In.Term,
         Set => Yes,
         Title => "Standard Input/Output");
   end if;

   -- set up Standard Error terminal
   Standard_Err.Terminal := True;
   Standard_Err.Visible  := False;
   Standard_Err.Mode := Out_File;
   Standard_Err.Self := Standard_Err;
   if SEPARATE_STD_OUT_ERR then
      Standard_Err.Real := Standard_Err;
      Open (
         Standard_Err.Term,
         Title => "Standard Error",
         Font => DEFAULT_FONTNAME,
         Size => DEFAULT_FONTSIZE,
         VirtualRows => DEFAULT_VIRTUAL_ROWS,
         MainMenu => No,
         Visible => No);
      -- disable keyboard
      SetKeyOptions (
         Standard_Err.Term,
         Locked => Yes,
         SetSize => Yes,
         Size => 0);
      SetWindowOptions (
         Standard_Err.Term,
         CloseProgram => Yes);
      SetEditingOptions (
         Standard_Err.Term,
         Wrap => Yes);
      SetOtherOptions (
         Standard_Err.Term,
         UseLFasEOL => Yes,
         AutoCRonLF => Yes);
      -- disable input cursor
      SetCursorOptions (
         Standard_Err.Term,
         Visible => No,
         Flashing => No);
      if NO_ANSI_ON_DEFAULTS then
         SetAnsiOptions (
            Standard_Err.Term,
            OnOutput => No,
            OnInput => No);
      end if;
      if STRICT_LRM_DEFAULTS then
         Standard_Err.Strict := True;
      end if;
   else
      if SEPARATE_STD_IN_OUT then
         SetTitleOptions (
            Standard_Out.Term,
            Set => Yes,
            Title => "Standard Output/Error");
         Standard_Err.Real := Standard_Out;
      else
         SetTitleOptions (
            Standard_In.Term,
            Set => Yes,
            Title => "Standard Input/Output/Error");
         Standard_Err.Real := Standard_In;
      end if;
   end if;

end Term_IO;

