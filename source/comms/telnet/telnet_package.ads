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

--*****************************************************************************
--
--                          PACKAGE DESCRIPTIONS
--
--*****************************************************************************
--
-- Package Name : TELNET_PACKAGE
--
-- Abstract : 
-- This package has the data types and data operations which are exported
-- to the TELNET controller program to allow the controller to set up the
-- data structure used by the TELNET procedure and the TELNET procedure
-- which services a TELNET user. 
--
--
-- 
-- Package Name : TELNET_APL
-- 
-- Abstract : 
-- This package performs the high level processing associated with the 
-- Telnet Aplication Level protocol.
--
--
-- 
-- Package Name : TERMINAL_TO_TRANSPORT
-- 
-- Abstract : 
-- This package has subprograms to manage APL level processing of Network 
-- Virtual keyboard input.
-- 
--
-- 
-- Package Name : TRANSPORT_TO_TERMINAL
-- 
-- Abstract : 
-- This package has APL subprograms used to process data input to the 
-- local Telnet from the remote Telnet.
-- 
--
-- 
-- Package Name : TELNET_TERMINAL
-- 
-- Abstract : 
-- This package provides low level Network Virtual Terminal services and 
-- interfaces with the actual I/O device or process. 
-- 
--
-- 
-- Package Name : VIRTUAL_TRANSPORT
-- 
-- Abstract : 
-- This package provides low level virtual transport level services and 
-- interfaces with the actual transport level.
-- 
--
-- 
-- Package Name : USER_DATA
-- 
-- Abstract : 
-- This package contains operations to examine and manipulate user APL 
-- state information and APL buffers.
-- 
--
-- 
-- Package Name : OPTION_NEGOTIATION
-- 
-- Abstract : 
-- This package contains subprograms to handle Telnet option negotiation.
-- 
-------------------------------------------------------------------------------


with Telnet_Options;
with Telnet_Terminal;

package Telnet_Package is
   
   use Telnet_Terminal;

   -- **********************  USER SPECIFICATION  *****************************
   -- 
   -- This package has the data types and data operations which are exported
   -- to the TELNET controller program to allow the controller to set up the
   -- data structure used by the TELNET procedure and the TELNET procedure
   -- which services a TELNET user.  An array of user data structures could be 
   -- used by the controller to serve multiple TELNET users.  The 
   -- user_information_type contains all the necessary information maintained 
   -- for a TELNET user.  The TELNET_options_supported_type lists the 
   -- non-default options currently supported by this implementation.  User
   -- information directly alterable by the controller are the non-standard
   -- TELNET options and I/O_device_characteristics.  The controller
   -- can request to begin a non-default TELNET option, demand not to support a
   -- non-default option, (as well as the same request/demand for the other
   -- side of the TELNET connection) and set information regarding the actual
   -- I/O device characteristics for a particular user.  These characteristics 
   -- should be initialized prior to running the TELNET procedure, but could
   -- be dynamically changed if appropriate.
   -- 
   -- **************************************************************************

   type Io_Device_Supported_Type is 
         (Process, 
          Vt100); 
   

   procedure Request_To_Do_Option (
         Option    : in     Telnet_Options.Option_Type; 
         VT        : in out Virtual_Terminal); 
   -- *********************  USER SPECIFICATION  *****************************
   --
   -- This procedure allows the TELNET controller to request a non-default
   -- TELNET option to be done locally.  Used primarily to initialize
   -- this information prior to using the TELNET procedure, but it
   -- can be used to dynamically request a change in TELNET options if
   -- desired.  If this procedure is used for a closed connection, TELNET
   -- will automatically try to negotiate that option upon the establishment
   -- of a new connection.
   ---------------------------------------------------------------------------


   procedure Demand_Not_To_Do_Option (
         Option    : in     Telnet_Options.Option_Type; 
         VT        : in out Virtual_Terminal); 
   -- *********************  USER SPECIFICATION  *****************************
   --
   -- This procedure allows the TELNET controller to demand a non-default
   -- TELNET option not be done locally.  Used primarily to initialize
   -- this information prior to using the TELNET procedure, but it
   -- can be used to dynamically request a change in TELNET options if
   -- desired.
   ---------------------------------------------------------------------------


   procedure Request_Remote_To_Do_Option (
         Option    : in     Telnet_Options.Option_Type; 
         VT        : in out Virtual_Terminal); 
   -- *********************  USER SPECIFICATION  *****************************
   --
   -- This procedure allows the TELNET controller to request a non-default
   -- TELNET option to be done remotely.  Used primarily to initialize
   -- this information prior to using the TELNET procedure, but it
   -- can be used to dynamically request a change in TELNET options if
   -- desired.  If this procedure is used for a closed connection, TELNET
   -- will automatically try to negotiate that option upon the establishment
   -- of a new connection.
   ---------------------------------------------------------------------------


   procedure Demand_Remote_Not_To_Do_Option (
         Option    : in     Telnet_Options.Option_Type; 
         VT        : in out Virtual_Terminal); 
   -- *********************  USER SPECIFICATION  *****************************
   --
   -- This procedure allows the TELNET controller to demand a non-default
   -- TELNET option not be done remotely.  Used primarily to initialize
   -- this information prior to using the TELNET procedure, but it
   -- can be used to dynamically request a change in TELNET options if
   -- desired.
   ---------------------------------------------------------------------------


   procedure Set_Device_Type (
         Device_Type : in     Io_Device_Supported_Type; 
         VT          : in out Virtual_Terminal); 
   -- *********************  USER SPECIFICATION  *****************************
   --
   -- This procedure sets the device type for use by the TELNET 
   -- presentation protocol level to allow actual communication 
   -- with that process or device.  Used primarily to initialize
   -- this information prior to using the TELNET procedure, but it
   -- can be used to dynamically request a change if desired.
   ---------------------------------------------------------------------------


   procedure Set_Connection_Type (
         VT     : in out Virtual_Terminal;
         Active : in     Boolean); 
   -- *********************  USER SPECIFICATION  *****************************
   --
   -- This procedure sets the I/O port address for use by the TELNET 
   -- presentation protocol level to allow actual communication 
   -- with that process or device.  Used to initialize this
   -- this information prior to using the TELNET procedure.
   ---------------------------------------------------------------------------

   -- Note : Other device specific procedures may have to be added here
   --        as deemed appropriate baised on the characteristics of the 
   --        of the specific devices supported and the host system.



   procedure Telnet (
         VT        : in out Virtual_Terminal); 
   -- *****************  USER SPECIFICATION  *****************************
   --
   -- This procedure implements the TELNET [1] communication protocol
   -- for a single user.  One "pass" is made for all sources of I/O
   -- for a user for each call of this procedure.  The controlling
   -- program should initialize any non-default options desired and I/O 
   -- device characteristics prior to calling telnet.
   --
   -- SPECIFICATION REFERENCES:
   -- 
   --    [1] Network Working Group Request for Comments: 854, May 1983,
   --        TELNET PROTOCOL SPECIFICATION
   -----------------------------------------------------------------------

end Telnet_Package;
