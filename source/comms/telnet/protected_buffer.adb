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
package body Protected_Buffer is

   -----------------
   -- Buffer_Type --
   -----------------

   protected body Buffer_Type is

      -----------
      -- Count --
      -----------

      function Count 
         return Element_Index is
      begin
         return Size;
      end Count;

      -----------
      -- Empty --
      -----------

      function Empty
         return Boolean
      is
      begin
         return Size = 0;
      end Empty;

      ----------
      -- Full --
      ----------

      function Full
         return Boolean
      is
      begin
         return Size = BUFFER_SIZE;
      end Full;

      ---------------
      -- Get_First --
      ---------------

      procedure Get_First (
            Element : in out Element_Type)
      is
      begin
         if not Empty then
            Element := Buffer (Head);
            Head := (Head + 1) mod BUFFER_SIZE;
            Size := Size - 1;
         else
            if Guarantee then
               raise Buffer_Error;
            end if;
         end if;
      end Get_First;

      --------------
      -- Get_Last --
      --------------

      procedure Get_Last (
            Element : in out Element_Type)
      is
      begin
         if not Empty then
            Tail := (Tail + BUFFER_SIZE - 1) mod BUFFER_SIZE;
            Element := Buffer (Tail);
            Size := Size - 1;
         else
            if Guarantee then
               raise Buffer_Error;
            end if;
         end if;
      end Get_Last;

      ---------------
      -- Get_First --
      ---------------

      procedure Get_First (
            Elements : in out Element_Array;
            Count    : in out Element_Index)
      is
      begin
         Count := 0;
         if Size > 0 then
            declare
               Max    : Element_Index := Element_Index'Min (Size, Elements'Length);
               Result : Element_Array (0 .. Max - 1);
            begin
               for i in Result'Range loop
                  Result (i) := Buffer (Head);
                  Head  := (Head + 1) mod BUFFER_SIZE;
                  Size  := Size - 1;
                  Count := Count + 1;
               end loop;
               Elements (Elements'First .. Elements'First + Max - 1) := Result;
            end;
         end if;
      end Get_First;

      --------------
      -- Get_Last --
      --------------

      procedure Get_Last (
            Elements : in out Element_Array;
            Count    : in out Element_Index)
      is
      begin
         Count := 0;
         if Size > 0 then
            declare
               Max    : Element_Index := Element_Index'Min (Size, Elements'Length);
               Result : Element_Array (0 .. Max - 1);
            begin
               for i in Result'Range loop
                  Tail  := (Tail + BUFFER_SIZE - 1) mod BUFFER_SIZE;
                  Result (i) := Buffer (Tail);
                  Size  := Size - 1;
                  Count := Count + 1;
               end loop;
               Elements (Elements'First .. Elements'First + Max - 1) := Result;
            end;
         end if;
      end Get_Last;

      -----------
      -- Space --
      -----------

      function Space
         return Element_Index
      is
      begin
         return BUFFER_SIZE - Size;
      end Space;

      --------------
      -- Put_Last --
      --------------

      procedure Put_Last (
            Element  : in     Element_Type)
      is
      begin
         if not Full then
            Buffer (Tail) := Element;
            Tail := (Tail + 1) mod BUFFER_SIZE;
            Size := Size + 1;
         else
            if Guarantee then
               raise Buffer_Error;
            end if;
         end if;
      end Put_Last;

      --------------
      -- Put_Last --
      --------------

      procedure Put_Last (
            Elements : in     Element_Array)
      is
      begin
         if Space >= Elements'Length then
            for i in Elements'Range loop
               Put_Last (Elements (i));
            end loop;
         else
            if Guarantee then
               raise Buffer_Error;
            end if;
         end if;
      end Put_Last;

      ---------------
      -- Put_First --
      ---------------

      procedure Put_First (
            Element  : in     Element_Type)
      is
      begin
         if not Full then
            Head := (Head + BUFFER_SIZE - 1) mod BUFFER_SIZE;
            Buffer (Head) := Element;
            Size := Size + 1;
         else
            if Guarantee then
               raise Buffer_Error;
            end if;
         end if;
      end Put_First;

      ---------------
      -- Put_First --
      ---------------

      procedure Put_First (
            Elements : in     Element_Array)
      is
      begin
         if Space >= Elements'Length then
            for i in Elements'Range loop
               Put_First (Elements (i));
            end loop;
         else
            if Guarantee then
               raise Buffer_Error;
            end if;
         end if;
      end Put_First;

      --------------
      -- Get_Copy --
      --------------

      function Peek (
            Offset  : in     Element_Index)
         return Element_Type
      is
      begin
         if Offset < Size then
            return Buffer ((Head + Offset) mod BUFFER_SIZE);
         else
            raise Buffer_Error;
         end if;
      end;

      -----------
      -- Reset --
      -----------

      procedure Reset (
            Raise_Errors_As_Exceptions : in     Boolean := False) 
      is
      begin
         Guarantee := Raise_Errors_As_Exceptions;
         Size      := 0;
         Head      := 0;
         Tail      := 0;
      end Reset;

   end Buffer_Type;

end Protected_Buffer;

