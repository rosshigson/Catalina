package Instr.Child is 

   subtype Thousand is Integer range 0 .. 1000;
   
   type Accurate_Clock is new Clock with record 
      MilliSec : Thousand := 0;
   end record;

   procedure Display_Value (C : Accurate_Clock);   
   procedure Increment (C : in out Accurate_Clock; inc : Integer := 1); 

end;










