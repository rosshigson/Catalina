-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 0.1                                   --
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

with Win32.Windef;
with Win32.Winuser;

package body Win32_Support is

   use Win32;
   use Win32.Winnt;
   use Win32.Winbase;
   use Win32.Winuser;

   use type Win32.BOOL;
   use type System.Address;
   use type Interfaces.C.unsigned_long;
   use type Interfaces.C.unsigned_short;

   package IC renames Interfaces.C;


   MAX_BUFFER_SIZE : constant := 1024;

   IDLE_TIMEOUT    : constant := 100;
   IDLE_RETRIES    : constant := 10;

   VK_NUMLOCK      : constant := 144;
   SC_NUMLOCK      : constant := 16#45#;

   procedure Beep
   is
      Dummy : BOOL;
   begin
      Dummy := MessageBeep (MB_OK);
   end Beep;


   procedure SetHighPriority
   is
      BoolResult : BOOL;
      WinHandle  : HANDLE;
   begin
      WinHandle := OpenProcess (
         Process_Set_Information,
         0,
         GetCurrentProcessID);
      if WinHandle /= INVALID_HANDLE_VALUE then
         BoolResult := Setpriorityclass (
            WinHandle,
            High_Priority_Class);
      end if;
      BoolResult := CloseHandle (WinHandle);
   end SetHighPriority;


   procedure CreateProcess (
         Command      : in     String;
         PHandle      :    out Win32_Handle;
         THandle      :    out Win32_Handle;
         ProcessId    :    out Win32_ProcessId;
         StdIn        : in     Win32_Handle    := Win32.Winbase.INVALID_HANDLE_VALUE;
         StdOut       : in     Win32_Handle    := Win32.Winbase.INVALID_HANDLE_VALUE;
         StdErr       : in     Win32_Handle    := Win32.Winbase.INVALID_HANDLE_VALUE;
         Hide         : in     Boolean         := True;
         Inherit      : in     Boolean         := True;
         Infinite     : in     Boolean         := False;
         CreateFlags  : in     Win32_Flags     := CREATE_NEW_PROCESS_GROUP)

   is
      ProcessInfo   : aliased PROCESS_INFORMATION;
      CommandCLine  : aliased IC.Char_Array := IC.TO_C (Command);
      Startup       : aliased STARTUPINFO;
      BoolResult    : BOOL;
      DwordResult   : DWORD;
      bInherit      : Win32.BOOL;
      UseStdHandles : Boolean := False;

   begin
      Startup.cb          := (STARTUPINFOA'Size)/System.Storage_Unit;
      Startup.lpReserved  := null;
      Startup.lpDesktop   := null;
      Startup.lpTitle     := null;
      Startup.wShowWindow := SW_HIDE;
      Startup.cbReserved2 := 0;
      Startup.lpReserved2 := null;
      Startup.dwFlags     := 0;

      -- if handles are provided, use those instead of standard handles
      if StdIn /= INVALID_HANDLE_VALUE then
         Startup.hStdInput := StdIn;
         UseStdHandles := True;
      end if;
      if StdOut /= INVALID_HANDLE_VALUE then
         Startup.hStdOutput := StdOut;
         UseStdHandles := True;
      end if;
      if StdErr /= INVALID_HANDLE_VALUE then
         Startup.hStdError := StdErr;
         UseStdHandles := True;
      end if;

      if UseStdHandles then
         Startup.dwFlags := Startup.dwFlags or STARTF_USESTDHANDLES;
      end if;

      if Hide then
         Startup.dwFlags := Startup.dwFlags or STARTF_USESHOWWINDOW;
         Startup.wShowWindow := SW_HIDE;
      else
         Startup.dwFlags := Startup.dwFlags or STARTF_USESHOWWINDOW;
         Startup.wShowWindow := SW_SHOW;
      end if;

      if Inherit then
         bInherit := Win32.TRUE;
      else
         bInherit := Win32.FALSE;
      end if;

      BoolResult := Win32.Winbase.CreateProcess (
         lpApplicationName => null,
         lpCommandline => CommandCLine (CommandCLine'First)'Unchecked_Access,
         lpProcessAttributes => null,
         lpThreadAttributes => null,
         bInheritHandles => bInherit,
         dwCreationFlags => Win32.DWORD (CreateFlags),
         lpEnvironment => System.Null_Address,
         lpCurrentdirectory => null,
         lpStartupInfo => Startup'Unchecked_Access,
         lpProcessInformation => ProcessInfo'Unchecked_Access);
      if BoolResult = Win32.FALSE then
         ProcessId := 0;
         PHandle   := System.Null_Address;
         THandle   := System.Null_Address;
      else
         ProcessId := ProcessInfo.dwProcessId;
         PHandle   := ProcessInfo.hProcess;
         THandle   := ProcessInfo.hThread;
         if Infinite then
            DWordResult := WaitForInputIdle (
                              ProcessInfo.hProcess, 
                              Win32.Winbase.INFINITE);
         else
            for i in 1 .. IDLE_RETRIES loop
               DWordResult := WaitForInputIdle (
                                 ProcessInfo.hProcess, 
                                 IDLE_TIMEOUT);
               if DWordResult = 0 then
                  exit;
               end if;
            end loop;
         end if;
      end if;
   end CreateProcess;


   procedure WaitForProcess (
      PHandle : Win32_Handle)
   is
      DWordResult : DWORD;
   begin
      DwordResult := WaitForSingleObject (PHandle, INFINITE);
   end WaitForProcess;

   procedure CreateNamedPipe (
         Pipe        : in out Win32_Handle;
         Name        : in     String;
         Mode        : in     Win32_Flags;
         Inheritable : in     Boolean := False)
   is

      PipeCName : aliased IC.Char_Array := IC.TO_C (Name);
      Security  : aliased Security_Attributes;

   begin
      Security.nLength := Security_Attributes'Size / System.Storage_Unit;
      Security.lpSecurityDescriptor := System.Null_Address;
      if Inheritable then
         Security.bInheritHandle := Win32.TRUE;
      else
         Security.bInheritHandle := Win32.FALSE;
      end if;

      Pipe := CreateNamedPipe (
         LpName               => PipeCName (PipeCName'First)'Unchecked_Access,
         dwOpenMode           => Mode,
         DwPipemode           => 0,
         nMaxInstances        => PIPE_UNLIMITED_INSTANCES,
         NOutBufferSize       => MAX_BUFFER_SIZE,
         nInBufferSize        => MAX_BUFFER_SIZE,
         nDefaultTimeout      => 1000,
         lpSecurityAttributes => Security'Unchecked_Access);
   end CreateNamedPipe;


   procedure CreateAnonPipe (
         Read_Pipe   : in out Win32_Handle;
         Write_Pipe  : in out Win32_Handle;
         Inheritable : in     Boolean            := True)
   is

      Security   : aliased Security_Attributes;
      BoolResult : BOOL;
      Read       : aliased Win32_Handle;
      Write      : aliased Win32_Handle;

   begin
      Security.nLength := Security_Attributes'Size / System.Storage_Unit;
      Security.lpSecurityDescriptor := System.Null_Address;
      if Inheritable then
         Security.bInheritHandle := Win32.TRUE;
      else
         Security.bInheritHandle := Win32.FALSE;
      end if;

      BoolResult := CreatePipe (
         hReadPipe        => Read'Unchecked_Access,
         hWritePipe       => Write'Unchecked_Access,
         lpPipeAttributes => Security'Unchecked_Access,
         nSize            => MAX_BUFFER_SIZE
      );
      if BoolResult = Win32.FALSE then
         Read_Pipe  := INVALID_HANDLE_VALUE;
         Write_Pipe := INVALID_HANDLE_VALUE;
      else
         Read_Pipe  := Read;
         Write_Pipe := Write;
      end if;
   end CreateAnonPipe;


   function NullClipboardData (
         Data : in Clipboard_Data_Access)
      return Boolean is
   begin
      return Data = Null;
   end NullClipboardData;


   function OpenClipboard (
         Handle : in GWindows.Types.Handle)
      return Boolean
   is
   begin
      return OpenClipboard (WinHandle (Handle)) /= 0;
   end OpenClipboard;


   function CloseClipboard
      return Boolean
   is
   begin
      return (CloseClipboard /= 0);
   end CloseClipboard;


   function EmptyClipboard
      return Boolean
   is
   begin
      return (EmptyClipboard /= 0);
   end EmptyClipboard;


   procedure SetClipboardData (
         Data : in     Clipboard_Data_Access)
   is
      use Interfaces.C;

      type Mem_Type is new Clipboard_Data (Data'Range);
      type Mem_Ptr is access Mem_Type;

      function To_Memptr is
      new Ada.Unchecked_Conversion (HANDLE, Mem_Ptr);

      function To_Sysaddr is
      new Ada.Unchecked_Conversion (HANDLE, System.Address);

      hMem  : HANDLE;
      Mem   : Mem_Ptr;
      Dummy : BOOL;

   begin
      hMem := GlobalAlloc (GMEM_MOVEABLE or GMEM_DDESHARE, Data'Length);
      if To_Sysaddr (hMem) /= System.Null_Address then
         Mem := To_Memptr (GlobalLock (hMem));
         if Mem /= null then
            for I in Data'Range loop
               Mem (I) := Data (I);
            end loop;
            if To_Sysaddr (SetClipboardData (CF_TEXT, hMem))
                  = System.Null_Address then
               -- failed, so free memory
               hMem := GlobalFree (hMem);
            end if;
            Dummy := GlobalUnlock (hMem);
         end if;
      end if;
   end SetClipboardData;


   procedure GetClipboardData (
         Data   : in out Clipboard_Data_Access;
         Length :    out Natural)
   is

      type Mem_Type is new Clipboard_Data (1 .. MAX_CLIPBOARD_SIZE);
      type Mem_Ptr is access Mem_Type;

      function To_Sysaddr is
      new Ada.Unchecked_Conversion (HANDLE, System.Address);

      function To_Memptr is
      new Ada.Unchecked_Conversion (LPVOID, Mem_Ptr);

      function To_Sysaddr is
      new Ada.Unchecked_Conversion (Mem_Ptr, System.Address);

      hMem  : HANDLE;
      Mem   : Mem_Ptr;
      Len   : Integer            := 0;
      Dummy : BOOL;

   begin
      hMem := GetClipboardData (CF_TEXT);
      if To_Sysaddr (hMem) /= System.Null_Address then
         Mem := To_Memptr (GlobalLock (hMem));
         if To_Sysaddr (Mem) /= System.Null_Address then
            while Len < MAX_CLIPBOARD_SIZE
            and then Mem (Mem.all'First + Len) /= ASCII.NUL loop
               Len := Len + 1;
            end loop;
            if Data /= null and then Data.all'Length < Len + 1 then
               -- existing buffer is not big enough
               FreeClipboardData (Data);
            end if;
            if Data = null then
               Data := new Clipboard_Data (1 .. Len + 1);
            end if;
            if Data /= null then
               for I in 0 .. Len - 1 loop
                  Data (Data.all'First + I) := Mem (Mem.all'First + I);
               end loop;
               Data (Data.all'First + Len) := ASCII.NUL;
            else
               Len := 0;
            end if;
            Dummy := GlobalUnlock (hMem);
         end if;
      end if;
      Length := Len;
   end GetClipboardData;


   procedure GetCursorPos (
         Point : in out GWindows.Types.Point_Type)
   is
      Result : BOOL;
      Winpoint : aliased Win32.Windef.Point;
   begin
      Result := GetCursorPos (Winpoint'Unchecked_Access);
      Point.X := Integer (Winpoint.X);
      Point.Y := Integer (Winpoint.Y);
   end GetCursorPos;


   procedure ScreenToClient (
         Handle : in     GWindows.Types.Handle;
         Point  : in out GWindows.Types.Point_Type)
   is
      Result : BOOL;
      Winpoint : aliased Win32.Windef.Point;
   begin
      WinPoint.X := Interfaces.C.long (Point.X);
      WinPoint.Y := Interfaces.C.long (Point.Y);
      Result := ScreenToClient (
                     WinHandle (Handle),
                     Winpoint'Unchecked_Access);
      Point.X := Integer (Winpoint.X);
      Point.Y := Integer (Winpoint.Y);
   end ScreenToClient;


   function DoubleClickTime
      return Integer is
   begin
      return Integer (GetDoubleClickTime);
   end DoubleClickTime;


   function IsUnicode (
         Text : in String)
      return Boolean
   is
      Flags  : aliased INT;
      Result : BOOL;
   begin
      Flags  := IS_TEXT_UNICODE_UNICODE_MASK;
      Result := IsTextUnicode (
         lpBuffer => Text (Text'First)'Address,
         cb => Text'Length,
         lpi => Flags'Unchecked_Access);
      if Result /= Win32.FALSE then
         return True;
      else
         Flags  := IS_TEXT_UNICODE_REVERSE_MASK;
         Result := IsTextUnicode (
            lpBuffer => Text (Text'First)'Address,
            cb => Text'Length,
            lpi => Flags'Unchecked_Access);
         return Result /= Win32.FALSE;
      end if;
   end IsUnicode;


   procedure GetCurrentDirectory (
      Dir    : in out String;
      DirLen : in out Natural;
      Result :    out Boolean)
   is
      DwordResult : Win32.DWORD;
      Directory  : aliased IC.Char_Array (1 .. MAX_BUFFER_SIZE);
   begin
      DwordResult := Win32.Winbase.GetCurrentDirectory (
         MAX_BUFFER_SIZE,
         Directory (Directory'First)'Unchecked_Access);
      if DwordResult = 0 then
         DirLen := 0;
         Result := False;
      else
         DirLen := 0;
         for i in 1 .. Dir'Length loop
            if Character (Directory (Interfaces.C.size_t (i))) /= ASCII.NUL then
               Dir (Dir'First + i - 1) 
                  := Character (Directory (Interfaces.C.size_t (i)));
               DirLen := DirLen + 1;
            else
               exit;
            end if;
         end loop;
         Result := True;
      end if;
   end GetCurrentDirectory;

   procedure SetCurrentDirectory (
      Dir    : in     String;
      Result :    out Boolean)
   is
      BoolResult : Win32.BOOL;
      Directory  : aliased IC.Char_Array := IC.TO_C (Dir);
   begin
      BoolResult := Win32.Winbase.SetCurrentDirectory (
         Directory (Directory'First)'Unchecked_Access);
      Result := not (BoolResult = Win32.FALSE);
   end SetCurrentDirectory;


   procedure GetEnvironmentVariable (
      Name     : in     String;
      Value    : in out String;
      ValueLen : in out Natural;
      Result   :    out Boolean)
   is
      VarName     : aliased constant IC.Char_Array := IC.TO_C (Name);
      DwordResult : Win32.DWORD;
      VarValue    : aliased IC.Char_Array (1 .. MAX_BUFFER_SIZE);
   begin
      DwordResult := Win32.Winbase.GetEnvironmentVariable (
         VarName (VarName'First)'Unchecked_Access,
         VarValue (VarValue'First)'Unchecked_Access,
         MAX_BUFFER_SIZE);
      if DwordResult = 0 then
         ValueLen := 0;
         Result := False;
      else
         ValueLen := 0;
         for i in 1 .. VarValue'Length loop
            if Character (VarValue (Interfaces.C.size_t (i))) /= ASCII.NUL then
               Value (Value'First + i - 1) 
                  := Character (VarValue (Interfaces.C.size_t (i)));
               ValueLen := ValueLen + 1;
            else
               exit;
            end if;
         end loop;
         Result := True;
      end if;
   end GetEnvironmentVariable;



   procedure GetWindowsVersion (
      Platform : out Natural;
      Major    : out Natural;
      Minor    : out Natural)
   is
      Version    : aliased OSVERSIONINFOA;
      BoolResult : BOOL;
   begin
      Version.dwOSVersionInfoSize := (OSVERSIONINFOA'Size)/System.Storage_Unit;
      Version.dwMajorVersion := 0;
      Version.dwMinorVersion := 0;
      Version.dwBuildNumber  := 0;
      Version.dwPlatformId   := 0;
      BoolResult := GetVersionEX (Version'Unchecked_Access);
      if BoolResult = Win32.FALSE then
         Platform := 0;
         Major    := 0;
         Minor    := 0;
      else
         Platform := Natural (Version.dwPlatformId);
         Major    := Natural (Version.dwMajorVersion);
         Minor    := Natural (Version.dwMinorVersion);
      end if;
   exception
      when others =>
         Platform := 0;
         Major    := 0;
         Minor    := 0;
   end GetWindowsVersion;


   procedure GetKeyboardState (
      KeyboardState : in     KeyboardStateAccess;
      Ok            :    out Boolean)
   is
   begin
      Ok := Win32.WinUser.GetKeyboardState (KeyboardState (0)'Access) 
         /= Win32.FALSE;
   end GetKeyboardState;
  
   
   procedure SetKeyboardState (
      KeyboardState : in     KeyboardStateAccess;
      Ok            :    out Boolean)
   is
   begin
      Ok := Win32.WinUser.SetKeyboardState (KeyboardState (0)'Access) 
         /= Win32.FALSE;
   end SetKeyboardState;

   
   procedure SimulateKeyPress (VirtualKey : in Integer;
                               ScanCode   : in Integer)
   is
   begin
      Win32.WinUser.keybd_event (
         Win32.BYTE (VirtualKey),
         Win32.BYTE (ScanCode),
         Win32.WinUser.KEYEVENTF_EXTENDEDKEY,
         0);
   end SimulateKeyPress;

   procedure SimulateKeyRelease (VirtualKey : in Integer;
                                 ScanCode   : in Integer)
   is
   begin
      Win32.WinUser.keybd_event (
         Win32.BYTE (VirtualKey),
         Win32.BYTE (ScanCode),
         Win32.WinUser.KEYEVENTF_EXTENDEDKEY or Win32.WinUser.KEYEVENTF_KEYUP,
         0);
   end SimulateKeyRelease;
                                 

   procedure NumLockOn
   is
      Platform  : Natural;
      Major     : Natural;
      Minor     : Natural;
      KeyStates : aliased KeyboardState := (others => 0);
      Ok        : Boolean;
   begin
      GetWindowsVersion (Platform, Major, Minor);
      if Platform /= 0 then
         GetKeyboardState (KeyStates'Unchecked_Access, Ok);
         if Ok and KeyStates (VK_NUMLOCK) /= 1 then
            if Platform = 1 then
               -- Win95/98/ME : can set key state directly
               KeyStates (VK_NUMLOCK) := 1;
               SetKeyboardState (KeyStates'Unchecked_Access, Ok);
            elsif Platform = 2 then
               -- WinNT/2000/XP : must simulate key press and release
               SimulateKeyPress (VK_NUMLOCK, SC_NUMLOCK);
               SimulateKeyRelease (VK_NUMLOCK, SC_NUMLOCK);
            end if;
         end if;
      end if;
   end NumLockOn;
   
   
end Win32_Support;

