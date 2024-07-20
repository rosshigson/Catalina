with Interfaces.C;
with Ada.Strings;
with Ada.Strings.Fixed;

with Win32;
with Win32.Winnt;
with Win32.Winbase;

with Interfaces.C;
with Interfaces.C.Strings;

with Terminal_Internal_Types;


package body FYModem is
   
   use Interfaces.C;
   use Terminal_Internal_Types;

   function SetComms(
       CommsPort : in WS.Win32_Handle;
       Mode      : in Integer;
       Time      : in Integer)
   return Integer is

      function fymodem_comms
        (file  : WS.Win32_Handle;
         mode  : Integer;
         time  : Integer)
      return Integer;
      pragma Import (StdCall, fymodem_comms, "fymodem_comms");

   begin
      return fymodem_comms(CommsPort, Mode, Time);
   end SetComms;  

   function SetFile(
      FileName  : in     GWindows.GString_Unbounded;
      Timeout   : in     Integer)
   return Integer is
   
      use GWindows.GStrings;
      use GWindows.GStrings.Unbounded;

      Max_Size   : constant := 64;
      C_FileName : char_array (0 .. Max_Size) := (others => nul);

      function fymodem_file
        (filename : Win32.LPCSTR;
         timeout  : Integer)
      return Integer;
      pragma Import (StdCall, fymodem_file, "fymodem_file");

   begin
      if FileName /= To_Unbounded("") then
         declare
            SFileName  : char_array :=
              To_C (To_String (To_GString_From_Unbounded (FileName)));
         begin
            C_FileName (SFileName'Range) := SFileName;
         end;
      end if;
      return fymodem_file(C_FileName (0)'Unchecked_Access, Timeout);
   end SetFile;

   function Send return Integer is
      function fymodem_send return Integer;
      pragma Import (StdCall, fymodem_send, "fymodem_send");

   begin
     return fymodem_send;
   end Send;

   function Receive return Integer is
      function fymodem_receive return Integer;
      pragma Import (StdCall, fymodem_receive, "fymodem_receive");
   begin
      return fymodem_receive;
   end Receive;

   function Cancel return Integer is
      function fymodem_abort return Integer;
      pragma Import (StdCall, fymodem_abort, "fymodem_abort");
   begin
      return fymodem_abort;
   end Cancel;

   function Status return Integer is
      function fymodem_status return Integer;
      pragma Import (StdCall, fymodem_status, "fymodem_status");
   begin
      return fymodem_status;
   end Status;

   function Expected return Integer is
      function fymodem_expected return Integer;
      pragma Import (StdCall, fymodem_expected, "fymodem_expected");
   begin
      return fymodem_expected;
   end Expected;

   function Actual return Integer is
      function fymodem_actual return Integer;
      pragma Import (StdCall, fymodem_actual, "fymodem_actual");
   begin
      return fymodem_actual;
   end Actual;

   function FileName return String is
      use Interfaces.C;
      function fymodem_file_name return Strings.Chars_Ptr;
      pragma Import (StdCall, fymodem_file_name, "fymodem_file_name");
   begin
      return Strings.Value(fymodem_file_name);
   end FileName;

end FYModem;

