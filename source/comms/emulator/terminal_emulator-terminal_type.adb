-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 2.2                                   --
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

Separate (Terminal_Emulator)

task body Terminal_Type is

   use Terminal_Types;


   Me : Terminal;

   procedure My_Vertical_Scroll (
         Window  : in out GWindows.Base.Base_Window_Type'Class;
         Request : in     GWindows.Base.Scroll_Request_Type)
   is
   begin
      Do_Vertical_Scroll (Me.Buffer, Window, Request);
   end My_Vertical_Scroll;


   procedure My_Horizontal_Scroll (
         Window  : in out GWindows.Base.Base_Window_Type'Class;
         Request : in     GWindows.Base.Scroll_Request_Type)
   is
   begin
      Do_Horizontal_Scroll (Me.Buffer, Window, Request);
   end My_Horizontal_Scroll;


   procedure My_Close (
         Window    : in out GWindows.Base.Base_Window_Type'Class;
         Can_Close :    out Boolean)
   is
   begin
      Do_Close (Me.Buffer, Window, Can_Close);
   end My_Close;


   procedure My_Destroy (
         Window : in out GWindows.Base.Base_Window_Type'Class)
   is
   begin
      Do_Destroy (Me.Buffer, Window);
   end My_Destroy;


   -- My_Key_Down : Process WM_KEYDOWN messages. All special or extended
   --               keys are processed here.
   procedure My_Key_Down (
         Window  : in out GWindows.Base.Base_Window_Type'Class;
         Special : in     GWindows.Windows.Special_Key_Type;
         Value   : in     GWindows.GCharacter)
   is
   begin
      Do_Key_Down (Me.Buffer, Window, Special, Value);
   end My_Key_Down;


   -- My_Virtual_Key : Receive a Virtual key code, which may be
   --                  required during subsequent key processing.
   procedure My_Virtual_Key (
         Window  : in out GWindows.Base.Base_Window_Type'Class;
         Virtual : in     Integer)
   is
   begin
      Do_Virtual_Key (Me.Buffer, Window, Virtual);
   end My_Virtual_Key;


   -- My_Key : Process WM_CHAR messages. All normal keys are
   --          processed here.
   procedure My_Key (
         Window   : in out GWindows.Base.Base_Window_Type'Class;
         Special  : in     GWindows.Windows.Special_Key_Type;
         Value    : in     GWindows.GCharacter;
         Repeat   : in     Boolean;
         Extended : in     Boolean)
   is
   begin
      Do_Key (Me.Buffer, Window, Special, Value, Repeat, Extended);
   end My_Key;


   -- My_Size : Respond to window sizing messages.
   procedure My_Size (
         Window   : in out GWindows.Base.Base_Window_Type'Class;
         SizeType : in     Integer;
         Width    : in     Integer;
         Height   : in     Integer)
   is
   begin
      Do_Size (Me.Buffer, Window, SizeType, Width, Height);
      Me.ScrnCols := Natural (Me.Buffer.Scrn_Size.Col);
      Me.ScrnRows := Natural (Me.Buffer.Scrn_Size.Row);
   end My_Size;



   -- My_Focus : Got focus - draw cursor
   procedure My_Focus (
         Window : in out GWindows.Base.Base_Window_Type'Class)
   is
   begin
      Do_Focus (Me.Buffer, Window);
   end My_Focus;


   -- My_Lost_Focus : Lost focus - undraw cursor
   procedure My_Lost_Focus (
         Window : in out GWindows.Base.Base_Window_Type'Class)
   is
   begin
      Do_Lost_Focus (Me.Buffer, Window);
   end My_Lost_Focus;


   -- My_Menu_Select : Perform all main window menu processing,
   --                  including context menu.
   procedure My_Menu_Select (
         Window : in out GWindows.Base.Base_Window_Type'Class;
         Item   : in     Integer)
   is
   begin
      Do_Menu_Select (Me.Buffer, Window, Item);
   end My_Menu_Select;


   -- My_Context_Menu : display the context menu.
   procedure My_Context_Menu (
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer)
   is
   begin
      Do_Context_Menu (Me.Buffer, Window, X, Y);
   end My_Context_Menu;


   -- My_Left_Button_Down : perform mouse left button processing.
   --                       Thie procedure does single clicks, and
   --                       simulates triple-clicks. See also
   --                       My_Left_Button_Double_Click
   procedure My_Left_Button_Down (
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer;
         Keys   : in     GWindows.Windows.Mouse_Key_States)
   is
   begin
      Do_Left_Button_Down (Me.Buffer, Window, X, Y, Keys);
   end My_Left_Button_Down;


   -- My_Left_Button_Up : release the mouse if we have it.
   procedure My_Left_Button_Up (
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer;
         Keys   : in     GWindows.Windows.Mouse_Key_States)
   is
   begin
      Do_Left_Button_Up (Me.Buffer, Window, X, Y, Keys);
   end My_Left_Button_Up;


   -- My_Left_Button_Double_Click : perform mouse left button processing.
   --                               This procedure handles double clicks.
   --                               See also My_Left_Button_Down
   procedure My_Left_Button_Double_Click (
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer;
         Keys   : in     GWindows.Windows.Mouse_Key_States)
   is
   begin
      Do_Left_Button_Double_Click (Me.Buffer, Window, X, Y, Keys);
   end My_Left_Button_Double_Click;


   -- My_Mouse_Move : Note that we only handle mouse moves completely within
   --                 the client window - others are handled elsewhere.
   procedure My_Mouse_Move (
         Window : in out GWindows.Base.Base_Window_Type'Class;
         X      : in     Integer;
         Y      : in     Integer;
         Keys   : in     GWindows.Windows.Mouse_Key_States)
   is
   begin
      Do_Mouse_Move (Me.Buffer, Window, X, Y, Keys);
   end My_Mouse_Move;


   -- My_Capture_Changed : Someone else captured the mouse.
   procedure My_Capture_Changed (
         Window : in out GWindows.Base.Base_Window_Type'Class)
   is
   begin
      Do_Capture_Changed (Me.Buffer, Window);
   end My_Capture_Changed;



   -- My_Init_Menu : The menu is about to be displayed.
   procedure My_Init_Menu (
         Window : in out GWindows.Base.Base_Window_Type'Class)
   is
   begin
      Do_Init_Menu (Me.Buffer, Window);
   end My_Init_Menu;



   -- InitializeTerminal : Perform common initialization functions.
   procedure InitializeTerminal (
         Buffer       : in out Terminal_Buffer.Terminal_Buffer;
         MainMenu     : in     Option;
         TransferMenu : in     Option;
         OptionMenu   : in     Option;
         AdvancedMenu : in     Option;
         ContextMenu  : in     Option;
         Columns      : in     Natural;
         Rows         : in     Natural;
         VirtualRows  : in     Natural;
         OnTop        : in     Option;
         Visible      : in     Option)
   is
      use GWindows.Drawing;
   begin
      if Me /= null then

         -- TBD : the following should go in the various "Construct" routines:

         GDO.Create_Solid_Brush (Me.Buffer.DefaultBrush, White);
         Me.Buffer.AnsiResult := new AP.Parser_Result;
         Me.Buffer.AnsiParser := AP.InitializeParser;
         AP.SwitchParserMode (Me.Buffer.AnsiParser, AP.VT100);

         if Buffer.KeySize > 0 then
            -- add another position specifically for unget:
            Buffer.KeySize := Buffer.KeySize + 1;
            -- add another position to the actual allocated buffer so that
            -- we can tell the difference between a full and empty buffer
            New_Keyboard_Buffer (Me.Buffer);
         end if;
         Me.Buffer.Scrn_Base  := (0, 0);
         Me.Buffer.Regn_Base  := (0, 0);
         Me.Buffer.View_Base  := (0, 0);
         Me.Buffer.Virt_Base  := (0, 0);
         Me.Buffer.Virt_Used  := (0, 0);
         Resize (
            Me.Buffer,
            Min (Virt_Col (Columns), Virt_Col (MAX_COLUMNS)),
            Min (
               Max (
                  Virt_Row (VirtualRows),
                  Virt_Row (Rows)),
               Virt_Row (MAX_ROWS)),
            Min (Scrn_Col (Columns), Scrn_Col (MAX_COLUMNS)),
            Min (Scrn_Row (Rows), Scrn_Row (MAX_ROWS)),
            Min (View_Col (Columns), View_Col (MAX_COLUMNS)),
            Min (View_Row (Rows), View_Row (MAX_ROWS)),
            Me.Buffer.BlankStyle);
         Me.ScrnCols := Natural (Me.Buffer.Scrn_Size.Col);
         Me.ScrnRows := Natural (Me.Buffer.Scrn_Size.Row);
         if OnTop = Yes then
            Me.Buffer.AlwaysOnTop := True;
         elsif OnTop = No then
            Me.Buffer.AlwaysOnTop := False;
         end if;
         if Me.Buffer.AlwaysOnTop then
            Order (Me.Buffer.Panel, GWindows.Base.Always_On_Top);
         end if;
         -- Size canvas to desktop and never resize it,
         -- including space used for stretching characters
         Auto_Resize (Me.Buffer.Panel, False);
         Resize_Canvas (Me.Buffer);
         Get_Canvas (Me.Buffer.Panel, Me.Buffer.Canvas);
         SetStretchMode (Me.Buffer.Canvas);
         On_Close_Handler (
            Me.Buffer.Panel,
            My_Close'Unrestricted_Access);
         On_Destroy_Handler (
            Me.Buffer.Panel,
            My_Destroy'Unrestricted_Access);
         On_Size_Handler (
            Me.Buffer.Panel,
            My_Size'Unrestricted_Access);
         On_Focus_Handler (
            Me.Buffer.Panel,
            My_Focus'Unrestricted_Access);
         On_Lost_Focus_Handler (
            Me.Buffer.Panel,
            My_Lost_Focus'Unrestricted_Access);
         On_Character_Handler (
            Me.Buffer.Panel,
            My_Key'Unrestricted_Access);
         On_Virtual_Key_Handler (
            Me.Buffer.Panel,
            My_Virtual_Key'Unrestricted_Access);
         On_Character_Down_Handler (
            Me.Buffer.Panel,
            My_Key_Down'Unrestricted_Access);
         On_Vertical_Scroll_Handler (
            Me.Buffer.Panel,
            My_Vertical_Scroll'Unrestricted_Access);
         On_Horizontal_Scroll_Handler (
            Me.Buffer.Panel,
            My_Horizontal_Scroll'Unrestricted_Access);
         On_Context_Menu_Handler (
            Me.Buffer.Panel,
            My_Context_Menu'Unrestricted_Access);
         On_Menu_Select_Handler (
            Me.Buffer.Panel,
            My_Menu_Select'Unrestricted_Access);
         CreateMenus (
            Me.Buffer,
            MainMenu,
            TransferMenu,
            OptionMenu,
            AdvancedMenu,
            ContextMenu);
         if Me.Buffer.VertScrollbar then
            VerticalScrollbar (Me.Buffer, Yes);
         end if;
         if Me.Buffer.HorzScrollbar then
            HorizontalScrollbar (Me.Buffer, Yes);
         end if;
         if Me.Buffer.SizingOn then
            WindowSizing (Me.Buffer, Yes);
         else
            WindowSizing (Me.Buffer, No);
         end if;
         SetDefaultTabStops (
            Me.Buffer,
            DEFAULT_TAB_SIZE);
         -- set up mouse callbacks
         On_Left_Mouse_Button_Down_Handler (
            Me.Buffer.Panel,
            My_Left_Button_Down'Unrestricted_Access);
         On_Left_Mouse_Button_Double_Click_Handler (
            Me.Buffer.Panel,
            My_Left_Button_Double_Click'Unrestricted_Access);
         On_Left_Mouse_Button_Up_Handler (
            Me.Buffer.Panel,
            My_Left_Button_Up'Unrestricted_Access);
         On_Mouse_Move_Handler (
            Me.Buffer.Panel,
            My_Mouse_Move'Unrestricted_Access);
         On_Capture_Changed_Handler (
            Me.Buffer.Panel,
            My_Capture_Changed'Unrestricted_Access);
         On_Init_Menu_Handler (
            Me.Buffer.Panel,
            My_Init_Menu'Unrestricted_Access);
         ResizeClientArea (Me.Buffer);
         -- set the default for cursor flashing and text flashing to True
         FlashControl (Me.Buffer, True, True);
         DrawView (Me.Buffer);
         DrawCursor (Me.Buffer);
         if Visible /= No then
            Sizable_Panels.Visible (Me.Buffer.Panel, True);
            Sizable_Panels.Focus(Me.Buffer.Panel);
         end if;
      end if;
   end InitializeTerminal;

begin

   loop
      select
         accept Open (
               Self         : in     Terminal;
               Title        : in     String        := "";
               MainMenu     : in     Option        := Ignore;
               TransferMenu : in     Option        := Ignore;
               OptionMenu   : in     Option        := Ignore;
               AdvancedMenu : in     Option        := Ignore;
               ContextMenu  : in     Option        := Ignore;
               Columns      : in     Natural       := DEFAULT_SCREEN_COLS;
               Rows         : in     Natural       := DEFAULT_SCREEN_ROWS;
               VirtualRows  : in     Natural       := DEFAULT_VIRTUAL_ROWS;
               XCoord       : in     Integer       := GC.Use_Default;
               YCoord       : in     Integer       := GC.Use_Default;
               OnTop        : in     Option        := Ignore;
               Visible      : in     Option        := Ignore;
               Font         : in     String;
               CharSet      : in     Charset_Type  := GDO.ANSI_CHARSET;
               Size         : in     Integer       := DEFAULT_FONT_SIZE)
         do
            begin
               if Self /= null then
                  Me := Self;
                  if Me.Buffer.Real_Size = (0, 0) then
                     -- The following line stop the processing of WM_SIZE
                     -- messages resulting from this routine. This is to
                     -- stop Windows incorrectly calculating the size of
                     -- the Client Area. Processing of WM_SIZE messages
                     -- is resumed after all outstanding Windows messages
                     -- have been processed.
                     Me.Buffer.EnableResize  := False;
                     -- create the panel and fonts, then use the common
                     -- initialization routine
                     Me.Buffer.TitleText := To_Unbounded (To_GString (Title));
                     Create (
                        Me.Buffer.Panel,
                        To_GString (Me.Buffer.TitleText)
                           & To_GString (Me.Buffer.LEDText),
                        Left => XCoord, Top => YCoord,
                        Width => 0, Height => 0);
                     Get_Canvas (Me.Buffer.Panel, Me.Buffer.Canvas);
                     Dock (Me.Buffer.Panel, GWindows.Base.Fill);
                     CreateFontsByName (
                        Me.Buffer,
                        To_GString (Font),
                        Size,
                        CharSet);
                     InitializeTerminal (
                        Me.Buffer,
                        MainMenu,
                        TransferMenu,
                        OptionMenu,
                        AdvancedMenu,
                        ContextMenu,
                        Columns,
                        Rows,
                        VirtualRows,
                        OnTop,
                        Visible);
                  end if;
               end if;
            end;
            Me.ScrnCols := Natural (Me.Buffer.Scrn_Size.Col);
            Me.ScrnRows := Natural (Me.Buffer.Scrn_Size.Row);
         end Open;
      or
         accept Open (
               Self         : in     Terminal;
               Title        : in     String    := "";
               MainMenu     : in     Option    := Ignore;
               TransferMenu : in     Option    := Ignore;
               OptionMenu   : in     Option    := Ignore;
               AdvancedMenu : in     Option    := Ignore;
               ContextMenu  : in     Option    := Ignore;
               Columns      : in     Natural   := DEFAULT_SCREEN_COLS;
               Rows         : in     Natural   := DEFAULT_SCREEN_ROWS;
               VirtualRows  : in     Natural   := DEFAULT_VIRTUAL_ROWS;
               XCoord       : in     Integer   := GC.Use_Default;
               YCoord       : in     Integer   := GC.Use_Default;
               OnTop        : in     Option    := Ignore;
               Visible      : in     Option    := Ignore;
               Font         : in     Font_Type := DEFAULT_FONT_TYPE;
               PrintFont    : in     String    := DEFAULT_PRINT_FONT;
               Size         : in     Integer   := DEFAULT_FONT_SIZE)
         do
            begin
               if Self /= null then
                  Me := Self;
                  if Me.Buffer.Real_Size = (0, 0) then
                     -- The following line stop the processing of WM_SIZE
                     -- messages resulting from this routine. This is to
                     -- stop Windows incorrectly calculating the size of
                     -- the Client Area. Processing of WM_SIZE messages
                     -- is resumed after all outstanding Windows messages
                     -- have been processed.
                     Me.Buffer.EnableResize  := False;
                     -- create the panel and fonts, then use the common
                     -- initialization routine
                     Me.Buffer.TitleText := To_Unbounded (To_GString (Title));
                     Create (
                        Me.Buffer.Panel,
                        To_GString (Me.Buffer.TitleText)
                           & To_GString (Me.Buffer.LEDText),
                        Left => XCoord, Top => YCoord,
                        Width => 0, Height => 0);
                     Dock (Me.Buffer.Panel, GWindows.Base.Fill);
                     Get_Canvas (Me.Buffer.Panel, Me.Buffer.Canvas);
                     CreateFontsByType (
                        Me.Buffer,
                        Font,
                        Size);
                     if Me.Buffer.SizingMode = Size_Fonts then
                        -- cannot do this with stock fonts
                        Me.Buffer.SizingMode := Size_View;
                        UpdateMenuStates (Me.Buffer);
                     end if;
                     Me.Buffer.PrintFontName
                        := To_Unbounded (To_GString (PrintFont));
                     InitializeTerminal (
                        Me.Buffer,
                        MainMenu,
                        TransferMenu,
                        OptionMenu,
                        AdvancedMenu,
                        ContextMenu,
                        Columns,
                        Rows,
                        VirtualRows,
                        OnTop,
                        Visible);
                  end if;
               end if;
            end;
            Me.ScrnCols := Natural (Me.Buffer.Scrn_Size.Col);
            Me.ScrnRows := Natural (Me.Buffer.Scrn_Size.Row);
         end Open;
      or
         accept SetTitleOptions (
               Visible : in     Option := Ignore;
               Set     : in     Option := Ignore;
               Title   : in     String := "")
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               WindowCaption (Me.Buffer, Visible);
               if Set = Yes then
                  Me.Buffer.TitleText := To_Unbounded (To_GString (Title));
                  Sizable_Panels.Text (
                     Me.Buffer.Panel,
                     To_GString (Me.Buffer.TitleText) &
                     To_GString (Me.Buffer.LEDText));
               end if;
               ResizeClientArea (Me.Buffer);
               DrawView (Me.Buffer);
            end;
         end SetTitleOptions;
      or
         when Me /= null =>
         accept SetWindowOptions (
               XCoord       : in     Integer := GC.Use_Default;
               YCoord       : in     Integer := GC.Use_Default;
               OnTop        : in     Option  := Ignore;
               Visible      : in     Option  := Ignore;
               Active       : in     Option  := Ignore;
               CloseWindow  : in     Option  := Ignore;
               CloseProgram : in     Option  := Ignore)
         do
            declare
               X : Integer := XCoord;
               Y : Integer := YCoord;
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if X = GC.Use_Default then
                  X := Left (Me.Buffer.Panel);
               end if;
               if Y = GC.Use_Default then
                  Y := Top (Me.Buffer.Panel);
               end if;
               Move (Me.Buffer.Panel, X, Y);
               if OnTop = Yes then
                  Me.Buffer.AlwaysOnTop := True;
               elsif OnTop = No then
                  Me.Buffer.AlwaysOnTop := False;
               end if;
               if Me.Buffer.AlwaysOnTop then
                  Order (Me.Buffer.Panel, GWindows.Base.Always_On_Top);
               else
                  Order (Me.Buffer.Panel, GWindows.Base.Not_Always_On_Top);
               end if;
               -- note that the first "ShowWindow" can be ignored
               -- by Windows, so we do this twice.
               if Visible = Yes then
                  CreateMenus (Me.Buffer, Yes, Ignore, Ignore, Ignore);
                  Sizable_Panels.Visible (Me.Buffer.Panel, True);
                  Sizable_Panels.Visible (Me.Buffer.Panel, True);
               elsif Visible = No then
                  Sizable_Panels.Visible (Me.Buffer.Panel, False);
                  Sizable_Panels.Visible (Me.Buffer.Panel, False);
               end if;
               if Active = Yes then
                  Sizable_Panels.Activate (Me.Buffer.Panel);
               end if;
               if CloseWindow = Yes then
                  Me.Buffer.WindowClose := True;
               elsif CloseWindow = No then
                  Me.Buffer.WindowClose := False;
               end if;
               if CloseProgram = Yes then
                  Me.Buffer.ProgramClose := True;
               elsif CloseProgram = No then
                  Me.Buffer.ProgramClose := False;
               end if;
            end;
         end SetWindowOptions;
      or
         when Me /= null and then not Me.Buffer.Selecting =>
         accept SetScreenSize (
               Columns : in     Natural := DEFAULT_SCREEN_COLS;
               Rows    : in     Natural := DEFAULT_SCREEN_ROWS)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               UndrawCursor (Me.Buffer);
               ResizeScreen (Me.Buffer, Columns, Rows, SetView => False);
               Me.ScrnCols := Natural (Me.Buffer.Scrn_Size.Col);
               Me.ScrnRows := Natural (Me.Buffer.Scrn_Size.Row);
               DrawCursor (Me.Buffer);
            end;
         end SetScreenSize;
      or
         when Me /= null and then not Me.Buffer.Selecting =>
         accept SetViewSize (
               Columns : in     Natural := 0;
               Rows    : in     Natural := 0)
         do
            declare
               NewCols : Natural := Columns;
               NewRows : Natural := Rows;
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if NewCols = 0 then
                  NewCols := Natural (Me.Buffer.Scrn_Size.Col);
               end if;
               if NewRows = 0 then
                  NewRows := Natural (Me.Buffer.Scrn_Size.Row);
               end if;
               UndrawCursor (Me.Buffer);
               ResizeView (Me.Buffer, NewCols, NewRows);
               Me.ScrnCols := Natural (Me.Buffer.Scrn_Size.Col);
               Me.ScrnRows := Natural (Me.Buffer.Scrn_Size.Row);
               DrawCursor (Me.Buffer);
            end;
         end SetViewSize;
      or
         when Me /= null and then not Me.Buffer.Selecting =>
         accept SetRegionSize (
               Columns : in     Natural := 0;
               Rows    : in     Natural := 0)
         do
            declare
               NewCols : Natural := Columns;
               NewRows : Natural := Rows;
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if NewCols = 0 then
                  NewCols := Natural (Me.Buffer.Scrn_Size.Col);
               end if;
               if NewRows = 0 then
                  NewRows := Natural (Me.Buffer.Scrn_Size.Row);
               end if;
               -- region must be at least one column and two rows
               if  NewCols >= 1
               and NewRows >= 2
               and Natural (Me.Buffer.Regn_Base.Col) + NewCols
                <= Natural (Me.Buffer.Scrn_Size.Col)
               and Natural (Me.Buffer.Regn_Base.Row) + NewRows
                <= Natural (Me.Buffer.Scrn_Size.Row) then
                  Me.Buffer.Regn_Size
                     := (Regn_Col (NewCols), Regn_Row (NewRows));
               end if;
            end;
         end SetRegionSize;
      or
         when Me /= null and then not Me.Buffer.Selecting =>
         accept SetScreenBase (
               Column : in     Natural := 0;
               Row    : in     Natural := 0)
         do
            declare
               MaxBaseRow : Natural;
               MaxBaseCol : Natural;
            begin
               MaxBaseRow := Natural (Me.Buffer.Real_Used.Row)
                  - Natural (Me.Buffer.Scrn_Size.Row);
               MaxBaseCol := Natural (Me.Buffer.Real_Used.Col)
                  - Natural (Me.Buffer.Scrn_Size.Col);
               ProcessPutBuffer (Me.Buffer, True);
               if Row <= MaxBaseRow and Column <= MaxBaseCol then
                  -- Note: since Me.Buffer.Real_Used.Col is always equal
                  -- to Me.Buffer.Scrn_Size.Col, the only valid value
                  -- for Column is actually zero.
                  Me.Buffer.Scrn_Base := (Virt_Col (Column), Virt_Row (Row));
                  if Me.Buffer.ScreenAndView then
                     Me.Buffer.View_Base.Row := Me.Buffer.Scrn_Base.Row;
                  end if;
                  UpdateScrollPositions (Me.Buffer);
                  -- redraw entire screen
                  UndrawCursor (Me.Buffer);
                  DrawView (Me.Buffer);
                  DrawCursor (Me.Buffer);
               end if;
            end;
         end SetScreenBase;
      or
         when Me /= null and then not Me.Buffer.Selecting =>
         accept SetViewBase (
               Column : in     Natural := 0;
               Row    : in     Natural := 0)
         do
            declare
               MaxBaseRow : Natural;
               MaxBaseCol : Natural;
            begin
               MaxBaseRow := Natural (Me.Buffer.Real_Used.Row)
                  - Natural (Me.Buffer.View_Size.Row);
               MaxBaseCol := Natural (Me.Buffer.Real_Used.Col)
                  - Natural (Me.Buffer.View_Size.Col);
               ProcessPutBuffer (Me.Buffer, True);
               if Row <= MaxBaseRow and Column <= MaxBaseCol then
                  -- valid view base
                  Me.Buffer.View_Base := (Virt_Col (Column), Virt_Row (Row));
                  if Me.Buffer.ScreenAndView then
                     Me.Buffer.Scrn_Base.Row := Me.Buffer.View_Base.Row;
                  end if;
                  UpdateScrollPositions (Me.Buffer);
                  -- redraw entire screen
                  UndrawCursor (Me.Buffer);
                  DrawView (Me.Buffer);
                  DrawCursor (Me.Buffer);
               end if;
            end;
         end SetViewBase;
      or
         when Me /= null and then not Me.Buffer.Selecting =>
         accept SetRegionBase (
               Column : in     Natural := 0;
               Row    : in     Natural := 0)
         do
            declare
               MaxBaseRow : Natural;
               MaxBaseCol : Natural;
            begin
               MaxBaseRow := Natural (Me.Buffer.Scrn_Size.Row)
                  - Natural (Me.Buffer.Regn_Size.Row);
               MaxBaseCol := Natural (Me.Buffer.Scrn_Size.Col)
                  - Natural (Me.Buffer.Regn_Size.Col);
               ProcessPutBuffer (Me.Buffer, True);
               if Row <= MaxBaseRow and Column <= MaxBaseCol then
                  -- valid region base
                  Me.Buffer.Regn_Base := (Scrn_Col (Column), Scrn_Row (Row));
               end if;
            end;
         end SetRegionBase;
      or
         accept SetVirtualSize (
               VirtualRows : in     Natural := 0)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               NullSelection (Me.Buffer);
               Me.Buffer.EnableResize := False;
               Resize (
                  Me.Buffer,
                  Me.Buffer.Virt_Used.Col,
                  Min (
                     Max (Virt_Row (Me.Buffer.Scrn_Size.Row),
                          Virt_Row (VirtualRows)),
                     Virt_Row (MAX_ROWS)),
                  Me.Buffer.Scrn_Size.Col,
                  Me.Buffer.Scrn_Size.Row,
                  Me.Buffer.View_Size.Col,
                  Me.Buffer.View_Size.Row,
                  Me.Buffer.OutputStyle);
               Me.ScrnCols := Natural (Me.Buffer.Scrn_Size.Col);
               Me.ScrnRows := Natural (Me.Buffer.Scrn_Size.Row);
               UpdateScrollRanges (Me.Buffer);
               UpdateScrollPositions (Me.Buffer);
            end;
         end SetVirtualSize;
      or
         accept Close
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               Me.Buffer.CloseFlag := True;
            end;
         end Close;
      or
         when Me /= null and then not Me.Buffer.Selecting =>
         accept ClearBuffer
         do
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               Initialize (Me.Buffer, Me.Buffer.BlankStyle);
               ResetOffsets (Me.Buffer);
               DrawView (Me.Buffer);
               if Me.Buffer.VertScrollbar then
                  Scroll_Range (
                     Me.Buffer.Panel,
                     GWindows.Windows.Vertical,
                     0,
                     0);
                  Scroll_Position (
                     Me.Buffer.Panel,
                     GWindows.Windows.Vertical,
                     0);
               end if;
               if Me.Buffer.HorzScrollbar then
                  Scroll_Range (
                     Me.Buffer.Panel,
                     GWindows.Windows.Horizontal,
                     0,
                     0);
                  Scroll_Position (
                     Me.Buffer.Panel,
                     GWindows.Windows.Horizontal,
                     0);
               end if;
               DrawCursor (Me.Buffer);
            end;
         end ClearBuffer;
      or
         when Me /= null
         and then not Me.Buffer.Selecting =>
         accept ClearScreen
         do
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               ClearScreenBuffer (Me.Buffer);
               Me.Buffer.Input_Curs  := (0, 0);
               Me.Buffer.WrapNextIn  := False;
               Me.Buffer.Output_Curs := (0, 0);
               Me.Buffer.WrapNextOut := False;
               DrawView (Me.Buffer);
               DrawCursor (Me.Buffer);
            end;
         end ClearScreen;
      or
         when Me /= null
         and then not Me.Buffer.Selecting =>
         accept ClearToEOL
         do
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               if Me.Buffer.SingleCursor then
                  -- use input cursor
                  ClearEOL (
                     Me.Buffer,
                     Me.Buffer.Input_Curs.Col,
                     Me.Buffer.Input_Curs.Row);
               else
                  -- use output cursor
                  ClearEOL (
                     Me.Buffer,
                     Me.Buffer.Output_Curs.Col,
                     Me.Buffer.Output_Curs.Row);
               end if;
            end;
         end ClearToEOL;
      or
         accept ClearKeyboard
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               Me.Buffer.KeyStart := 0;
               Me.Buffer.KeyFinish := 0;
            end;
         end ClearKeyboard;
      or
         when Me /= null and then not Me.Buffer.Selecting =>
         accept Scroll (
               Rows : in     Integer := 1)
         do
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               if Rows > 0 then
                  -- shift the data on the screen up, and also
                  -- shift the view unless we are using a region
                  ShiftUp (
                     Me.Buffer,
                     Me.Buffer.BlankStyle,
                     Rows,
                     AdjustView => not Me.Buffer.UseRegion);
               elsif Rows < 0 then
                  -- shift the data on the screen down, and also
                  -- shift the view unless we are using a region
                  ShiftDown (
                     Me.Buffer,
                     Me.Buffer.BlankStyle,
                     -Rows,
                     AdjustView => not Me.Buffer.UseRegion);
               end if;
               DrawCursor (Me.Buffer);
            end;
         end Scroll;
      or
         when Me /= null and then not Me.Buffer.Selecting =>
         accept Shift (
               Cols : in     Integer := 1)
         do
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               if Cols > 0 then
                  ShiftLeft (
                     Me.Buffer,
                     Me.Buffer.BlankStyle,
                     Cols);
               elsif Cols < 0 then
                  ShiftRight (
                     Me.Buffer,
                     Me.Buffer.BlankStyle,
                     -Cols);
               end if;
               DrawCursor (Me.Buffer);
            end;
         end Shift;
      or
         accept SetEditingOptions (
               Wrap   : in     Option := Ignore;
               Insert : in     Option := Ignore;
               Echo   : in     Option := Ignore)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if Wrap = Yes then
                  Me.Buffer.WrapOn   := True;
               elsif Wrap = No then
                  Me.Buffer.WrapOn   := False;
               end if;
               if Insert = Yes then
                  Me.Buffer.InsertOn := True;
               elsif Insert = No then
                  Me.Buffer.InsertOn := False;
               end if;
               if Echo = Yes then
                  Me.Buffer.EchoOn   := True;
               elsif Echo = No then
                  Me.Buffer.EchoOn   := False;
               end if;
               UpdateMenuStates (Me.Buffer);
            end;
         end SetEditingOptions;
      or
         accept SetPasteOptions (
               ToBuffer   : in     Option := Ignore;
               ToKeyboard : in     Option := Ignore)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if ToBuffer = Yes then
                  Me.Buffer.PasteToBuff := True;
               elsif ToBuffer = No then
                  Me.Buffer.PasteToBuff := False;
               end if;
               if ToKeyboard = Yes then
                  Me.Buffer.PasteToKybd := True;
               elsif ToKeyboard = No then
                  Me.Buffer.PasteToKybd := False;
               end if;
            end;
         end SetPasteOptions;
      or
         accept GetPastingFlag (
               Pasting : out Boolean)
         do
            begin
               Pasting := Me.Buffer.Pasting;
            end;
         end GetPastingFlag;
      or
         accept SetPastingFlag (
               Pasting : in Boolean)
         do
            begin
               Me.Buffer.Pasting := Pasting;
               if not Pasting then
                  Me.Buffer.LFonCR := Me.Buffer.LFonCR;
               end if;
            end;
         end SetPastingFlag;
      or
         accept SetScrollOptions (
               Horizontal : in     Option := Ignore;
               Vertical   : in     Option := Ignore;
               OnOutput   : in     Option := Ignore;
               Smooth     : in     Option := Ignore;
               Region     : in     Option := Ignore)
         do
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               VerticalScrollbar (Me.Buffer, Vertical);
               HorizontalScrollbar (Me.Buffer, Horizontal);
               if OnOutput = Yes then
                  Me.Buffer.ScrollOnPut  := True;
               elsif OnOutput = No then
                  Me.Buffer.ScrollOnPut  := False;
               end if;
               if Smooth = Yes then
                  Me.Buffer.SmoothScroll := True;
               elsif Smooth = No then
                  Me.Buffer.SmoothScroll := False;
               end if;
               if Region = Yes then
                  -- region must be at least one column and two rows
                  if Me.Buffer.Regn_Size.Col >= 1
                  and Me.Buffer.Regn_Size.Row >= 2 then
                     Me.Buffer.UseRegion := True;
                  end if;
               elsif Region = No then
                  Me.Buffer.UseRegion := False;
               end if;
               ResizeClientArea (Me.Buffer);
               DrawView (Me.Buffer);
               DrawCursor (Me.Buffer);
               UpdateMenuStates (Me.Buffer);
            end;
         end SetScrollOptions;
      or
         accept SetMenuOptions (
               MainMenu     : in     Option := Ignore;
               TransferMenu : in     Option := Ignore;
               OptionMenu   : in     Option := Ignore;
               AdvancedMenu : in     Option := Ignore;
               ContextMenu  : in     Option := Ignore)
         do
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               CreateMenus (
                  Me.Buffer,
                  MainMenu,
                  TransferMenu,
                  OptionMenu,
                  AdvancedMenu,
                  ContextMenu);
               ResizeClientArea (Me.Buffer);
               DrawView (Me.Buffer);
               UpdateMenuStates (Me.Buffer);
               DrawCursor (Me.Buffer);
            end;
         end SetMenuOptions;
      or
         accept SetSizingOptions (
               Sizing : in     Option      := Ignore;
               Mode   : in     Sizing_Mode := DEFAULT_SIZING_MODE)
         do
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               WindowSizing (Me.Buffer, Sizing);
               Me.Buffer.SizingMode := Mode;
               UpdateMenuStates (Me.Buffer);
               DrawCursor (Me.Buffer);
            end;
         end SetSizingOptions;
      or
         accept SetAnsiOptions (
               OnInput  : in     Option    := Ignore;
               OnOutput : in     Option    := Ignore;
               Mode     : in     Ansi_Mode := DEFAULT_ANSI_MODE)
         do
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               if OnInput = Yes then
                  Me.Buffer.AnsiOnInput := True;
               elsif OnInput = No then
                  Me.Buffer.AnsiOnInput := False;
               end if;
               if OnOutput = Yes then
                  Me.Buffer.AnsiOnOutput := True;
               elsif OnOutput = No then
                  Me.Buffer.AnsiOnOutput := False;
               end if;
               Me.Buffer.AnsiMode := Mode;
               Me.Buffer.AnsiBase := Mode;
               case Me.Buffer.AnsiMode is
                  when PC =>
                     -- for PC, use VT100 - differences are taken
                     -- care of in ProcessAnsi routine
                     AP.SwitchParserMode (Me.Buffer.AnsiParser, AP.VT100);
                  when VT52 =>
                     AP.SwitchParserMode (Me.Buffer.AnsiParser, AP.VT52);
                  when VT100 | VT101 | VT102 =>
                     AP.SwitchParserMode (Me.Buffer.AnsiParser, AP.VT100);
                  when VT220 | VT320 | VT420 =>
                     AP.SwitchParserMode (Me.Buffer.AnsiParser, AP.VT420);
               end case;
               AnsiReset (
                  Me.Buffer,
                  Me.Buffer.Input_Curs.Col,
                  Me.Buffer.Input_Curs.Row,
                  Me.Buffer.OutputStyle);
               UpdateMenuStates (Me.Buffer);
               DrawCursor (Me.Buffer);
            end;
         end SetAnsiOptions;
      or
         accept GetInputPos (
               Column     :    out Natural;
               Row        :    out Natural;
               InputStyle : in     Boolean := True)
         do
            declare
               CellWidth : Scrn_Col;
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, True);
               if Me.Buffer.WrapOn and Me.Buffer.WrapNextIn then
                  -- cursor position is not correct since it would wrap on
                  -- the next character, so we must force a wrap now.
                  if InputStyle then
                     ForceWrap (
                        Me.Buffer,
                        Me.Buffer.Input_Curs.Col,
                        Me.Buffer.Input_Curs.Row,
                        Me.Buffer.WrapNextIn,
                        Me.Buffer.InputStyle);
                  else
                     ForceWrap (
                        Me.Buffer,
                        Me.Buffer.Input_Curs.Col,
                        Me.Buffer.Input_Curs.Row,
                        Me.Buffer.WrapNextIn,
                        Me.Buffer.OutputStyle);
                  end if;
               end if;
               CellWidth := Width (
                  Me.Buffer,
                  Me.Buffer.Input_Curs.Col,
                  Me.Buffer.Input_Curs.Row);
               Row       := Natural (Me.Buffer.Input_Curs.Row);
               Column    := Natural (Me.Buffer.Input_Curs.Col / CellWidth);
            end;
            if Me.Buffer.CursVisible and not Me.Buffer.CursFlashOff then
               DrawCursor (Me.Buffer);
            end if;
         end GetInputPos;
      or
         accept SetInputPos (
               Column : in     Integer := -1;
               Row    : in     Integer := -1)
         do
            declare
               CellWidth   : Scrn_Col;
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               if Row in 0 .. Integer (Me.Buffer.Scrn_Size.Row - 1) then
                  Me.Buffer.Input_Curs.Row := Scrn_Row (Row);
                  Me.Buffer.WrapNextIn := False;
               end if;
               CellWidth := Width (
                  Me.Buffer,
                  Me.Buffer.Input_Curs.Col,
                  Me.Buffer.Input_Curs.Row);
               if Column
               in 0 .. Integer (Me.Buffer.Scrn_Size.Col / CellWidth - 1) then
                  Me.Buffer.Input_Curs.Col := Scrn_Col (Column) * CellWidth;
                  Me.Buffer.WrapNextIn := False;
               end if;
               if Me.Buffer.CursVisible and not Me.Buffer.CursFlashOff then
                  DrawCursor (Me.Buffer);
               end if;
            end;
         end SetInputPos;
      or
         accept GetOutputPos (
               Column      :    out Natural;
               Row         :    out Natural;
               OutputStyle : in     Boolean := True)
         do
            declare
               CellWidth : Scrn_Col;
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, True);
               if Me.Buffer.WrapOn and Me.Buffer.WrapNextOut then
                  -- cursor position is not correct since it would wrap on
                  -- the next character, so we must force a wrap now.
                  if OutputStyle then
                     ForceWrap (
                        Me.Buffer,
                        Me.Buffer.Output_Curs.Col,
                        Me.Buffer.Output_Curs.Row,
                        Me.Buffer.WrapNextOut,
                        Me.Buffer.OutputStyle);
                  else
                     ForceWrap (
                        Me.Buffer,
                        Me.Buffer.Output_Curs.Col,
                        Me.Buffer.Output_Curs.Row,
                        Me.Buffer.WrapNextOut,
                        Me.Buffer.InputStyle);
                  end if;
               end if;
               CellWidth := Width (
                  Me.Buffer,
                  Me.Buffer.Output_Curs.Col,
                  Me.Buffer.Output_Curs.Row);
               Row       := Natural (Me.Buffer.Output_Curs.Row);
               Column    := Natural (Me.Buffer.Output_Curs.Col / CellWidth);
            end;
            if Me.Buffer.CursVisible and not Me.Buffer.CursFlashOff then
               DrawCursor (Me.Buffer);
            end if;
         end GetOutputPos;
      or
         accept SetOutputPos (
               Column : in     Integer := -1;
               Row    : in     Integer := -1)
         do
            declare
               CellWidth   : Scrn_Col;
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               if Row in 0 .. Integer (Me.Buffer.Scrn_Size.Row - 1) then
                  Me.Buffer.Output_Curs.Row := Scrn_Row (Row);
                  Me.Buffer.WrapNextOut := False;
                  if Me.Buffer.SingleCursor then
                     -- also set the input cursor
                     Me.Buffer.Input_Curs.Row := Scrn_Row (Row);
                     Me.Buffer.WrapNextIn := False;
                  end if;
               end if;
               CellWidth := Width (
                  Me.Buffer,
                  Me.Buffer.Output_Curs.Col,
                  Me.Buffer.Output_Curs.Row);
               if Column
               in 0 .. Integer (Me.Buffer.Scrn_Size.Col / CellWidth - 1) then
                  Me.Buffer.Output_Curs.Col := Scrn_Col (Column) * CellWidth;
                  Me.Buffer.WrapNextOut := False;
                  if Me.Buffer.SingleCursor then
                     -- also set the input cursor
                     Me.Buffer.Input_Curs.Col := Scrn_Col (Column);
                     Me.Buffer.WrapNextIn := False;
                  end if;
               end if;
               if Me.Buffer.CursVisible and not Me.Buffer.CursFlashOff then
                  DrawCursor (Me.Buffer);
               end if;
            end;
         end SetOutputPos;
      or
         accept PushInputPos
         do
            declare
               Absolute : Real_Pos;
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if Me.Buffer.Input_Stack.Top < MAX_CURS_STACK_SIZE then
                  Absolute
                     := (Real (Me.Buffer, Me.Buffer.Input_Curs.Col),
                         Real (Me.Buffer, Me.Buffer.Input_Curs.Row));
                  Me.Buffer.Input_Stack.Item (Me.Buffer.Input_Stack.Top).Real
                     := Absolute;
                  Me.Buffer.Input_Stack.Item (Me.Buffer.Input_Stack.Top).Wrap
                     := Me.Buffer.WrapNextIn;
                  Me.Buffer.Input_Stack.Top := Me.Buffer.Input_Stack.Top + 1;
               else
                  WS.Beep;
               end if;
            end;
         end PushInputPos;
      or
         accept PopInputPos (
               Discard : in     Option := No;
               Show    : in     Option := Yes;
               Force   : in     Option := Yes)
         do
            declare
               Absolute : Real_Pos;
               Scroll   : Integer;
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if Me.Buffer.Input_Stack.Top > 0 then
                  Me.Buffer.Input_Stack.Top := Me.Buffer.Input_Stack.Top - 1;
                  if Discard /= Yes then
                     UndrawCursor (Me.Buffer);
                     Absolute
                        := Me.Buffer.Input_Stack.Item (
                           Me.Buffer.Input_Stack.Top).Real;
                     if OnScreen (Me.Buffer, Real_Row (Absolute.Row)) 
                     or Force = Yes then
                        Me.Buffer.WrapNextIn
                           := Me.Buffer.Input_Stack.Item (
                              Me.Buffer.Input_Stack.Top).Wrap;
                        Me.Buffer.Input_Curs.Col
                           := Scrn (Me.Buffer, Real_Col (Absolute.Col));
                        Me.Buffer.Input_Curs.Row
                           := Scrn (Me.Buffer, Real_Row (Absolute.Row));
                        -- make sure the row is on the screen
                        PutOnScreen (Me.Buffer, Real_Row (Absolute.Row), Scroll);
                        if Show = Yes then
                           -- make sure the row is on view
                           PutOnView (
                              Me.Buffer,
                              Virt (Me.Buffer, Me.Buffer.Input_Curs.Row),
                              Scroll);
                           if Scroll /= 0 then
                              UpdateScrollPositions (Me.Buffer);
                           end if;
                        end if;
                     end if;
                     if Me.Buffer.CursVisible
                     and not Me.Buffer.CursFlashOff then
                        DrawCursor (Me.Buffer);
                     end if;
                  end if;
               else
                  WS.Beep;
               end if;
            end;
         end PopInputPos;
      or
         accept PushOutputPos
         do
            declare
               Absolute : Real_Pos;
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if Me.Buffer.Output_Stack.Top < MAX_CURS_STACK_SIZE then
                  Absolute
                     := (Real (Me.Buffer, Me.Buffer.Output_Curs.Col),
                         Real (Me.Buffer, Me.Buffer.Output_Curs.Row));
                  Me.Buffer.Output_Stack.Item (Me.Buffer.Output_Stack.Top).Real
                     := Absolute;
                  Me.Buffer.Output_Stack.Item (Me.Buffer.Output_Stack.Top).Wrap
                     := Me.Buffer.WrapNextOut;
                  Me.Buffer.Output_Stack.Top := Me.Buffer.Output_Stack.Top + 1;
               else
                  WS.Beep;
               end if;
            end;
         end PushOutputPos;
      or
         accept PopOutputPos (
               Discard : in     Option := No;
               Show    : in     Option := Yes;
               Force   : in     Option := Yes)
         do
            declare
               Absolute : Real_Pos;
               Scroll   : Integer;
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if Me.Buffer.Output_Stack.Top > 0 then
                  Me.Buffer.Output_Stack.Top := Me.Buffer.Output_Stack.Top - 1;
                  if Discard /= Yes then
                     UndrawCursor (Me.Buffer);
                     Absolute
                        := Me.Buffer.Output_Stack.Item (
                           Me.Buffer.Output_Stack.Top).Real;
                     if OnScreen (Me.Buffer, Real_Row (Absolute.Row))
                     or Force = Yes then
                        Me.Buffer.WrapNextOut
                           := Me.Buffer.Output_Stack.Item (
                              Me.Buffer.Output_Stack.Top).Wrap;
                        Me.Buffer.Output_Curs.Col
                           := Scrn (Me.Buffer, Real_Col (Absolute.Col));
                        Me.Buffer.Output_Curs.Row
                           := Scrn (Me.Buffer, Real_Row (Absolute.Row));
                        -- make sure the row is on the screen
                        -- PutOnScreen (Me.Buffer, Real_Row (Absolute.Row), Scroll);
                       if Me.Buffer.SingleCursor then
                           -- also set the input cursor
                           Me.Buffer.Input_Curs := Me.Buffer.Output_Curs;
                           Me.Buffer.WrapNextIn := Me.Buffer.WrapNextOut;
                        end if;
                        if Show = Yes then
                              -- make sure the row is on view
                           PutOnView (
                              Me.Buffer,
                              Virt (Me.Buffer, Me.Buffer.Output_Curs.Row),
                              Scroll);
                           if Scroll /= 0 then
                              UpdateScrollPositions (Me.Buffer);
                           end if;
                        end if;
                     end if;
                     if Me.Buffer.CursVisible
                     and not Me.Buffer.CursFlashOff then
                        DrawCursor (Me.Buffer);
                     end if;
                  end if;
               else
                  WS.Beep;
               end if;
            end;
         end PopOutputPos;
      or
         accept Peek (
               Char  :    out Character;
               Ready :    out Boolean)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               Ready := Me.Buffer.KeySize > 0
                    and (Me.Buffer.KeyStart /= Me.Buffer.KeyFinish);
               if Ready then
                  Char := Me.Buffer.KeyBuff (Me.Buffer.KeyStart).Char;
               end if;
            end;
         end Peek;
      or
         when Me /= null
         and then Me.Buffer.KeyStart /= Me.Buffer.KeyFinish =>
         accept Get (
               Char :    out Character)
         do
            declare
               Special   : Special_Key_Type;
               Modifier  : Modifier_Key_Type;
               Available : Boolean;
            begin
               ProcessPutBuffer (Me.Buffer, True);
               ReceiveKey (Me.Buffer, Special, Char, Modifier, Available);
               if not Available then
                  -- probably no key buffer
                  null;
               end if;
            end;
         end Get;
      or
         accept UnGet (
               Char : in     Character)
         do
            declare
               Added : Boolean;
            begin
               ProcessPutBuffer (Me.Buffer, True);
               UnReceiveKey (Me.Buffer, None, Char, No_Modifier, Added);
               if not Added then
                  -- may happen if we unget more than once, but
                  -- there is not much we can do about it.
                  null;
               end if;
            end;
         end UnGet;
      or
         when Me /= null
         and then Me.Buffer.KeyStart /= Me.Buffer.KeyFinish =>
         accept GetExtended (
               Special  :    out Special_Key_Type;
               Modifier :    out Modifier_Key_Type;
               Char     :    out Character)
         do
            declare
               Available : Boolean;
            begin
               ProcessPutBuffer (Me.Buffer, True);
               ReceiveKey (Me.Buffer, Special, Char, Modifier, Available);
               if not Available then
                  -- probably no key buffer
                  null;
               end if;
            end;
         end GetExtended;
      or
         when Me /= null
         and then not Me.Buffer.Selecting
         and then Me.Buffer.PutCount < MAX_PUT_COUNT =>
         accept Put (
               Char   : in     Character;
               Column : in     Integer   := -1;
               Row    : in     Integer   := -1;
               Move   : in     Option    := Yes)
         do
            declare
               SavedCursor : Scrn_Pos;
               SavedWrap   : Boolean;
               CellWidth   : Scrn_Col;
            begin
               if Me.Buffer.SingleCursor then
                  UndrawCursor (Me.Buffer);
                  ProcessPutBuffer (Me.Buffer, False);
                  -- use input cursor
                  SavedCursor := Me.Buffer.Input_Curs;
                  SavedWrap   := Me.Buffer.WrapNextIn;
                  if Row in 0 .. Integer (Me.Buffer.Scrn_Size.Row - 1) then
                     Me.Buffer.Input_Curs.Row := Scrn_Row (Row);
                     Me.Buffer.WrapNextIn := False;
                  end if;
                  CellWidth := Width (
                     Me.Buffer,
                     Me.Buffer.Input_Curs.Col,
                     Me.Buffer.Input_Curs.Row);
                  if Column
                  in 0 .. Integer (Me.Buffer.Scrn_Size.Col / CellWidth - 1) then
                     Me.Buffer.Input_Curs.Col := Scrn_Col (Column) * CellWidth;
                     Me.Buffer.WrapNextIn := False;
                  end if;
                  if Me.Buffer.AnsiOnOutput then
                     Ansi_Buffer.ProcessChar (
                        Ansi_Buffer.Ansi_Buffer (Me.Buffer),
                        Me.Buffer.Input_Curs.Col,
                        Me.Buffer.Input_Curs.Row,
                        Me.Buffer.WrapNextIn,
                        Char,
                        Me.Buffer.OutputStyle,
                        Input => False);
                  else
                     Graphic_Buffer.ProcessChar (
                        Graphic_Buffer.Graphic_Buffer (Me.Buffer),
                        Me.Buffer.Input_Curs.Col,
                        Me.Buffer.Input_Curs.Row,
                        Me.Buffer.WrapNextIn,
                        Char,
                        Me.Buffer.OutputStyle,
                        Input => False);
                  end if;
                  if Move /= Yes then
                     Me.Buffer.Input_Curs := SavedCursor;
                     Me.Buffer.WrapNextIn := SavedWrap;
                  end if;
                  if Me.Buffer.CursVisible and not Me.Buffer.CursFlashOff then
                     DrawCursor (Me.Buffer);
                  end if;
               else
                  -- use output cursor
                  ProcessPutBuffer (Me.Buffer, True);
                  SavedCursor := Me.Buffer.Output_Curs;
                  SavedWrap   := Me.Buffer.WrapNextOut;
                  if Row in 0 .. Integer (Me.Buffer.Scrn_Size.Row - 1) then
                     Me.Buffer.Output_Curs.Row := Scrn_Row (Row);
                     Me.Buffer.WrapNextOut := False;
                  end if;
                  CellWidth := Width (
                     Me.Buffer,
                     Me.Buffer.Output_Curs.Col,
                     Me.Buffer.Output_Curs.Row);
                  if Column
                  in 0 .. Integer (Me.Buffer.Scrn_Size.Col / CellWidth - 1) then
                     Me.Buffer.Output_Curs.Col := Scrn_Col (Column) * CellWidth;
                     Me.Buffer.WrapNextOut := False;
                  end if;
                  if Me.Buffer.AnsiOnOutput then
                     Ansi_Buffer.ProcessChar (
                        Ansi_Buffer.Ansi_Buffer (Me.Buffer),
                        Me.Buffer.Output_Curs.Col,
                        Me.Buffer.Output_Curs.Row,
                        Me.Buffer.WrapNextOut,
                        Char,
                        Me.Buffer.OutputStyle,
                        Input => False);
                  else
                     Graphic_Buffer.ProcessChar (
                        Graphic_Buffer.Graphic_Buffer (Me.Buffer),
                        Me.Buffer.Output_Curs.Col,
                        Me.Buffer.Output_Curs.Row,
                        Me.Buffer.WrapNextOut,
                        Char,
                        Me.Buffer.OutputStyle,
                        Input => False);
                  end if;
                  if Move /= Yes then
                     Me.Buffer.Output_Curs := SavedCursor;
                     Me.Buffer.WrapNextOut := SavedWrap;
                  end if;
               end if;
               Me.Buffer.PutCount := Me.Buffer.PutCount + 1;
            end;
         end Put;
      or
         when Me /= null
         and then not Me.Buffer.Selecting
         and then Me.Buffer.PutCount < MAX_PUT_COUNT =>
         accept Put (
               Str    : in     String;
               Column : in     Integer := -1;
               Row    : in     Integer := -1;
               Move   : in     Option  := Yes)
         do
            declare
               SavedCursor : Scrn_Pos;
               SavedWrap   : Boolean;
               CellWidth   : Scrn_Col;
            begin
               if Me.Buffer.SingleCursor then
                  -- use input cursor
                  UndrawCursor (Me.Buffer);
                  ProcessPutBuffer (Me.Buffer, False);
                  SavedCursor := Me.Buffer.Input_Curs;
                  SavedWrap   := Me.Buffer.WrapNextIn;
                  if Row in 0 .. Integer (Me.Buffer.Scrn_Size.Row - 1) then
                     Me.Buffer.Input_Curs.Row := Scrn_Row (Row);
                     Me.Buffer.WrapNextIn := False;
                  end if;
                  CellWidth := Width (
                     Me.Buffer,
                     Me.Buffer.Input_Curs.Col,
                     Me.Buffer.Input_Curs.Row);
                  if Column
                  in 0 .. Integer (Me.Buffer.Scrn_Size.Col / CellWidth - 1) then
                     Me.Buffer.Input_Curs.Col := Scrn_Col (Column) * CellWidth;
                     Me.Buffer.WrapNextIn := False;
                  end if;
                  if Me.Buffer.AnsiOnOutput then
                     Ansi_Buffer.ProcessStr (
                        Ansi_Buffer.Ansi_Buffer (Me.Buffer),
                        Me.Buffer.Input_Curs.Col,
                        Me.Buffer.Input_Curs.Row,
                        Me.Buffer.WrapNextIn,
                        Str,
                        Me.Buffer.OutputStyle,
                        Input => False);
                  else
                     Graphic_Buffer.ProcessStr (
                        Graphic_Buffer.Graphic_Buffer (Me.Buffer),
                        Me.Buffer.Input_Curs.Col,
                        Me.Buffer.Input_Curs.Row,
                        Me.Buffer.WrapNextIn,
                        Str,
                        Me.Buffer.OutputStyle,
                        Input => False);
                  end if;
                  if Move /= Yes then
                     Me.Buffer.Input_Curs := SavedCursor;
                     Me.Buffer.WrapNextIn := SavedWrap;
                  end if;
                  if Me.Buffer.CursVisible and not Me.Buffer.CursFlashOff then
                     DrawCursor (Me.Buffer);
                  end if;
               else
                  -- use output cursor
                  ProcessPutBuffer (Me.Buffer, True);
                  SavedCursor := Me.Buffer.Output_Curs;
                  SavedWrap   := Me.Buffer.WrapNextOut;
                  if Row in 0 .. Integer (Me.Buffer.Scrn_Size.Row - 1) then
                     Me.Buffer.Output_Curs.Row := Scrn_Row (Row);
                     Me.Buffer.WrapNextOut := False;
                  end if;
                  CellWidth := Width (
                     Me.Buffer,
                     Me.Buffer.Output_Curs.Col,
                     Me.Buffer.Output_Curs.Row);
                  if Column
                  in 0 .. Integer (Me.Buffer.Scrn_Size.Col / CellWidth - 1) then
                     Me.Buffer.Output_Curs.Col := Scrn_Col (Column) * CellWidth;
                     Me.Buffer.WrapNextOut := False;
                  end if;
                  if Me.Buffer.AnsiOnOutput then
                     Ansi_Buffer.ProcessStr (
                        Ansi_Buffer.Ansi_Buffer (Me.Buffer),
                        Me.Buffer.Output_Curs.Col,
                        Me.Buffer.Output_Curs.Row,
                        Me.Buffer.WrapNextOut,
                        Str,
                        Me.Buffer.OutputStyle,
                        Input => False);
                  else
                     Graphic_Buffer.ProcessStr (
                        Graphic_Buffer.Graphic_Buffer (Me.Buffer),
                        Me.Buffer.Output_Curs.Col,
                        Me.Buffer.Output_Curs.Row,
                        Me.Buffer.WrapNextOut,
                        Str,
                        Me.Buffer.OutputStyle,
                        Input => False);
                  end if;
                  if Move /= Yes then
                     Me.Buffer.Output_Curs := SavedCursor;
                     Me.Buffer.WrapNextOut := SavedWrap;
                  end if;
               end if;
               Me.Buffer.PutCount := Me.Buffer.PutCount + Str'Length;
            end;
         end Put;
      or
         accept SetInputFgColor (
               Color : in     Color_Type := DEFAULT_FG_COLOR)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               Me.Buffer.InputStyle.FgColor := Color;
               if Me.Buffer.SingleStyle then
                  Me.Buffer.OutputStyle := Me.Buffer.InputStyle;
               end if;
            end;
         end SetInputFgColor;
      or
         accept SetInputBgColor (
               Color : in     Color_Type := DEFAULT_BG_COLOR)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               Me.Buffer.InputStyle.BgColor := Color;
               if Me.Buffer.SingleStyle then
                  Me.Buffer.OutputStyle := Me.Buffer.InputStyle;
               end if;
            end;
         end SetInputBgColor;
      or
         accept SetInputStyle (
               Bold      : in     Option := Ignore;
               Italic    : in     Option := Ignore;
               Underline : in     Option := Ignore;
               Strikeout : in     Option := Ignore;
               Inverse   : in     Option := Ignore;
               Flashing  : in     Option := Ignore)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if Bold = Yes then
                  Me.Buffer.InputStyle.Bold      := True;
                  if BRIGHT_ON_BOLD_FG then
                     Bright (Me.Buffer.InputStyle.FgColor);
                  end if;
                  if BRIGHT_ON_BOLD_BG then
                     Bright (Me.Buffer.InputStyle.BgColor);
                  end if;
               elsif Bold = No then
                  Me.Buffer.InputStyle.Bold      := False;
                  if BRIGHT_ON_BOLD_FG then
                     Dim (Me.Buffer.InputStyle.FgColor);
                  end if;
                  if BRIGHT_ON_BOLD_BG then
                     Dim (Me.Buffer.InputStyle.BgColor);
                  end if;
               end if;
               if Italic = Yes then
                  Me.Buffer.InputStyle.Italic    := True;
               elsif Italic = No then
                  Me.Buffer.InputStyle.Italic    := False;
               end if;
               if Underline = Yes then
                  Me.Buffer.InputStyle.Underline := True;
               elsif Underline = No then
                  Me.Buffer.InputStyle.Underline := False;
               end if;
               if Strikeout = Yes then
                  Me.Buffer.InputStyle.Strikeout := True;
               elsif Strikeout = No then
                  Me.Buffer.InputStyle.Strikeout := False;
               end if;
               if Inverse = Yes then
                  Me.Buffer.InputStyle.Inverse   := True;
               elsif Inverse = No then
                  Me.Buffer.InputStyle.Inverse   := False;
               end if;
               if Flashing = Yes then
                  Me.Buffer.InputStyle.Flashing  := True;
               elsif Flashing = No then
                  Me.Buffer.InputStyle.Flashing  := False;
               end if;
               if Me.Buffer.SingleStyle then
                  Me.Buffer.OutputStyle := Me.Buffer.InputStyle;
               end if;
            end;
         end SetInputStyle;
      or
         accept SetOutputFgColor (
               Color : in     Color_Type := DEFAULT_FG_COLOR)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               Me.Buffer.OutputStyle.FgColor := Color;
            end;
         end SetOutputFgColor;
      or
         accept SetOutputBgColor (
               Color : in     Color_Type := DEFAULT_BG_COLOR)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               Me.Buffer.OutputStyle.BgColor := Color;
            end;
         end SetOutputBgColor;
      or
         accept SetOutputStyle (
               Bold      : in     Option := Ignore;
               Italic    : in     Option := Ignore;
               Underline : in     Option := Ignore;
               Strikeout : in     Option := Ignore;
               Inverse   : in     Option := Ignore;
               Flashing  : in     Option := Ignore)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if Bold = Yes then
                  Me.Buffer.OutputStyle.Bold      := True;
                  if BRIGHT_ON_BOLD_FG then
                     Bright (Me.Buffer.OutputStyle.FgColor);
                  end if;
                  if BRIGHT_ON_BOLD_BG then
                     Bright (Me.Buffer.OutputStyle.BgColor);
                  end if;
               elsif Bold = No then
                  Me.Buffer.OutputStyle.Bold      := False;
                  if BRIGHT_ON_BOLD_FG then
                     Dim (Me.Buffer.OutputStyle.FgColor);
                  end if;
                  if BRIGHT_ON_BOLD_BG then
                     Dim (Me.Buffer.OutputStyle.BgColor);
                  end if;
               end if;
               if Italic = Yes then
                  Me.Buffer.OutputStyle.Italic    := True;
               elsif Italic = No then
                  Me.Buffer.OutputStyle.Italic    := False;
               end if;
               if Underline = Yes then
                  Me.Buffer.OutputStyle.Underline := True;
               elsif Underline = No then
                  Me.Buffer.OutputStyle.Underline := False;
               end if;
               if Strikeout = Yes then
                  Me.Buffer.OutputStyle.Strikeout := True;
               elsif Strikeout = No then
                  Me.Buffer.OutputStyle.Strikeout := False;
               end if;
               if Inverse = Yes then
                  Me.Buffer.OutputStyle.Inverse   := True;
               elsif Inverse = No then
                  Me.Buffer.OutputStyle.Inverse   := False;
               end if;
               if Flashing = Yes then
                  Me.Buffer.OutputStyle.Flashing  := True;
               elsif Flashing = No then
                  Me.Buffer.OutputStyle.Flashing  := False;
               end if;
            end;
         end SetOutputStyle;
      or
         accept SetScreenColors (
               FgColor : in     Color_Type := DEFAULT_FG_COLOR;
               BgColor : in     Color_Type := DEFAULT_BG_COLOR;
               Current : in     Option     := Ignore)
         do
            declare
               Fg : Color_Type;
               Bg : Color_Type;
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               if Current = Yes then
                  -- use current output colors
                  Fg := Me.Buffer.OutputStyle.FgColor;
                  Bg := Me.Buffer.OutputStyle.BgColor;
               else
                  -- use colors provided
                  Fg := FgColor;
                  Bg := BgColor;
               end if;
               InitializeScreenColors (Me.Buffer, Fg, Bg);
               DrawView (Me.Buffer);
               DrawCursor (Me.Buffer);
            end;
         end SetScreenColors;
      or
         accept SetBufferColors (
               FgColor : in     Color_Type := DEFAULT_FG_COLOR;
               BgColor : in     Color_Type := DEFAULT_BG_COLOR;
               Current : in     Option     := Ignore)
         do
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               if Current = Yes then
                  -- use current output colors
                  Me.Buffer.BlankStyle.FgColor := Me.Buffer.OutputStyle.FgColor;
                  Me.Buffer.BlankStyle.BgColor := Me.Buffer.OutputStyle.BgColor;
               else
                  -- use colors provided
                  Me.Buffer.BlankStyle.FgColor := FgColor;
                  Me.Buffer.BlankStyle.BgColor := BgColor;
               end if;
               Me.Buffer.InitSaveFg := Me.Buffer.BlankStyle.FgColor;
               Me.Buffer.InitSaveBg := Me.Buffer.BlankStyle.BgColor;
               Me.Buffer.FgBgSaved := True;
               InitializeBufferColors (
                  Me.Buffer,
                  Me.Buffer.BlankStyle.FgColor,
                  Me.Buffer.BlankStyle.BgColor);
               DrawView (Me.Buffer);
               DrawCursor (Me.Buffer);
            end;
         end SetBufferColors;
      or
         accept SetCursorColor (
               Color : in     Color_Type := DEFAULT_CURS_COLOR)
         do
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               Me.Buffer.CursorColor := Color;
               DrawCursor (Me.Buffer);
            end;
         end SetCursorColor;
      or
         accept SetCursorOptions (
               Visible  : in     Option := Ignore;
               Flashing : in     Option := Ignore;
               Bar      : in     Option := Ignore)
         do
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               if Visible = Yes then
                  Me.Buffer.CursVisible := True;
               elsif Visible = No then
                  Me.Buffer.CursVisible := False;
               end if;
               if Flashing = Yes then
                  FlashControl (Me.Buffer, True, Me.Buffer.TextFlashing);
               elsif Flashing = No then
                  FlashControl (Me.Buffer, False, Me.Buffer.TextFlashing);
               end if;
               if Bar = Yes then
                  Me.Buffer.CursorBar := True;
               elsif Bar = No then
                  Me.Buffer.CursorBar := False;
               end if;
               DrawView (Me.Buffer);
               UpdateMenuStates (Me.Buffer);
               DrawCursor (Me.Buffer);
            end;
         end SetCursorOptions;
      or
         accept SetRowOptions (
               Row      : in     Integer  := -1;
               Size     : in     Row_Size := Single_Width)
         do
            begin
               UndrawCursor (Me.Buffer);
               ProcessPutBuffer (Me.Buffer, False);
               if Row < 0 then
                  -- use current output cursor row
                  if Size = Single_Width then
                     SingleWidthLine (
                        Me.Buffer,
                        Me.Buffer.Output_Curs.Col,
                        Me.Buffer.Output_Curs.Row);
                  else
                     DoubleWidthLine (
                        Me.Buffer,
                        Me.Buffer.Output_Curs.Col,
                        Me.Buffer.Output_Curs.Row,
                        Size);
                  end if;
                  DrawScreenRow (Me.Buffer, Me.Buffer.Output_Curs.Row);
               elsif Row in 0 .. Integer (Me.Buffer.Scrn_Size.Row - 1) then
                  -- set output cursor row
                  Me.Buffer.Output_Curs.Row := Scrn_Row (Row);
                  Me.Buffer.WrapNextOut := False;
                  if Me.Buffer.SingleCursor then
                     -- also set the input cursor
                     Me.Buffer.Input_Curs := Me.Buffer.Output_Curs;
                     Me.Buffer.WrapNextIn := Me.Buffer.WrapNextOut;
                  end if;
                  if Size = Single_Width then
                     SingleWidthLine (
                        Me.Buffer,
                        Me.Buffer.Output_Curs.Col,
                        Me.Buffer.Output_Curs.Row);
                  else
                     DoubleWidthLine (
                        Me.Buffer,
                        Me.Buffer.Output_Curs.Col,
                        Me.Buffer.Output_Curs.Row,
                        Size);
                  end if;
                  DrawScreenRow (Me.Buffer, Me.Buffer.Output_Curs.Row);
               end if;
               if Me.Buffer.CursVisible and not Me.Buffer.CursFlashOff then
                  DrawCursor (Me.Buffer);
               end if;
            end;
         end SetRowOptions;
      or
         accept SetTabOptions (
               Size    : in     Integer := -1;
               SetAt   : in     Integer := -1;
               ClearAt : in     Integer := -1)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if Size >= 0 and Size < MAX_COLUMNS then
                  SetDefaultTabStops (Me.Buffer, Size);
               end if;
               if SetAt > 0 and SetAt < MAX_COLUMNS then
                  Me.Buffer.TabStops (SetAt) := True;
               end if;
               if ClearAt > 0 and ClearAt < MAX_COLUMNS then
                  Me.Buffer.TabStops (ClearAt) := False;
               end if;
            end;
         end SetTabOptions;
      or
         when Me /= null =>
         accept SetKeyOptions (
               ExtendedKeys : in     Option   := Ignore;
               CursorKeys   : in     Option   := Ignore;
               VTKeys       : in     Option   := Ignore;
               AutoRepeat   : in     Option   := Ignore;
               Locked       : in     Option   := Ignore;
               SetSize      : in     Option   := Ignore;
               Size         : in     Natural  := DEFAULT_KEYBUF_SIZE)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if ExtendedKeys = Yes then
                  Me.Buffer.ExtendedKeysOn := True;
               elsif ExtendedKeys = No then
                  Me.Buffer.ExtendedKeysOn := False;
               end if;
               if CursorKeys = Yes then
                  Me.Buffer.CursorKeysOn := True;
               elsif CursorKeys = No then
                  Me.Buffer.CursorKeysOn := False;
               end if;
               if VTKeys = Yes then
                  Me.Buffer.VTKeysOn := True;
               elsif VTKeys = No then
                  Me.Buffer.VTKeysOn := False;
               end if;
               if AutoRepeat = Yes then
                  Me.Buffer.KeyRepeatOn := True;
               elsif AutoRepeat = No then
                  Me.Buffer.KeyRepeatOn := False;
               end if;
               if Locked = Yes then
                  Me.Buffer.KeyLockOn := True;
               elsif Locked = No then
                  Me.Buffer.KeyLockOn := False;
               end if;
               if SetSize = Yes then
                  if Size > 0 then
                     Free_Keyboard_Buffer (Me.Buffer);
                  end if;
                  if Size > 0 then
                     -- add another position specifically for unget:
                     Me.Buffer.KeySize := Size + 1;
                     -- Note that we also add another position when we allocate
                     -- the buffer so that we can tell the difference between
                     -- a full and empty buffer:
                     New_Keyboard_Buffer (Me.Buffer);
                  else
                     -- zero means no key buffer at all
                     Me.Buffer.KeySize := 0;
                  end if;
                  Me.Buffer.KeyStart   := 0;
                  Me.Buffer.KeyFinish  := 0;
               end if;
               UpdateMenuStates (Me.Buffer);
            end;
         end SetKeyOptions;
      or
         accept SetOtherOptions (
               IgnoreCR          : in     Option := Ignore;
               IgnoreLF          : in     Option := Ignore;
               UseLFasEOL        : in     Option := Ignore;
               AutoLFonCR        : in     Option := Ignore;
               AutoCRonLF        : in     Option := Ignore;
               UpDownMoveView    : in     Option := Ignore;
               PageMoveView      : in     Option := Ignore;
               HomeEndMoveView   : in     Option := Ignore;
               LockScreenAndView : in     Option := Ignore;
               LeftRightWrap     : in     Option := Ignore;
               LeftRightScroll   : in     Option := Ignore;
               HomeEndWithinLine : in     Option := Ignore;
               CombinedStyle     : in     Option := Ignore;
               CombinedCursor    : in     Option := Ignore;
               FlashingEnabled   : in     Option := Ignore;
               HalftoneEnabled   : in     Option := Ignore;
               DisplayControls   : in     Option := Ignore;
               SysKeysEnabled    : in     Option := Ignore;
               DeleteOnBS        : in     Option := Ignore;
               RedrawPrevious    : in     Option := Ignore;
               RedrawNext        : in     Option := Ignore)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if IgnoreCR = Yes then
                  Me.Buffer.IgnoreCR      := True;
               elsif IgnoreCR = No then
                  Me.Buffer.IgnoreCR      := False;
               end if;
               if IgnoreLF = Yes then
                  Me.Buffer.IgnoreLF      := True;
               elsif IgnoreLF = No then
                  Me.Buffer.IgnoreLF      := False;
               end if;
               if UseLFasEOL = Yes then
                  Me.Buffer.LFasEOL       := True;
               elsif UseLFasEOL = No then
                  Me.Buffer.LFasEOL       := False;
               end if;
               if AutoLFonCR = Yes then
                  Me.Buffer.LFonCR        := True;
               elsif AutoLFonCR = No then
                  Me.Buffer.LFonCR        := False;
               end if;
               if AutoCRonLF = Yes then
                  Me.Buffer.CRonLF        := True;
               elsif AutoCRonLF = No then
                  Me.Buffer.CRonLF        := False;
               end if;
               if UpDownMoveView = Yes then
                  Me.Buffer.UpDownView    := True;
               elsif UpDownMoveView = No then
                  Me.Buffer.UpDownView    := False;
               end if;
               if PageMoveView = Yes then
                  Me.Buffer.PageView      := True;
               elsif PageMoveView = No then
                  Me.Buffer.PageView      := False;
               end if;
               if HomeEndMoveView = Yes then
                  Me.Buffer.HomeEndView   := True;
               elsif HomeEndMoveView = No then
                  Me.Buffer.HomeEndView   := False;
               end if;
               if LockScreenAndView = Yes then
                  Me.Buffer.ScreenAndView := True;
               elsif LockScreenAndView = No then
                  Me.Buffer.ScreenAndView := False;
               end if;
               if LeftRightWrap = Yes then
                  Me.Buffer.LRWrap        := True;
               elsif LeftRightWrap = No then
                  Me.Buffer.LRWrap        := False;
               end if;
               if LeftRightScroll = Yes then
                  Me.Buffer.LRScroll      := True;
               elsif LeftRightScroll = No then
                  Me.Buffer.LRScroll      := False;
               end if;
               if HomeEndWithinLine = Yes then
                  Me.Buffer.HomeEndInLine := True;
               elsif HomeEndWithinLine = No then
                  Me.Buffer.HomeEndInLine := False;
               end if;
               if CombinedStyle = Yes then
                  Me.Buffer.SingleStyle   := True;
               elsif CombinedStyle = No then
                  Me.Buffer.SingleStyle   := False;
               end if;
               if CombinedCursor = Yes then
                  Me.Buffer.SingleCursor  := True;
               elsif CombinedCursor = No then
                  Me.Buffer.SingleCursor  := False;
                  -- initialize output cursor to input cursor
                  Me.Buffer.Output_Curs   := Me.Buffer.Input_Curs;
               end if;
               if FlashingEnabled = Yes then
                  FlashControl (Me.Buffer, Me.Buffer.CursFlashing, True);
               elsif FlashingEnabled = No then
                  FlashControl (Me.Buffer, Me.Buffer.CursFlashing, False);
               end if;
               if HalftoneEnabled = Yes then
                  USE_HALFTONE  := True;
               elsif HalftoneEnabled = No then
                  USE_HALFTONE  := False;
               end if;
               if DisplayControls = Yes then
                  Me.Buffer.DECCRM       := True;
                  Me.Buffer.AnsiOnInput  := False;
                  Me.Buffer.AnsiOnOutput := False;
                  Me.Buffer.GLSet        := DEC_CONTROL;
                  Me.Buffer.GRSet        := DEC_CONTROL;
                  Me.Buffer.SingleShift  := False;
               elsif DisplayControls = No then
                  Me.Buffer.DECCRM := False;
               end if;
               if SysKeysEnabled = Yes then
                  System_Keys (Me.Buffer.Panel, True);
               elsif SysKeysEnabled = No then
                  System_Keys (Me.Buffer.Panel, False);
               end if;
               if DeleteOnBS = Yes then
                  Me.Buffer.DECBKM := False;
               elsif DeleteOnBS = No then
                  Me.Buffer.DECBKM := True;
               end if;
               if RedrawPrevious = Yes then
                  Me.Buffer.RedrawPrev := True;
               elsif RedrawPrevious = No then
                  Me.Buffer.RedrawPrev := False;
               end if;
               if RedrawNext = Yes then
                  Me.Buffer.RedrawNext := True;
               elsif RedrawNext = No then
                  Me.Buffer.RedrawNext := False;
               end if;
               DrawView (Me.Buffer);
               UpdateMenuStates (Me.Buffer);
            end;
         end SetOtherOptions;
      or
         accept SetMouseOptions (
               MouseCursor  : in     Option := Ignore;
               MouseSelects : in     Option := Ignore)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if MouseCursor = Yes then
                  Me.Buffer.MouseCursorOn   := True;
               elsif MouseCursor = No then
                  Me.Buffer.MouseCursorOn   := False;
               end if;
               if MouseSelects = Yes then
                  Me.Buffer.MouseSelectsOn  := True;
               elsif MouseSelects = No then
                  Me.Buffer.MouseSelectsOn  := False;
               end if;
               UpdateMenuStates (Me.Buffer);
            end;
         end SetMouseOptions;
      or
         accept SetFontByType (
               SetType : in     Option    := Ignore;
               Font    : in     Font_Type := DEFAULT_FONT_TYPE;
               SetSize : in     Option    := Ignore;
               Size    : in     Natural   := DEFAULT_FONT_SIZE)
         do
            declare
               TmpFont : Font_Type;
               Tmpsize : Natural;
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if SetType = Yes then
                  TmpFont := Font;
               else
                  TmpFont := Me.Buffer.FontType;
               end if;
               if SetSize = Yes then
                  Tmpsize := Size;
               else
                  Tmpsize := Me.Buffer.FontSize;
               end if;
               CreateFontsByType (Me.Buffer, TmpFont, Tmpsize);
               if Me.Buffer.SizingMode = Size_Fonts then
                  -- cannot do this with stock fonts
                  Me.Buffer.SizingMode := Size_View;
                  UpdateMenuStates (Me.Buffer);
               end if;
               ResizeClientArea (Me.Buffer);
               DrawView (Me.Buffer);
               DrawCursor (Me.Buffer);
            end;
         end SetFontByType;
      or
         accept SetFontByName (
               SetName : in     Option       := Ignore;
               Font    : in     String       := DEFAULT_FONT_NAME;
               SetSize : in     Option       := Ignore;
               Size    : in     Natural      := DEFAULT_FONT_SIZE;
               SetChar : in     Option       := Ignore;
               CharSet : in     Charset_Type := GDO.ANSI_CHARSET)
         do
            declare
               TmpFont    : Unbounded_String := Null_String;
               Tmpsize    : Natural;
               TmpCharSet : Charset_Type;
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if SetName = Yes then
                  TmpFont := To_Unbounded (To_GString (Font));
               else
                  TmpFont := Me.Buffer.FontName;
               end if;
               if SetSize = Yes then
                  Tmpsize := Size;
               else
                  Tmpsize := Me.Buffer.FontSize;
               end if;
               if SetChar = Yes then
                  TmpCharSet := CharSet;
               else
                  TmpCharSet := Me.Buffer.FontCharSet;
               end if;
               CreateFontsByName (
                  Me.Buffer,
                  To_GString (TmpFont),
                  Tmpsize,
                  TmpCharSet);
               ResizeClientArea (Me.Buffer);
               DrawView (Me.Buffer);
               DrawCursor (Me.Buffer);
            end;
         end SetFontByName;
      or
         accept GetBufferInformation (
               RealSizeCol :    out Natural;
               RealSizeRow :    out Natural;
               RealUsedCol :    out Natural;
               RealUsedRow :    out Natural;
               VirtBaseCol :    out Natural;
               VirtBaseRow :    out Natural;
               VirtUsedCol :    out Natural;
               VirtUsedRow :    out Natural;
               ScrnBaseCol :    out Natural;
               ScrnBaseRow :    out Natural;
               ScrnSizeCol :    out Natural;
               ScrnSizeRow :    out Natural;
               ViewBaseCol :    out Natural;
               ViewBaseRow :    out Natural;
               ViewSizeCol :    out Natural;
               ViewSizeRow :    out Natural;
               RegnBaseCol :    out Natural;
               RegnBaseRow :    out Natural;
               RegnSizeCol :    out Natural;
               RegnSizeRow :    out Natural)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               RealSizeCol := Natural (Me.Buffer.Real_Size.Col);
               RealSizeRow := Natural (Me.Buffer.Real_Size.Row);
               RealUsedCol := Natural (Me.Buffer.Real_Used.Col);
               RealUsedRow := Natural (Me.Buffer.Real_Used.Row);
               VirtBaseCol := Natural (Me.Buffer.Virt_Base.Col);
               VirtBaseRow := Natural (Me.Buffer.Virt_Base.Row);
               VirtUsedCol := Natural (Me.Buffer.Virt_Used.Col);
               VirtUsedRow := Natural (Me.Buffer.Virt_Used.Row);
               ScrnBaseCol := Natural (Me.Buffer.Scrn_Base.Col);
               ScrnBaseRow := Natural (Me.Buffer.Scrn_Base.Row);
               ScrnSizeCol := Natural (Me.Buffer.Scrn_Size.Col);
               ScrnSizeRow := Natural (Me.Buffer.Scrn_Size.Row);
               ViewBaseCol := Natural (Me.Buffer.View_Base.Col);
               ViewBaseRow := Natural (Me.Buffer.View_Base.Row);
               ViewSizeCol := Natural (Me.Buffer.View_Size.Col);
               ViewSizeRow := Natural (Me.Buffer.View_Size.Row);
               RegnBaseCol := Natural (Me.Buffer.Regn_Base.Col);
               RegnBaseRow := Natural (Me.Buffer.Regn_Base.Row);
               RegnSizeCol := Natural (Me.Buffer.Regn_Size.Col);
               RegnSizeRow := Natural (Me.Buffer.Regn_Size.Row);
            end;
         end GetBufferInformation;
      or
         accept GetEditingOptions (
               Insert :    out Boolean;
               Wrap   :    out Boolean;
               Echo   :    out Boolean)
         do
            begin
               ProcessPutBuffer (Me.Buffer, True);
               Insert := Me.Buffer.InsertOn;
               Echo   := Me.Buffer.EchoOn;
               Wrap   := Me.Buffer.WrapOn;
            end;
         end GetEditingOptions;
      or
         accept ScreenDump (
               Column : in     Natural;
               Row    : in     Natural;
               Result : in out String;
               Length : in out Natural)
         do
            declare
               MaxLen   : Natural  := Integer'Min (Result'Length, Length);
               Size     : Row_Size;
               Len      : Natural  := 0;
               ScrnPos  : Scrn_Pos;
               DummyPos : Scrn_Pos;
            begin
               ProcessPutBuffer (Me.Buffer, True);
               if Column in 0 .. Integer (Me.Buffer.Scrn_Size.Col - 1)
               and   Row in 0 .. Integer (Me.Buffer.Scrn_Size.Row - 1) then
                  ScrnPos := (Scrn_Col (Column), Scrn_Row (Row));
                  while Len < MaxLen
                  and ScrnPos.Col < Me.Buffer.Scrn_Size.Col
                  and ScrnPos.Row < Me.Buffer.Scrn_Size.Row loop
                     if DoubleWidth (Me.Buffer, ScrnPos.Col, ScrnPos.Row) then
                        DummyPos := ScrnPos;
                        Size := Me.Buffer.Real_Buffer (
                           Real (Me.Buffer, DummyPos.Col),
                           Real (Me.Buffer, DummyPos.Row)).Size;
                        SingleWidthLine (Me.Buffer, DummyPos.Col, DummyPos.Row);
                        Result (Result'First + Len)
                           := Me.Buffer.Real_Buffer (
                              Real (Me.Buffer, ScrnPos.Col),
                              Real (Me.Buffer, ScrnPos.Row)).Char;
                        DoubleWidthLine (
                           Me.Buffer,
                           DummyPos.Col,
                           DummyPos.Row,
                           Size);
                     else
                        Result (Result'First + Len)
                           := Me.Buffer.Real_Buffer (
                              Real (Me.Buffer, ScrnPos.Col),
                              Real (Me.Buffer, ScrnPos.Row)).Char;
                     end if;
                     if ScrnPos.Col < Me.Buffer.Scrn_Size.Col - 1 then
                        ScrnPos.Col := ScrnPos.Col + 1;
                     else
                        ScrnPos.Col := 0;
                        ScrnPos.Row := ScrnPos.Row + 1;
                     end if;
                     Len := Len + 1;
                  end loop;
                  Length := Len;
               end if;
            end;
         end ScreenDump;
      or
         accept SetPriority (
            Priority : in     System.Priority := System.Default_Priority - 1)
         do
            Ada.Dynamic_Priorities.Set_Priority (Priority);
         end SetPriority;

      or  when Me /= null =>
         accept SetCommsPort (
            CommsPort  : in     WS.Win32_Handle;
            CommsMutex : in     Protection.MutexPtr)
         do
            Me.Buffer.CommsPort  := CommsPort;
            Me.Buffer.CommsMutex := CommsMutex;
         end SetCommsPort;
            
      or -- was "else" in previous versions

         delay 0.01; -- avoid consuming unnecessary CPU time
         if Me /= null then
            declare
               Open : Boolean;
            begin
               HouseKeeping (Me.Buffer, Open);
               if not Open then
                  exit;
               end if;
            end;
            Me.Buffer.PutCount := 0;
         end if;
         --  GWindows.Application.Message_Check;
      end select;
   end loop;

end Terminal_Type;



