-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 0.7                                   --
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

package Telnet_Options is

   use Telnet_Types;

   -- list of all Telnet options:
   type Option_Type is (
          Binary_Transmission,              -- RFC856
          Echo,                             -- RFC857
          Reconnection,                     -- NIC50005
          Suppress_Go_Ahead,                -- RFC858
          Status,                           -- RFC859
          Timing_Mark,                      -- RFC860
          Remote_Controlled_Trans_and_Echo, -- RFC726
          Output_Line_Width,                -- NIC50005
          Output_Page_Size,                 -- NIC50005
          Output_CR_Disposition,            -- RFC652
          Output_HT_Stops,                  -- RFC653
          Output_HT_Disposition,            -- RFC654
          Output_FF_Disposition,            -- RFC655
          Output_VT_Stops,                  -- RFC656
          Output_VT_Disposition,            -- RFC657
          Output_LF_Disposition,            -- RFC657
          Extended_ASCII,                   -- RFC698
          Logout,                           -- RFC727
          Byte_Macro,                       -- RFC735
          Data_Entry_Terminal,              -- RFC1043,RFC732
          SUPDUP,                           -- RFC736,RFC734
          SUPDUP_Output,                    -- RFC749
          Send_Location,                    -- RFC779
          Terminal_Type,                    -- RFC1091
          End_of_Record,                    -- RFC885
          TACACS_User_Id,                   -- RFC927
          Output_Marking,                   -- RFC933
          Terminal_Location_Number,         -- RFC946
          Telnet_3270_Regime,               -- RFC1041
          X3_PAD,                           -- RFC1053
          Negotiate_About_Window_Size,      -- RFC1073
          Terminal_Speed,                   -- RFC1079
          Remote_Flow_Control,              -- RFC1372
          Linemode,                         -- RFC1184
          X_Display_Location,               -- RFC1096
          Environment,                      -- RFC1408
          Authentication,                   -- RFC1409
          Encryption,                       -- 
          New_Environment,                  -- RFC1572
          Extended_Options                  -- RFC861
   );

   for Option_Type'Size use 8;   

   -- Telnet option values:
   for Option_Type use (
      Binary_Transmission                => 0,
      Echo                               => 1,
      Reconnection                       => 2,
      Suppress_Go_Ahead                  => 3,
      Status                             => 5,
      Timing_Mark                        => 6,
      Remote_Controlled_Trans_and_Echo   => 7,
      Output_Line_Width                  => 8,
      Output_Page_Size                   => 9,
      Output_CR_Disposition              => 10,
      Output_HT_Stops                    => 11,
      Output_HT_Disposition              => 12,
      Output_FF_Disposition              => 13,
      Output_VT_Stops                    => 14,
      Output_VT_Disposition              => 15,
      Output_LF_Disposition              => 16,
      Extended_ASCII                     => 17,
      Logout                             => 18,
      Byte_Macro                         => 19,
      Data_Entry_Terminal                => 20,
      SUPDUP                             => 21,
      SUPDUP_Output                      => 22,
      Send_Location                      => 23,
      Terminal_Type                      => 24,
      End_of_Record                      => 25,
      TACACS_User_Id                     => 26,
      Output_Marking                     => 27,
      Terminal_Location_Number           => 28,
      Telnet_3270_Regime                 => 29,
      X3_PAD                             => 30,
      Negotiate_About_Window_Size        => 31,
      Terminal_Speed                     => 32,
      Remote_Flow_Control                => 33,
      Linemode                           => 34,
      X_Display_Location                 => 35,
      Environment                        => 36,
      Authentication                     => 37,
      Encryption                         => 38,
      New_Environment                    => 39,
      Extended_Options                   => 255
   );

   type Option_Array_Type is array (Option_Type) of Boolean; 
   
   -- list of supported options:
   Supported : constant Option_Array_Type := (
      Binary_Transmission                => True,
      Echo                               => True,
      Reconnection                       => False,
      Suppress_Go_Ahead                  => True,
      Status                             => True,
      Timing_Mark                        => True,
      Remote_Controlled_Trans_and_Echo   => False,
      Output_Line_Width                  => False,
      Output_Page_Size                   => False,
      Output_CR_Disposition              => False,
      Output_HT_Stops                    => False,
      Output_HT_Disposition              => False,
      Output_FF_Disposition              => False,
      Output_VT_Stops                    => False,
      Output_VT_Disposition              => False,
      Output_LF_Disposition              => False,
      Extended_ASCII                     => False,
      Logout                             => False,
      Byte_Macro                         => False,
      Data_Entry_Terminal                => False,
      SUPDUP                             => False,
      SUPDUP_Output                      => False,
      Send_Location                      => False,
      Terminal_Type                      => True,
      End_of_Record                      => True,
      TACACS_User_Id                     => False,
      Output_Marking                     => False,
      Terminal_Location_Number           => False,
      Telnet_3270_Regime                 => False,
      X3_PAD                             => False,
      Negotiate_About_Window_Size        => False,
      Terminal_Speed                     => False,
      Remote_Flow_Control                => False,
      Linemode                           => False,
      X_Display_Location                 => False,
      Environment                        => False,
      Authentication                     => False,
      Encryption                         => False,
      New_Environment                    => False,
      Extended_Options                   => False
   );

   type Action_Type is (
      Telnet_Will, 
      Telnet_Wont, 
      Telnet_Do,   
      Telnet_Dont
   );

   for Action_Type'Size use 8;   

   for Action_Type use (
      Telnet_Will => T_WILL,                -- 251
      Telnet_Wont => T_WONT,                -- 252
      Telnet_Do   => T_DO,                  -- 253
      Telnet_Dont => T_DONT                 -- 254
   );


   type Option_Tables_Type is 
      record 
         Local_Desired    : Option_Array_Type := (others => False);  
         Local_Pending    : Option_Array_Type := (others => False);
         Local_Count      : Natural := 0; -- Count of Local_Pending
         Local_In_Effect  : Option_Array_Type := (others => False);  
         Remote_Desired   : Option_Array_Type := (others => False);  
         Remote_Pending   : Option_Array_Type := (others => False);  
         Remote_Count     : Natural := 0; -- Count of Remote_Pending
         Remote_In_Effect : Option_Array_Type := (others => False);  
      end record; 


   ---------------------------------------------------
   -- option/action manipulation functions/procedures:
   ---------------------------------------------------


   procedure Reset (
      Options : in out Option_Tables_Type);


   function Valid_Option (
         Option : in    Eight_Bits)
      return Boolean;


   -- use "Valid_Option" to check the value first, 
   -- or this routine may raise an exception
   function Option (
         Option : in    Eight_Bits)
      return Option_Type;


   function Code (
         Option : in    Option_Type)
      return Eight_Bits;
         

   function Text (
         Option : in    Option_Type)
      return String;
         

   function Valid_Action (
         Action : in    Eight_Bits)
      return Boolean;


   -- use "Valid_Action" to check the value first, 
   -- or this routine may raise an exception
   function Action (
         Action : in    Eight_Bits)
      return Action_Type;


   function Code (
         Action : in   Action_Type)
      return Eight_Bits;

      
   function Text (
         Action : in    Action_Type)
      return String;
         

end Telnet_Options;
