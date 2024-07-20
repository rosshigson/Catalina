-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 0.2                                   --
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

with System;

with Interfaces.C;
with GWindows.Types;
with GWindows.GStrings;
with GWindows.GStrings.Unbounded;
with GNATCOM.Types;

with Win32.Windef;
with Win32.Winbase;

package body Common_Dialogs is
   pragma Linker_Options ("-luser32");
   pragma Linker_Options ("-lgdi32");
   pragma Linker_Options ("-lcomdlg32");

   use type Interfaces.C.unsigned;

   -------------------------------------------------------------------------
   --  Operating System Imports
   ------------------------------------------------------------------------

   CC_RGBINIT              : constant := 1;
--     CC_FULLOPEN             : constant := 2;
--     CC_PREVENTFULLOPEN      : constant := 4;
--     CC_SHOWHELP             : constant := 8;
--     CC_ENABLEHOOK           : constant := 16;
--     CC_ENABLETEMPLATE       : constant := 32;
--     CC_ENABLETEMPLATEHANDLE : constant := 64;
--     CC_SOLIDCOLOR           : constant := 128;
   CC_ANYCOLOR             : constant := 256;
--     OFN_READONLY             : constant := 1;
--     OFN_OVERWRITEPROMPT      : constant := 2;
   OFN_HIDEREADONLY         : constant := 4;
