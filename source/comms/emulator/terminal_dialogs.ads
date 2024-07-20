-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 2.0                                   --
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

with GWindows; use GWindows;
with GWindows.Base; use GWindows.Base;

with Terminal_Types;

package Terminal_Dialogs is

   use Terminal_Types;

   procedure Single_Value_Dialog (
      Owner   : in out Base_Window_Type'Class;
      Title   : in GString;
      Text    : in GString;
      Min     : in Natural;
      Max     : in Natural;
      Current : in Natural;
      Result  : out Natural;
      Ok      : out Boolean);

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
      Ok      : out Boolean);

   procedure About_Dialog (
      Owner       : in out Base_Window_Type'Class;
      Title       : in GString);

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
      RegnSizeRow : in Natural);

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
      Ok            :    out Boolean);

   procedure YModem_Dialog (
      Owner     : in out Base_Window_Type'Class;
      Title     : in     GString;
      Text      : in     GString;
      On_Start  : in     GWindows.Base.Action_Event;
      On_Abort  : in     GWindows.Base.Action_Event;
      Ok        :    out Boolean);

end Terminal_Dialogs;
