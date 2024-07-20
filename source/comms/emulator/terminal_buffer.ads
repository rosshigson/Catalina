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

with Ada.Real_Time;
with GWindows.Base;
with GWindows.Menus;
with GWindows.Windows;
with Sizable_Panels;
with Terminal_Types;
with Buffer_Types;
with Ansi_Buffer;
with Protection;

package Terminal_Buffer is

   use Sizable_Panels;
   use Terminal_Types;
   use Buffer_Types;
   use Ansi_Buffer;

   package ART renames Ada.Real_Time;


   MAX_PUT_COUNT      : constant := 250; -- max puts before message processing

   type PutBuffer_Type is array (0 .. PUT_CHAR_BUFF_SIZE) of Character;

   type Terminal_Buffer is new Ansi_Buffer.Ansi_Buffer with record

      MenuMain       : GWindows.Menus.Menu_Type;
      MenuTransfer   : GWindows.Menus.Menu_Type;
      MenuEdit       : GWindows.Menus.Menu_Type;
      MenuFile       : GWindows.Menus.Menu_Type;
      MenuFormat     : GWindows.Menus.Menu_Type;
      MenuOption     : GWindows.Menus.Menu_Type;
      MenuContext    : GWindows.Menus.Menu_Type;
      MenuHelp       : GWindows.Menus.Menu_Type;

      MainMenuOn     : Boolean  := True;  -- main menu
      TransferMenuOn : Boolean  := False; -- transfer menu
      OptionMenuOn   : Boolean  := True;  -- basic options menu
      AdvancedMenuOn : Boolean  := False; -- advanced options menu
      ContextMenuOn  : Boolean  := True;  -- context menu
      AlwaysOnTop    : Boolean  := False; -- terminal is on top of Z order
      WindowClose    : Boolean  := True;  -- terminal can be closed
      ProgramClose   : Boolean  := False; -- close terminal terminates program
      SizingMode     : Sizing_Mode := Size_View; -- resizing mode
   
      DoubleClick    : Boolean  := False;
      DoubleTime     : ART.Time := ART.Time_First;
      DoublePos      : Real_Pos := (0, 0);

      -- other miscellaneous things
      CloseFlag      : Boolean  := False; -- close has been requested
      PutCount       : Natural  := 0;
      VirtualKey     : Integer  := 0;     -- virtual keycode of last key pressed
      SizeDisplay    : Sizable_Panel_Type; -- shows current size when resizing
      SizeDisplayed  : Boolean  := False; -- SizeDisplay is currently on display

      PutBuffer      : PutBuffer_Type;
      PutProtect     : Protection.Mutex;
      PutStart       : Natural          := 0;
      PutFinish      : Natural          := 0;

   end record;

   procedure Do_Vertical_Scroll (
         Buffer  : in out Terminal_Buffer;
         Window  : in out GWindows.Base.Base_Window_Type'Class;
         Request : in     GWindows.Base.Scroll_Request_Type);


   procedure Do_Horizontal_Scroll (
         Buffer  : in out Terminal_Buffer;
         Window  : in out GWindows.Base.Base_Window_Type'Class;
         Request : in     GWindows.Base.Scroll_Request_Type);


   procedure Do_Close (
         Buffer    : in out Terminal_Buffer;
         Window    : in out GWindows.Base.Base_Window_Type'Class;
         Can_Close :    out Boolean);


   procedure Do_Destroy (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class);


   -- Do_Key_Down : Process WM_KEYDOWN messages. All special or extended
   --               keys are processed here.
   procedure Do_Key_Down (
         Buffer  : in out Terminal_Buffer;
         Window  : in out GWindows.Base.Base_Window_Type'Class;
         Special : in     GWindows.Windows.Special_Key_Type;
         Value   : in     GWindows.GCharacter);


   -- Do_Virtual_Key : Receive a Virtual key code, which may be
   --                  required during subsequent key processing.
   procedure Do_Virtual_Key (
         Buffer  : in out Terminal_Buffer;
         Window  : in out GWindows.Base.Base_Window_Type'Class;
         Virtual : in     Integer);


   -- Do_Key : Process WM_CHAR messages. All normal keys are
   --          processed here.
   procedure Do_Key (
         Buffer   : in out Terminal_Buffer;
         Window   : in out GWindows.Base.Base_Window_Type'Class;
         Special  : in     GWindows.Windows.Special_Key_Type;
         Value    : in     GWindows.GCharacter;
         Repeat   : in     Boolean;
         Extended : in     Boolean);


   -- Do_Size : Respond to window sizing messages.
   procedure Do_Size (
         Buffer   : in out Terminal_Buffer;
         Window   : in out GWindows.Base.Base_Window_Type'Class;
         SizeType : in     Integer;
         Width    : in     Integer;
         Height   : in     Integer);



   -- Do_Focus : Got focus - draw cursor
   procedure Do_Focus (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class);


   -- Do_Lost_Focus : Lost focus - undraw cursor
   procedure Do_Lost_Focus (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class);


   -- Do_Menu_Select : Perform all main window menu processing,
   --                  including context menu.
   procedure Do_Menu_Select (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class;
         Item   : in     Integer);


   -- Do_Context_Menu : display the context menu.
   procedure Do_Context_Menu (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer);


   -- Do_Left_Button_Down : perform mouse left button processing.
   --                       Thie procedure does single clicks, and
   --                       simulates triple-clicks. See also
   --                       Do_Left_Button_Double_Click
   procedure Do_Left_Button_Down (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer;
         Keys   : in     GWindows.Windows.Mouse_Key_States);


   -- Do_Left_Button_Up : release the mouse if we have it.
   procedure Do_Left_Button_Up (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer;
         Keys   : in     GWindows.Windows.Mouse_Key_States);


   -- Do_Left_Button_Double_Click : perform mouse left button processing.
   --                               This procedure handles double clicks.
   --                               See also Do_Left_Button_Down
   procedure Do_Left_Button_Double_Click (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer;
         Keys   : in     GWindows.Windows.Mouse_Key_States);


   -- Do_Mouse_Move : Note that we only handle mouse moves completely within
   --                 the client window - others are handled elsewhere.
   procedure Do_Mouse_Move (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer;
         Keys   : in     GWindows.Windows.Mouse_Key_States);


   -- Do_Capture_Changed : Someone else captured the mouse.
   procedure Do_Capture_Changed (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class);


   -- Do_Init_Menu : The menu is about to be displayed.
   procedure Do_Init_Menu (
         Buffer : in out Terminal_Buffer;
         Window : in out GWindows.Base.Base_Window_Type'Class);


   -- UpdateSizeDisplay : update the contents of the size display.
   procedure UpdateSizeDisplay (
         Buffer : in out Terminal_Buffer);


   -- CreateSizeDisplay : create and display the size display.
   procedure CreateSizeDisplay (
         Buffer : in out Terminal_Buffer);


   -- DeleteSizeDisplay : Close and delete the size display.
   procedure DeleteSizeDisplay (
         Buffer : in out Terminal_Buffer);


   -- UpdateMenuStates : set the states of all menu entries to
   --                    be checked or unchecked, grayed or enabled.
   procedure UpdateMenuStates (
         Buffer : in out Terminal_Buffer);


   -- CreateMenus : Create all main window menus, including context menu.
   procedure CreateMenus (
         Buffer       : in out Terminal_Buffer;
         MainMenu     : in     Option := Ignore;
         TransferMenu : in     Option := Ignore;
         OptionMenu   : in     Option := Ignore;
         AdvancedMenu : in     Option := Ignore;
         ContextMenu  : in     Option := Ignore);


   -- HouseKeeping : Do things that need to be done periodically.
   --                Returns False if application has been closed.
   procedure HouseKeeping (
         Buffer : in out Terminal_Buffer;
         Open   :    out Boolean);
   
   
   -- GetFromBuffer : Get a char from the PutBuffer.
   procedure GetfromBuffer (
         Buffer  : in out Terminal_Buffer;
         Char    :    out Character;
         Removed :    out Boolean);


   -- PutToBuffer : Put a char to the PutBuffer.
   procedure PutToBuffer (
         Buffer : in out Terminal_Buffer;
         Char   : in     Character;
         Added  :    out Boolean);
   

   -- ProcessPutBuffer : process the put buffer by putting each
   --                    character that has been buffered.
   procedure ProcessPutBuffer (
         Buffer       : in out Terminal_Buffer;
         HandleCursor : in     Boolean := True);


end Terminal_Buffer;
