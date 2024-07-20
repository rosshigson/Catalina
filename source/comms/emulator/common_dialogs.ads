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

with Interfaces.C;

with GWindows;
with GWindows.Types;
with GWindows.Colors;
with GWindows.Base;
with GWindows.Drawing_Objects;
with GWindows.Drawing;
with GWindows.Common_Dialogs;

package Common_Dialogs is

   -------------------------------------------------------------------------
   --  Color Chooser
   -------------------------------------------------------------------------

   type Color_Array is array (Positive range 1 .. 16)
      of GWindows.Colors.Color_Type;
   type Pointer_To_Color_Array is access all Color_Array;

   Global_Color_Array : aliased Color_Array := (others => 16#FFFFFF#);
   --  Used to hold the custom colors in the Choose_Color dialog

   procedure Choose_Color
     (Window  : in     GWindows.Base.Base_Window_Type'Class;
      Color   : in out GWindows.Colors.Color_Type;
      Success :    out Boolean;
      Custom  : in     Pointer_To_Color_Array :=
        Global_Color_Array'Access);

   -------------------------------------------------------------------------
   --  Directory Chooser
   -------------------------------------------------------------------------
   --  Note: GNATCOM.Initialize.Initialize_COM should be called before
   --        using the Directory Chooser

   function Get_Directory
     (Window       : in GWindows.Base.Base_Window_Type'Class;
      Dialog_Title : in GWindows.GString)
     return GWindows.GString;
   function Get_Directoy
     (Dialog_Title : in GWindows.GString)
     return GWindows.GString;
   --  Returns the path for the user selected directory

   procedure Get_Directory
     (Window       : in GWindows.Base.Base_Window_Type'Class;
      Dialog_Title : in GWindows.GString;
      Directory_Display_Name : out GWindows.GString_Unbounded;
      Directory_Path : out GWindows.GString_Unbounded);
   procedure Get_Directory
     (Dialog_Title : in GWindows.GString;
      Directory_Display_Name : out GWindows.GString_Unbounded;
      Directory_Path : out GWindows.GString_Unbounded);

   -------------------------------------------------------------------------
   --  File Chooser
   -------------------------------------------------------------------------

   type Filter_Type is
      record
         Name   : GWindows.GString_Unbounded;
         Filter : GWindows.GString_Unbounded;
      end record;

   type Filter_Array is array (Positive range <>) of Filter_Type;

   procedure Open_File
     (Window            : in     GWindows.Base.Base_Window_Type'Class;
      Dialog_Title      : in     GWindows.GString;
      File_Name         : in out GWindows.GString_Unbounded;
      Filters           : in     Filter_Array;
      Default_Extension : in     GWindows.GString;
      File_Title        :    out GWindows.GString_Unbounded;
      Success           :    out Boolean);

   procedure Save_File
     (Window            : in     GWindows.Base.Base_Window_Type'Class;
      Dialog_Title      : in     GWindows.GString;
      File_Name         : in out GWindows.GString_Unbounded;
      Filters           : in     Filter_Array;
      Default_Extension : in     GWindows.GString;
      File_Title        :    out GWindows.GString_Unbounded;
      Success           :    out Boolean);

   -------------------------------------------------------------------------
   --  Font Details
   -------------------------------------------------------------------------

   ANSI_CHARSET          : constant Integer := 0;
   DEFAULT_CHARSET       : constant Integer := 1;
   SYMBOL_CHARSET        : constant Integer := 2;
   SHIFTJIS_CHARSET      : constant Integer := 128;
   HANGEUL_CHARSET       : constant Integer := 129;
   GB2312_CHARSET        : constant Integer := 134;
   CHINESEBIG5_CHARSET   : constant Integer := 136;
   GREEK_CHARSET         : constant Integer := 161;
   TURKISH_CHARSET       : constant Integer := 162;
   HEBREW_CHARSET        : constant Integer := 177;
   ARABIC_CHARSET        : constant Integer := 178;
   BALTIC_CHARSET        : constant Integer := 186;
   RUSSIAN_CHARSET       : constant Integer := 204;
   THAI_CHARSET          : constant Integer := 222;
   EASTEUROPE_CHARSET    : constant Integer := 238;
   OEM_CHARSET           : constant Integer := 255;
   JOHAB_CHARSET         : constant Integer := 130;
   VIETNAMESE_CHARSET    : constant Integer := 163;
   MAC_CHARSET           : constant Integer := 77;

   procedure FontDetails
     (Font      : in out GWindows.Drawing_Objects.Font_Type'Class;
      Name      : in out GWindows.GString_Unbounded;
      Size      : in out Integer;
      Bold      : in out Boolean;
      Italic    : in out Boolean;
      Underline : in out Boolean;
      Strikeout : in out Boolean;
      CharSet   : in out Integer);

   package GDO renames GWindows.Drawing_Objects;

   procedure Create_Font_With_Charset (Font          : in out GDO.Font_Type;
                                       Name          : in     GWindows.GString;
                                       Size          : in     Integer;
                                       Weight        : in     GDO.Font_Weight_Type := GDO.FW_NORMAL;
                                       Italics       : in     Boolean          := False;
                                       Underline     : in     Boolean          := False;
                                       Strike_Out    : in     Boolean          := False;
                                       Character_Set : in     Integer          := DEFAULT_CHARSET);
   --  Create a font from system
   --  Size = 0   -  Default Size
   --  Size > 0   -  Cell height
   --  size < 0   -  Abs (size) = Character height

   -------------------------------------------------------------------------
   --  Font Chooser
   -------------------------------------------------------------------------

   procedure Choose_Font
     (Window   : in     GWindows.Base.Base_Window_Type'Class;
      Canvas   : in     GWindows.Drawing.Canvas_Type'Class;
      Font     : in out GWindows.Drawing_Objects.Font_Type'Class;
      AnyFont  : in     Boolean;
      PSize    :    out Integer;
      Success  :    out Boolean;
      Min_Size : in     Integer                                  := 8;
      Max_Size : in     Integer                                  := 72);
   --  Chooses font. Initializes dialog based on settings of Font

   procedure Choose_Font_With_Effects
     (Window   : in     GWindows.Base.Base_Window_Type'Class;
      Canvas   : in     GWindows.Drawing.Canvas_Type'Class;
      Font     : in out GWindows.Drawing_Objects.Font_Type'Class;
      AnyFont  : in     Boolean;
      PSize    :    out Integer;
      Success  :    out Boolean;
      Color    : in out GWindows.Colors.Color_Type;
      Min_Size : in     Integer                                  := 8;
      Max_Size : in     Integer                                  := 72);
   --  Chooses font. Initializes dialog based on settings of Font
   --  and Color, sets also underline and strike out.

   -------------------------------------------------------------------------
   --  Printer Chooser
   -------------------------------------------------------------------------

   type BCHARSTR is
     array (Integer range 0 .. 31) of Interfaces.C.unsigned_char;

   type DEVMODE is
      record
         dmDeviceName       : BCHARSTR := (others => 0);
         dmSpecVersion      : Interfaces.C.short;
         dmDriverVersion    : Interfaces.C.short;
         dmSize             : Interfaces.C.short;
         dmDriverExtra      : Interfaces.C.short;
         dmFields           : Interfaces.C.long;
         dmOrientation      : Interfaces.C.short;
         dmPaperSize        : Interfaces.C.short;
         dmPaperLength      : Interfaces.C.short;
         dmPaperWidth       : Interfaces.C.short;
         dmScale            : Interfaces.C.short;
         dmCopies           : Interfaces.C.short;
         dmDefaultSource    : Interfaces.C.short;
         dmPrintQuality     : Interfaces.C.short;
         dmColor            : Interfaces.C.short;
         dmDuplex           : Interfaces.C.short;
         dmYResolution      : Interfaces.C.short;
         dmTTOption         : Interfaces.C.short;
         dmCollate          : Interfaces.C.short;
         dmFormName         : BCHARSTR;
         dmLogPixels        : Interfaces.C.short;
         dmBitsPerPel       : Interfaces.C.long;
         dmPelsWidth        : Interfaces.C.long;
         dmPelsHeight       : Interfaces.C.long;
         dmDisplayFlags     : Interfaces.C.long;
         dmDisplayFrequency : Interfaces.C.long;
         dmICMMethod        : Interfaces.C.long;
         dmICMIntent        : Interfaces.C.long;
         dmMediaType        : Interfaces.C.long;
         dmDitherType       : Interfaces.C.long;
         dmReserved1        : Interfaces.C.long;
         dmReserved2        : Interfaces.C.long;
      end record;

   --  Flags that can be used for Choose Printer

   PD_ALLPAGES                   : constant := 0;
   PD_SELECTION                  : constant := 1;
   PD_PAGENUMS                   : constant := 2;
   PD_NOSELECTION                : constant := 4;
   PD_NOPAGENUMS                 : constant := 8;
   PD_COLLATE                    : constant := 16;
   PD_PRINTTOFILE                : constant := 32;
   PD_PRINTSETUP                 : constant := 64;
   PD_NOWARNING                  : constant := 128;
   PD_USEDEVMODECOPIES           : constant := 262144;
   PD_USEDEVMODECOPIESANDCOLLATE : constant := 262144;
   PD_DISABLEPRINTTOFILE         : constant := 524288;
   PD_HIDEPRINTTOFILE            : constant := 1048576;
   PD_NONETWORKBUTTON            : constant := 2097152;

   PSD_INWININIINTLMEASURE            : constant := 0;
   PSD_DEFAULTMINMARGINS              : constant := 0;
   PSD_MINMARGINS                     : constant := 1;
   PSD_MARGINS                        : constant := 2;
   PSD_INTHOUSANDTHSOFINCHES          : constant := 4;
   PSD_INHUNDREDTHSOFMILLIMETERS      : constant := 8;
   PSD_DISABLEMARGINS                 : constant := 16;
   PSD_DISABLEPRINTER                 : constant := 32;
   PSD_NOWARNING                      : constant := 128;
   PSD_DISABLEORIENTATION             : constant := 256;
   PSD_DISABLEPAPER                   : constant := 512;
   PSD_RETURNDEFAULT                  : constant := 1024;
   PSD_SHOWHELP                       : constant := 2048;
   PSD_ENABLEPAGESETUPHOOK            : constant := 8192;
   PSD_ENABLEPAGESETUPTEMPLATE        : constant := 32768;
   PSD_ENABLEPAGEPAINTHOOK            : constant := 262144;
   PSD_DISABLEPAGEPAINTING            : constant := 524288;
   PSD_ENABLEPAGESETUPTEMPLATEHANDLE  : constant := 131072;



   procedure Page_Setup
     (Window    : in     GWindows.Base.Base_Window_Type'Class;
      Settings  : in out DEVMODE;
      Flags     : in out Interfaces.C.unsigned;
      PaperSize : in out GWindows.Types.Point_Type;
      Margins   : in out GWindows.Types.Rectangle_Type;
      Success   :    out Boolean);

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
      Success   :    out Boolean);

   procedure Choose_Default_Printer
     (Canvas    :    out GWindows.Drawing.Printer_Canvas_Type'Class;
      Name      : in out GWindows.GString_Unbounded;
      Settings  :    out DEVMODE;
      Success   :    out Boolean);

   CHOOSE_PRINTER_ERROR : exception;

   --  Constants and flags used for DEVMODE

   DM_SPECVERSION                  : constant := 1024;
   DM_ORIENTATION                  : constant := 1;
   DM_PAPERSIZE                    : constant := 2;
   DM_PAPERLENGTH                  : constant := 4;
   DM_PAPERWIDTH                   : constant := 8;
   DM_SCALE                        : constant := 16;
   DM_COPIES                       : constant := 256;
   DM_DEFAULTSOURCE                : constant := 512;
   DM_PRINTQUALITY                 : constant := 1024;
   DM_COLOR                        : constant := 2048;
   DM_DUPLEX                       : constant := 4096;
   DM_YRESOLUTION                  : constant := 8192;
   DM_TTOPTION                     : constant := 16384;
   DM_COLLATE                      : constant := 32768;
   DM_FORMNAME                     : constant := 65536;
   DM_LOGPIXELS                    : constant := 131072;
   DM_BITSPERPEL                   : constant := 262144;
   DM_PELSWIDTH                    : constant := 524288;
   DM_PELSHEIGHT                   : constant := 1048576;
   DM_DISPLAYFLAGS                 : constant := 2097152;
   DM_DISPLAYFREQUENCY             : constant := 4194304;
   DM_ICMMETHOD                    : constant := 8388608;
   DM_ICMINTENT                    : constant := 16777216;
   DM_MEDIATYPE                    : constant := 33554432;
   DM_DITHERTYPE                   : constant := 67108864;

   DMORIENT_PORTRAIT               : constant := 1;
   DMORIENT_LANDSCAPE              : constant := 2;

   DMPAPER_FIRST                   : constant := 1;
   DMPAPER_LETTER                  : constant := 1;
   DMPAPER_LETTERSMALL             : constant := 2;
   DMPAPER_TABLOID                 : constant := 3;
   DMPAPER_LEDGER                  : constant := 4;
   DMPAPER_LEGAL                   : constant := 5;
   DMPAPER_STATEMENT               : constant := 6;
   DMPAPER_EXECUTIVE               : constant := 7;
   DMPAPER_A3                      : constant := 8;
   DMPAPER_A4                      : constant := 9;
   DMPAPER_A4SMALL                 : constant := 10;
   DMPAPER_A5                      : constant := 11;
   DMPAPER_B4                      : constant := 12;
   DMPAPER_B5                      : constant := 13;
   DMPAPER_FOLIO                   : constant := 14;
   DMPAPER_QUARTO                  : constant := 15;
   DMPAPER_10X14                   : constant := 16;
   DMPAPER_11X17                   : constant := 17;
   DMPAPER_NOTE                    : constant := 18;
   DMPAPER_ENV_9                   : constant := 19;
   DMPAPER_ENV_10                  : constant := 20;
   DMPAPER_ENV_11                  : constant := 21;
   DMPAPER_ENV_12                  : constant := 22;
   DMPAPER_ENV_14                  : constant := 23;
   DMPAPER_CSHEET                  : constant := 24;
   DMPAPER_DSHEET                  : constant := 25;
   DMPAPER_ESHEET                  : constant := 26;
   DMPAPER_ENV_DL                  : constant := 27;
   DMPAPER_ENV_C5                  : constant := 28;
   DMPAPER_ENV_C3                  : constant := 29;
   DMPAPER_ENV_C4                  : constant := 30;
   DMPAPER_ENV_C6                  : constant := 31;
   DMPAPER_ENV_C65                 : constant := 32;
   DMPAPER_ENV_B4                  : constant := 33;
   DMPAPER_ENV_B5                  : constant := 34;
   DMPAPER_ENV_B6                  : constant := 35;
   DMPAPER_ENV_ITALY               : constant := 36;
   DMPAPER_ENV_MONARCH             : constant := 37;
   DMPAPER_ENV_PERSONAL            : constant := 38;
   DMPAPER_FANFOLD_US              : constant := 39;
   DMPAPER_FANFOLD_STD_GERMAN      : constant := 40;
   DMPAPER_FANFOLD_LGL_GERMAN      : constant := 41;
   DMPAPER_ISO_B4                  : constant := 42;
   DMPAPER_JAPANESE_POSTCARD       : constant := 43;
   DMPAPER_9X11                    : constant := 44;
   DMPAPER_10X11                   : constant := 45;
   DMPAPER_15X11                   : constant := 46;
   DMPAPER_ENV_INVITE              : constant := 47;
   DMPAPER_RESERVED_48             : constant := 48;
   DMPAPER_RESERVED_49             : constant := 49;
   DMPAPER_LETTER_EXTRA            : constant := 50;
   DMPAPER_LEGAL_EXTRA             : constant := 51;
   DMPAPER_TABLOID_EXTRA           : constant := 52;
   DMPAPER_A4_EXTRA                : constant := 53;
   DMPAPER_LETTER_TRANSVERSE       : constant := 54;
   DMPAPER_A4_TRANSVERSE           : constant := 55;
   DMPAPER_LETTER_EXTRA_TRANSVERSE : constant := 56;
   DMPAPER_A_PLUS                  : constant := 57;
   DMPAPER_B_PLUS                  : constant := 58;
   DMPAPER_LETTER_PLUS             : constant := 59;
   DMPAPER_A4_PLUS                 : constant := 60;
   DMPAPER_A5_TRANSVERSE           : constant := 61;
   DMPAPER_B5_TRANSVERSE           : constant := 62;
   DMPAPER_A3_EXTRA                : constant := 63;
   DMPAPER_A5_EXTRA                : constant := 64;
   DMPAPER_B5_EXTRA                : constant := 65;
   DMPAPER_A2                      : constant := 66;
   DMPAPER_A3_TRANSVERSE           : constant := 67;
   DMPAPER_A3_EXTRA_TRANSVERSE     : constant := 68;
   DMPAPER_USER                    : constant := 256;

   DMBIN_FIRST                     : constant := 1;
   DMBIN_UPPER                     : constant := 1;
   DMBIN_ONLYONE                   : constant := 1;
   DMBIN_LOWER                     : constant := 2;
   DMBIN_MIDDLE                    : constant := 3;
   DMBIN_MANUAL                    : constant := 4;
   DMBIN_ENVELOPE                  : constant := 5;
   DMBIN_ENVMANUAL                 : constant := 6;
   DMBIN_AUTO                      : constant := 7;
   DMBIN_TRACTOR                   : constant := 8;
   DMBIN_SMALLFMT                  : constant := 9;
   DMBIN_LARGEFMT                  : constant := 10;
   DMBIN_LARGECAPACITY             : constant := 11;
   DMBIN_CASSETTE                  : constant := 14;
   DMBIN_FORMSOURCE                : constant := 15;
   DMBIN_LAST                      : constant := 15;
   DMBIN_USER                      : constant := 256;

   DMRES_DRAFT                     : constant := -1;
   DMRES_LOW                       : constant := -2;
   DMRES_MEDIUM                    : constant := -3;
   DMRES_HIGH                      : constant := -4;

   DMCOLOR_MONOCHROME              : constant := 1;
   DMCOLOR_COLOR                   : constant := 2;

   DMDUP_SIMPLEX                   : constant := 1;
   DMDUP_VERTICAL                  : constant := 2;
   DMDUP_HORIZONTAL                : constant := 3;

   DMTT_BITMAP                     : constant := 1;
   DMTT_DOWNLOAD                   : constant := 2;
   DMTT_SUBDEV                     : constant := 3;
   DMTT_DOWNLOAD_OUTLINE           : constant := 4;

   DMCOLLATE_FALSE                 : constant := 0;
   DMCOLLATE_TRUE                  : constant := 1;

   DM_GRAYSCALE                    : constant := 1;
   DM_INTERLACED                   : constant := 2;

   DMICMMETHOD_NONE                : constant := 1;
   DMICMMETHOD_SYSTEM              : constant := 2;
   DMICMMETHOD_DRIVER              : constant := 3;
   DMICMMETHOD_DEVICE              : constant := 4;
   DMICMMETHOD_USER                : constant := 256;

   DMICM_SATURATE                  : constant := 1;
   DMICM_CONTRAST                  : constant := 2;
   DMICM_COLORMETRIC               : constant := 3;
   DMICM_USER                      : constant := 256;

   DMMEDIA_STANDARD                : constant := 1;
   DMMEDIA_TRANSPARENCY            : constant := 2;
   DMMEDIA_GLOSSY                  : constant := 3;
   DMMEDIA_USER                    : constant := 256;

   DMDITHER_NONE                   : constant := 1;
   DMDITHER_COARSE                 : constant := 2;
   DMDITHER_FINE                   : constant := 3;
   DMDITHER_LINEART                : constant := 4;
   DMDITHER_ERRORDIFFUSION         : constant := 5;
   DMDITHER_RESERVED6              : constant := 6;
   DMDITHER_RESERVED7              : constant := 7;
   DMDITHER_RESERVED8              : constant := 8;
   DMDITHER_RESERVED9              : constant := 9;
   DMDITHER_GRAYSCALE              : constant := 10;
   DMDITHER_USER                   : constant := 256;

end Common_Dialogs;
