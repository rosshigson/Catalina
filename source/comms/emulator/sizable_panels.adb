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

--  Note: Much of this code is swiped from GWindows.Windows, unchanged
--  except to replace Window_Type with Sizable_Panel_Type.

with GWindows;
with GWindows.Types;
with GWindows.Utilities;
with Interfaces.C;


package body Sizable_Panels is

   use GWindows;
   use Interfaces.C;

   WS_SIZEBOX          : constant := 262144;
   WS_MAXIMIZEBOX      : constant := 65536;
   WS_CAPTION          : constant := 12582912;

   SWP_NOSIZE          : constant := 1;
   SWP_NOMOVE          : constant := 2;
   SWP_NOZORDER        : constant := 4;
   SWP_FRAMECHANGED    : constant := 32;

   procedure SetWindowPos
     (hwnd            : GWindows.Types.Handle;
      hwndInsertAfter : GWindows.Types.Handle := GWindows.Types.Null_Handle;
      x               : Integer := 0;
      y               : Integer := 0;
      cx              : Integer := 0;
      cy              : Integer := 0;
      fuFlags         : Interfaces.C.unsigned :=
        SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER or SWP_FRAMECHANGED);
   pragma Import (StdCall, SetWindowPos, "SetWindowPos");

   GWL_STYLE   : constant := -16;
   GWL_EXSTYLE : constant := -20;

   procedure SetWindowLong
     (hwnd : GWindows.Types.Handle;
      nIndex  : Interfaces.C.int := GWL_STYLE;
      newLong : Interfaces.C.unsigned);
   pragma Import (StdCall, SetWindowLong,
                    "SetWindowLong" & Character_Mode_Identifier);

   function GetWindowLong
     (hwnd : GWindows.Types.Handle;
      nIndex : Interfaces.C.int := GWL_STYLE)
     return Interfaces.C.unsigned;
   pragma Import (StdCall, GetWindowLong,
                    "GetWindowLong" & Character_Mode_Identifier);

   --------------
   -- Sizable --
   --------------

   procedure Sizable
     (Window : in out Sizable_Panel_Type;
      State  : in     Boolean          := True)
   is
      use type Interfaces.C.unsigned;
   begin
      if State then
         SetWindowLong (
            Handle (Window),
            GWL_STYLE,
            newLong => GetWindowLong (Handle (Window), GWL_STYLE)
                       or WS_SIZEBOX or WS_MAXIMIZEBOX);
         SetWindowPos (Handle (Window));
      else
         SetWindowLong (
            Handle (Window),
            GWL_STYLE,
            newLong => GetWindowLong (Handle (Window), GWL_STYLE)
                       and not WS_SIZEBOX and not WS_MAXIMIZEBOX);
         SetWindowPos (Handle (Window));
      end if;
   end Sizable;

   -------------
   -- Sizable --
   -------------

   function Sizable (Window : in Sizable_Panel_Type) return Boolean
   is
      use type Interfaces.C.unsigned;
   begin
      return (GetWindowLong (Handle (Window)) and WS_SIZEBOX) = WS_SIZEBOX;
   end Sizable;

   --------------
   -- Activate --
   --------------

   procedure Activate (Window : in out Sizable_Panel_Type)
   is
      hwnd   : GWindows.Types.Handle;
      Result : Interfaces.C.int;

      function SetForegroundWindow
            (hwnd : GWindows.Types.Handle)
         return Interfaces.C.Int;
      pragma Import (StdCall, SetForegroundWindow, "SetForegroundWindow");

      function SetActiveWindow
            (hwnd : GWindows.Types.Handle)
         return GWindows.Types.Handle;
      pragma Import (StdCall, SetActiveWindow, "SetActiveWindow");

      function SetFocus
            (hwnd : GWindows.Types.Handle)
         return GWindows.Types.Handle;
      pragma Import (StdCall, SetFocus, "SetFocus");

   begin
      Result := SetForegroundWindow (Handle (Window));
      hwnd   := SetActiveWindow (Handle (Window));
      hwnd   := SetFocus (Handle (Window));
   end Activate;

   ------------------
   -- System_Keys  --
   ------------------

   procedure System_Keys
     (Window : in out Sizable_Panel_Type;
      Enable : in     Boolean := True)
   is
   begin
      Window.Enable_System_Keys := Enable;
   end System_Keys;

   ------------------
   -- System_Keys  --
   ------------------

   function System_Keys
     (Window : in Sizable_Panel_Type) return Boolean
   is
   begin
      return Window.Enable_System_Keys;
   end System_Keys;

   --------------
   -- Caption  --
   --------------

   procedure Caption
     (Window : in out Sizable_Panel_Type;
      State  : in     Boolean          := True)
   is
      use type Interfaces.C.unsigned;
   begin
      if State then
         SetWindowLong (
            Handle (Window),
            GWL_STYLE,
            newLong => GetWindowLong (Handle (Window), GWL_STYLE) or WS_CAPTION);
         SetWindowPos (Handle (Window));
      else
         SetWindowLong (
            Handle (Window),
            GWL_STYLE,
            newLong => GetWindowLong (Handle (Window), GWL_STYLE) and not WS_CAPTION);
         SetWindowPos (Handle (Window));
      end if;
   end Caption;

   --------------
   -- Caption  --
   --------------

   function Caption
     (Window : in Sizable_Panel_Type) return Boolean is
      use type Interfaces.C.unsigned;
   begin
      return (GetWindowLong (Handle (Window)) and WS_CAPTION) = WS_CAPTION;
   end Caption;

   ------------------
   -- Scroll_Range --
   ------------------

   SB_HORZ             : constant := 0;
   SB_VERT             : constant := 1;

   SIF_RANGE           : constant := 1;
   SIF_DISABLENOSCROLL : constant := 8;

   type SCROLLINFO is
      record
         cbSize    : Interfaces.C.unsigned := 28;
         fMask     : Natural;
         nMin      : Integer := 0;
         nMax      : Integer := 0;
         nPage     : Natural;
         nPos      : Integer := 0;
         nTrackPos : Integer := 0;
      end record;

   procedure SetScrollInfo
     (hwnd    : GWindows.Types.Handle;
      fnBar   : Interfaces.C.int;
      lpsi    : SCROLLINFO;
      fRedraw : Interfaces.C.long     := 1);
   pragma Import (StdCall, SetScrollInfo, "SetScrollInfo");

   procedure GetScrollInfo
     (hwnd    : GWindows.Types.Handle;
      fnBar   : Interfaces.C.int;
      lpsi    : SCROLLINFO);
   pragma Import (StdCall, GetScrollInfo, "GetScrollInfo");

   procedure Scroll_Range
     (Window  : in     Sizable_Panel_Type;
      Bar     : in     GWindows.Windows.Scroll_Bar_Type;
      Minimum : in     Integer;
      Maximum : in     Integer)
   is
      use GWindows.Windows;
      Info : SCROLLINFO;
   begin
      Info.fMask := SIF_RANGE + SIF_DISABLENOSCROLL;
      Info.nMin := Minimum;
      Info.nMax := Maximum;
      if Bar = GWindows.Windows.Horizontal then
         SetScrollInfo (Handle (Window), SB_HORZ, Info);
      else
         SetScrollInfo (Handle (Window), SB_VERT, Info);
      end if;
   end Scroll_Range;

   --------------------
   -- Scroll_Maximum --
   --------------------

   procedure Scroll_Maximum
     (Window  : in     Sizable_Panel_Type;
      Bar     : in     GWindows.Windows.Scroll_Bar_Type;
      Maximum : in     Integer)
   is
      use GWindows.Windows;
      Info : SCROLLINFO;
   begin
      Info.fMask := SIF_RANGE + SIF_DISABLENOSCROLL;
      Info.nMin := Scroll_Minimum (Window, Bar);
      Info.nMax := Maximum;
      if Bar = GWindows.Windows.Horizontal then
         SetScrollInfo (Handle (Window), SB_HORZ, Info);
      else
         SetScrollInfo (Handle (Window), SB_VERT, Info);
      end if;
   end Scroll_Maximum;

   function Scroll_Maximum
     (Window : in Sizable_Panel_Type;
      Bar    : in GWindows.Windows.Scroll_Bar_Type) return Integer
   is
      use GWindows.Windows;
      Info : SCROLLINFO;
   begin
      Info.fMask := SIF_RANGE + SIF_DISABLENOSCROLL;

      if Bar = GWindows.Windows.Horizontal then
         GetScrollInfo (Handle (Window), SB_HORZ, Info);
      else
         GetScrollInfo (Handle (Window), SB_VERT, Info);
      end if;

      return Info.nMax;
   end Scroll_Maximum;

   --------------------
   -- Scroll_Minimum --
   --------------------

   procedure Scroll_Minimum
     (Window  : in     Sizable_Panel_Type;
      Bar     : in     GWindows.Windows.Scroll_Bar_Type;
      Minimum : in     Integer)
   is
      use GWindows.Windows;
      Info : SCROLLINFO;
   begin
      Info.fMask := SIF_RANGE + SIF_DISABLENOSCROLL;
      Info.nMin := Minimum;
      Info.nMax := Scroll_Maximum (Window, Bar);
      if Bar = GWindows.Windows.Horizontal then
         SetScrollInfo (Handle (Window), SB_HORZ, Info);
      else
         SetScrollInfo (Handle (Window), SB_VERT, Info);
      end if;
   end Scroll_Minimum;

   function Scroll_Minimum
     (Window : in Sizable_Panel_Type;
      Bar    : in GWindows.Windows.Scroll_Bar_Type) return Integer
   is
      use GWindows.Windows;
      Info : SCROLLINFO;
   begin
      Info.fMask := SIF_RANGE + SIF_DISABLENOSCROLL;

      if Bar = GWindows.Windows.Horizontal then
         GetScrollInfo (Handle (Window), SB_HORZ, Info);
      else
         GetScrollInfo (Handle (Window), SB_VERT, Info);
      end if;

      return Info.nMin;
   end Scroll_Minimum;

   ------------------------------
   -- On_Non_Client_Mouse_Move --
   ------------------------------

   procedure On_Non_Client_Mouse_Move
     (Window : in out Sizable_Panel_Type;
      X      : in     Integer;
      Y      : in     Integer;
      Hit    : in     Hit_Test_Type)
   is
   begin
      Fire_On_Non_Client_Mouse_Move (Window, X, Y, Hit);
   end On_Non_Client_Mouse_Move;

   ------------------------
   -- On_Capture_Changed --
   ------------------------

   procedure On_Capture_Changed
     (Window : in out Sizable_Panel_Type)
   is
   begin
      Fire_On_Capture_Changed (Window);
   end On_Capture_Changed;

   ------------------
   -- On_Init_Menu --
   ------------------

   procedure On_Init_Menu
     (Window : in out Sizable_Panel_Type)
   is
   begin
      Fire_On_Init_Menu (Window);
   end On_Init_Menu;

   ------------------
   -- On_Character --
   ------------------

   procedure On_Character
     (Window      : in out Sizable_Panel_Type;
      Special_Key : in     GWindows.Windows.Special_Key_Type;
      Value       : in     GCharacter;
      Repeat      : in     Boolean;
      Extended    : in     Boolean)
   is
   begin
      Fire_On_Character (Window, Special_Key, Value, Repeat, Extended);
   end On_Character;

   -------------
   -- On_Size --
   -------------

   procedure On_Size
     (Window   : in out Sizable_Panel_Type;
      SizeType : in     Integer;
      Width    : in     Integer;
      Height   : in     Integer)
   is
      use GWindows.Drawing_Panels;
   begin
      if Window.On_Size_Event /= null then
         Fire_On_Size (Window, SizeType, Width, Height);
      else
         Dock_Children (Window);
         On_Size (Drawing_Panel_Type (Window), Width, Height);
      end if;
   end On_Size;

   --------------------
   -- On_Virtual_Key --
   --------------------

   procedure On_Virtual_Key
     (Window      : in out Sizable_Panel_Type;
      Virtual_Key : in     Integer)
   is
   begin
      Fire_On_Virtual_Key (Window, Virtual_Key);
   end On_Virtual_Key;

   ----------------
   -- On_Message --
   ----------------

   overriding
   procedure On_Message
     (Window       : in out Sizable_Panel_Type;
      message      : in     Interfaces.C.unsigned;
      wParam       : in     GWindows.Types.Wparam;
      lParam       : in     GWindows.Types.Lparam;
      Return_Value : in out GWindows.Types.Lresult)
   is
      use type Interfaces.C.long;
      use GWindows.Base;
      use GWindows.Windows;

      WM_SIZE                    : constant := 5;
      WM_KEYDOWN                 : constant := 256;
      WM_CHAR                    : constant := 258;
      WM_SYSKEYDOWN              : constant := 260;
      WM_NCMOUSEMOVE             : constant := 160;
      WM_CAPTURECHANGED          : constant := 533;
      WM_INITMENU                : constant := 278;

   begin
      case message is

         when WM_SIZE =>
            On_Size (
               Sizable_Panel_Type'Class (Window),
               Integer (wParam),
               GWindows.Utilities.Low_Word (lParam),
               GWindows.Utilities.High_Word (lParam));

            On_Message (
               GWindows.Windows.Window_Type (Window),
               message,
               wParam,
               lParam,
               Return_Value);

         when WM_KEYDOWN =>
            On_Virtual_Key (
               Sizable_Panel_Type (Window),
               Integer (wParam));
            On_Message (
               GWindows.Windows.Window_Type (Window),
               message,
               wParam,
               lParam,
               Return_Value);

         when WM_SYSKEYDOWN =>
            if Window.Enable_System_Keys then
               -- system keys enabled
               On_Message (
                  GWindows.Windows.Window_Type (Window),
                  message,
                  wParam,
                  lParam,
                  Return_Value);
            else
               -- simulate a WM_KEYDOWN message for system keys
               On_Virtual_Key (
                  Sizable_Panel_Type (Window),
                  Integer (wParam));
               On_Message (
                  GWindows.Windows.Window_Type (Window),
                  WM_KEYDOWN,
                  wParam,
                  lParam,
                  Return_Value);
               Return_Value := 1;
            end if;

         when WM_CHAR =>
            declare
               type short is mod 16#10000#;

               Key      : GCharacter;
               High     : short := short (GWindows.Utilities.High_Word (lParam));
               Repeat   : Boolean;
               Extended : Boolean;
            begin
               Key := GCharacter'Val (wParam);
               Repeat := ((High and 16#4000#) /= 0);
               Extended := ((High and 16#0100#) /= 0);
               On_Character (
                  Sizable_Panel_Type (Window),
                  None,
                  Key,
                  Repeat,
                  Extended);
               Return_Value := 0;
            end;

         when WM_NCMOUSEMOVE =>
            On_Non_Client_Mouse_Move
              (Sizable_Panel_Type (Window),
               GWindows.Utilities.Low_Word (lParam),
               GWindows.Utilities.High_Word (lParam),
               Hit_Test_Type (wParam)); -- should decode hit test type
            On_Message (
               GWindows.Windows.Window_Type (Window),
               message,
               wParam,
               lParam,
               Return_Value);
            Return_Value := 0;

         when WM_CAPTURECHANGED =>
            On_Capture_Changed (Sizable_Panel_Type (Window));
            On_Message (
               GWindows.Windows.Window_Type (Window),
               message,
               wParam,
               lParam,
               Return_Value);
            Return_Value := 0;

         when WM_INITMENU =>
            On_Init_Menu (Sizable_Panel_Type (Window));

            Return_Value := 0;

         when others =>
            On_Message (
               GWindows.Windows.Window_Type (Window),
               message,
               wParam,
               lParam,
               Return_Value);
      end case;

   end On_Message;

   --------------------------
   -- On_Horizontal_Scroll --
   --------------------------

   procedure On_Horizontal_Scroll
     (Window  : in out Sizable_Panel_Type;
      Request : in     GWindows.Base.Scroll_Request_Type;
      Control : in     GWindows.Base.Pointer_To_Base_Window_Class)
   is
      use GWindows.Base;
      use GWindows.Windows;
   begin
      if Control /= null then
         On_Horizontal_Scroll (
            GWindows.Base.Base_Window_Type (Window),
            Request,
            Control);
      else
         Fire_On_Horizontal_Scroll (
            GWindows.Base.Base_Window_Type (Window),
            Request);
      end if;
   end On_Horizontal_Scroll;

   ------------------------
   -- On_Vertical_Scroll --
   ------------------------

   procedure On_Vertical_Scroll
     (Window  : in out Sizable_Panel_Type;
      Request : in     GWindows.Base.Scroll_Request_Type;
      Control : in     GWindows.Base.Pointer_To_Base_Window_Class)
   is
      use GWindows.Base;
   begin
      if Control /= null then
         On_Vertical_Scroll (
            GWindows.Base.Base_Window_Type (Window),
            Request,
            Control);
      else
         Fire_On_Vertical_Scroll (
            GWindows.Base.Base_Window_Type (Window),
            Request);
      end if;
   end On_Vertical_Scroll;

   --------------------------------------
   -- On_Non_Client_Mouse_Move_Handler --
   --------------------------------------

   procedure On_Non_Client_Mouse_Move_Handler
      (Window  : in out Sizable_Panel_Type;
       Handler : in     Non_Client_Mouse_Event)
   is
   begin
      Window.On_Non_Client_Mouse_Move_Event := Handler;
   end On_Non_Client_Mouse_Move_Handler;

   -------------------------------------------
   -- Fire_On_Non_Client_Mouse_Move_Handler --
   -------------------------------------------

   procedure Fire_On_Non_Client_Mouse_Move
      (Window : in out Sizable_Panel_Type;
       X      : in     Integer;
       Y      : in     Integer;
       Hit    : in     Hit_Test_Type)
   is
      use GWindows.Base;
   begin
      if Window.On_Non_Client_Mouse_Move_Event /= null then
         Window.On_Non_Client_Mouse_Move_Event
           (Base_Window_Type'Class (Window), X, Y, Hit);
      end if;
   end Fire_On_Non_Client_Mouse_Move;

   --------------------------------
   -- On_Capture_Changed_Handler --
   --------------------------------

   procedure On_Capture_Changed_Handler
      (Window  : in out Sizable_Panel_Type;
       Handler : in     GWindows.Base.Action_Event)
   is
   begin
      Window.On_Capture_Changed_Event := Handler;
   end On_Capture_Changed_Handler;

   -----------------------------
   -- Fire_On_Capture_Changed --
   -----------------------------

   procedure Fire_On_Capture_Changed
      (Window : in out Sizable_Panel_Type)
   is
      use GWindows.Base;
   begin
      if Window.On_Capture_Changed_Event /= null then
         Window.On_Capture_Changed_Event
           (Base_Window_Type'Class (Window));
      end if;
   end Fire_On_Capture_Changed;

   --------------------------
   -- On_Init_Menu_Handler --
   --------------------------

   procedure On_Init_Menu_Handler
      (Window  : in out Sizable_Panel_Type;
       Handler : in     GWindows.Base.Action_Event)
   is
   begin
      Window.On_Init_Menu_Event := Handler;
   end On_Init_Menu_Handler;

   -----------------------
   -- Fire_On_Init_Menu --
   -----------------------

   procedure Fire_On_Init_Menu
      (Window : in out Sizable_Panel_Type)
   is
      use GWindows.Base;
   begin
      if Window.On_Init_Menu_Event /= null then
         Window.On_Init_Menu_Event
           (Base_Window_Type'Class (Window));
      end if;
   end Fire_On_Init_Menu;

   --------------------------
   -- On_Character_Handler --
   --------------------------

   procedure On_Character_Handler
     (Window  : in out Sizable_Panel_Type;
      Handler : in     Repeatable_Character_Event)
   is
   begin
      Window.On_Character_Event := Handler;
   end On_Character_Handler;

   -----------------------
   -- Fire_On_Character --
   -----------------------

   procedure Fire_On_Character
     (Window      : in out Sizable_Panel_Type;
      Special_Key : in     GWindows.Windows.Special_Key_Type;
      Value       : in     GCharacter;
      Repeat      : in     Boolean;
      Extended    : in     Boolean)
   is
      use GWindows.Base;
      use GWindows.Windows;
   begin
      if Window.On_Character_Event /= null then
         Window.On_Character_Event
           (Base_Window_Type'Class (Window),
            Special_Key,
            Value,
            Repeat,
            Extended);
      end if;
   end Fire_On_Character;

   ---------------------
   -- On_Size_Handler --
   ---------------------

   procedure On_Size_Handler (Window  : in out Sizable_Panel_Type;
                              Handler : in     Size_Event)
   is
   begin
      Window.On_Size_Event := Handler;
   end On_Size_Handler;

   ------------------
   -- Fire_On_Size --
   ------------------

   procedure Fire_On_Size
     (Window   : in out Sizable_Panel_Type;
      SizeType : in     Integer;
      Width    : in     Integer;
      Height   : in     Integer)
   is
      use GWindows.Base;
   begin
      if Window.On_Size_Event /= null then
         Window.On_Size_Event
           (Base_Window_Type'Class (Window), SizeType, Width, Height);
      end if;
   end Fire_On_Size;

   ----------------------------
   -- On_Virtual_Key_Handler --
   ----------------------------

   procedure On_Virtual_Key_Handler
     (Window  : in out Sizable_Panel_Type;
      Handler : in     Virtual_Key_Event)
   is
   begin
      Window.On_Virtual_Key_Event := Handler;
   end On_Virtual_Key_Handler;

   -----------------------
   -- Fire_On_Virtual_Key --
   -----------------------

   procedure Fire_On_Virtual_Key
     (Window      : in out Sizable_Panel_Type;
      Virtual_Key : in     Integer)
   is
      use GWindows.Base;
      use GWindows.Windows;
   begin
      if Window.On_Virtual_Key_Event /= null then
         Window.On_Virtual_Key_Event
           (Base_Window_Type'Class (Window),
            Virtual_Key);
      end if;
   end Fire_On_Virtual_Key;

   ----------------------
   -- Messages_Waiting --
   ----------------------

   function Messages_Waiting return Boolean
   is
      use type Interfaces.C.long;

      type POINTL is
         record
            x : Interfaces.C.long;
            y : Interfaces.C.long;
         end record;
      pragma Convention (C_PASS_BY_COPY, POINTL);
      --  Part of MSG

      type MSG is
         record
            hwnd    : GWindows.Types.Handle;
            message : Interfaces.C.int;
            wParam  : Interfaces.C.int;
            lParam  : Interfaces.C.long;
            time    : Interfaces.C.unsigned_long;
            pt      : POINTL;
         end record;
      pragma Convention (C_PASS_BY_COPY, MSG);
      type Pointer_To_MSG is access all MSG;
      --  Win32 Message Loop Objet

      PM_REMOVE   : constant := 1;
      PM_NOREMOVE : constant := 0;

      function PeekMessage
        (lpMsg         : Pointer_To_MSG;
         hwnd          : Interfaces.C.long;
         wMsgFilterMin : Interfaces.C.unsigned;
         wMsgFilterMax : Interfaces.C.unsigned;
         RemoveMsg     : Interfaces.C.unsigned := PM_NOREMOVE)
        return Interfaces.C.long;
      pragma Import (StdCall, PeekMessage,
                       "PeekMessage" & Character_Mode_Identifier);

      tMSG        : aliased MSG;
      pMSG        : Pointer_To_MSG := tMSG'Unchecked_Access;
   begin
      return PeekMessage (pMSG, 0, 0, 0) /= 0;
   end Messages_Waiting;

end Sizable_Panels;

