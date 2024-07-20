with Gnat_IO; use Gnat_IO;
package body Instr.Child is 

   procedure Display_Value (C : Accurate_Clock) is 
   begin 
      Display_Value (Clock (C));
      Put (":"); 
      Put (Character'Val (Character'Pos ('0') + (C.MilliSec / 100) mod 10));
      Put (Character'Val (Character'Pos ('0') + (C.MilliSec / 10) mod 10));
      Put (Character'Val (Character'Pos ('0') + C.MilliSec mod 10));
   end Display_Value;
      
   procedure Increment (C : in out Accurate_Clock; Inc : Integer := 1) is 
   begin
     Increment (Clock (C), (C.MilliSec + Inc) / 1000);
     C.MilliSec := (C.MilliSec + Inc) mod 1000;
   end Increment;

end;
