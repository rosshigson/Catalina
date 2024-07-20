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

with Ada.IO_Exceptions;
with Ada.Text_IO;
use Ada.Text_IO;
with Terminal_Emulator;

pragma Elaborate_All (Terminal_Emulator);

package Term_IO is

   type File_Type is limited private;

   -- type File_Mode is (In_File, Out_File, Append_File);

   -- type Count is range 0 .. Natural'Last;
   -- subtype Positive_Count is Count range 1 .. Count'Last;
   -- Unbounded : constant Count := 0; -- line and page length

   -- subtype Field       is Integer range 0 .. 255;
   -- subtype Number_Base is Integer range 2 .. 16;

   -- type Type_Set is (Lower_Case, Upper_Case);

   subtype File_Mode      is Ada.Text_IO.File_Mode;
   In_File     : File_Mode renames Ada.Text_IO.In_File;
   Out_File    : File_Mode renames Ada.Text_IO.Out_File;
   Append_File : File_Mode renames Ada.Text_IO.Append_File;

   subtype Count          is Ada.Text_IO.Count;
   subtype Positive_Count is Ada.Text_IO.Positive_Count;

   Unbounded : constant Count := 0; -- line and page length

   subtype Field          is Ada.Text_IO.Field;
   subtype Number_Base    is Ada.Text_IO.Number_Base;

   subtype Type_Set       is Ada.Text_IO.Type_Set;
   Upper_Case : Type_Set renames Ada.Text_IO.Upper_Case;
   Lower_Case : Type_Set renames Ada.Text_IO.Lower_Case;

   -- File Management
   procedure Create (
         File : in out File_Type;
         Mode : in     File_Mode := Out_File;
         Name : in     String    := "";
         Form : in     String    := "");

   procedure Open (
         File : in out File_Type;
         Mode : in     File_Mode;
         Name : in     String;
         Form : in     String    := "");

   procedure Close (
         File : in out File_Type);
   procedure Delete (
         File : in out File_Type);
   procedure Reset (
         File : in out File_Type;
         Mode : in     File_Mode);
   procedure Reset (
         File : in out File_Type);

   function Mode (
         File : in     File_Type)
     return File_Mode;
   function Name (
         File : in     File_Type)
     return String;
   function Form (
         File : in     File_Type)
     return String;

   function Is_Open (
         File : in     File_Type)
     return Boolean;

   -- Control of default input and output files

   procedure Set_Input (
         File : in     File_Type);
   procedure Set_Output (
         File : in     File_Type);
   procedure Set_Error (
         File : in     File_Type);

   function Standard_Input return File_Type;
   function Standard_Output return File_Type;
   function Standard_Error return File_Type;

   function Current_Input return File_Type;
   function Current_Output return File_Type;
   function Current_Error return File_Type;

   type File_Access is access constant File_Type;

   function Standard_Input return File_Access;
   function Standard_Output return File_Access;
   function Standard_Error return File_Access;

   function Current_Input return File_Access;
   function Current_Output return File_Access;
   function Current_Error return File_Access;

   -- Buffer control
   procedure Flush (
         File : in out File_Type);

   procedure Flush;

   -- Specification of line and page lengths

   procedure Set_Line_Length (
         File : in     File_Type;
         To   : in     Count);
   procedure Set_Line_Length (
         To : in     Count);

   procedure Set_Page_Length (
         File : in     File_Type;
         To   : in     Count);
   procedure Set_Page_Length (
         To : in     Count);

   function Line_Length (
         File : in     File_Type)
     return Count;
   function Line_Length return Count;

   function Page_Length (
         File : in     File_Type)
     return Count;
   function Page_Length return Count;

   -- Column, Line, and Page Control

   procedure New_Line (
         File    : in     File_Type;
         Spacing : in     Positive_Count := 1);
   procedure New_Line (
         Spacing : in     Positive_Count := 1);

   procedure Skip_Line (
         File    : in     File_Type;
         Spacing : in     Positive_Count := 1);
   procedure Skip_Line (
         Spacing : in     Positive_Count := 1);

   function End_Of_Line (
         File : in     File_Type)
     return Boolean;
   function End_Of_Line return Boolean;

   procedure New_Page (
         File : in     File_Type);
   procedure New_Page;

   procedure Skip_Page (
         File : in     File_Type);
   procedure Skip_Page;

   function End_Of_Page (
         File : in     File_Type)
     return Boolean;
   function End_Of_Page return Boolean;

   function End_Of_File (
         File : in     File_Type)
     return Boolean;
   function End_Of_File return Boolean;

   procedure Set_Col (
         File : in     File_Type;
         To   : in     Positive_Count);
   procedure Set_Col (
         To : in     Positive_Count);

   procedure Set_Line (
         File : in     File_Type;
         To   : in     Positive_Count);
   procedure Set_Line (
         To : in     Positive_Count);

   function Col (
         File : in     File_Type)
     return Positive_Count;
   function Col return Positive_Count;

   function Line (
         File : in     File_Type)
     return Positive_Count;
   function Line return Positive_Count;

   function Page (
         File : in     File_Type)
     return Positive_Count;
   function Page return Positive_Count;

   -- Character Input-Output

   procedure Get (
         File : in     File_Type;
         Item :    out Character);
   procedure Get (
         Item :    out Character);

   procedure Put (
         File : in     File_Type;
         Item : in     Character);
   procedure Put (
         Item : in     Character);

   procedure Look_Ahead (
         File        : in     File_Type;
         Item        :    out Character;
         End_Of_Line :    out Boolean);
   procedure Look_Ahead (
         Item        :    out Character;
         End_Of_Line :    out Boolean);

   procedure Get_Immediate (
         File : in     File_Type;
         Item :    out Character);
   procedure Get_Immediate (
         Item :    out Character);

   procedure Get_Immediate (
         File      : in     File_Type;
         Item      :    out Character;
         Available :    out Boolean);
   procedure Get_Immediate (
         Item      :    out Character;
         Available :    out Boolean);

   -- String Input-Output

   procedure Get (
         File : in     File_Type;
         Item :    out String);
   procedure Get (
         Item :    out String);

   procedure Put (
         File : in     File_Type;
         Item : in     String);
   procedure Put (
         Item : in     String);

   procedure Get_Line (
         File : in     File_Type;
         Item :    out String;
         Last :    out Natural);
   procedure Get_Line (
         Item :    out String;
         Last :    out Natural);

   procedure Put_Line (
         File : in     File_Type;
         Item : in     String);
   procedure Put_Line (
         Item : in     String);

   -- Generic packages for Input-Output of Integer Typesa

   generic
      type Num is range <>;
   package Integer_IO is

      Default_Width : Field := Num'Width;
      Default_Base  : Number_Base := 10;

      procedure Get (
            File  : in     File_Type;
            Item  :    out Num;
            Width : in     Field     := 0);
      procedure Get (
            Item  :    out Num;
            Width : in     Field := 0);

      procedure Put (
            File  : in     File_Type;
            Item  : in     Num;
            Width : in     Field       := Default_Width;
            Base  : in     Number_Base := Default_Base);
      procedure Put (
            Item  : in     Num;
            Width : in     Field       := Default_Width;
            Base  : in     Number_Base := Default_Base);
      procedure Get (
            From : in     String;
            Item :    out Num;
            Last :    out Positive);
      procedure Put (
            To   :    out String;
            Item : in     Num;
            Base : in     Number_Base := Default_Base);

   end Integer_IO;

   generic
      type Num is mod <>;
   package Modular_IO is

      Default_Width : Field := Num'Width;
      Default_Base  : Number_Base := 10;

      procedure Get (
            File  : in     File_Type;
            Item  :    out Num;
            Width : in     Field     := 0);
      procedure Get (
            Item  :    out Num;
            Width : in     Field := 0);

      procedure Put (
            File  : in     File_Type;
            Item  : in     Num;
            Width : in     Field       := Default_Width;
            Base  : in     Number_Base := Default_Base);
      procedure Put (
            Item  : in     Num;
            Width : in     Field       := Default_Width;
            Base  : in     Number_Base := Default_Base);
      procedure Get (
            From : in     String;
            Item :    out Num;
            Last :    out Positive);
      procedure Put (
            To   :    out String;
            Item : in     Num;
            Base : in     Number_Base := Default_Base);

   end Modular_IO;

   -- Generic packages for Input-Output of Real Types

   generic
      type Num is digits <>;
   package Float_IO is

      Default_Fore : Field := 2;

      Default_Aft  : Field := Num'Digits - 1;

      Default_Exp  : Field := 3;

      procedure Get (
            File  : in     File_Type;
            Item  :    out Num;
            Width : in     Field     := 0);
      procedure Get (
            Item  :    out Num;
            Width : in     Field := 0);

      procedure Put (
            File : in     File_Type;
            Item : in     Num;
            Fore : in     Field     := Default_Fore;
            Aft  : in     Field     := Default_Aft;
            Exp  : in     Field     := Default_Exp);
      procedure Put (
            Item : in     Num;
            Fore : in     Field := Default_Fore;
            Aft  : in     Field := Default_Aft;
            Exp  : in     Field := Default_Exp);

      procedure Get (
            From : in     String;
            Item :    out Num;
            Last :    out Positive);
      procedure Put (
            To   :    out String;
            Item : in     Num;
            Aft  : in     Field  := Default_Aft;
            Exp  : in     Field  := Default_Exp);

   end Float_IO;

   generic
      type Num is delta <>;
   package Fixed_IO is

      Default_Fore : Field := Num'Fore;
      Default_Aft  : Field := Num'Aft;
      Default_Exp  : Field := 0;

      procedure Get (
            File  : in     File_Type;
            Item  :    out Num;
            Width : in     Field     := 0);
      procedure Get (
            Item  :    out Num;
            Width : in     Field := 0);

      procedure Put (
            File : in     File_Type;
            Item : in     Num;
            Fore : in     Field     := Default_Fore;
            Aft  : in     Field     := Default_Aft;
            Exp  : in     Field     := Default_Exp);
      procedure Put (
            Item : in     Num;
            Fore : in     Field := Default_Fore;
            Aft  : in     Field := Default_Aft;
            Exp  : in     Field := Default_Exp);

      procedure Get (
            From : in     String;
            Item :    out Num;
            Last :    out Positive);
      procedure Put (
            To   :    out String;
            Item : in     Num;
            Aft  : in     Field  := Default_Aft;
            Exp  : in     Field  := Default_Exp);

   end Fixed_IO;

   generic
      type Num is delta <> digits <>;
   package Decimal_IO is

      Default_Fore : Field := Num'Fore;
      Default_Aft  : Field := Num'Aft;
      Default_Exp  : Field := 0;

      procedure Get (
            File  : in     File_Type;
            Item  :    out Num;
            Width : in     Field     := 0);
      procedure Get (
            Item  :    out Num;
            Width : in     Field := 0);

      procedure Put (
            File : in     File_Type;
            Item : in     Num;
            Fore : in     Field     := Default_Fore;
            Aft  : in     Field     := Default_Aft;
            Exp  : in     Field     := Default_Exp);
      procedure Put (
            Item : in     Num;
            Fore : in     Field := Default_Fore;
            Aft  : in     Field := Default_Aft;
            Exp  : in     Field := Default_Exp);

      procedure Get (
            From : in     String;
            Item :    out Num;
            Last :    out Positive);
      procedure Put (
            To   :    out String;
            Item : in     Num;
            Aft  : in     Field  := Default_Aft;
            Exp  : in     Field  := Default_Exp);

   end Decimal_IO;

   -- Generic package for Input-Output of Enumeration Types

   generic
      type Enum is
            (<>);
   package Enumeration_IO is

      Default_Width   : Field := 0;
      Default_Setting : Type_Set := Upper_Case;

      procedure Get (
            File : in     File_Type;
            Item :    out Enum);
      procedure Get (
            Item :    out Enum);

      procedure Put (
            File  : in     File_Type;
            Item  : in     Enum;
            Width : in     Field     := Default_Width;
            Set   : in     Type_Set  := Default_Setting);
      procedure Put (
            Item  : in     Enum;
            Width : in     Field    := Default_Width;
            Set   : in     Type_Set := Default_Setting);

      procedure Get (
            From : in     String;
            Item :    out Enum;
            Last :    out Positive);
      procedure Put (
            To   :    out String;
            Item : in     Enum;
            Set  : in     Type_Set := Default_Setting);

   end Enumeration_IO;

   -- Exceptions
   Status_Error : exception renames Ada.IO_Exceptions.Status_Error;
   Mode_Error   : exception renames Ada.IO_Exceptions.Mode_Error;
   Name_Error   : exception renames Ada.IO_Exceptions.Name_Error;
   Use_Error    : exception renames Ada.IO_Exceptions.Use_Error;
   Device_Error : exception renames Ada.IO_Exceptions.Device_Error;
   End_Error    : exception renames Ada.IO_Exceptions.End_Error;
   Data_Error   : exception renames Ada.IO_Exceptions.Data_Error;
   Layout_Error : exception renames Ada.IO_Exceptions.Layout_Error;

