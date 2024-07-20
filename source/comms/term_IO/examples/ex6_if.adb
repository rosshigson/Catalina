with Gnat_IO; use Gnat_IO;
package body Ex6_If is
   package body Ada_Extension is

      procedure Overridden (This : in C) is
      begin
         Put ("in Ex6_If.Ada_Extension.Overridden, a_value = ");
         Put (This.A_Value);
         Put (", b_value = ");
         Put (This.B_Value);
         Put (", c_value = ");
         Put (This.C_Value);
         New_Line;
      end Overridden;

   end Ada_Extension;
end Ex6_If;
