with GWindows;
with GWindows.GStrings;
with GWindows.GStrings.Unbounded;

with Win32;
with Win32_Support;

package FYModem is

   package WS  renames Win32_Support;

   function SetComms(
       CommsPort : in     WS.Win32_Handle;
       Mode      : in     Integer;
       Time      : in     Integer)
    return Integer;  

   function SetFile(
      FileName  : in     GWindows.GString_Unbounded;
      Timeout   : in     Integer)
   return Integer;

   function Send return Integer;

   function Receive return Integer;

   function Cancel return Integer;
   
   function Status return Integer;

   function Expected return Integer;

   function Actual return Integer;

   function FileName return String;

end FYModem;
