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

with Win32;
with Win32.Winnt;
with Win32.Winbase;
with Ada.Unchecked_Conversion;
with Ada.Unchecked_Deallocation;

with GWindows.Types;

with Interfaces.C;

package Win32_Support is

   use type Interfaces.C.unsigned_long;

   MAX_CLIPBOARD_SIZE : constant := 1048576; -- max size of a clipboard (1mb)

   -- buffer for clipboard data:
   subtype Clipboard_Data is String;
   type Clipboard_Data_Access is access Clipboard_Data;

   -- types used by Get/Set Keyboard State:
   type KeyboardState is new Win32.BYTE_Array (0 .. 255);
   type KeyboardStateAccess is access all KeyboardState;

   -- NullClipboardData : return True if the clipbaord buffer is null.
   function NullClipboardData (
         Data : in Clipboard_Data_AccesS)
      return Boolean;


   -- free a clipboard buffer
   procedure FreeClipboardData is
   new Ada.Unchecked_Deallocation (Clipboard_Data, Clipboard_Data_Access);


   -- Beep : system exclamation beep
   procedure Beep;


   -- SetHighPriority : Set the current task to hig priority.
   procedure SetHighPriority;


   -- WinHandle : convert a Win32 handle to a GWindows handle.
   function WinHandle is
   new Ada.Unchecked_Conversion (GWindows.Types.Handle, Win32.Winnt.HANDLE);


   subtype Win32_ProcessId     is Win32.DWORD;
   subtype Win32_Handle        is Win32.Winnt.HANDLE;
   subtype Win32_Flags         is Win32.DWORD;
   subtype BOOL                is Win32.BOOL;
   
   INVALID_HANDLE_VALUE : constant Win32.Winnt.HANDLE 
        := Win32.Winbase.INVALID_HANDLE_VALUE;

   SETDTR                         : constant := 5;
   CLRDTR                         : constant := 6;

      function EscapeCommFunction
        (hFile  : Win32.Winnt.HANDLE;
         dwFunc : Win32.DWORD)
         return Win32.BOOL;
      pragma Import (Stdcall, EscapeCommFunction, "EscapeCommFunction");

   -- CreateProcess : start a new process. The process can inherit the handled provided
   --                 as standard input, output and error. If these are not specified,
   --                 but Inherit is true, the process will inherit the callers default
   --                 handles. Returns the process id and handles to the process and
   --                 thread. The Hide flag indicates whether the main window of the
   --                 created process will be hidden or shown. The routine waits for
   --                 the created process to complete initialization. If the Infinite
   --                 flag is set, it will wait forever, otherwise it will wait for
   --                 up to 1 second. The create flags.
   --
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
         CreateFlags  : in     Win32_Flags     := Win32.Winbase.CREATE_NEW_PROCESS_GROUP);


   -- WaitforProcess : Wait for process to terminate.
   procedure WaitForProcess (
      PHandle : Win32_Handle);


   -- CreateNamedPipe : create a named pipe. The pipe must then be opened at
   --                   both ends.
   procedure CreateNamedPipe (
         Pipe        : in out Win32_Handle;
         Name        : in     String;
         Mode        : in     Win32_Flags;
         Inheritable : in     Boolean := FALSE);


   -- CreateAnonPipe : create an anonymous pipe and return handled to both ends.
   procedure CreateAnonPipe (
         Read_Pipe   : in out Win32_Handle;
         Write_Pipe  : in out Win32_Handle;
         Inheritable : in     Boolean            := True);


   -- OpenClipboard : Open the clipboard, identifying the opening window.
   function OpenClipboard (
         Handle : in GWindows.Types.Handle)
      return Boolean;


   -- CloseClipboard : Close the clipboard
   function CloseClipboard
      return Boolean;


   -- EmptyClipboard : Empty the clipboard.
   function EmptyClipboard
      return Boolean;


   -- SetClipboardData : copy the data into the clipboard.
   procedure SetClipboardData (
         Data : in     Clipboard_Data_Access);


   -- GetClipboardData : copy the clipboard data into the buffer.
   --                    Allocate a new buffer if required.
   procedure GetClipboardData (
         Data   : in out Clipboard_Data_Access;
         Length :    out Natural);


   procedure GetCursorPos (
         Point : in out GWindows.Types.Point_Type);


   procedure ScreenToClient (
         Handle : in     GWindows.Types.Handle;
         Point  : in out GWindows.Types.Point_Type);


   function DoubleClickTime
      return Integer;


   function IsUnicode (
         Text : in String)
      return Boolean;


   procedure GetCurrentDirectory (
      Dir    : in out String;
      DirLen : in out Natural;
      Result :    out Boolean);


   procedure SetCurrentDirectory (
      Dir    : in     String;
      Result :    out Boolean);


   procedure GetEnvironmentVariable (
      Name     : in     String;
      Value    : in out String;
      ValueLen : in out Natural;
      Result   :    out Boolean);

   -- GetWindowsVersion: Return the platform and major.minor
   --                    release number of Windows. Returns
   --                    all zeroes on error.
   -- platform:
   --    VER_PLATFORM_WIN32S        : 0 - Win32s on Windows 3.1 (not supported!)
   --    VER_PLATFORM_WIN32_WINDOWS : 1 - Win32 on Windows 95/98/ME
   --    VER_PLATFORM_WIN32_NT      : 2 - Win32 on Windows NT/2000/XP
   --
   -- major.minor:
   --    e.g. 3.51 (Windows NT 3.51)
   --
   procedure GetWindowsVersion (
      Platform : out Natural;
      Major    : out Natural;
      Minor    : out Natural);

   
   procedure GetKeyboardState (
      KeyboardState : in     KeyboardStateAccess;
      Ok            : out    Boolean);
   
   procedure SetKeyboardState (
      KeyboardState : in     KeyboardStateAccess;
      Ok            : out    Boolean);


   procedure SimulateKeyPress (VirtualKey : in Integer;
                               ScanCode   : in Integer);

   procedure SimulateKeyRelease (VirtualKey : in Integer;
                                 ScanCode   : in Integer);

   -- NumLockOn : Check num lock and makes sure it is on, either by 
   --             setting the keyboard state or simulating a key press
   --             and release (depending on the version of Windows).
   --             Note that this may result in spurious key presses
   --             being detected by the application - it is the
   --             responsibility of the caller to intercept these !!!
   procedure NumLockOn;

end Win32_Support;

