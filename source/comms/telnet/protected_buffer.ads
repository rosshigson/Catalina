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
generic

   type Element_Type  is private;

   type Element_Index is range <>;

   type Element_Array is array (Element_Index range <>) of Element_Type;

   BUFFER_SIZE : Element_Index;

package Protected_Buffer is
   
   Buffer_Error : exception;

   protected type Buffer_Type
   is

      procedure Reset (
            Raise_Errors_As_Exceptions : in     Boolean := False);

      function Empty
         return Boolean; 

      function Full
         return Boolean;

      function Count 
         return Element_Index;

      function Space
         return Element_Index; 

      procedure Put_First (
            Element  : in     Element_Type); 

      procedure Put_First (
            Elements : in     Element_Array); 
   
      procedure Put_Last (
            Element  : in     Element_Type); 

      procedure Put_Last (
            Elements : in     Element_Array); 
   
      procedure Get_First (
            Element  : in out Element_Type); 
   
      procedure Get_First (
            Elements : in out Element_Array;
            Count    : in out Element_Index);
         
      procedure Get_Last (
            Element  : in out Element_Type); 

      procedure Get_Last (
            Elements : in out Element_Array;
            Count    : in out Element_Index);

      function Peek (
            Offset  : in     Element_Index)
         return Element_Type;

   private
      Guarantee : Boolean := False;
      Buffer    : Element_Array (0 .. BUFFER_SIZE - 1);  
      Size      : Element_Index := 0;  
      Head      : Element_Index := 0;  
      Tail      : Element_Index := 0;  

   end Buffer_Type;

end Protected_Buffer;
