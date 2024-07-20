-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 1.9                                   --
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
with Telnet_Types;
with Telnet_Terminal;

-- **************************  USER SPECIFICATION  ****************************
--
-- This package provides subprograms to process (at the APL level) data 
-- input to TELNET relayed from the remote TELNET.
--
-- **************************************************************************

package Transport_To_Terminal  is

   use Telnet_Types;
   use Telnet_Terminal;


   function There_Is_Transport_Input  (
         VT    : in     Virtual_Terminal)
      return Boolean;
   -- ************************  USER SPECIFICATION  ****************************
   -- 
   -- This function returns true if there is data input available from the
   -- transport layer.
   -----------------------------------------------------------------------------


   function There_Is_Transport_Message  (
         VT    : in     Virtual_Terminal)
      return Boolean;
   -- ************************  USER SPECIFICATION  ****************************
   -- 
   -- This function returns true if there is a message available from the
   -- transport layer.
   -----------------------------------------------------------------------------
      

   procedure Get_Transport_Input (
         VT               : in out Virtual_Terminal;
         Char             :    out Eight_Bits; 
         Control_Function :    out Boolean;        
         Urgent           :    out Boolean); 
   -- ************************  USER SPECIFICATION  ****************************
   -- 
   -- This procedure returns a character sent from the transport layer and 
   -- indicates whether it is to be interpreted as a control function.
   -----------------------------------------------------------------------------


   procedure Get_Transport_Message (
         VT      : in out Virtual_Terminal;
         Message :    out Buffer_Area;
         Size    :    out Buffer_Index);
   -- ************************  USER SPECIFICATION  ****************************
   -- 
   -- This procedure returns a message from the transport layer.
   -----------------------------------------------------------------------------

         
   procedure Process_Standard_Control_Function (
         VT     : in out Virtual_Terminal;
         Char   : in     Eight_Bits; 
         Urgent : in     Boolean); 
   -- ************************  USER SPECIFICATION  ****************************
   -- 
   -- This procedure processes a control function which was received from
   -- the transport layer.
   -----------------------------------------------------------------------------


   procedure Output_To_Terminal (
         VT   : in out Virtual_Terminal;
         Char : in     Eight_Bits); 
   -- ************************  USER SPECIFICATION  ****************************
   -- 
   -- This routine writes a character to the NVT printer.
   -----------------------------------------------------------------------------

   function Terminal_Will_Accept_Output (
         VT   : in     Virtual_Terminal)
      return Boolean;
   -- ************************  USER SPECIFICATION  ****************************
   -- 
   -- Return True if the NVT printer can accept characters.
   -----------------------------------------------------------------------------

end Transport_To_Terminal;
