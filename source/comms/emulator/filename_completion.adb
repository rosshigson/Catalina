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

with System;
with Interfaces.C;

with Ada.Unchecked_Deallocation;

with Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed;

with Win32;
with Win32.Winnt;
with Win32.Winbase;

package body Filename_Completion is

   use Ada.Strings.Maps.Constants;
   use Ada.Strings.Fixed;

   package IC renames Interfaces.C;

   use type IC.Unsigned_Long;
   use type Win32.BOOL;
   use type System.Address;

   procedure Free is
   new
      Ada.Unchecked_Deallocation (Completion_Record, Completion_Handle);


   procedure Free is
   new
      Ada.Unchecked_Deallocation (Completion_Entry, Completion_Access);


   -- ExtnInList : see if filename extension matches one in the list.
   --              The list is something like ".ex1;.ex2"
   function Extninlist (
         Filename : in     String;
         Extnlist : in     String  )
     return Boolean is
      Extnstart : Natural;
      Extnlen   : Natural;
      Foundextn : Boolean;
      Liststart : Natural;
      Listlen   : Natural;
   begin
      -- get extension from filename
      Extnlen := 0;
      Extnstart := Filename'Last;
      Foundextn := False;
      while Extnstart > Filename'First loop
         Extnlen := Extnlen + 1;
         if Filename (Extnstart) = '.' then
            Foundextn := True;
            exit;
         else
            Extnstart := Extnstart - 1;
         end if;
      end loop;
      if Foundextn then
         -- compare against all extensions in list
         Liststart := Extnlist'First;
         Listlen   := 0;
         while Liststart < Extnlist'Last loop
            -- get next extension from list
            while Liststart + Listlen < Extnlist'Last loop
               if Extnlist (Liststart + Listlen) = ';' then
                  exit;
               else
                  Listlen := Listlen + 1;
               end if;
            end loop;
            if Listlen > 0 and Extnlen = Listlen then
               if Translate (Filename (Extnstart .. Extnstart + Extnlen - 1), Lower_Case_Map)
                     = Translate (Extnlist (Liststart .. Liststart + Listlen - 1), Lower_Case_Map) then
                  return True;
               end if;
            end if;
            Liststart := Liststart + Listlen + 1;
         end loop;
         return False;
      else
         return False;
      end if;
   end Extninlist;

   procedure First_Completion (
         Handle      : in out Completion_Handle;
         Pathlist    : in     String;
         Extnlist    : in     String;
         Partialname : in     String;
         Filename    : in out String;
         Filenamelen : in out Natural;
         Success     : in out Boolean;
         Includepath : in     Boolean           := False;
         Returndirs  : in     Boolean           := False  )
   is
      Count1 : Natural;
      Count2 : Natural;
   begin
      if Handle /= null then
         Finish_Completion (Handle);
      end if;
      Handle := new Completion_Record;
      -- remove any "quotes" from pathlist and save in completion record
      Count1 := 0;
      Count2 := 0;
      loop
         if Count1 >= Pathlist'Length
               or Count2 >= MAX_FILENAME_LENGTH then
            exit;
         elsif Pathlist (Pathlist'First + Count1) /= '"' then
            Handle.Pathlist (Count2 + 1) := Pathlist (Pathlist'First + Count1);
            Count2 := Count2 + 1;
         end if;
         Count1 := Count1 + 1;
      end loop;
      Handle.Pathlen  := Count2;
      -- remove any "quotes" from extnlist and save in completion record
      Count1 := 0;
      Count2 := 0;
      loop
         if Count1 >= Extnlist'Length or Count2 >= MAX_FILENAME_LENGTH then
            exit;
         elsif Extnlist (Extnlist'First + Count1) /= '"' then
            Handle.Extnlist (Count2 + 1) := Extnlist (Extnlist'First + Count1);
            Count2 := Count2 + 1;
         end if;
         Count1 := Count1 + 1;
      end loop;
      Handle.Extnlen  := Count2;
      -- remove any "quotes" from partial and save in completion record
      Count1 := 0;
      Count2 := 0;
      loop
         if Count1 >= Partialname'Length or Count2 >= MAX_FILENAME_LENGTH then
            exit;
         elsif Partialname (Partialname'First + Count1) /= '"' then
            Handle.Partial (Count2 + 1) := Partialname (Partialname'First + Count1);
            Count2 := Count2 + 1;
         end if;
         Count1 := Count1 + 1;
      end loop;
      Handle.Partlen  := Count2;
      Handle.Inclpath := Includepath;
      Handle.Rtndirs  := Returndirs;
      Next_Completion (Handle, Filename, Filenamelen, Success);
   exception
      when others =>
         Success := False;
   end First_Completion;

   procedure Next_Completion (
         Handle      : in out Completion_Handle;
         Filename    : in out String;
         Filenamelen : in out Natural;
         Success     : in out Boolean            ) is
      Pathok     : Boolean;
      Found      : Boolean;
      FindInfo   : aliased Win32.Winbase.Win32_Find_Dataa;
      Buffer     : String (1 .. 260);
      Bufflen    : Natural;
      Count      : Natural;
      Count2     : Natural;
      Result     : Win32.BOOL;
      Foundspace : Boolean;
      Completion : Completion_Access;
      CSpecLen   : Natural;
   begin
      if Handle /= null then
         if Handle.Completions /= null and then Handle.Completions.Next /= null then
            Handle.Completions := Handle.Completions.Next;
            Filenamelen := Handle.Completions.Filenamelen;
            Filename (Filename'First .. Filename'First + Filenamelen - 1) := 
               Handle.Completions.Filename (1 .. Filenamelen);
            Success := True;
         else
            Pathok := True;
            Found  := False;
            loop
               exit when Found or not Pathok;
               if Handle.FfHandle = Win32.Winbase.INVALID_HANDLE_VALUE then
                  Result := Win32.TRUE;
                  -- set up the next path from the path list as our spec
                  if Handle.Pathpos <= Handle.Pathlen then
                     Count := 0;
                     while Handle.Pathpos + Count <= Handle.Pathlen
                           and then Handle.Pathlist (Handle.Pathpos + Count) /= ';' loop
                        Handle.Spec (Count + 1) := Handle.Pathlist (Handle.Pathpos + Count);
                        Count := Count + 1;
                     end loop;
                     if Count > 0 then
                        -- if the path does not include a trailing '\' then add one
                        if Handle.Spec (Count) = '\' then
                           Handle.Speclen := Count;
                           Handle.Pathpos := Handle.Pathpos + Count;
                        else
                           if Count < MAX_FILENAME_LENGTH - 1 then
                              Handle.Spec (Count + 1) := '\';
                              Handle.Speclen := Count + 1;
                              Handle.Pathpos := Handle.Pathpos + Count + 1;
                           else
                              Handle.Speclen := 0;
                              Pathok := False;
                              Result := Win32.FALSE;
                           end if;
                        end if;
                     else
                        -- null path in pathlist
                        Handle.Speclen := 0;
                        Pathok := False;
                        Result := Win32.FALSE;
                     end if;
                  else
                     -- run out of paths in pathlist
                     Pathok := False;
                     Result := Win32.FALSE;
                  end if;
                  if Pathok then
                     if Handle.Speclen + Handle.Partlen  + 1 < MAX_FILENAME_LENGTH then
                        -- add the partial filename to the spec
                        Count := 0;
                        while Count < Handle.Partlen loop
                           Handle.Spec (Handle.Speclen + Count + 1) := Handle.Partial (Count + 1);
                           Count := Count + 1;
                        end loop;
                        -- if the partial does not include a trailing '*' then add one
                        if Handle.Spec (Handle.Speclen + Count) /= '*' then
                           Handle.Spec (Handle.Speclen + Count + 1) := '*';
                           CSpecLen := Handle.Speclen + Count + 1;
                        else
                           CSpecLen := Handle.Speclen + Count;
                        end if;
                        declare
                           CSpec : aliased IC.Char_Array := IC.TO_C (Handle.Spec (1 .. CSpecLen));
                        begin
                           Handle.FfHandle := Win32.Winbase.FindFirstFile (
                              CSpec (CSpec'First)'Unchecked_Access,
                              FindInfo'Unchecked_Access);
                        end;
                        if Handle.FfHandle /= Win32.Winbase.INVALID_HANDLE_VALUE then
                           Result := Win32.TRUE;
                        else
                           Result := Win32.FALSE;
                        end if;
                     else
                        Result := Win32.FALSE;
                     end if;
                  end if;
               else
                  Result := Win32.Winbase.FindNextFile (Handle.FfHandle, FindInfo'Unchecked_Access);
                  if Result = Win32.FALSE then
                     Result := Win32.Winbase.FindClose (Handle.FfHandle);
                     Handle.FfHandle := Win32.Winbase.INVALID_HANDLE_VALUE;
                     Result := Win32.FALSE;
                  end if;
               end if;
               if Result /= Win32.FALSE then
                  loop
                     Count := 0;
                     while Character (FindInfo.Cfilename (Count)) /=  Ascii.Nul and Count <= 259 loop
                        Buffer (Count + 1) := Character (FindInfo.Cfilename (Count));
                        Count := Count + 1;
                     end loop;
                     Bufflen := Count;
                     -- make sure we haven't found "." or ".."
                     if ((Bufflen /= 1 or else Buffer (1 .. 1) /= ".")
                           and (Bufflen /= 2 or else Buffer (1 .. 2) /= "..")) then
                        if Handle.Rtndirs
                              and (FindInfo.dwFileAttributes and Win32.WinNT.FILE_ATTRIBUTE_DIRECTORY) /= 0 then
                           -- found a directory - return it
                           exit;
                        end if;
                        if Handle.Extnlen = 0 then
                           -- no extension list, so done
                           exit;
                        else
                           -- done if extension in extension list
                           if Extninlist (Buffer (1 .. Count), Handle.Extnlist (1 .. Handle.Extnlen)) then
                              -- extension matches extension list, so done
                              exit;
                           end if;
                        end if;
                     end if;
                     Result := Win32.Winbase.FindNextFile (Handle.FfHandle, FindInfo'Unchecked_Access);
                     if Result = Win32.FALSE then
                        Result := Win32.Winbase.FindClose (Handle.FfHandle);
                        Handle.FfHandle := Win32.Winbase.INVALID_HANDLE_VALUE;
                        Result := Win32.FALSE;
                        exit;
                     end if;
                  end loop;
               end if;
               if Result /= Win32.FALSE then
                  -- if there are spaces in the name, return the result "quoted"
                  Foundspace := False;
                  for I in 1 .. Bufflen loop
                     if Buffer (I) = ' ' then
                        Foundspace := True;
                        exit;
                     end if;
                  end loop;
                  if Foundspace  and Bufflen <= MAX_FILENAME_LENGTH - 2 then
                     Buffer (Bufflen + 2) := '"';
                     for I in reverse 1 .. Bufflen loop
                        Buffer (I + 1) := Buffer (I);
                     end loop;
                     Buffer (1) := '"';
                     Bufflen := Bufflen + 2;
                  end if;
                  if (FindInfo.dwFileAttributes and Win32.WinNT.FILE_ATTRIBUTE_DIRECTORY) /= 0 then
                     -- follow dir names by "\" if not already - do not recurse into subdirs
                     if Bufflen < MAX_FILENAME_LENGTH and then Buffer (Bufflen) /= '\' then
                        Buffer (Bufflen + 1) := '\';
                        Bufflen := Bufflen + 1;
                     end if;
                  end if;
                  Count := 0;
                  if Handle.Inclpath then
                     -- if there are spaces in the spec, return it "quoted"
                     Foundspace := False;
                     for I in 1 .. Handle.Speclen loop
                        if Handle.Spec (I) = ' ' then
                           Foundspace := True;
                           exit;
                        end if;
                     end loop;
                     if Foundspace then
                        if Filename'Length > 0 then
                           Filename (Filename'First) := '"';
                           Count := 1;
                        end if;
                        loop
                           exit when Count >= Filename'Length or Count > Handle.Speclen;
                           Filename (Filename'First + Count) := Handle.Spec (Count);
                           Count := Count + 1;
                        end loop;
                        if Count < Filename'Length then
                           Filename (Filename'First + Count) := '"';
                           Count := Count + 1;
                        end if;
                     else
                        loop
                           exit when Count >= Filename'Length or Count >= Handle.Speclen;
                           Filename (Filename'First + Count) := Handle.Spec (Count + 1);
                           Count := Count + 1;
                        end loop;
                     end if;
                  end if;
                  Count2 := 0;
                  loop
                     exit when Count + Count2 >= Filename'Length or Count2 >= Bufflen;
                     Filename (Filename'First + Count + Count2) := Buffer (Count2 + 1);
                     Count2 := Count2 + 1;
                  end loop;
                  Filenamelen := Count + Count2;
                  Found := True;
               end if;
            end loop;
            Success := Found;
            if Success then
               Completion := new Completion_Entry;
               Completion.Filenamelen := Filenamelen;
               Completion.Filename (1 .. Filenamelen) := 
                  Filename (Filename'First .. Filename'First + Filenamelen - 1);
               Completion.Prior := Handle.Completions;
               if Handle.Completions /= null then
                  Handle.Completions.Next := Completion;
               end if;
               Handle.Completions := Completion;
            end if;
         end if;
      end if;
   exception
      when others =>
         Success := False;
   end Next_Completion;

   procedure Prior_Completion (
         Handle      : in out Completion_Handle;
         Filename    : in out String;
         Filenamelen : in out Natural;
         Success     : in out Boolean            ) is
   begin
      if Handle /= null then
         if Handle.Completions /= null and then Handle.Completions.Prior /= null then
            Handle.Completions := Handle.Completions.Prior;
            Filenamelen := Handle.Completions.Filenamelen;
            Filename (Filename'First .. Filename'First + Filenamelen - 1) := 
               Handle.Completions.Filename (1 .. Filenamelen);
            Success := True;
         else
            Success := False;
         end if;
      else
         Success := False;
      end if;
   exception
      when others =>
         Success := False;
   end Prior_Completion;


   procedure Finish_Completion (
         Handle : in out Completion_Handle ) is
      Result     : Win32.BOOL;
      Completion : Completion_Access;
   begin
      if Handle /= null then
         if Handle.FfHandle /= Win32.Winbase.INVALID_HANDLE_VALUE then
            Result := Win32.Winbase.FindClose (Handle.FfHandle);
            if Handle.Completions /= null then
               while Handle.Completions.Next /= null loop
                  Completion := Handle.Completions.Next;
                  Handle.Completions.Next := Handle.Completions.Next.Next;
                  Free (Completion);
               end loop;
               while Handle.Completions.Prior /= null loop
                  Completion := Handle.Completions.Prior;
                  Handle.Completions.Prior := Handle.Completions.Prior.Prior;
                  Free (Completion);
               end loop;
               Free (Handle.Completions);
            end if;
         end if;
         Free (Handle);
      end if;
   exception
      when others =>
         null;
   end Finish_Completion;

   function Valid_Completion (
         Handle : in     Completion_Handle )
     return Boolean is
   begin
      return (Handle /= null);
   end Valid_Completion;

end Filename_Completion;

