-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 1.5                                   --
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

--  Window types to support a sizeable, scrollable drawing panel that can also
--  process a few more events.

with GWindows; use GWindows;

with GWindows.Base;

with GWindows.Drawing_Panels;

with GWindows.Windows;

with GWindows.Types;

with Interfaces.C;

package Sizable_Panels is

   SIZE_RESTORED  : constant := 0;                 --  winuser.h:1041
   SIZE_MINIMIZED : constant := 1;                 --  winuser.h:1042
   SIZE_MAXIMIZED : constant := 2;                 --  winuser.h:1043
   SIZE_MAXSHOW   : constant := 3;                 --  winuser.h:1044
   SIZE_MAXHIDE   : constant := 4;                 --  winuser.h:1045

   -------------------------------------------------------------------------
   --  Drawing_Canvas_Type
   -------------------------------------------------------------------------
   --  Drawing canvas is used by the Sizable_Panel_Type. It is the canvas
   --  type used for all painting on Sizable_Panel_Types.

   type Drawing_Canvas_Type is
      new GWindows.Drawing_Panels.Drawing_Canvas_Type with null record;


   -------------------------------------------------------------------------
   -- Sizable_Panel_Type
   -------------------------------------------------------------------------

   type Sizable_Panel_Type is
      new GWindows.Drawing_Panels.Drawing_Panel_Type with private;

   type Sizable_Panel_Type_Access is
      access all Sizable_Panel_Type;

   type Pointer_To_Sizable_Panel_Class is
      access all Sizable_Panel_Type'Class;

   -------------------------------------------------------------------------
   -- Sizable_Panel_Type - Methods
   -------------------------------------------------------------------------

   procedure Activate (Window : in out Sizable_Panel_Type);
   -- Activate - make this window active and put it in the foreground

   -------------------------------------------------------------------------
   -- Sizable_Panel_Type - Properties
   -------------------------------------------------------------------------

   procedure Sizable
     (Window : in out Sizable_Panel_Type;
      State  : in     Boolean          := True);
   function Sizable
     (Window : in Sizable_Panel_Type) return Boolean;
   --  Sizable property - need this to make it possible to enable
   --                      or disable the size box

   procedure System_Keys
     (Window : in out Sizable_Panel_Type;
      Enable : in     Boolean := True);
   function System_Keys
     (Window : in Sizable_Panel_Type) return Boolean;
   -- System_Keys property - Enable/Disable the F10 system key

   procedure Caption
     (Window : in out Sizable_Panel_Type;
      State  : in     Boolean          := True);
   function Caption
     (Window : in Sizable_Panel_Type) return Boolean;
   --  Caption property - need this to make it possible to enable
   --                      or disable the window title

   procedure Scroll_Range
     (Window  : in     Sizable_Panel_Type;
      Bar     : in     GWindows.Windows.Scroll_Bar_Type;
      Minimum : in     Integer;
      Maximum : in     Integer);

   procedure Scroll_Maximum
     (Window  : in     Sizable_Panel_Type;
      Bar     : in     GWindows.Windows.Scroll_Bar_Type;
      Maximum : in     Integer);

   function Scroll_Maximum
     (Window : in     Sizable_Panel_Type;
      Bar    : in     GWindows.Windows.Scroll_Bar_Type) return Integer;

   procedure Scroll_Minimum
     (Window  : in     Sizable_Panel_Type;
      Bar     : in     GWindows.Windows.Scroll_Bar_Type;
      Minimum : in     Integer);

   function Scroll_Minimum
     (Window : in     Sizable_Panel_Type;
      Bar    : in     GWindows.Windows.Scroll_Bar_Type) return Integer;
   --  Scroll Range Property - need this because the basic GWindows.Windows
   --                          versions allows the scroll bar to be disabled
   --                          if it is not required by the range parameters

   -------------------------------------------------------------------------
   --  Sizable_Panel_Type - Event Types
   -------------------------------------------------------------------------
   --  See Event Methods for details on each event

   --  temporary - should really decode this
   type Hit_Test_Type is new Integer;

   type Non_Client_Mouse_Event is access
     procedure (Window  : in out GWindows.Base.Base_Window_Type'Class;
                X       : in     Integer;
                Y       : in     Integer;
                Hit     : in     Hit_Test_Type);

   type Size_Event is access
     procedure (Window   : in out GWindows.Base.Base_Window_Type'Class;
                SizeType : in    Integer;
                Width    : in     Integer;
                Height   : in     Integer);

   type Repeatable_Character_Event is access
     procedure (Window      : in out GWindows.Base.Base_Window_Type'Class;
                Special_Key : in     GWindows.Windows.Special_Key_Type;
                Value       : in     GCharacter;
                Repeat      : in     Boolean;
                Extended    : in     Boolean);

   type Virtual_Key_Event is access
     procedure (Window      : in out GWindows.Base.Base_Window_Type'Class;
                Virtual_Key : in     Integer);

   -------------------------------------------------------------------------
   --  Sizable_Panel_Type - Event Handlers
   -------------------------------------------------------------------------
   --  See Event Methods for details on each event

   procedure On_Non_Client_Mouse_Move_Handler
     (Window  : in out Sizable_Panel_Type;
      Handler : in     Non_Client_Mouse_Event);
   procedure Fire_On_Non_Client_Mouse_Move
     (Window : in out Sizable_Panel_Type;
      X      : in     Integer;
      Y      : in     Integer;
      Hit    : in     Hit_Test_Type);

   procedure On_Capture_Changed_Handler
     (Window  : in out Sizable_Panel_Type;
      Handler : in     GWindows.Base.Action_Event);
   procedure Fire_On_Capture_Changed
     (Window : in out Sizable_Panel_Type);

   procedure On_Init_Menu_Handler
     (Window  : in out Sizable_Panel_Type;
      Handler : in     GWindows.Base.Action_Event);
   procedure Fire_On_Init_Menu
     (Window : in out Sizable_Panel_Type);

   procedure On_Character_Handler
     (Window  : in out Sizable_Panel_Type;
      Handler : in     Repeatable_Character_Event);
   procedure Fire_On_Character
     (Window      : in out Sizable_Panel_Type;
      Special_Key : in     GWindows.Windows.Special_Key_Type;
      Value       : in     GCharacter;
      Repeat      : in     Boolean;
      Extended    : in     Boolean);

   procedure On_Size_Handler
     (Window  : in out Sizable_Panel_Type;
      Handler : in     Size_Event);
   procedure Fire_On_Size
     (Window   : in out Sizable_Panel_Type;
      SizeType : in     Integer;
      Width    : in     Integer;
      Height   : in     Integer);

   procedure On_Virtual_Key_Handler
     (Window  : in out Sizable_Panel_Type;
      Handler : in     Virtual_Key_Event);
   procedure Fire_On_Virtual_Key
     (Window      : in out Sizable_Panel_Type;
      Virtual_Key : in     Integer);


   -------------------------------------------------------------------------
   --  Sizable_Panel_Type - Events
   -------------------------------------------------------------------------

   procedure On_Non_Client_Mouse_Move
     (Window : in out Sizable_Panel_Type;
      X      : in     Integer;
      Y      : in     Integer;
      Hit    : in     Hit_Test_Type);
   --  Mouse has moved outside client area

   procedure On_Capture_Changed
     (Window : in out Sizable_Panel_Type);
   --  Mouse capture has changed

   procedure On_Init_Menu
     (Window : in out Sizable_Panel_Type);
   --  Menu is about to be displayed

   procedure On_Character
     (Window      : in out Sizable_Panel_Type;
      Special_Key : in     GWindows.Windows.Special_Key_Type;
      Value       : in     GCharacter;
      Repeat      : in     Boolean;
      Extended    : in     Boolean);
   --  If Special_Key is 'None', Key equals the character value of the
   --  key combination pressed (eg. 'A', Esc, ctrl-A, etc.) other wise it
   --  is null. The F10 key is absorbed by the OS for many window types to
   --  generate context sensitive help messages. The function keys F11 and
   --  above are only captured if the input focus (GWindows.Base.Focus) is
   --  on the window.

   procedure On_Size
     (Window   : in out Sizable_Panel_Type;
      SizeType : in     Integer;
      Width    : in     Integer;
      Height   : in     Integer);
   --  Window size has changed (Width and Height are of client area)
   --  Handles resizing of MDI Client Area

   procedure On_Virtual_Key
     (Window      : in out Sizable_Panel_Type;
      Virtual_Key : in     Integer);
   -- Virtual Key has been pressed. This is a temporary means of getting
   -- the virtual key code returned on each WM_KEYDOWN and WM_CHAR event.
   -- It is called on each WM_KEYDOWN message, before the key itself is
   -- processed any further.

   -------------------------------------------------------------------------
   --  Sizable_Panel_Type - Event Framework Methods
   -------------------------------------------------------------------------
   --  These should be overiden with caution and only with a full
   --  understanding of the internals of the entire GWindows framework

   overriding
   procedure On_Message
     (Window       : in out Sizable_Panel_Type;
      message      : in     Interfaces.C.unsigned;
      wParam       : in     GWindows.Types.Wparam;
      lParam       : in     GWindows.Types.Lparam;
      Return_Value : in out GWindows.Types.Lresult);
   --  Handles additional Win32 messages for sizeable panel Windows - need
   --  this to process WM_CHAR, WM_NCMOUSEMOVE and WM_CAPTURECHANGED events
   --  which are not processed by GWindows.Windows

   procedure On_Horizontal_Scroll
     (Window  : in out Sizable_Panel_Type;
      Request : in     GWindows.Base.Scroll_Request_Type;
      Control : in     GWindows.Base.Pointer_To_Base_Window_Class);
   --  Handles basic processing of Horizontal Scroll Bar - need this because
   --  the GWindows.Windows one doesn't fire the handler (why ?)

   procedure On_Vertical_Scroll
     (Window  : in out Sizable_Panel_Type;
      Request : in     GWindows.Base.Scroll_Request_Type;
      Control : in     GWindows.Base.Pointer_To_Base_Window_Class);
   --  Handles basic process of Veritcal Scroll Bar - need this because
   --  the GWindows.Windows one doesn't fire the handler (why ?)

   function Messages_Waiting return Boolean;
   -- return true if there are any outstanding windows messages

private

   type Sizable_Panel_Type is
     new GWindows.Drawing_Panels.Drawing_Panel_Type with
      record
         Enable_System_Keys             : Boolean                    := True;
         On_Size_Event                  : Size_Event                 := null;
         On_Capture_Changed_Event       : GWindows.Base.Action_Event := null;
         On_Init_Menu_Event             : GWindows.Base.Action_Event := null;
         On_Non_Client_Mouse_Move_Event : Non_Client_Mouse_Event     := null;
         On_Character_Event             : Repeatable_Character_Event := null;
         On_Virtual_Key_Event           : Virtual_Key_Event          := null;

      end record;

end Sizable_Panels;