--     OFN_NOCHANGEDIR          : constant := 8;
--     OFN_SHOWHELP             : constant := 16;
--     OFN_ENABLEHOOK           : constant := 32;
--     OFN_ENABLETEMPLATE       : constant := 64;
--     OFN_ENABLETEMPLATEHANDLE : constant := 128;
--     OFN_NOVALIDATE           : constant := 256;
--     OFN_ALLOWMULTISELECT     : constant := 512;
--     OFN_EXTENSIONDIFFERENT   : constant := 1024;
--     OFN_PATHMUSTEXIST        : constant := 2048;
--     OFN_FILEMUSTEXIST        : constant := 4096;
--     OFN_CREATEPROMPT         : constant := 8192;
--     OFN_SHAREAWARE           : constant := 16384;
--     OFN_NOREADONLYRETURN     : constant := 32768;
--     OFN_NOTESTFILECREATE     : constant := 65536;
--     OFN_NONETWORKBUTTON      : constant := 131072;
--     OFN_NOLONGNAMES          : constant := 262144;
--     OFN_EXPLORER             : constant := 524288;
--     OFN_NODEREFERENCELINKS   : constant := 1048576;
--     OFN_LONGNAMES            : constant := 2097152;

   type TCHOOSECOLOR is
      record
         lStructSize    : Interfaces.C.long          := Interfaces.C.long(TCHOOSECOLOR'Size/8);
         hwndOwner      : GWindows.Types.Handle      := GWindows.Types.Null_Handle;
         hInstance      : Win32.Windef.HGLOBAL       := System.Null_Address;
         rgbResult      : GWindows.Colors.Color_Type := 0;
         lpCustColors   : Pointer_To_Color_Array;
         flags          : Interfaces.C.unsigned      := CC_ANYCOLOR or CC_RGBINIT;
         lCustData      : Win32.PVOID                := System.Null_Address;
         lpfnHook       : Win32.PVOID                := System.Null_Address;
         lpTemplateName : Win32.LPSTR                := null;
      end record;

      pragma Convention (C, TCHOOSECOLOR);

   function ChooseColor
     (lpcc : in TCHOOSECOLOR)
     return Integer;
   pragma Import (StdCall, ChooseColor, "ChooseColorA");

   type LPSTR is access all Interfaces.C.char;

   type OPENFILENAME is
      record
         lStructSize       : Interfaces.C.long      := Interfaces.C.long(OPENFILENAME'Size/8);
         hwndOwner         : GWindows.Types.Handle  := GWindows.Types.Null_Handle;
         hInstance         : Win32.Windef.HGLOBAL   := System.Null_Address;
         lpstrFilter       : Win32.LPSTR := null;
         lpstrCustomFilter : Win32.LPSTR := null;
         nMaxCustFilter    : Interfaces.C.long := 0;
         nFilterIndex      : Interfaces.C.long := 0;
         lpstrFile         : Win32.LPSTR := null;
         nMaxFile          : Interfaces.C.long;
         lpstrFileTitle    : Win32.LPSTR := null;
         nMaxFileTitle     : Interfaces.C.long := 0;
         lpstrInitialDir   : Win32.LPSTR := null;
         lpstrTitle        : Win32.LPSTR := null;
         flags             : Interfaces.C.long  := OFN_HIDEREADONLY;
         nFileOffset       : Interfaces.C.short := 0;
         nFileExtension    : Interfaces.C.short := 0;
         lpstrDefExt       : Win32.LPSTR := null;
         lCustData         : Win32.PVOID := System.Null_Address;
         lpfnHook          : Win32.PVOID := System.Null_Address;
         lpTemplateName    : Win32.LPSTR := null;
      end record;

      pragma Convention (C, OPENFILENAME);

   function GetOpenFileName
     (lpOFN : in OPENFILENAME)
     return Integer;
   pragma Import (StdCall, GetOpenFileName, "GetOpenFileNameA");

   function GetSaveFileName
     (lpOFN : in OPENFILENAME)
     return Integer;
   pragma Import (StdCall, GetSaveFileName, "GetSaveFileNameA");

   type Face_Name_Type is new Interfaces.C.char_array (0 .. 32);
   type Pointer_To_Face_Name_Type is access all Face_Name_Type;

   type LOGFONT is
      record
         lfHeight         : Interfaces.C.long := 0;
         lfWidth          : Interfaces.C.long := 0;
         lfEscapement     : Interfaces.C.long := 0;
         lfOrientation    : Interfaces.C.long := 0;
         lfWeight         : Interfaces.C.long := 0;
         lfItalic         : Interfaces.C.unsigned_char := 0;
         lfUnderline      : Interfaces.C.unsigned_char := 0;
         lfStrikeOut      : Interfaces.C.unsigned_char := 0;
         lfCharSet        : Interfaces.C.unsigned_char := 0;
         lfOutPrecision   : Interfaces.C.unsigned_char := 0;
         lfClipPrecision  : Interfaces.C.unsigned_char := 0;
         lfQuality        : Interfaces.C.unsigned_char := 0;
         lfPitchAndFamily : Interfaces.C.unsigned_char := 0;
         lfFaceName       : Interfaces.C.char_array (0 .. 32);
         -- lfFaceName       : Pointer_To_Face_Name_Type := null;
      end record;

      pragma Convention (C, LOGFONT);

   type Pointer_To_LOGFONT is access all LOGFONT;

       CF_SCREENFONTS          : constant := 1;
--     CF_PRINTERFONTS         : constant := 2;
       CF_BOTH                 : constant := 3;
--     CF_SHOWHELP             : constant := 4;
--     CF_FONTSHOWHELP         : constant := 4;
--     CF_ENABLEHOOK           : constant := 8;
--     CF_ENABLETEMPLATE       : constant := 16;
--     CF_ENABLETEMPLATEHANDLE : constant := 32;
       CF_INITTOLOGFONTSTRUCT  : constant := 64;
--     CF_USESTYLE             : constant := 128;
       CF_EFFECTS              : constant := 256;
--     CF_APPLY                : constant := 512;
--     CF_ANSIONLY             : constant := 1024;
--     CF_SCRIPTSONLY          : constant := 1024;
--     CF_NOVECTORFONTS        : constant := 2048;
--     CF_NOOEMFONTS           : constant := 2048;
--     CF_NOSIMULATIONS        : constant := 4096;
       CF_LIMITSIZE            : constant := 8192;
       CF_FIXEDPITCHONLY       : constant := 16384;
--     CF_WYSIWYG              : constant := 32768;
--     CF_FORCEFONTEXIST       : constant := 65536;
       CF_SCALABLEONLY         : constant := 131072;
--     CF_TTONLY               : constant := 262144;
--     CF_NOFACESEL            : constant := 524288;
--     CF_NOSTYLESEL           : constant := 1048576;
--     CF_NOSIZESEL            : constant := 2097152;
--     CF_SELECTSCRIPT         : constant := 4194304;
--     CF_NOSCRIPTSEL          : constant := 8388608;
--     CF_NOVERTFONTS          : constant := 16777216;

--     SIMULATED_FONTTYPE : constant := 32768;
--     PRINTER_FONTTYPE   : constant := 16384;
--     SCREEN_FONTTYPE    : constant := 8192;
--     BOLD_FONTTYPE      : constant := 256;
--     ITALIC_FONTTYPE    : constant := 512;
--     REGULAR_FONTTYPE   : constant := 1024;

   type Pointer_To_DEVMODE is access all DEVMODE;

   type TPRINTDLG is
      record
         lStructSize         : Interfaces.C.long      := Interfaces.C.long(TPRINTDLG'Size/8);
         hwndOwner           : GWindows.Types.Handle  := GWindows.Types.Null_Handle;
         hDevMode            : Win32.Windef.HGLOBAL   := System.Null_Address;
         hDevNames           : Win32.Windef.HGLOBAL   := System.Null_Address;
         hDC                 : GWindows.Types.Handle  := GWindows.Types.Null_Handle;
         flags               : Interfaces.C.unsigned  := 0;
         nFromPage           : Interfaces.C.short     := 0;
         nToPage             : Interfaces.C.short     := 0;
         nMinPage            : Interfaces.C.short     := 0;
         nMaxPage            : Interfaces.C.short     := 0;
         nCopies             : Interfaces.C.short     := 0;
         hInstance           : Win32.Windef.HGLOBAL   := System.Null_Address;
         lCustData           : Win32.PVOID := System.Null_Address;
         lpfnPrintHook       : Win32.PVOID := System.Null_Address;
         lpfnSetupHook       : Win32.PVOID := System.Null_Address;
         lpPrintTemplateName : Win32.LPSTR := null;
         lpSetupTemplateName : Win32.LPSTR := null;
         hPrintTemplate      : Win32.Windef.HGLOBAL   := System.Null_Address;
         hSetupTemplate      : Win32.Windef.HGLOBAL   := System.Null_Address;
      end record;

      pragma Convention (C, TPRINTDLG);

   type TPAGESETUPDLG is
      record
         lStructSize             : Interfaces.C.long             := Interfaces.C.long(TPAGESETUPDLG'Size/8);
         hwndOwner               : GWindows.Types.Handle         := GWindows.Types.Null_Handle;
         hDevMode                : Win32.Windef.HGLOBAL          := System.Null_Address;
         hDevNames               : Win32.Windef.HGLOBAL          := System.Null_Address;
         flags                   : Interfaces.C.unsigned         := 0;
         ptPaperSize             : GWindows.Types.Point_Type     := (0, 0);
         rtMinMargin             : GWindows.Types.Rectangle_Type := (0, 0, 0, 0);
         rtMargin                : GWindows.Types.Rectangle_Type := (0, 0, 0, 0);
         hInstance               : Win32.Windef.HGLOBAL          := System.Null_Address;
         lCustData               : Win32.PVOID                   := System.Null_Address;
         lpfnPageSetupHook       : Win32.PVOID                   := System.Null_Address;
         lpfnPagePaintHook       : Win32.PVOID                   := System.Null_Address;
         lpPageSetupTemplateName : LPSTR := null;
         hPageSetupTemplate      : Win32.Windef.HGLOBAL          := System.Null_Address;
      end record;

      pragma Convention (C, TPAGESETUPDLG);

   PD_RETURNDC                   : constant := 256;
--     PD_RETURNIC                   : constant := 512;
   PD_RETURNDEFAULT              : constant := 1024;

   type BROWSEINFO is
      record
         hwndOwner      : GWindows.Types.Handle := GWindows.Types.Null_Handle;
         pidlRoot       : Interfaces.C.long := 0;
         pszDisplayName : GNATCOM.Types.LPSTR;
         lpszTitle      : GNATCOM.Types.LPSTR;
         ulFlags        : Interfaces.C.unsigned := 0;
         lpfn           : Interfaces.C.long := 0;
         lParam         : Interfaces.C.long := 0;
         iImage         : Interfaces.C.int;
      end record;

      pragma Convention (C, BROWSEINFO);

   function SHBrowseForFolder
     (lpbi : BROWSEINFO)
     return Interfaces.C.long;
   pragma Import (StdCall, SHBrowseForFolder, "SHBrowseForFolder");

   procedure  SHGetPathFromIDList
     (pidl    : Interfaces.C.long;
      pszpath : Interfaces.C.char_array);
   pragma Import (StdCall, SHGetPathFromIDList, "SHGetPathFromIDList");

   -------------------------------------------------------------------------
   --  Package Body
   -------------------------------------------------------------------------

   ------------------
   -- Choose_Color --
   ------------------

   procedure Choose_Color
     (Window  : in     GWindows.Base.Base_Window_Type'Class;
      Color   : in out GWindows.Colors.Color_Type;
      Success :    out Boolean;
      Custom  : in     Pointer_To_Color_Array          :=
        Global_Color_Array'Access)
   is
      CC     : TCHOOSECOLOR;
      Result : Integer;
   begin
      CC.hwndOwner    := GWindows.Base.Handle (Window);
      CC.lpCustColors := Custom;
      CC.rgbResult    := Color;

      Result := ChooseColor (CC);

      Success := Result /= 0;

      if Success then
         Color := CC.rgbResult;
      end if;
   end Choose_Color;

   ---------------
   -- Open_File --
   ---------------

   procedure Open_File
     (Window            : in     GWindows.Base.Base_Window_Type'Class;
      Dialog_Title      : in     GWindows.GString;
      File_Name         : in out GWindows.GString_Unbounded;
      Filters           : in     Filter_Array;
      Default_Extension : in     GWindows.GString;
      File_Title        :    out GWindows.GString_Unbounded;
      Success           :    out Boolean)
   is
      use Interfaces.C;
      use GWindows.GStrings;
      use GWindows.GStrings.Unbounded;

      OFN         : OPENFILENAME;
      Max_Size    : constant := 5120;
      C_File_Name : char_array (0 .. Max_Size) :=
        (others => nul);
      C_File_Title  : char_array (0 .. Max_Size) :=
        (others => nul);
      Result      : Integer;
      C_Default_Extension : char_array :=
        To_C (GWindows.GStrings.To_String (Default_Extension));
      C_Dialog_Title : char_array :=
        To_C (GWindows.GStrings.To_String (Dialog_Title));
      Filter_List : GWindows.GString_Unbounded;
   begin
      for N in Filters'Range loop
         Filter_List := Filter_List &
           To_GString_Unbounded (To_GString_From_Unbounded
                                   (Filters (N).Name) &
                                 GWindows.GCharacter'Val (0) &
                                 To_GString_From_Unbounded
                                   (Filters (N).Filter) &
                                 GWindows.GCharacter'Val (0));
      end loop;

      Filter_List := Filter_List & To_GString_Unbounded (GWindows.GCharacter'Val (0) &
                                                         GWindows.GCharacter'Val (0));

      if File_Name /= "" then
         declare
            SFile_Name  : char_array :=
              To_C (To_String (To_GString_From_Unbounded (File_Name)));
         begin
            C_File_Name (SFile_Name'Range) := SFile_Name;
         end;
      end if;

      declare
         C_Filter_List : char_array :=
           To_C (To_String (To_GString_From_Unbounded (Filter_List)));
      begin
         OFN.hwndOwner := GWindows.Base.Handle (Window);
         OFN.lpstrFile := C_File_Name (0)'Unchecked_Access;
         OFN.nMaxFile := Max_Size;
         OFN.lpstrFileTitle := C_File_Title (0)'Unchecked_Access;
         OFN.nMaxFileTitle := Max_Size;
         OFN.lpstrFilter := C_Filter_List (0)'Unchecked_Access;
         OFN.nFilterIndex := 1;
         OFN.lpstrDefExt := C_Default_Extension (0)'Unchecked_Access;
         OFN.lpstrTitle := C_Dialog_Title (0)'Unchecked_Access;

         Result := GetOpenFileName (OFN);
      end;
      Success := Result /= 0;

      if Success then
         File_Name :=
           To_GString_Unbounded
           (To_GString_From_String (To_Ada (C_File_Name)));
         File_Title :=
           To_GString_Unbounded
           (To_GString_From_String (To_Ada (C_File_Title)));
      else
         File_Name := To_GString_Unbounded ("");
         File_Title := To_GString_Unbounded ("");
      end if;
   end Open_File;

   ---------------
   -- Save_File --
   ---------------

   procedure Save_File
     (Window            : in     GWindows.Base.Base_Window_Type'Class;
      Dialog_Title      : in     GWindows.GString;
      File_Name         : in out GWindows.GString_Unbounded;
      Filters           : in     Filter_Array;
      Default_Extension : in     GWindows.GString;
      File_Title        :    out GWindows.GString_Unbounded;
      Success           :    out Boolean)
   is
      use Interfaces.C;
      use GWindows.GStrings;
      use GWindows.GStrings.Unbounded;

      OFN         : OPENFILENAME;
      Max_Size    : constant := 5120;
      C_File_Name : char_array (0 .. Max_Size) :=
        (others => nul);
      C_File_Title  : char_array (0 .. Max_Size) :=
        (others => nul);
      Result      : Integer;
      C_Default_Extension : char_array :=
        To_C (GWindows.GStrings.To_String (Default_Extension));
      C_Dialog_Title : char_array :=
        To_C (GWindows.GStrings.To_String (Dialog_Title));
      Filter_List : GWindows.GString_Unbounded;
   begin
      for N in Filters'Range loop
         Filter_List := Filter_List &
           To_GString_Unbounded (To_GString_From_Unbounded
                                   (Filters (N).Name) &
                                 GWindows.GCharacter'Val (0) &
                                 To_GString_From_Unbounded
                                   (Filters (N).Filter) &
                                 GWindows.GCharacter'Val (0));
      end loop;

      Filter_List := Filter_List & To_GString_Unbounded (GWindows.GCharacter'Val (0) &
                                                         GWindows.GCharacter'Val (0));

      if File_Name /= "" then
         declare
            SFile_Name  : char_array :=
              To_C (To_String (To_GString_From_Unbounded (File_Name)));
         begin
            C_File_Name (SFile_Name'Range) := SFile_Name;
         end;
      end if;

      declare
         C_Filter_List : char_array :=
           To_C (To_String (To_GString_From_Unbounded (Filter_List)));
      begin
         OFN.hwndOwner := GWindows.Base.Handle (Window);
         OFN.lpstrFile := C_File_Name (0)'Unchecked_Access;
         OFN.nMaxFile := Max_Size;
         OFN.lpstrFileTitle := C_File_Title (0)'Unchecked_Access;
         OFN.nMaxFileTitle := Max_Size;
         OFN.lpstrFilter := C_Filter_List (0)'Unchecked_Access;
         OFN.nFilterIndex := 1;
         OFN.lpstrDefExt := C_Default_Extension (0)'Unchecked_Access;
         OFN.lpstrTitle := C_Dialog_Title (0)'Unchecked_Access;

         Result := GetSaveFileName (OFN);
      end;
      Success := Result /= 0;

      if Success then
         File_Name :=
           To_GString_Unbounded
           (To_GString_From_String (To_Ada (C_File_Name)));
         File_Title :=
           To_GString_Unbounded
           (To_GString_From_String (To_Ada (C_File_Title)));
      else
         File_Name := To_GString_Unbounded ("");
         File_Title := To_GString_Unbounded ("");
      end if;
   end Save_File;

   -----------------
   -- FontDetails --
   -----------------

   procedure FontDetails
     (Font      : in out GWindows.Drawing_Objects.Font_Type'Class;
      Name      : in out GWindows.GString_Unbounded;
      Size      : in out Integer;
      Bold      : in out Boolean;
      Italic    : in out Boolean;
      Underline : in out Boolean;
      Strikeout : in out Boolean;
      CharSet   : in out Integer)
   is

      use GWindows.Base;
      use GWindows.Drawing_Objects;
      use GWindows.Drawing;
      use GWindows.Colors;
      use type Interfaces.C.long;
      use type Interfaces.C.unsigned_long;
      use type Interfaces.C.unsigned_char;
      use type GWindows.GString_Unbounded;

      -- FName : aliased Face_Name_Type;
      LFont : aliased LOGFONT;

      procedure GetObject
        (Object :        GWindows.Types.Handle := Handle (Font);
         SizeOf :        Integer           := 60;
         Font   : in out LOGFONT);
      pragma Import (StdCall, GetObject, "GetObjectA");

   begin

      GetObject (Font => LFont);
      Name := GWindows.GStrings.To_GString_Unbounded ("");
      for i in 0 .. 31 loop
         if Character (LFont.lfFaceName (Interfaces.C.size_t (i))) = ASCII.NUL then
            exit;
         end if;
         Name := Name & GWindows.GCharacter'Val (Character'Pos (Character (LFont.lfFaceName (Interfaces.C.size_t (i)))));
      end loop;
      Size := abs (Integer (LFont.lfHeight));
      Bold := (LFont.lfWeight > 400);
      Italic := (LFont.lfItalic /= 0);
      Strikeout := (LFont.lfStrikeOut /= 0);
      Underline := (LFont.lfUnderline /= 0);
      CharSet   := Integer (LFont.lfCharSet);

   end FontDetails;

   ------------------------------
   -- Create_Font_With_Charset --
   ------------------------------
   procedure Create_Font_With_Charset (Font          : in out GDO.Font_Type;
                                       Name          : in     GWindows.GString;
                                       Size          : in     Integer;
                                       Weight        : in     GDO.Font_Weight_Type := GDO.FW_NORMAL;
                                       Italics       : in     Boolean          := False;
                                       Underline     : in     Boolean          := False;
                                       Strike_Out    : in     Boolean          := False;
                                       Character_Set : in     Integer          := DEFAULT_CHARSET)
   is
   begin
      GDO.Create_Font(Font, Name, Size, Weight, Italics, Underline, Strike_Out, 0, Character_Set);
   end Create_Font_With_CharSet;

   ------------------------------
   -- Choose_Font_With_Effects --
   ------------------------------

   procedure Choose_Font_With_Effects
     (Window   : in     GWindows.Base.Base_Window_Type'Class;
      Canvas   : in     GWindows.Drawing.Canvas_Type'Class;
      Font     : in out GWindows.Drawing_Objects.Font_Type'Class;
      AnyFont  : in     Boolean;
      PSize    :    out Integer;
      Success  :    out Boolean;
      Color    : in out GWindows.Colors.Color_Type;
      Min_Size : in     Integer                                  := 8;
      Max_Size : in     Integer                                  := 72)
   is
      use GWindows.Base;
      use GWindows.Drawing_Objects;
      use GWindows.Drawing;
      use GWindows.Colors;
      use type Interfaces.C.unsigned_long;

      --FName : aliased Face_Name_Type;
      LFont : aliased LOGFONT;

      type TCHOOSEFONT is
         record
            lStructSize            : Interfaces.C.long      := Interfaces.C.long(TCHOOSEFONT'Size/8);
            hwndOwner              : GWindows.Types.Handle  := Handle (Window);
            hDC                    : GWindows.Types.Handle  := Handle (Canvas);
            lpLogFont              : Pointer_To_LOGFONT
              := LFont'Unchecked_Access;
            iPointSize             : Interfaces.C.int       := 0;
            flags                  : Interfaces.C.unsigned_long
              := CF_INITTOLOGFONTSTRUCT or CF_LIMITSIZE; --  or CF_SCALABLEONLY;
            rgbColors              : Color_Type             := 0;
            lCustData              : LPSTR := null;
            lpfnHook               : LPSTR := null;
            lpTemplateName         : LPSTR := null;
            hInstance              : Win32.Windef.HGLOBAL   := System.Null_Address;
            lpszStyle              : LPSTR := null;
            nFontType              : Interfaces.C.short     := 0;
            uu_MISSING_ALIGNMENT_u : Interfaces.C.short     := 0;
            nSizeMin               : Integer                := Min_Size;
            nSizeMax               : Integer                := Max_Size;
         end record;

      CFont : TCHOOSEFONT;

      procedure GetObject
        (Object :        GWindows.Types.Handle := Handle (Font);
         SizeOf :        Integer           := 60;
         Font   : in out LOGFONT);
      pragma Import (StdCall, GetObject, "GetObjectA");

      function ChooseFont (CF : TCHOOSEFONT := CFont) return Interfaces.C.int;
      pragma Import (StdCall, ChooseFont, "ChooseFontA");

      function CreateFontIndirect (LF : Pointer_To_LOGFONT)
                                  return GWindows.Types.Handle;
      pragma Import (StdCall, CreateFontIndirect, "CreateFontIndirectA");
   begin

      if Color < 16#FFFFFFFF# then
         CFont.flags := CFont.flags or CF_EFFECTS;
         CFont.rgbColors := Color;
      end if;

      if AnyFont then
         -- allow any screen font
         CFont.flags := CFont.flags or CF_SCREENFONTS;
      else
         -- limit to fixed pitch screen and printer fonts only
         CFont.flags := CFont.flags or CF_BOTH or CF_FIXEDPITCHONLY;
      end if;

      -- LFont.lfFaceName := FName'Unchecked_Access;

      GetObject (Font => LFont);

      if Integer (ChooseFont) /= 0 then
         Delete (Font);
         Handle (Font, CreateFontIndirect (CFont.lpLogFont));
         Color := CFont.rgbColors;
         PSize := Integer (CFont.iPointSize);
         Success := true;
      else
         Success := false;
      end if;

   end Choose_Font_With_Effects;

   -----------------
   -- Choose_Font --
   -----------------

   procedure Choose_Font
     (Window   : in     GWindows.Base.Base_Window_Type'Class;
      Canvas   : in     GWindows.Drawing.Canvas_Type'Class;
      Font     : in out GWindows.Drawing_Objects.Font_Type'Class;
      AnyFont  : in     Boolean;
      PSize    :    out Integer;
      Success  :    out Boolean;
      Min_Size : in     Integer                                  := 8;
      Max_Size : in     Integer                                  := 72)
   is
      Color : GWindows.Colors.Color_Type := 16#FFFFFFFF#;
   begin
      Choose_Font_With_Effects
        (Window, Canvas, Font, AnyFont, PSize, Success, Color, Min_Size, Max_Size);
   end Choose_Font;

   -------------------
   -- Alloc_DevMode --
   -------------------

   function Alloc_DevMode return Win32.Windef.HGLOBAL
   is
      use Interfaces.C;

      Ptr : Win32.Windef.HGLOBAL;
      Size : Interfaces.C.unsigned_long;

   begin
      Size := (DEVMODE'Size)/System.Storage_Unit;
      Ptr := Win32.Winbase.GlobalAlloc (Win32.Winbase.GHND, Size);
      return Ptr;
   end Alloc_DevMode;

   function LockDevMode (hDevMode : Win32.Windef.HGLOBAL) return Pointer_To_DEVMODE
   is
      function GlobalLock (handle : Win32.Windef.HGLOBAL) return Pointer_To_DEVMODE;
      pragma Import (StdCall, GlobalLock, "GlobalLock");
   begin
      return GlobalLock (hDevMode);
   end LockDevMode;

   procedure UnlockDevMode (hDevMode : Win32.Windef.HGLOBAL)
   is
      function GlobalUnlock (handle : Win32.Windef.HGLOBAL) return Win32.BOOL;
      pragma Import (StdCall, GlobalUnlock, "GlobalUnlock");

      Result : Win32.BOOL;
   begin
      Result := GlobalUnlock (hDevMode);
   end UnlockDevMode;


   ----------------
   -- Page_Setup --
   ----------------

   procedure Page_Setup
     (Window    : in     GWindows.Base.Base_Window_Type'Class;
      Settings  : in out DEVMODE;
      Flags     : in out Interfaces.C.unsigned;
      PaperSize : in out GWindows.Types.Point_Type;
      Margins   : in out GWindows.Types.Rectangle_Type;
      Success   :    out Boolean)
   is
      use Interfaces.C;
      use System;

      PSD : TPAGESETUPDLG;
      PDM : Pointer_To_DEVMODE;

      function PageSetupDlg
        (lppsd : TPAGESETUPDLG := PSD)
        return Integer;
      pragma Import (StdCall, PageSetupDlg, "PageSetupDlgA");

      procedure GlobalFree (handle : Win32.Windef.HGLOBAL);
      pragma Import (StdCall, GlobalFree, "GlobalFree");

   begin
      PSD.hwndOwner := GWindows.Base.Handle (Window);
      PSD.flags     := Flags;
      if Settings.dmDeviceName (0) /= 0 then
         PSD.hDevMode  := Alloc_DevMode;
         if PSD.hDevMode /= System.Null_Address then
            PDM := LockDevMode (PSD.hDevMode);
            PDM.all := Settings;
            UnlockDevMode (PSD.hDevMode);
         end if;
      end if;
      PSD.ptPaperSize := PaperSize;
      PSD.rtMargin := Margins;

      Success := PageSetupDlg /= 0;

      if Success then

         Flags := PSD.flags;
         PaperSize := PSD.ptPaperSize;
         Margins := PSD.rtMargin;

         PDM := LockDevMode (PSD.hDevMode);
         Settings := PDM.all;
         UnlockDevMode (PSD.hDevMode);

         GlobalFree (PSD.hDevNames);
         GlobalFree (PSD.hDevMode);
      end if;

   end Page_Setup;

   --------------------
   -- Choose_Printer --
   --------------------

   procedure Choose_Printer
     (Window    : in     GWindows.Base.Base_Window_Type'Class;
      Canvas    :    out GWindows.Drawing.Printer_Canvas_Type'Class;
      Settings  : in out DEVMODE;
      Flags     : in out Interfaces.C.unsigned;
      From_Page : in out Natural;
      To_Page   : in out Natural;
      Min_Page  : in     Natural;
      Max_Page  : in     Natural;
      Copies    : in out Natural;
      Success   :    out Boolean)
   is
      use Interfaces.C;
      use System;

      PD : TPRINTDLG;
      PDM : Pointer_To_DEVMODE;

      function PrintDlg
        (lppd : TPRINTDLG := PD)
        return Integer;
      pragma Import (StdCall, PrintDlg, "PrintDlgA");

      procedure GlobalFree (handle : Win32.Windef.HGLOBAL);
      pragma Import (StdCall, GlobalFree, "GlobalFree");
   begin
      PD.hwndOwner := GWindows.Base.Handle (Window);
      PD.flags     := PD_RETURNDC or Flags;
      PD.nFromPage := short (From_Page);
      PD.nToPage := short (To_Page);
      PD.nMinPage := short (Min_Page);
      PD.nMaxPage := short (Max_Page);
      PD.nCopies := short (Copies);
      if Settings.dmDeviceName (0) /= 0 then
         PD.hDevMode  := Alloc_DevMode;
         if PD.hDevMode /= System.Null_Address then
            PDM := LockDevMode (PD.hDevMode);
            PDM.all := Settings;
            UnlockDevMode (PD.hDevMode);
         end if;
      end if;

      Success := PrintDlg /= 0;

      if Success then
         GWindows.Drawing.Capture (Canvas, GWindows.Types.Null_Handle, PD.hDC);

         Flags := PD.flags;
         From_Page := Integer (PD.nFromPage);
         To_Page := Integer (PD.nToPage);
         Copies := Integer (PD.nCopies);

         PDM := LockDevMode (PD.hDevMode);
         Settings := PDM.all;
         UnlockDevMode (PD.hDevMode);

         GlobalFree (PD.hDevNames);
         GlobalFree (PD.hDevMode);
      end if;

   end Choose_Printer;

   ----------------------------
   -- Choose_Default_Printer --
   ----------------------------

   procedure Choose_Default_Printer
     (Canvas   :    out GWindows.Drawing.Printer_Canvas_Type'Class;
      Name     : in out GWindows.GString_Unbounded;
      Settings :    out DEVMODE;
      Success  :    out Boolean)
   is
      use type GWindows.GString_Unbounded;

      PD : TPRINTDLG;
      PDM : Pointer_To_DEVMODE;

      function PrintDlg
        (lppd : TPRINTDLG := PD)
        return Integer;
      pragma Import (StdCall, PrintDlg, "PrintDlgA");

      procedure GlobalFree (handle : Win32.Windef.HGLOBAL);
      pragma Import (StdCall, GlobalFree, "GlobalFree");
   begin
      PD.flags     := PD_RETURNDC or PD_RETURNDEFAULT;

      Success := PrintDlg /= 0;

      if Success then
         GWindows.Drawing.Capture (Canvas, GWindows.Types.Null_Handle, PD.hDC);

         PDM := LockDevMode (PD.hDevMode);
         Settings := PDM.all;
         Name := GWindows.GStrings.To_GString_Unbounded ("");
         for i in 0 .. 31 loop
            if Character'Val (PDM.dmDeviceName (i)) = ASCII.NUL then
               exit;
            end if;
            Name := Name & GWindows.GCharacter'Val (PDM.dmDeviceName (i));
         end loop;
         UnlockDevMode (PD.hDevMode);

         GlobalFree (PD.hDevNames);
         GlobalFree (PD.hDevMode);
      end if;
   end Choose_Default_Printer;

   function Get_Directory
     (Window       : in GWindows.Base.Base_Window_Type'Class;
      Dialog_Title : in GWindows.GString)
     return GWindows.GString
   is
      Result1 : GWindows.GString_Unbounded;
      Result2 : GWindows.GString_Unbounded;
   begin
      Get_Directory (Window, Dialog_Title, Result1, Result2);
      return GWindows.GStrings.To_GString_From_Unbounded (Result2);
   end Get_Directory;

   function Get_Directoy
     (Dialog_Title : in GWindows.GString)
     return GWindows.GString
   is
      Result1 : GWindows.GString_Unbounded;
      Result2 : GWindows.GString_Unbounded;
   begin
      Get_Directory (Dialog_Title, Result1, Result2);
      return GWindows.GStrings.To_GString_From_Unbounded (Result2);
   end Get_Directoy;

   procedure Get_Directory
     (Window       : in GWindows.Base.Base_Window_Type'Class;
      Dialog_Title : in GWindows.GString;
      Directory_Display_Name : out GWindows.GString_Unbounded;
      Directory_Path : out GWindows.GString_Unbounded)
   is
      use type Interfaces.C.long;

      Directory : Interfaces.C.char_array (1 .. 1024);
      Title     : Interfaces.C.char_array :=
        Interfaces.C.To_C (GWindows.GStrings.To_String (Dialog_Title));
      BInfo     : BROWSEINFO;
      Pidl      : Interfaces.C.long;
   begin
      BInfo.hwndOwner := GWindows.Base.Handle (Window);
      BInfo.pszDisplayName := Directory (Directory'First)'Unchecked_Access;
      BInfo.lpszTitle := Title (Title'First)'Unchecked_Access;

      Pidl :=  SHBrowseForFolder (BInfo);

      if Pidl /= 0 then
         Directory_Display_Name := GWindows.GStrings.To_GString_Unbounded
           (GWindows.GStrings.To_GString_From_String
            (Interfaces.C.To_Ada (Directory)));

         SHGetPathFromIDList (Pidl, Directory);
         Directory_Path := GWindows.GStrings.To_GString_Unbounded
           (GWindows.GStrings.To_GString_From_String
            (Interfaces.C.To_Ada (Directory)));
      else
         Directory_Display_Name := GWindows.GStrings.To_GString_Unbounded ("");
         Directory_Path := GWindows.GStrings.To_GString_Unbounded ("");
      end if;
   end Get_Directory;

   procedure Get_Directory
     (Dialog_Title : in GWindows.GString;
      Directory_Display_Name : out GWindows.GString_Unbounded;
      Directory_Path : out GWindows.GString_Unbounded)
   is
      Temp : GWindows.Base.Base_Window_Type;
   begin
      Get_Directory (Temp,
                     Dialog_Title,
                     Directory_Display_Name,
                     Directory_Path);
   end Get_Directory;

end Common_Dialogs;
