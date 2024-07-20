-------------------------------- ex6_main.adb ---------------------------------
with ex6_if;
procedure ex6_main is

   use ex6_if;
   use ex6_if.A_Class;
   use ex6_if.B_Class;

   A_Obj : A_Class.A;
   B_Obj : B_Class.B;
   C_Obj : Ada_Extension.C;

   procedure Dispatch (Obj : A_Class.A'Class) is
   begin
      Overridden (Obj);
      Not_Overridden (Obj);
   end Dispatch;

begin
   Dispatch (A_Obj);
   Dispatch (B_Obj);
   Dispatch (C_Obj);
end ex6_main;