private

   MAX_FORM_LENGTH : constant := 256;

   LM : constant Character := ASCII.LF;
   --  Used as line mark
   PM : constant Character := ASCII.FF;
   --  Used as page mark
   type Term_File;
   type File_Type is access all Term_File;

   subtype Form_String is String (1 .. MAX_FORM_LENGTH);

   type Term_File is
      record
         Terminal    : Boolean               := False;   -- If True, this is a terminal
         Visible     : Boolean               := False;   -- If True, terminal has been made visible
         Mode        : File_Mode             := In_File;
         Strict      : aliased Boolean       := False;   -- If True, use strict LRM semantics
         Form        : Form_String;
         Formlen     : Natural               := 0;
         Term        : Terminal_Emulator.Terminal;       -- used when this is a terminal
         File        : Ada.Text_IO.File_Type;            -- used when this is a file
         Page        : Count                 := 1;
         Line        : Count                 := 1;
         Col         : Count                 := 1;
         Line_Length : Count                 := 0;
         Page_Length : Count                 := 0;
         Self        : aliased File_Type;
         Real        : aliased File_Type;                -- used when terminals are combined
         Before_LM   : Boolean               := False;
      end record;

   Null_Str : aliased
   constant String := "";

   Standard_Err_File : aliased Term_File;
   Standard_In_File  : aliased Term_File;
   Standard_Out_File : aliased Term_File;

   Standard_Err : aliased File_Type := Standard_Err_File'Access;
   Standard_In  : aliased File_Type := Standard_In_File'Access;
   Standard_Out : aliased File_Type := Standard_Out_File'Access;

   Current_In  : aliased File_Type := Standard_In;
   Current_Out : aliased File_Type := Standard_Out;
   Current_Err : aliased File_Type := Standard_Err;

end Term_IO;
