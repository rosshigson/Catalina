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

with Win32.Winnt;
with Win32.Winbase;

package Filename_Completion is

   MAX_FILENAME_LENGTH : constant := 1024;

   type Completion_Handle is private;

   procedure First_Completion (
         Handle      : in out Completion_Handle;
         Pathlist    : in     String;
         Extnlist    : in     String;
         Partialname : in     String;
         Filename    : in out String;
         Filenamelen : in out Natural;
         Success     : in out Boolean;
         Includepath : in     Boolean           := False;
         Returndirs  : in     Boolean           := False  );

   procedure Next_Completion (
         Handle      : in out Completion_Handle;
         Filename    : in out String;
         Filenamelen : in out Natural;
         Success     : in out Boolean            );

   procedure Prior_Completion (
         Handle      : in out Completion_Handle;
         Filename    : in out String;
         Filenamelen : in out Natural;
         Success     : in out Boolean            );

   procedure Finish_Completion (
         Handle : in out Completion_Handle );

   function Valid_Completion (
         Handle : in     Completion_Handle )
     return Boolean;

private

   type Completion_Entry;

   type Completion_Access is access Completion_Entry;

   type Completion_Entry is
      record
         Filename    : String (1 .. MAX_FILENAME_LENGTH);
         Filenamelen : Natural;
         Next        : Completion_Access        := null;
         Prior       : Completion_Access        := null;
      end record;

   type Completion_Record is
      record
         Pathlist    : String (1 .. MAX_FILENAME_LENGTH);
         Pathlen     : Natural                            := 0;
         Extnlist    : String (1 .. MAX_FILENAME_LENGTH);
         Extnlen     : Natural                            := 0;
         Pathpos     : Natural                            := 1;
         Partial     : String (1 .. MAX_FILENAME_LENGTH);
         Partlen     : Natural                            := 0;
         Spec        : String (1 .. MAX_FILENAME_LENGTH);
         Speclen     : Natural                            := 0;
         FfHandle    : Win32.Winnt.HANDLE                 := Win32.Winbase.INVALID_HANDLE_VALUE;
         Inclpath    : Boolean                            := False;
         Rtndirs     : Boolean                            := False;
         Completions : Completion_Access                  := null;
      end record;

   type Completion_Handle is access Completion_Record;

end Filename_Completion;
