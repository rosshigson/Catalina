-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 2.1                                   --
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

with Ada.Strings.Maps;
with Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed;
with Ada.Unchecked_Deallocation;

with GWindows.Colors;

package body Terminal_Emulator.Option_Parser is

   use Terminal_Emulator;
   use Terminal_Types;
   use Ada.Strings.Fixed;
   use Ada.Strings.Maps;
   use Ada.Strings.Maps.Constants;

   procedure Free is
   new Ada.Unchecked_Deallocation (Parser_Record, Parser_Type);

   function IsWhiteSpace (Char : in Character)
      return Boolean
   is
   begin
      return Char = ' ' or Char = ASCII.HT;
   end IsWhiteSpace;

   function FindStart (
         Str  : in     String;
         From : in     Natural)
     return Natural
   is
   begin
      for Pos in From .. Str'Last loop
         if not IsWhiteSpace (Str (Pos)) then
            return Pos;
         end if;
      end loop;
      return Str'Last + 1;
   end FindStart;

   function FindPositionAfter (
         Str  : in     String;
         From : in     Natural;
         Char : in     Character)
     return Natural
   is
   begin
      for Pos in From .. Str'Last loop
         if Str (Pos) = Char then
            return Pos + 1;
         end if;
      end loop;
      return Str'Last + 1;
   end FindPositionAfter;

   function FindFinish (
         Str  : in     String;
         From : in     Natural)
     return Natural
   is
   begin
      for Pos in From + 1 .. Str'Last loop
         if IsWhiteSpace (Str (Pos)) then
            return Pos - 1;
         end if;
      end loop;
      return Str'Last;
   end FindFinish;

   function CompareNoCase (
         Line         : in     String;
         Option       : in     String;
         StopAtEquals : in     Boolean := False)
     return Boolean
   is
      Len : Natural := Natural'Min (Option'Length, Line'Length);
   begin
      if StopAtEquals then
         -- if line contains "=", we stop comparison at that point
         for I in Line'First .. Line'Last loop
            if Line (I) = '=' then
               Len := Natural'Min (Len, I - Line'First);
               exit;
            end if;
         end loop;
      end if;
      return Translate (Option (Option'First .. Option'First + Len - 1),
                        Lower_Case_Map)
           = Translate (Line (Line'First .. Line'First + Len - 1),
                        Lower_Case_Map);
   end CompareNoCase;

   procedure ParseNatural (
         Str  : in     String;
         From : in out Natural;
         Num  : in out Natural;
         Ok   : in out Boolean)
   is
      Natstart : Natural;
      Natend   : Natural;
   begin
      Natstart := FindStart (Str, From);
      if Natstart <= Str'Last then
         Natend := FindFinish (Str, Natstart);
         Num  := Natural'Value (Str (Natstart .. Natend));
         From := Natend;
         Ok   := True;
      else
         Ok := False;
      end if;
   exception
      when others =>
         Ok := False;
   end ParseNatural;

   procedure ParseTwoNat (
         Str  : in     String;
         From : in out Natural;
         Num1 : in out Natural;
         Num2 : in out Natural;
         Ok   : in out Boolean)
   is
      Nat1start  : Natural;
      Nat1end    : Natural := 0;
      Foundcomma : Boolean := False;
      Nat2start  : Natural := 0;
      Nat2end    : Natural := 0;
   begin
      Nat1start := FindStart (Str, From);
      if Nat1start < Str'Last then
         for I in Nat1start .. Str'Last - 1 loop
            if Str (I) = ',' then
               Nat1end := I - 1;
               Nat2start := FindStart (Str, I + 1);
               Foundcomma := True;
               exit;
            end if;
         end loop;
         if Foundcomma and Nat2start <= Str'Last then
            Nat2end := FindFinish (Str, Nat2start);
            Num1 := Natural'Value (Str (Nat1start .. Nat1end));
            Num2 := Natural'Value (Str (Nat2start .. Nat2end));
            From := Nat2end;
            Ok := True;
         else
            Ok := False;
         end if;
      else
         Ok := False;
      end if;
   exception
      when others =>
         Ok := False;
   end ParseTwoNat;

   procedure ParseColor (
         Str   : in     String;
         From  : in out Natural;
         Color : in out Color_Type;
         Ok    : in out Boolean)
   is
      Start  : Natural;
      Finish : Natural;
   begin
      Start  := FindStart (Str, From);
      if Start <= Str'Last then
         Finish := FindFinish (Str, Start);
         if CompareNoCase (Str (Start .. Finish), "White") then
            Color := White;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Black") then
            Color := Black;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Silver") then
            Color := Silver;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Light_Gray") then
            Color := Light_Gray;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Gray") then
            Color := Gray;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Dark_Gray") then
            Color := Dark_Gray;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Red") then
            Color := Red;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Dark_red") then
            Color := Dark_Red;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Green") then
            Color := Green;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Dark_green") then
            Color := Dark_Green;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Blue") then
            Color := Blue;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Dark_blue") then
            Color := Dark_Blue;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Yellow") then
            Color := Yellow;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Magenta") then
            Color := Magenta;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Cyan") then
            Color := Cyan;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Pink") then
            Color := Pink;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Orange") then
            Color := Orange;
            From  := Finish;
            Ok := True;
         elsif CompareNoCase (Str (Start .. Finish), "Desktop") then
            Color := GWindows.Colors.System_Color (
               GWindows.Colors.COLOR_DESKTOP);
            From  := Finish;
            Ok := True;
         else
            Ok := False;
         end if;
      else
         Ok := False;
      end if;
   exception
      when others =>
         Ok := False;
   end ParseColor;

   procedure ParseString (
         Str  : in     String;
         From : in out Natural;
         Res  : in out String;
         Len  : in out Natural;
         Ok   : in out Boolean)
   is
      Start     : Natural;
      Finish    : Natural;
      Delimiter : Character := ASCII.NUL;
   begin
      Start := FindStart (Str, From);
      if Start < Str'Last then
         if Str (Start) = '"' or Str (Start) = ''' then
            -- delimited
            Delimiter := Str (Start);
            Start     := Start + 1;
         end if;
         Finish := Start;
         loop
            if Finish >= Str'Last
            or else (Delimiter /= ASCII.NUL and Str (Finish) = Delimiter)
            or else (Delimiter  = ASCII.NUL and IsWhiteSpace (Str (Finish))) then
               exit;
            end if;
            Finish := Finish + 1;
         end loop;
         if Finish <= Str'Last then
            if Delimiter /= ASCII.NUL and Str (Finish) = Delimiter then
               Finish := Finish - 1;
            end if;
            if Delimiter = ASCII.NUL and Finish > Start and IsWhiteSpace (Str (Finish)) then
               Finish := Finish - 1;
            end if;
            Len := Finish - Start + 1;
            if Len > 0 and Len <= Res'Length then
               Res (Res'First .. Res'First + Len - 1) := Str (Start .. Finish);
            end if;
            From := Finish;
            Ok := True;
         else
            Ok := False;
         end if;
      else
         Ok := False;
      end if;
   exception
      when others =>
         Ok := False;
   end ParseString;

   procedure CreateParser (
         Parser       : in out Parser_Type;
         Term         : in out Terminal;
         ExtraOptions : in     Natural     := 0;
         LeadChar     : in     Character   := DEFAULT_LEAD_CHAR)
   is
   begin
      DeleteParser (Parser);
      Parser := new Parser_Record (ExtraOptions);
      Parser.ExtraOptions := ExtraOptions;
      Parser.LeadChar     := LeadChar;
      Parser.Addedcount   := 0;
      Parser.Term         := Term;
   end CreateParser;

   procedure DeleteParser (
         Parser : in out Parser_Type)
   is
   begin
      if Parser /= null then
         Free (Parser);
      end if;
   end DeleteParser;

   procedure AddOption (
         Parser : in out Parser_Type;
         Oname  : in     String;
         Omin   : in     Natural;
         Otype  : in     Option_Type;
         Added  :    out Boolean;
         Bool   : in     Access_Bool := Dummy_Bool'Access;
      Num1 :
      in Access_Nat  := Dummy_Num1'Access;
      Num2 :
      in Access_Nat  := Dummy_Num2'Access;
      Col :
      in Access_Col  := Dummy_Col'Access;
      Str :
      in Access_Str  := Dummy_Str'Access)
         is
      Len : Natural := Natural'Min (Oname'Length, MAX_OPTION_LENGTH);
   begin
      if Parser = null then
         Added := False;
         return;
      end if;
      if Parser.Addedcount < Parser.ExtraOptions then
         if Len > 0 then
            if Parser.LeadChar /= ASCII.NUL then
               for I in Oname'First .. Oname'First + Len - 1 loop
                  if Oname (I) = Parser.LeadChar then
                     Added := False;
                     return;
                  end if;
               end loop;
            end if;
            Parser.Addedoption (Parser.Addedcount + 1).Oname (1 .. Len)
               := Oname (Oname'First .. Oname'First + Len - 1);
         end if;
         Parser.Addedoption (Parser.Addedcount + 1).Olen  := Len;
         Parser.Addedoption (Parser.Addedcount + 1).Omin  := Natural'Min (Len, Omin);
         Parser.Addedoption (Parser.Addedcount + 1).Otype := Otype;
         Parser.Addedoption (Parser.Addedcount + 1).Bool  := Bool;
         Parser.Addedoption (Parser.Addedcount + 1).Num1  := Num1;
         Parser.Addedoption (Parser.Addedcount + 1).Num2  := Num2;
         Parser.Addedoption (Parser.Addedcount + 1).Col   := Col;
         Parser.Addedoption (Parser.Addedcount + 1).Str   := Str;
         Parser.Addedcount := Parser.Addedcount + 1;
         Added := True;
      else
         Added := False;
      end if;
   end AddOption;

   procedure Parse (
         Parser  : in out Parser_Type;
         Options : in     String;
         First   : in     Natural;
         Last    :    out Natural;
         Ok      :    out Boolean)
   is
      X       : Natural                         := 0;
      Y       : Natural                         := 0;
      Str     : String (1 .. MAX_OPTION_STRING);
      Strlen  : Natural                         := 0;
      Color   : Color_Type                      := Black;
      Start   : Natural;
      Finish  : Natural;
      Parsed  : Boolean;
   begin
      Ok := False;
      if Parser = null then
         return;
      end if;
      Start := FindStart (Options, First);
      loop
         Parsed := False;
         if Start > Options'Last then
            Last := Start;
            return;
         end if;
         if Start < Options'Last then
            if Parser.LeadChar /= ASCII.NUL then
               if Options (Start) = Parser.LeadChar then
                  Start := Start + 1;
               else
                  Last := Start;
                  return;
               end if;
            end if;
         else
            Last := Start;
            return;
         end if;
         Finish := FindFinish (Options, Start);
         -- first process any added options, since
         -- they override any built-in options
         for I in 1 .. Parser.Addedcount loop
            if Finish - Start + 1 >= Parser.Addedoption (I).Omin then
               case Parser.Addedoption (I).Otype is
                  when True_Option =>
                     if CompareNoCase (Options (Start .. Finish),
                           Parser.Addedoption (I).Oname (1 .. Parser.Addedoption (I).Olen))
                     then
                        Parser.Addedoption (I).Bool.all := True;
                        Parsed := True;
                     end if;
                  when False_Option =>
                     if CompareNoCase (Options (Start .. Finish),
                           Parser.Addedoption (I).Oname (1 .. Parser.Addedoption (I).Olen))
                     then
                        Parser.Addedoption (I).Bool.all := False;
                        Parsed := True;
                     end if;
                  when Bool_Option =>
                     if CompareNoCase (Options (Start .. Finish),
                           Parser.Addedoption (I).Oname (1 .. Parser.Addedoption (I).Olen))
                     then
                        Parser.Addedoption (I).Bool.all := True;
                        Parsed := True;
                     end if;
                  when Num_Option =>
                     if CompareNoCase (Options (Start .. Finish),
                           Parser.Addedoption (I).Oname (1 .. Parser.Addedoption (I).Olen),
                           StopAtEquals => True)
                     then
                        Start := FindPositionAfter (Options, Start, '=');
                        if Start <= Options'Last then
                           ParseNatural (
                              Options,
                              Start,
                              Parser.Addedoption (I).Num1.all,
                              Parsed);
                        end if;
                        if not Parsed then
                           Last := Start;
                           return;
                        end if;
                     end if;
                  when Dbl_Option =>
                     if CompareNoCase (Options (Start .. Finish),
                           Parser.Addedoption (I).Oname (1 .. Parser.Addedoption (I).Olen),
                           StopAtEquals => True)
                     then
                        Start := FindPositionAfter (Options, Start, '=');
                        if Start <= Options'Last then
                           ParseTwoNat (
                              Options,
                              Start,
                              Parser.Addedoption (I).Num1.all,
                              Parser.Addedoption (I).Num2.all,
                              Parsed);
                        end if;
                        if not Parsed then
                           Last := Start;
                           return;
                        end if;
                     end if;
                  when Col_Option =>
                     if CompareNoCase (Options (Start .. Finish),
                           Parser.Addedoption (I).Oname (1 .. Parser.Addedoption (I).Olen),
                           StopAtEquals => True)
                     then
                        Start := FindPositionAfter (Options, Start, '=');
                        if Start <= Options'Last then
                           ParseColor (
                              Options,
                              Start,
                              Parser.Addedoption (I).Col.all,
                              Parsed);
                        end if;
                        if not Parsed then
                           Last := Start;
                           return;
                        end if;
                     end if;
                  when Str_Option =>
                     if CompareNoCase (Options (Start .. Finish),
                           Parser.Addedoption (I).Oname (1 .. Parser.Addedoption (I).Olen),
                           StopAtEquals => True)
                     then
                        Start := FindPositionAfter (Options, Start, '=');
                        if Start <= Options'Last then
                           ParseString (Options, Start, Str, Strlen, Parsed);
                           if Strlen > 0
                           and Strlen <= Parser.Addedoption (I).Str'Length then
                              X := Parser.Addedoption (I).Str'First;
                              Parser.Addedoption (I).Str (X .. X + Strlen - 1)
                                 := Str (1 .. Strlen);
                           end if;
                           if Strlen < Parser.Addedoption (I).Str'Length then
                              Parser.Addedoption (I).Str (X + Strlen) := ASCII.NUL;
                           end if;
                        end if;
                        if not Parsed then
                           Last := Start;
                           return;
                        end if;
                     end if;
               end case;
            end if;
            if not Parsed then
               -- check for special case of "NoOption"
               if Parser.Addedoption (I).Otype = Bool_Option
                     and Finish - Start + 1 >= Parser.Addedoption (I).Omin + 2
                     and CompareNoCase (Options (Start .. Finish),
                     "No" & Parser.Addedoption (I).Oname (1 .. Parser.Addedoption (I).Olen))
               then
                  Parser.Addedoption (I).Bool.all := False;
                  Parsed := True;
               end if;
            end if;
            if Parsed then
               exit;
            end if;
         end loop;
         if not Parsed then
            -- not an added option, so try builtin options
            if Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "Top") then
               SetWindowOptions (Parser.Term, OnTop => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "NoTop") then
               SetWindowOptions (Parser.Term, OnTop => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 4
            and CompareNoCase (Options (Start .. Finish), "MainMenu") then
               SetMenuOptions (Parser.Term, MainMenu => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 6
            and CompareNoCase (Options (Start .. Finish), "NoMainMenu") then
               SetMenuOptions (Parser.Term, MainMenu => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 4
            and CompareNoCase (Options (Start .. Finish), "TransferMenu") then
               SetMenuOptions (Parser.Term, TransferMenu => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 6
            and CompareNoCase (Options (Start .. Finish), "NoTransferMenu") then
               SetMenuOptions (Parser.Term, TransferMenu => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "OptionMenu") then
               SetMenuOptions (Parser.Term, OptionMenu => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "NoOptionMenu") then
               SetMenuOptions (Parser.Term, OptionMenu => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "ContextMenu") then
               SetMenuOptions (Parser.Term, ContextMenu => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "NoContextMenu") then
               SetMenuOptions (Parser.Term, ContextMenu => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "AdvancedMenu") then
               SetMenuOptions (Parser.Term, AdvancedMenu => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "NoAdvancedMenu") then
               SetMenuOptions (Parser.Term, AdvancedMenu => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "Title") then
               SetTitleOptions (Parser.Term, Visible => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "NoTitle") then
               SetTitleOptions (Parser.Term, Visible => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 6
            and CompareNoCase (Options (Start .. Finish), "MouseSelect") then
               SetMouseOptions (Parser.Term, MouseSelects => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 8
            and CompareNoCase (Options (Start .. Finish), "NoMouseSelect") then
               SetMouseOptions (Parser.Term, MouseSelects => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 6
            and CompareNoCase (Options (Start .. Finish), "MouseCursor") then
               SetMouseOptions (Parser.Term, MouseCursor => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 8
            and CompareNoCase (Options (Start .. Finish), "NoMouseCursor") then
               SetMouseOptions (Parser.Term, MouseCursor => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 7
            and CompareNoCase (Options (Start .. Finish), "IgnoreCR") then
               SetOtherOptions (Parser.Term, IgnoreCR => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 7
            and CompareNoCase (Options (Start .. Finish), "IgnoreLF") then
               SetOtherOptions (Parser.Term, IgnoreLF => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "AutoCRonLF") then
               SetOtherOptions (Parser.Term, AutoCRonLF => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 7
            and CompareNoCase (Options (Start .. Finish), "NoAutoCRonLF") then
               SetOtherOptions (Parser.Term, AutoCRonLF => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "AutoLFonCR") then
               SetOtherOptions (Parser.Term, AutoLFonCR => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 7
            and CompareNoCase (Options (Start .. Finish), "NoAutoLFonCR") then
               SetOtherOptions (Parser.Term, AutoLFonCR => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "UseLFasEOL") then
               SetOtherOptions (Parser.Term, UseLFasEOL => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 7
            and CompareNoCase (Options (Start .. Finish), "NoUseLFasEOL") then
               SetOtherOptions (Parser.Term, UseLFasEOL => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "SysKeysEnabled") then
               SetOtherOptions (Parser.Term, SysKeysEnabled => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "NoSysKeysEnabled") then
               SetOtherOptions (Parser.Term, SysKeysEnabled => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "DeleteOnBS") then
               SetOtherOptions (Parser.Term, DeleteOnBS => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "NoDeleteOnBS") then
               SetOtherOptions (Parser.Term, DeleteOnBS => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 7
            and CompareNoCase (Options (Start .. Finish), "ScrollOnOutput") then
               SetScrollOptions (Parser.Term, OnOutput => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 9
            and CompareNoCase (Options (Start .. Finish), "NoScrollOnOutput") then
               SetScrollOptions (Parser.Term, OnOutput => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 4
            and CompareNoCase (Options (Start .. Finish), "HalftoneEnabled") then
               SetOtherOptions (Parser.Term, HalftoneEnabled => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 6
            and CompareNoCase (Options (Start .. Finish), "NoHalftoneEnabled") then
               SetOtherOptions (Parser.Term, HalftoneEnabled => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 4
            and CompareNoCase (Options (Start .. Finish), "DisplayControls") then
               SetOtherOptions (Parser.Term, DisplayControls => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 6
            and CompareNoCase (Options (Start .. Finish), "NoDisplayControls") then
               SetOtherOptions (Parser.Term, DisplayControls => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 4
            and CompareNoCase (Options (Start .. Finish), "Wrap") then
               SetEditingOptions (Parser.Term, Wrap => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 6
            and CompareNoCase (Options (Start .. Finish), "NoWrap") then
               SetEditingOptions (Parser.Term, Wrap => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 4
            and CompareNoCase (Options (Start .. Finish), "Echo") then
               SetEditingOptions (Parser.Term, Echo => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 6
            and CompareNoCase (Options (Start .. Finish), "NoEcho") then
               SetEditingOptions (Parser.Term, Echo => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 6
            and CompareNoCase (Options (Start .. Finish), "CursorVisible") then
               SetCursorOptions (Parser.Term, Visible => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 8
            and CompareNoCase (Options (Start .. Finish), "NoCursorVisible") then
               SetCursorOptions (Parser.Term, Visible => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 6
            and CompareNoCase (Options (Start .. Finish), "CursorFlashing") then
               SetCursorOptions (Parser.Term, Flashing => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 8
            and CompareNoCase (Options (Start .. Finish), "NoCursorFlashing") then
               SetCursorOptions (Parser.Term, Flashing => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "Insert") then
               SetEditingOptions (Parser.Term, Insert => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "NoInsert") then
               SetEditingOptions (Parser.Term, Insert => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "VTKeys") then
               SetKeyOptions (Parser.Term, VTKeys => Yes);
               Parsed := True;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "NoVTKeys") then
               SetKeyOptions (Parser.Term, VTKeys => No);
               Parsed := True;
            elsif Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "TabSize",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseNatural (Options, Start, X, Parsed);
               end if;
               if Parsed then
                  SetTabOptions (Parser.Term, X);
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "VirtualRows",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseNatural (Options, Start, X, Parsed);
               end if;
               if Parsed then
                  SetVirtualSize (Parser.Term, X);
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 2
            and CompareNoCase (Options (Start .. Finish), "FgColor",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseColor (Options, Start, Color, Parsed);
               end if;
               if Parsed then
                  SetFgColor (Parser.Term, Color);
                  SetBufferColors (Parser.Term, Current => Yes);
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 2
            and CompareNoCase (Options (Start .. Finish), "BgColor",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseColor (Options, Start, Color, Parsed);
               end if;
               if Parsed then
                  SetBgColor (Parser.Term, Color);
                  SetBufferColors (Parser.Term, Current => Yes);
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 2
            and CompareNoCase (Options (Start .. Finish), "CursorColor",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseColor (Options, Start, Color, Parsed);
               end if;
               if Parsed then
                  SetCursorColor (Parser.Term, Color);
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "FontSize",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseNatural (Options, Start, X, Parsed);
               end if;
               if Parsed then
                  SetFontByName (Parser.Term, Setsize => Yes, Size => X);
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "ScreenSize",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseTwoNat (Options, Start, X, Y, Parsed);
               end if;
               if Parsed then
                  SetScreenSize (Parser.Term, Columns => X, Rows => Y);
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "ViewSize",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseTwoNat (Options, Start, X, Y, Parsed);
               end if;
               if Parsed then
                  SetViewSize (Parser.Term, Columns => X, Rows => Y);
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "Position",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseTwoNat (Options, Start, X, Y, Parsed);
               end if;
               if Parsed then
                  SetWindowOptions (Parser.Term, Xcoord => X, Ycoord => Y);
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "FontName",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseString (Options, Start, Str, Strlen, Parsed);
               end if;
               if Parsed then
                  SetFontByName (Parser.Term,
                     SetName => Yes,
                     Font => Str (1 .. Strlen));
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 4
            and CompareNoCase (Options (Start .. Finish), "CharSet",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseString (Options, Start, Str, Strlen, Parsed);
               end if;
               if Parsed then
                  if CompareNoCase (Str (1 .. Strlen), "Ansi") then
                     SetFontByName (Parser.Term, SetChar => Yes, CharSet => GDO.ANSI_CHARSET);
                  elsif CompareNoCase (Str (1 .. Strlen), "Oem") then
                     SetFontByName (Parser.Term, SetChar => Yes, CharSet => GDO.OEM_CHARSET);
                  else
                     Parsed := False;
                  end if;
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 3
            and CompareNoCase (Options (Start .. Finish), "SetTitle",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseString (Options, Start, Str, Strlen, Parsed);
               end if;
               if Parsed then
                  SetTitleOptions (Parser.Term,
                     Set => Yes,
                     Title => Str (1 .. Strlen));
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 4
            and CompareNoCase (Options (Start .. Finish), "Ansi",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseString (Options, Start, Str, Strlen, Parsed);
               end if;
               if Parsed then
                  if CompareNoCase (Str (1 .. Strlen), "Input") then
                     SetAnsiOptions (Parser.Term, OnInput => Yes, OnOutput => No);
                  elsif CompareNoCase (Str (1 .. Strlen), "Output") then
                     SetAnsiOptions (Parser.Term, OnInput => No, OnOutput => Yes);
                  elsif CompareNoCase (Str (1 .. Strlen), "None") then
                     SetAnsiOptions (Parser.Term, OnInput => No, OnOutput => No);
                  elsif CompareNoCase (Str (1 .. Strlen), "Both") then
                     SetAnsiOptions (Parser.Term, OnInput => Yes, OnOutput => Yes);
                  else
                     Parsed := False;
                  end if;
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 4
            and CompareNoCase (Options (Start .. Finish), "Mode",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseString (Options, Start, Str, Strlen, Parsed);
               end if;
               if Parsed then
                  if CompareNoCase (Str (1 .. Strlen), "PC") then
                     SetAnsiOptions (Parser.Term, Mode => PC);
                  elsif CompareNoCase (Str (1 .. Strlen), "VT52") then
                     SetAnsiOptions (Parser.Term, Mode => VT52);
                  elsif CompareNoCase (Str (1 .. Strlen), "VT100") then
                     SetAnsiOptions (Parser.Term, Mode => VT100);
                  elsif CompareNoCase (Str (1 .. Strlen), "VT101") then
                     SetAnsiOptions (Parser.Term, Mode => VT101);
                  elsif CompareNoCase (Str (1 .. Strlen), "VT102") then
                     SetAnsiOptions (Parser.Term, Mode => VT102);
                  elsif CompareNoCase (Str (1 .. Strlen), "VT220") then
                     SetAnsiOptions (Parser.Term, Mode => VT220);
                  elsif CompareNoCase (Str (1 .. Strlen), "VT320") then
                     SetAnsiOptions (Parser.Term, Mode => VT320);
                  elsif CompareNoCase (Str (1 .. Strlen), "VT420") then
                     SetAnsiOptions (Parser.Term, Mode => VT420);
                  else
                     Parsed := False;
                  end if;
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 4
            and CompareNoCase (Options (Start .. Finish), "Sizing",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseString (Options, Start, Str, Strlen, Parsed);
               end if;
               if Parsed then
                  if CompareNoCase (Str (1 .. Strlen), "None") then
                     SetSizingOptions (Parser.Term, Sizing => No);
                  elsif CompareNoCase (Str (1 .. Strlen), "Screen") then
                     SetSizingOptions (Parser.Term, Sizing => Yes, Mode => Size_Screen);
                  elsif CompareNoCase (Str (1 .. Strlen), "View") then
                     SetSizingOptions (Parser.Term, Sizing => Yes, Mode => Size_View);
                  elsif CompareNoCase (Str (1 .. Strlen), "Font") then
                     SetSizingOptions (Parser.Term, Sizing => Yes, Mode => Size_Fonts);
                  else
                     Parsed := False;
                  end if;
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 7
            and CompareNoCase (Options (Start .. Finish), "Scrollbar",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseString (Options, Start, Str, Strlen, Parsed);
               end if;
               if Parsed then
                  if CompareNoCase (Str (1 .. Strlen), "None") then
                     SetScrollOptions (Parser.Term, Vertical => No, Horizontal => No);
                  elsif CompareNoCase (Str (1 .. Strlen), "Vertical") then
                     SetScrollOptions (Parser.Term, Vertical => Yes, Horizontal => No);
                  elsif CompareNoCase (Str (1 .. Strlen), "Horizontal") then
                     SetScrollOptions (Parser.Term, Vertical => No, Horizontal => Yes);
                  elsif CompareNoCase (Str (1 .. Strlen), "Both") then
                     SetScrollOptions (Parser.Term, Vertical => Yes, Horizontal => Yes);
                  else
                     Parsed := False;
                  end if;
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 6
            and CompareNoCase (Options (Start .. Finish), "Redraw",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseString (Options, Start, Str, Strlen, Parsed);
               end if;
               if Parsed then
                  if CompareNoCase (Str (1 .. Strlen), "None") then
                     SetOtherOptions (Parser.Term, RedrawPrevious => No, RedrawNext => No);
                  elsif CompareNoCase (Str (1 .. Strlen), "Prev") then
                     SetOtherOptions (Parser.Term, RedrawPrevious => Yes, RedrawNext => No);
                  elsif CompareNoCase (Str (1 .. Strlen), "Next") then
                     SetOtherOptions (Parser.Term, RedrawPrevious => No, RedrawNext => Yes);
                  elsif CompareNoCase (Str (1 .. Strlen), "Both") then
                     SetOtherOptions (Parser.Term, RedrawPrevious => Yes, RedrawNext => Yes);
                  else
                     Parsed := False;
                  end if;
               else
                  Last := Start;
                  return;
               end if;
            elsif Finish - Start + 1 >= 5
            and CompareNoCase (Options (Start .. Finish), "Close",
                               StopAtEquals => True) then
               Start := FindPositionAfter (Options, Start, '=');
               if Start <= Options'Last then
                  ParseString (Options, Start, Str, Strlen, Parsed);
               end if;
               if Parsed then
                  if CompareNoCase (Str (1 .. Strlen), "None") then
                     SetWindowOptions (Parser.Term,
                        CloseWindow => No,
                        CloseProgram => No);
                  elsif CompareNoCase (Str (1 .. Strlen), "Window") then
                     SetWindowOptions (Parser.Term,
                        CloseWindow => Yes,
                        CloseProgram => No);
                  elsif CompareNoCase (Str (1 .. Strlen), "Program") then
                     SetWindowOptions (Parser.Term,
                        CloseWindow => No,
                        CloseProgram => Yes);
                  else
                     Parsed := False;
                  end if;
               else
                  Last := Start;
                  return;
               end if;
            end if;
         end if;
         if Parsed then
            if Start <= Options'Last and then not IsWhiteSpace (Options (Start)) then
               Start := FindFinish (Options, Start);
            end if;
            Start := FindStart (Options, Start + 1);
            if Start > Options'Last then
               Ok := True;
               return;
            end if;
         else
            Last := Start;
            return;
         end if;
      end loop;
   end Parse;


end Terminal_Emulator.Option_Parser;
