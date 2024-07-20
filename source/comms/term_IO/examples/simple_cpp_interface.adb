package body Simple_Cpp_Interface is

   procedure Ada_Method2 (This : in out A; V : Integer) is
   begin
      Method1 (This);
      This.A_Value := V;
   end Ada_Method2;

end Simple_Cpp_Interface;

