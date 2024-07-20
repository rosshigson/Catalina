-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 2.9                                   --
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

with GWindows.Windows;
with GWindows.Base;
with GWindows.Constants;
with GWindows.Edit_Boxes;
with GWindows.Buttons;
with GWindows.Static_Controls;
with GWindows.Combo_Boxes;
with GWindows.Common_Controls;
with GWindows.GStrings;
with GWindows.Application;
with GWindows.Drawing_Objects;

with Terminal_Internal_Types;

with FYModem;

package body Terminal_Dialogs is

   use Terminal_Internal_Types;
   use GWindows.Windows;
   use GWindows.Edit_Boxes;
   use GWindows.Buttons;
   use GWindows.Static_Controls;
   use GWindows.Combo_Boxes;
   use GWindows.Common_Controls;
   use GWindows.GStrings;
   use GWindows.Drawing_Objects;

   CRLF      : constant String    := ASCII.CR & ASCII.LF;
   HT        : constant Character := ASCII.HT;

   procedure Single_Value_Dialog (
      Owner   : in out Base_Window_Type'Class;
      Title   : in GString;
      Text    : in GString;
      Min     : in Natural;
      Max     : in Natural;
      Current : in Natural;
      Result  : out Natural;
      Ok      : out Boolean)
   is
      Dialog        : Window_Type;
      Font          : GWindows.Drawing_Objects.Font_Type;
      Label         : Label_Type;
      Size_Box      : Edit_Box_Type;
      Size_Str      : Unbounded_String;
      Up_Control    : Up_Down_Control_Type;
      Set_Button    : Default_Button_Type;
      Cancel_Button : Button_Type;
      Button        : Integer;

      procedure Do_Destroy (
         Window : in out GWindows.Base.Base_Window_Type'Class) is
      begin
         -- get result values before they are destroyed
         Size_Str := To_GString_Unbounded (Edit_Boxes.Text (Size_Box));
      end Do_Destroy;

   begin
      Create_As_Dialog (Dialog, Owner, Title, Width => 200, Height => 160);
      Keyboard_Support (Dialog);
      Center (Dialog, Owner);

      Create_Stock_Font (Font, GWindows.Drawing_Objects.Default_GUI);
      Set_Font (Dialog, Font);

      Create (Label, Dialog, Text, 5, 15, 190, 20, Center);
      Tab_Stop (Label, false);

      Create (Size_Box , Dialog, "", 40, 50, 120, 20);
      Digits_Only (Size_Box);
      Tab_Stop (Size_Box);
      Create (Up_Control, Dialog, 40, 50, 120, 20, Thousands => false); -- buddy with Size_Box
      Tab_Stop (Up_Control, false);
      Set_Range (Up_Control, Max, Min);
      Position (Up_Control, Current);
      Focus (Size_Box);
      Group (Size_Box);
      Create (Set_Button, Dialog, "Set", 40, 90, 50, 30, ID => GWindows.Constants.IDOK);
      Tab_Stop (Set_Button);
      Create (Cancel_Button, Dialog, "Cancel", 110, 90, 50, 30, ID => GWindows.Constants.IDCANCEL);
      Tab_Stop (Cancel_Button);
      Dock_Children (Dialog);
      On_Destroy_Handler (Dialog, Do_Destroy'Unrestricted_Access);
      Button := GWindows.Application.Show_Dialog (Dialog, Owner);
      if Button = GWindows.Constants.IDOK then
         begin
            Result := Natural'Value (To_String (Size_Str));
            Ok := true;
         exception
            when others =>
               Result := Current;
               Ok     := false;
         end;
         -- final sanity check on result
         if Result < Min or Result > Max then
            Result := Current;
         end if;
      else
         Result := Current;
         Ok     := false;
      end if;
   end Single_Value_Dialog;


   procedure Double_Value_Dialog (
      Owner   : in out Base_Window_Type'Class;
      Title   : in GString;
      Text    : in GString;
      Text1   : in GString;
      Min1    : in Natural;
      Max1    : in Natural;
      Cur1    : in Natural;
      Res1    : out Natural;
      Text2   : in GString;
      Min2    : in Natural;
      Max2    : in Natural;
      Cur2    : in Natural;
      Res2    : out Natural;
      Ok      : out Boolean)
   is
      Res1_Str      : Unbounded_String;
      Res2_Str      : Unbounded_String;
      Dialog        : Window_Type;
      Font          : GWindows.Drawing_Objects.Font_Type;
      Label         : Label_Type;
      Label1        : Label_Type;
      Label2        : Label_Type;
      Size_Box1     : Edit_Box_Type;
      Up_Control1   : Up_Down_Control_Type;
      Size_Box2     : Edit_Box_Type;
      Up_Control2   : Up_Down_Control_Type;
      Set_Button    : Default_Button_Type;
      Cancel_Button : Button_Type;
      Button        : Integer;

      procedure Do_Destroy (
         Window : in out GWindows.Base.Base_Window_Type'Class) is
      begin
         -- get result values before they are destroyed
         Res1_Str := To_GString_Unbounded (Edit_Boxes.Text (Size_Box1));
         Res2_Str := To_GString_Unbounded (Edit_Boxes.Text (Size_Box2));
      end Do_Destroy;

   begin
      Create_As_Dialog (Dialog, Owner, Title, Width => 300, Height => 180);
      Keyboard_Support (Dialog);
      Center (Dialog, Owner);

      Create_Stock_Font (Font, GWindows.Drawing_Objects.Default_GUI);
      Set_Font (Dialog, Font);

      Create (Label, Dialog, Text, 5, 15, 290, 20, Center);
      Tab_Stop (Label, false);

      Create (Label1, Dialog, Text1, 20, 50, 120, 20, Left);
      Tab_Stop (Label1, false);

      Create (Size_Box1 , Dialog, "", 20, 70, 120, 20);
      Digits_Only (Size_Box1);
      Tab_Stop (Size_Box1);
      Create (Up_Control1, Dialog, 20, 50, 120, 20, Thousands => false); -- buddy with Size_Box1
      Tab_Stop (Up_Control1, false);
      Set_Range (Up_Control1, Max1, Min1);
      Position (Up_Control1, Cur1);
      Focus (Size_Box1);
      Group (Size_Box1);

      Create (Label2, Dialog, Text2, 160, 50, 120, 20, Left);
      Tab_Stop (Label2, false);

      Create (Size_Box2 , Dialog, "", 160, 70, 120, 20);
      Digits_Only (Size_Box2);
      Tab_Stop (Size_Box2);
      Create (Up_Control2, Dialog, 160, 70, 120, 20, Thousands => false); -- buddy with Size_Box2
      Tab_Stop (Up_Control2, false);
      Set_Range (Up_Control2, Max2, Min2);
      Position (Up_Control2, Cur2);

      Create (Set_Button, Dialog, "Set", 90, 110, 50, 30, ID => GWindows.Constants.IDOK);
      Tab_Stop (Set_Button);
      Create (Cancel_Button, Dialog, "Cancel", 160, 110, 50, 30, ID => GWindows.Constants.IDCANCEL);
      Tab_Stop (Cancel_Button);
      Dock_Children (Dialog);
      On_Destroy_Handler (Dialog, Do_Destroy'Unrestricted_Access);
      Button := GWindows.Application.Show_Dialog (Dialog, Owner);
      if Button = GWindows.Constants.IDOK then
         begin
            Res1 := Natural'Value (To_String (Res1_Str));
            Res2 := Natural'Value (To_String (Res2_Str));
            Ok   := true;
         exception
            when others =>
               Res1 := Cur1;
               Res2 := Cur2;
               Ok := false;
         end;
         -- final sanity check on result
         if Res1 < Min1 or Res1 > Max1 then
            Res1 := Cur1;
         end if;
         if Res2 < Min2 or Res2 > Max2 then
            Res2 := Cur2;
         end if;
      else
         Res1 := Cur1;
         Res2 := Cur2;
         Ok   := false;
      end if;
   end Double_Value_Dialog;


   procedure Info_Dialog (
      Owner       : in out Base_Window_Type'Class;
      Title       : in GString;
      RealSizeCol : in Natural;
      RealSizeRow : in Natural;
      RealUsedCol : in Natural;
      RealUsedRow : in Natural;
      VirtBaseCol : in Natural;
      VirtBaseRow : in Natural;
      VirtUsedCol : in Natural;
      VirtUsedRow : in Natural;
      ScrnBaseCol : in Natural;
      ScrnBaseRow : in Natural;
      ScrnSizeCol : in Natural;
      ScrnSizeRow : in Natural;
      ViewBaseCol : in Natural;
      ViewBaseRow : in Natural;
      ViewSizeCol : in Natural;
      ViewSizeRow : in Natural;
      RegnBaseCol : in Natural;
      RegnBaseRow : in Natural;
      RegnSizeCol : in Natural;
      RegnSizeRow : in Natural)
   is
      Dialog        : Window_Type;
      Font          : GWindows.Drawing_Objects.Font_Type;
      Label         : Label_Type;
      Data_Box      : Multi_Line_Edit_Box_Type;
      OK_Button     : Default_Button_Type;
      Button        : Integer;

   begin
      Create_As_Dialog (Dialog, Owner, Title, Width => 250, Height => 280);
      Keyboard_Support (Dialog);
      Center (Dialog, Owner);

      Create_Stock_Font (Font, GWindows.Drawing_Objects.Default_GUI);
      Set_Font (Dialog, Font);

      Create (Label, Dialog, "Buffer Values (Column, Row):", 10, 15, 220, 20, Left);
      Tab_Stop (Label, false);

      Create (Data_Box , Dialog, "", 10, 40, 225, 150);
      Tab_Stop (Data_Box, false);
      Read_Only (Data_Box);
      Edit_Boxes.Text (Data_Box, To_GString (
         "Real"    & HT & "Size:"  & HT &
            Natural'Image (RealSizeCol) & "," & Natural'Image (RealSizeRow) & CRLF &
                     HT & "Used:"  & HT &
            Natural'Image (RealUsedCol) & "," & Natural'Image (RealUsedRow) & CRLF &
         "Virtual" & HT & "Base:"  & HT &
            Natural'Image (VirtBaseCol) & "," & Natural'Image (VirtBaseRow) & CRLF &
                     HT & "Used:"  & HT &
            Natural'Image (VirtUsedCol) & "," & Natural'Image (VirtUsedRow) & CRLF &
         "Screen"  & HT & "Base:"  & HT &
            Natural'Image (ScrnBaseCol) & "," & Natural'Image (ScrnBaseRow) & CRLF &
                     HT & "Size:"  & HT &
            Natural'Image (ScrnSizeCol) & "," & Natural'Image (ScrnSizeRow) & CRLF &
         "View"    & HT & "Base:"  & HT &
            Natural'Image (ViewBaseCol) & "," & Natural'Image (ViewBaseRow) & CRLF &
                     HT & "Size:"  & HT &
            Natural'Image (ViewSizeCol) & "," & Natural'Image (ViewSizeRow) & CRLF &
         "Region"  & HT & "Base:"  & HT &
            Natural'Image (RegnBaseCol) & "," & Natural'Image (RegnBaseRow) & CRLF &
                     HT & "Size:"  & HT &
            Natural'Image (RegnSizeCol) & "," & Natural'Image (RegnSizeRow)));

      Create (OK_Button, Dialog, "OK", 100, 200, 50, 30, ID => GWindows.Constants.IDOK);
      Tab_Stop (OK_Button);
      Focus (OK_Button);
      Group (OK_Button);
      Dock_Children (Dialog);
      Button := GWindows.Application.Show_Dialog (Dialog, Owner);
   end Info_Dialog;


   procedure About_Dialog (
      Owner       : in out Base_Window_Type'Class;
      Title       : in GString)
   is
      Dialog        : Window_Type;
      Font          : GWindows.Drawing_Objects.Font_Type;
      Data_Box      : Multi_Line_Edit_Box_Type;
      OK_Button     : Default_Button_Type;
      Button        : Integer;

      FFT_Text      : constant String :=
            "Ada Terminal Emulator - version 2.9. This program should have come" & CRLF &
            "complete with all source code and documentation. If not, you can" & CRLF &
            "download them from https://ada-terminal-emulator.sourceforge.io/" & CRLF & CRLF &
            "Terminal_Emulator, Comms, Term_IO and Redirect:" & CRLF & CRLF &
            "Copyright (c) 2003, 2022 Ross Higson." & CRLF &
            "This program is free software; you can redistribute it and/or modify " &
            "it under the terms of the GNU General Public License as published by " &
            "the Free Software Foundation; either version 2 of the License, or " &
            "(at your option) any later version." & CRLF &
            "This program is distributed in the hope that it will be useful, " &
            "but WITHOUT ANY WARRANTY; without even the implied warranty of " &
            "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the " &
            "GNU General Public License for more details." & CRLF &
            "You should have received a copy of the GNU General Public License " &
            "along with this program; if not, write to the Free Software " &
            "Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA" & CRLF & CRLF;

      MIT_Text      : constant String :=
            "Parser for VT420 Terminal Emulators:" & CRLF & CRLF &
            "Copyright 1995 by the Massachusetts Institute of Technology. " &
            "All rights reserved." & CRLF &
            "THIS SOFTWARE IS PROVIDED ""AS IS"", AND M.I.T. MAKES NO REPRESENTATIONS " &
            "OR WARRANTIES, EXPRESS OR IMPLIED. By way of example, but not limitation, " &
            "M.I.T. MAKES NO REPRESENTATIONS OR WARRANTIES OF MERCHANTABILITY OR " &
            "FITNESS FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF THE LICENSED SOFTWARE " &
            "OR DOCUMENTATION WILL NOT INFRINGE ANY THIRD PARTY PATENTS, COPYRIGHTS, " &
            " TRADEMARKS OR OTHER RIGHTS. " & CRLF & CRLF;

      GWindows_Text : constant String :=
            "GWindows:" & CRLF & CRLF &
            "Copyright (C) 1999 - 2020 David Botton" & CRLF &
            "This is free software; you can redistribute it and/or modify it under " &
            "terms of the GNU General Public License as published by the Free Software " &
            "Foundation; either version 2, or (at your option) any later version. " &
            "It is distributed in the hope that it will be useful, but WITHOUT " &
            "ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or " &
            "FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License " &
            "for more details. You should have received a copy of the GNU General " &
            "Public License distributed with this; see file COPYING. If not, write " &
            "to the Free Software Foundation, 59 Temple Place - Suite 330, Boston, " &
            "MA 02111-1307, USA." & CRLF &
            "As a special exception, if other files instantiate generics from this " &
            "unit, or you link this unit with other files to produce an executable, " &
            "this unit does not by itself cause the resulting executable to be " &
            "covered by the GNU General Public License. This exception does not " &
            "however invalidate any other reasons why the executable file might be " &
            "covered by the GNU Public License." & CRLF &
            "More information about GWINDOWS and the most current public version can " &
            "be located on the web at one of the following places:" &
            "   https://sourceforge.net/projects/gnavi/" &
            "   https://github.com/zertovitch/gwindows" &
            "   http://www.gnavi.org/gwindows" &
            "   http://www.adapower.com/gwindows" & CRLF & CRLF;

   begin
      Create_As_Dialog (Dialog, Owner, Title, Width => 400, Height => 200);
      Keyboard_Support (Dialog);
      Center (Dialog, Owner);

      Create_Stock_Font (Font, GWindows.Drawing_Objects.Default_GUI);
      Set_Font (Dialog, Font);

      Create (Data_Box , Dialog, To_GString (
         FFT_Text & CRLF & MIT_Text & CRLF & GWindows_Text),
         10, 10, 380, 110);
      Tab_Stop (Data_Box, false);
      Read_Only (Data_Box);

      Create (OK_Button, Dialog, "OK", 175, 130, 50, 30, ID => GWindows.Constants.IDOK);
      Tab_Stop (OK_Button);
      Focus (OK_Button);
      Group (OK_Button);
      Dock_Children (Dialog);
      Button := GWindows.Application.Show_Dialog (Dialog, Owner);
   end About_Dialog;

   procedure Advanced_Dialog (
      Owner         : in out Base_Window_Type'Class;
      Title         : in     GString;
      Echo          : in out Boolean;
      Insert        : in out Boolean;
      Wrap          : in out Boolean;
      IgnoreCR      : in out Boolean;
      IgnoreLF      : in out Boolean;
      LFasEOL       : in out Boolean;
      LFonCR        : in out Boolean;
      CRonLF        : in out Boolean;
      CursorKeys    : in out Boolean;
      ExtendedKeys  : in out Boolean;
      SingleStyle   : in out Boolean;
      SingleCursor  : in out Boolean;
      UpDownView    : in out Boolean;
      PageView      : in out Boolean;
      HomeEndView   : in out Boolean;
      ScreenAndView : in out Boolean;
      LRWrap        : in out Boolean;
      LRScroll      : in out Boolean;
      HomeEndInLine : in out Boolean;
      TextFlashing  : in out Boolean;
      AnyFont       : in out Boolean;
      MouseCursor   : in out Boolean;
      SysKeys       : in out Boolean;
      FixPrevChar   : in out Boolean;
      FixNextChar   : in out Boolean;
      AnsiMode      : in out Ansi_Mode;
      AnsiOnInput   : in out Boolean;
      AnsiOnOutput  : in out Boolean;
      DeleteOnBS    : in out Boolean;
      UseRegion     : in out Boolean;
      DisplayCodes  : in out Boolean;
      VTKeys        : in out Boolean;
      Ok            :    out Boolean)
   is
      Dialog                 : Window_Type;
      Font                   : GWindows.Drawing_Objects.Font_Type;
      OK_Button              : Default_Button_Type;
      Cancel_Button          : Button_Type;
      Button                 : Integer;
      Wrap_Button            : Check_Box_Type;
      Echo_Button            : Check_Box_Type;
      Insert_Button          : Check_Box_Type;
      IgnoreCR_Button        : Check_Box_Type;
      IgnoreLF_Button        : Check_Box_Type;
      LFasEOL_Button         : Check_Box_Type;
      LFonCR_Button          : Check_Box_Type;
      CRonLF_Button          : Check_Box_Type;
      CursorKeys_Button      : Check_Box_Type;
      ExtendedKeys_Button    : Check_Box_Type;
      SingleStyle_Button     : Check_Box_Type;
      SingleCursor_Button    : Check_Box_Type;
      UpDownView_Button      : Check_Box_Type;
      PageView_Button        : Check_Box_Type;
      HomeEndView_Button     : Check_Box_Type;
      ScreenAndView_Button   : Check_Box_Type;
      LRWrap_Button          : Check_Box_Type;
      LRScroll_Button        : Check_Box_Type;
      HomeEndInLine_Button   : Check_Box_Type;
      TextFlashing_Button    : Check_Box_Type;
      AnyFont_Button         : Check_Box_Type;
      MouseCursor_Button     : Check_Box_Type;
      SysKeys_Button         : Check_Box_Type;
      FixPrev_Button         : Check_Box_Type;
      FixNext_Button         : Check_Box_Type;
      AnsiLabel              : Label_Type;
      AnsiMode_Box           : Drop_Down_List_Box_Type;
      AnsiOnInput_Button     : Check_Box_Type;
      AnsiOnOutput_Button    : Check_Box_Type;
      DeleteOnBS_Button      : Check_Box_Type;
      UseRegion_Button       : Check_Box_Type;
      DisplayCodes_Button    : Check_Box_Type;
      VTKeys_Button          : Check_Box_Type;
      Wrap_Result            : Boolean;
      Echo_Result            : Boolean;
      Insert_Result          : Boolean;
      IgnoreCR_Result        : Boolean;
      IgnoreLF_Result        : Boolean;
      LFasEOL_Result         : Boolean;
      LFonCR_Result          : Boolean;
      CRonLF_Result          : Boolean;
      CursorKeys_Result      : Boolean;
      ExtendedKeys_Result    : Boolean;
      SingleStyle_Result     : Boolean;
      SingleCursor_Result    : Boolean;
      UpDownView_Result      : Boolean;
      PageView_Result        : Boolean;
      HomeEndView_Result     : Boolean;
      ScreenAndView_Result   : Boolean;
      LRWrap_Result          : Boolean;
      LRScroll_Result        : Boolean;
      HomeEndInLine_Result   : Boolean;
      TextFlashing_Result    : Boolean;
      AnyFont_Result         : Boolean;
      MouseCursor_Result     : Boolean;
      SysKeys_Result         : Boolean;
      FixPrev_Result         : Boolean;
      FixNext_Result         : Boolean;
      AnsiMode_Result        : Ansi_Mode;
      AnsiOnInput_Result     : Boolean;
      AnsiOnOutput_Result    : Boolean;
      DeleteOnBS_Result      : Boolean;
      UseRegion_Result       : Boolean;
      DisplayCodes_Result    : Boolean;
      VTKeys_Result          : Boolean;

      procedure Do_Destroy (
         Window : in out GWindows.Base.Base_Window_Type'Class)
      is
         AnsiMode_TmpResult : Natural;
      begin
         -- get result values before they are destroyed
         Wrap_Result :=          State (Wrap_Button) = Checked;
         Echo_Result :=          State (Echo_Button) = Checked;
         Insert_Result :=        State (Insert_Button) = Checked;
         IgnoreCR_Result :=      State (IgnoreCR_Button) = Checked;
         IgnoreLF_Result :=      State (IgnoreLF_Button) = Checked;
         LFasEOL_Result :=       State (LFasEOL_Button) = Checked;
         LFonCR_Result :=        State (LFonCR_Button) = Checked;
         CRonLF_Result :=        State (CRonLF_Button) = Checked;
         CursorKeys_Result :=    State (CursorKeys_Button) = Checked;
         ExtendedKeys_Result :=  State (ExtendedKeys_Button) = Checked;
         SingleStyle_Result :=   State (SingleStyle_Button) = Checked;
         SingleCursor_Result :=  State (SingleCursor_Button) = Checked;
         UpDownView_Result :=    State (UpDownView_Button) = Checked;
         PageView_Result :=      State (PageView_Button) = Checked;
         HomeEndView_Result :=   State (HomeEndView_Button) = Checked;
         ScreenAndView_Result := State (ScreenAndView_Button) = Checked;
         LRWrap_Result :=        State (LRWrap_Button) = Checked;
         LRScroll_Result :=      State (LRScroll_Button) = Checked;
         HomeEndInLine_Result := State (HomeEndInLine_Button) = Checked;
         TextFlashing_Result :=  State (TextFlashing_Button) = Checked;
         AnyFont_Result :=       State (AnyFont_Button) = Checked;
         MouseCursor_Result :=   State (MouseCursor_Button) = Checked;
         SysKeys_Result :=       State (SysKeys_Button) = Checked;
         FixPrev_Result :=       State (FixPrev_Button) = Checked;
         FixNext_Result :=       State (FixNext_Button) = Checked;
         AnsiMode_TmpResult :=   Current (AnsiMode_Box);
         if AnsiMode_TmpResult = 1 then
               AnsiMode_Result := PC;
         elsif AnsiMode_TmpResult = 2 then
               AnsiMode_Result := VT52;
         elsif AnsiMode_TmpResult = 3 then
               AnsiMode_Result := VT100;
         elsif AnsiMode_TmpResult = 4 then
               AnsiMode_Result := VT101;
         elsif AnsiMode_TmpResult = 5 then
               AnsiMode_Result := VT102;
         elsif AnsiMode_TmpResult = 6 then
               AnsiMode_Result := VT220;
         elsif AnsiMode_TmpResult = 7 then
               AnsiMode_Result := VT320;
         elsif AnsiMode_TmpResult = 8 then
               AnsiMode_Result := VT420;
         end if;
         AnsiOnInput_Result  :=  State (AnsiOnInput_Button) = Checked;
         AnsiOnOutput_Result :=  State (AnsiOnOutput_Button) = Checked;
         DeleteOnBS_Result   :=  State (DeleteOnBS_Button) = Checked;
         UseRegion_Result    :=  State (UseRegion_Button) = Checked;
         DisplayCodes_Result :=  State (DisplayCodes_Button) = Checked;
         VTKeys_Result       :=  State (VTKeys_Button) = Checked;
      end Do_Destroy;

      procedure Create_Init (Button : in out Check_Box_Type;
                             Owner  : in out Base_Window_Type'Class;
                             Init   : in Boolean;
                             Text   : in String;
                             Left   : in Natural;
                             Top    : in Natural;
                             Width  : in Natural;
                             Height : in Natural) is
      begin
         create (Button, Owner, To_GString (Text), Left, Top, Width, Height);
         Tab_Stop (Button);
         if Init then
            State (Button, Checked);
         else
            State (Button, Unchecked);
         end if;
      end Create_Init;

   begin
      Create_As_Dialog (Dialog, Owner, Title, Width => 350, Height => 410);
      Keyboard_Support (Dialog);
      Center (Dialog, Owner);

      Create_Stock_Font (Font, GWindows.Drawing_Objects.Default_GUI);
      Set_Font (Dialog, Font);

      Create_Init (Wrap_Button, Dialog, Wrap, "Wrap", 10, 10, 60, 20);
      Create_Init (Echo_Button, Dialog, Echo, "Echo", 90, 10, 60, 20);
      Create_Init (Insert_Button, Dialog, Insert, "Insert", 160, 10, 60, 20);
      Create_Init (IgnoreCR_Button, Dialog, IgnoreCR, "Do not process CR", 10, 30, 140, 20);
      Create_Init (IgnoreLF_Button, Dialog, IgnoreLF, "Do not process LF", 160, 30, 140, 20);
      Create_Init (LFasEOL_Button, Dialog, LFasEOL, "Use LF as EOL", 10, 50, 140, 20);
      Create_Init (LFonCR_Button, Dialog, LFonCR, "Auto LF on CR", 160, 50, 140, 20);
      Create_Init (CRonLF_Button, Dialog, CRonLF, "Auto CR on LF", 10, 70, 140, 20);
      Create_Init (CursorKeys_Button, Dialog, CursorKeys, "Enable cursor Keys", 160, 70, 140, 20);
      Create_Init (SingleStyle_Button, Dialog, SingleStyle, "Combined Text Style", 10, 90, 140, 20);
      Create_Init (SingleCursor_Button, Dialog, SingleCursor, "Combined Text Cursor", 160, 90, 140, 20);
      Create_Init (UpDownView_Button, Dialog, UpDownView, "Up/Down moves View", 10, 110, 140, 20);
      Create_Init (PageView_Button, Dialog, PageView, "Page Up/Down moves View", 160, 110, 160, 20);
      Create_Init (HomeEndView_Button, Dialog, HomeEndView, "Home/End moves View", 10, 130, 140, 20);
      Create_Init (ScreenAndView_Button, Dialog, ScreenAndView, "Screen and View Locked", 160, 130, 140, 20);
      Create_Init (LRWrap_Button, Dialog, LRWrap, "Left/Right keys Wrap", 10, 150, 140, 20);
      Create_Init (LRScroll_Button, Dialog, LRScroll, "Left/Right keys Scroll", 160, 150, 140, 20);
      Create_Init (HomeEndInLine_Button, Dialog, HomeEndInLine, "Home/End stay in line", 10, 170, 140, 20);
      Create_Init (TextFlashing_Button, Dialog, TextFlashing, "Enable text flashing", 160, 170, 140, 20);
      Create_Init (AnyFont_Button, Dialog, AnyFont, "Allow any screen font", 10, 190, 140, 20);
      Create_Init (MouseCursor_Button, Dialog, MouseCursor, "Mouse moves Cursor", 160, 190, 140, 20);
      Create_Init (SysKeys_Button, Dialog, SysKeys, "Enable System Keys", 10, 210, 140, 20);
      Create_Init (ExtendedKeys_Button, Dialog, ExtendedKeys, "Return Extended Keys", 160, 210, 140, 20);
      Create_Init (FixPrev_Button, Dialog, FixPrevChar, "Redraw previous char", 10, 230, 140, 20);
      Create_Init (FixNext_Button, Dialog, FixNextChar, "Redraw next char", 160, 230, 140, 20);
      Create_Init (DeleteOnBS_Button, Dialog, DeleteOnBS, "Send DEL on Backspace", 10, 250, 140, 20);
      Create_Init (UseRegion_Button, Dialog, UseRegion, "Scroll only within region", 160, 250, 140, 20);
      Create_Init (DisplayCodes_Button, Dialog, DisplayCodes, "Display Control Codes", 10, 270, 140, 20);
      Create_Init (VTKeys_Button, Dialog, VTKeys, "VT Keys on keypad", 160, 270, 140, 20);
      Create (AnsiLabel, Dialog, "ANSI Mode:", 10, 295, 80, 20, Left);
      Tab_Stop (AnsiLabel, false);

      Create (AnsiMode_Box, Dialog, 100, 290, 120, 80, Sort => False);
      Add (AnsiMode_Box, "PC");
      Add (AnsiMode_Box, "VT52");
      Add (AnsiMode_Box, "VT100");
      Add (AnsiMode_Box, "VT101");
      Add (AnsiMode_Box, "VT102");
      Add (AnsiMode_Box, "VT220");
      Add (AnsiMode_Box, "VT320");
      Add (AnsiMode_Box, "VT420");
      Create_Init (AnsiOnInput_Button, Dialog, AnsiOnInput, "Decode ANSI on Input", 10, 310, 140, 20);
      Create_Init (AnsiOnOutput_Button, Dialog, AnsiOnOutput, "Decode ANSI on Output", 160, 310, 140, 20);
      case AnsiMode is
         when PC =>
            Current (AnsiMode_Box, 1);
         when VT52 =>
            Current (AnsiMode_Box, 2);
         when VT100 =>
            Current (AnsiMode_Box, 3);
         when VT101 =>
            Current (AnsiMode_Box, 4);
         when VT102 =>
            Current (AnsiMode_Box, 5);
         when VT220 =>
            Current (AnsiMode_Box, 6);
         when VT320 =>
            Current (AnsiMode_Box, 7);
         when VT420 =>
            Current (AnsiMode_Box, 8);
      end case;

      Create (OK_Button, Dialog, "OK", 110, 340, 50, 30, ID => GWindows.Constants.IDOK);
      Tab_Stop (OK_Button);
      Create (Cancel_Button, Dialog, "Cancel", 185, 340, 50, 30, ID => GWindows.Constants.IDCANCEL);
      Tab_Stop (Cancel_Button);
      Dock_Children (Dialog);
      On_Destroy_Handler (Dialog, Do_Destroy'Unrestricted_Access);
      Focus (OK_Button);
      Group (OK_Button);
      Button := GWindows.Application.Show_Dialog (Dialog, Owner);
      if Button = GWindows.Constants.IDOK then
         Wrap          := Wrap_Result;
         Echo          := Echo_Result;
         Insert        := Insert_Result;
         IgnoreCR      := IgnoreCR_Result;
         IgnoreLF      := IgnoreLF_Result;
         LFasEOL       := LFasEOL_Result;
         LFonCR        := LFonCR_Result;
         CRonLF        := CRonLF_Result;
         CursorKeys    := CursorKeys_Result;
         ExtendedKeys  := ExtendedKeys_Result;
         SingleStyle   := SingleStyle_Result;
         SingleCursor  := SingleCursor_Result;
         UpDownView    := UpDownView_Result;
         PageView      := PageView_Result;
         HomeEndView   := HomeEndView_Result;
         ScreenAndView := ScreenAndView_Result;
         LRWrap        := LRWrap_Result;
         LRScroll      := LRScroll_Result;
         HomeEndInLine := HomeEndInLine_Result;
         TextFlashing  := TextFlashing_Result;
         AnyFont       := AnyFont_Result;
         MouseCursor   := MouseCursor_Result;
         SysKeys       := SysKeys_Result;
         FixPrevChar   := FixPrev_Result;
         FixNextChar   := FixNext_Result;
         AnsiMode      := AnsiMode_Result;
         AnsiOnInput   := AnsiOnInput_Result;
         AnsiOnOutput  := AnsiOnOutput_Result;
         DeleteOnBS    := DeleteOnBS_Result;
         UseRegion     := UseRegion_Result;
         DisplayCodes  := DisplayCodes_Result;
         VTKeys        := VTKeys_Result;
         Ok   := true;
      else
         Ok   := false;
      end if;
   end Advanced_Dialog;

   -- general purpose parallel Action_Event task ...
   task type Performer is
      entry Start (Window : in out GWindows.Base.Base_Window_Type'Class;
                   Action : in     GWindows.Base.Action_Event);
      entry Done;
   end Performer;

   task body Performer is
      My_Window : access GWindows.Base.Base_Window_Type'Class;
      My_Action : GWindows.Base.Action_Event;
      begin
      accept Start (Window : in out GWindows.Base.Base_Window_Type'Class;
                    Action : in     GWindows.Base.Action_Event) do
         My_Window := Window'Unchecked_Access;
         My_Action := Action;
      end Start;
      My_Action (My_Window.all);
      select
         accept Done;
      or
         terminate;
      end select;
   end Performer;

   procedure YModem_Dialog (
      Owner     : in out Base_Window_Type'Class;
      Title     : in     GString;
      Text      : in     GString;
      On_Start  : in     GWindows.Base.Action_Event;
      On_Abort  : in     GWindows.Base.Action_Event;
      Ok        :    out Boolean)
   is
      Dialog         : Window_Type;
      Font           : GWindows.Drawing_Objects.Font_Type;
      Label          : Label_Type;
      Name_Box       : Multi_Line_Edit_Box_Type;
      Name_Str       : Unbounded_String;
      Label2         : Label_Type;
      Status_Box     : Edit_Box_Type;
      Status_Str     : Unbounded_String;
      Start_Button   : Button_Type;
      Abort_Button   : Button_Type;
      Done_Button    : Button_Type;
      Button         : Integer;
      Actor          : access Performer;
      In_Progress    : Boolean := False;
      Closed         : Boolean := False;

      procedure Do_Destroy (
         Window : in out GWindows.Base.Base_Window_Type'Class) is
      begin
         -- get result values before they are destroyed
         Name_Str := To_GString_Unbounded (Edit_Boxes.Text (Name_Box));
      end Do_Destroy;

      procedure My_Start(Window : in out GWindows.Base.Base_Window_Type'Class)
      is
         Name     : Unbounded_String;
         Status   : Integer;
         Expected : Integer;
         Actual   : Integer;
         -- Done     : Boolean := False;
      begin
         if In_Progress then
            Set_Selection(Status_Box, 0, 64);
            Replace_Selection(Status_Box, "Error: Transfer in progress");
         else
            In_Progress := True;
            Name := To_GString_Unbounded (Edit_Boxes.Text (Name_Box));
            Set_Selection(Status_Box, 0, 64);
            Replace_Selection(Status_Box, "Transferring ... ");
            Status := FYModem.SetFile(Name, 3000);
            Actor := new Performer;
            Actor.Start(Window, On_Start);
            while In_Progress loop
               select
                  Actor.Done;
                  In_Progress := False;
               else
                  delay 0.01;
                  if not Closed then
                     GWindows.Application.Message_Check;
                  end if;
               end select;
            end loop;
            Status := FYModem.Status;
            Expected := FYModem.Expected;
            Actual := FYModem.Actual;
            if not Closed then
               Set_Selection(Status_Box, 0, 64);
               if (Status = -1) then
                  Replace_Selection(Status_Box, "Error: Could not open file");
               elsif (Status = -2) then
                  Replace_Selection(Status_Box, "Transfer aborted");
               else
                  Set_Selection(Name_Box, 0, 64);
                  Replace_Selection(Name_Box, FYModem.FileName);
                  if Expected = Actual then
                     Replace_Selection(Status_Box,
                                       "Done: Transferred " & Integer'Image(Actual) & " bytes");
                  else
                     Replace_Selection(Status_Box,
                                       "Error: Expected" & Integer'Image(Expected)
                                       & " bytes but transferred" &  Integer'Image(Actual));
                  end if;
               end if;
            end if;
         end if;
      end My_Start;

      procedure My_Abort(Window : in out GWindows.Base.Base_Window_Type'Class)
      is
         Name : Unbounded_String;
      begin
         Name := To_GString_Unbounded (Edit_Boxes.Text (Name_Box));
         Set_Selection(Status_Box, 0, 64);
         Replace_Selection(Status_Box, "Aborting ...");
         On_Abort(Window);
         Set_Selection(Status_Box, 0, 64);
         Replace_Selection(Status_Box, "Transfer Aborted");
      end My_Abort;

      procedure My_Done(Window : in out GWindows.Base.Base_Window_Type'Class)
      is
         Name : Unbounded_String;
      begin
         if In_Progress then
            Set_Selection(Status_Box, 0, 64);
            Replace_Selection(Status_Box, "Error: Transfer in progress");
         else
            Closed := True;
            Close(Dialog);
         end if;
      end My_Done;

   begin
      Create_As_Dialog (Dialog, Owner, Title, Width => 480, Height => 200);
      Keyboard_Support (Dialog);
      Center (Dialog, Owner);

      Create_Stock_Font (Font, GWindows.Drawing_Objects.Default_GUI);
      Set_Font (Dialog, Font);

      Create (Label, Dialog, Text, 40, 15, 190, 20, Left);
      Tab_Stop (Label, false);

      Create_Multi_Line (Name_Box , Dialog, "", 40, 35, 400, 20, Vertical_Scroll => False);
      Tab_Stop (Name_Box);
      Text_Limit(Name_Box, 64);

      Create (Label2, Dialog, To_GString("Results:"), 40, 60, 190, 20, Left);
      Tab_Stop (Label2, false);

      Create (Status_Box , Dialog, "", 40, 80, 400, 20);
      Read_Only(Status_Box);
      Set_Selection(Status_Box, 0, 64);
      Replace_Selection(Status_Box, "Press Start, Abort or Done ... ");
      Tab_Stop (Status_Box, false);

      Create (Start_Button, Dialog, "Start", 140, 120, 50, 30);
      On_Click_Handler(Start_Button, My_Start'Unrestricted_Access);
      Tab_Stop (Start_Button);

      Create (Abort_Button, Dialog, "Abort", 220, 120, 50, 30);
      On_Click_Handler(Abort_Button, My_Abort'Unrestricted_Access);
      Tab_Stop (Abort_Button);

      Create (Done_Button, Dialog, "Done", 300, 120, 50, 30);
      On_Click_Handler(Done_Button, My_Done'Unrestricted_Access);
      Tab_Stop (Done_Button);

      Focus (Name_Box);

      Dock_Children (Dialog);
      Order(Dialog, Always_On_Top);
      On_Destroy_Handler (Dialog, Do_Destroy'Unrestricted_Access);
      Button := GWindows.Application.Show_Dialog (Dialog, Owner);
      if Button = GWindows.Constants.IDOK then
         begin
            Ok := true;
         exception
            when others =>
               Ok := false;
         end;
      else
         Ok := false;
      end if;
   end YModem_Dialog;

end Terminal_Dialogs;
