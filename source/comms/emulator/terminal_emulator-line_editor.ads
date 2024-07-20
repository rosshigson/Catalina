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

with Win32_Support;
with Terminal_Emulator;

generic

   with procedure GetDir (
         Dir    : in out String;
         DirLen : in out Natural);

   with procedure GetPath (
         Path    : in out String;
         PathLen : in out Natural);

   with procedure GetExtn (
         Extn    : in out String;
         ExtnLen : in out Natural);

package Terminal_Emulator.Line_Editor is

   use Terminal_Emulator;
   package WS renames Win32_Support;

   MAX_LINE_LEN            : constant := 1024;

   DEFAULT_HIST_SIZE       : constant := 20;

   DEFAULT_ERASELINE_CHAR  : constant Character := ASCII.ESC;

   DEFAULT_COMPLETION_CHAR : constant Character := ASCII.HT;


   type Command_Line_Editor is private;


   procedure New_Editor (
         Editor         : in out Command_Line_Editor;
         Term           : in     Terminal;
         ProcessID      : in     WS.Win32_ProcessID := 0;
         Insert         : in     Boolean            := True;
         EraseLineChar  : in     Character          := DEFAULT_ERASELINE_CHAR;
         Completion     : in     Boolean            := True;
         CompletionChar : in     Character          := DEFAULT_COMPLETION_CHAR;
         History        : in     Boolean            := True;
         HistMax        : in     Natural            := DEFAULT_HIST_SIZE);


   procedure Gethistory (
         Editor : in out Command_Line_Editor;
         Line   : in out String;
         Length : in out Natural;
         Number : in     Natural  := 0 );


   procedure Edit (
         Editor   : in out Command_Line_Editor;
         Line     : in out String;
         Length   : in out Natural;
         TermChar : in out Character);


   procedure Close_Editor (
         Editor : in out Command_Line_Editor);


private

   type History_Command is
      record
         Line   : String (1 .. MAX_LINE_LEN);
         Length : Natural;
      end record;

   type History_Buffer is array (Natural range <>) of History_Command;

   type History_Access is access History_Buffer;

   type Editor_Record is
      record
         Term           : Terminal;
         ProcessID      : WS.Win32_ProcessID := 0;
         Insert         : Boolean            := False;
         EraseLineChar  : Character          := DEFAULT_ERASELINE_CHAR;
         Completion     : Boolean            := False;
         CompletionChar : Character          := DEFAULT_COMPLETION_CHAR;
         History        : Boolean            := False;
         HistMax        : Natural            := 0;
         HistTop        : Natural            := 0;
         HistPos        : Natural            := 0;
         HistSize       : Natural            := 0;
         Hist           : History_Access;
         MaxCols        : Natural            := 0;
         MaxRows        : Natural            := 0;
      end record;

   type Command_Line_Editor is access Editor_Record;

end Terminal_Emulator.Line_Editor;
