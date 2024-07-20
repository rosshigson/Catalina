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

with Interfaces.C;
with Win32;
package body Ansi_Parser is


   -- CSI : return an 8 bit or 7 bit CSI
   function CSI (EightBit : in Boolean)
      return String
   is
   begin
      if EightBit then
         return Ansi_Parser.CSI_8BIT;
      else
         return Ansi_Parser.CSI_7BIT;
      end if;
   end CSI;


   -- DCS : return an 8 bit or 7 bit DCS
   function DCS (EightBit : in Boolean)
      return String
   is
   begin
      if EightBit then
         return Ansi_Parser.DCS_8BIT;
      else
         return Ansi_Parser.DCS_7BIT;
      end if;
   end DCS;


   -- SS2 : return an 8 bit or 7 bit SS2
   function SS2 (EightBit : in Boolean)
      return String
   is
   begin
      if EightBit then
         return Ansi_Parser.SS2_8BIT;
      else
         return Ansi_Parser.SS2_7BIT;
      end if;
   end SS2;


   -- SS3 : return an 8 bit or 7 bit SS3
   function SS3 (EightBit : in Boolean)
      return String
   is
   begin
      if EightBit then
         return Ansi_Parser.SS3_8BIT;
      else
         return Ansi_Parser.SS3_7BIT;
      end if;
   end SS3;


   -- ST : return an 8 bit or 7 bit ST
   function ST (EightBit : in Boolean)
      return String
   is
   begin
      if EightBit then
         return Ansi_Parser.ST_8BIT;
      else
         return Ansi_Parser.ST_7BIT;
      end if;
   end ST;


   function  InitializeParser return Access_Parser_Structure is
   begin
      return Processor.InitializeParser;
   end InitializeParser;


   procedure ResetParser (ParseStruct : in Access_Parser_Structure) is
   begin
      Processor.ResetParser (ParseStruct);
   end ResetParser;


   procedure FlushParserBuffer (ParseStruct : in Access_Parser_Structure) is
   begin
      Processor.FlushParserBuffer (ParseStruct);
   end FlushParserBuffer;


   procedure SwitchParserMode (ParseStruct : in Access_Parser_Structure;
                               Mode        : Parser_Mode) is
   begin
      Processor.SwitchParserMode (ParseStruct, Mode);
   end SwitchParserMode;


   procedure ProcessSKIP (ParseStruct : in Access_Parser_Structure) is
   begin
      Processor.ProcessSKIP (ParseStruct);
   end ProcessSKIP;


   procedure ProcessAnsi (
         pSesptr : Access_Parser_Result;
         iCode   : MIT_Defs.PA_INT;
         args    : MIT_Defs.LPARGS) is
      use Interfaces.C;
   begin
      if (pSesptr /= null)
      and then ((pSesptr.Count >= 0)
      and (pSesptr.Count < (MAX_RESULTS  - 1))) then
         pSesptr.Count := pSesptr.Count + 1;
         if (iCode < 0) then
            pSesptr.Result (pSesptr.Count).Code := DO_ERROR;
         elsif (iCode < 256) then
            pSesptr.Result (pSesptr.Count).Code := DO_ECHO;
            pSesptr.Result (pSesptr.Count).Char := Character'Val (iCode);
         else
            pSesptr.Result (pSesptr.Count).Code := Integer (iCode);
            for I in 0 .. MAX_ARGUMENTS - 1 loop
               pSesptr.Result (pSesptr.Count).Arg (I) := Integer (args (I));
            end loop;
         end if;
      end if;
   end ProcessAnsi;


   procedure ParseChar (ParseStruct : in Access_Parser_Structure;
                        Result      : in Access_Parser_Result;
                        Char        : in Character)
   is
      Ch : aliased Win32.CHAR;
   begin
     Result.Count := 0;
     Ch := Interfaces.C.CHAR (Char);
     Processor.ParseAnsiData (ParseStruct, Result, Ch'Unchecked_Access, 1);
   end ParseChar;


   -- IntsToAddress : convert a pointer encoded in two
   --                 integers into an address.
   function IntsToAddress (Int1 : in Integer;
                           Int2 : in Integer)
         return System.Address
   is
      Union : MIT_Defs.Ints_And_Address;
   begin
      Union := (which => MIT_Defs.Ints,
                Ints  => (MIT_Defs.PA_INT (Int1),
                          MIT_Defs.PA_INT (Int2)));
      return Union.Addr;
   end IntsToAddress;

end Ansi_Parser;
