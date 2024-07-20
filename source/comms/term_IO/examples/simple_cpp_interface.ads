package Simple_Cpp_Interface is
   type A is limited
      record
         O_Value : Integer;
         A_Value : Integer;
      end record;
   pragma Convention (C, A);

   procedure Method1 (This : in out A);
   pragma Import (C, Method1);

   procedure Ada_Method2 (This : in out A; V : Integer);
   pragma Export (C, Ada_Method2);

end Simple_Cpp_Interface;
