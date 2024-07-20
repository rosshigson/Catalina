---------------------------------- ex6_if.ads ---------------------------------
with Interfaces.CPP;
use  Interfaces.CPP;
package ex6_if is


   package A_Class is
      --
      --   Translation of C++ class A
      --

      type A is tagged
         record
            O_Value : Integer;
            A_Value : Integer;
            Vptr : Interfaces.CPP.Vtable_Ptr;
         end record;

      pragma CPP_Class (Entity => A);
      pragma CPP_Vtable (Entity => A, Vtable_Ptr => Vptr, Entry_Count => 2);

      --   Member Functions

      procedure Non_Virtual (This : in A'Class);
      pragma Import (CPP, Non_Virtual, "non_virtual_1A");

      procedure Overridden (This : in A);
      pragma CPP_Virtual (Entity      => Overridden,      --  long form
                          Vtable_Ptr  => Vptr,
                          Entry_Count => 1);
      pragma Import (CPP, Overridden, "overridden__1A");

      procedure Not_Overridden (This : in A);
      pragma CPP_Virtual (Not_Overridden);                -- short form
      pragma Import (CPP, Not_Overridden, "not_overridden__1A");

      function Constructor return A'Class;
      pragma CPP_Constructor (Entity => Constructor);
      pragma Import (CPP, Constructor, "__1A");

   end A_Class;

   package B_Class is

      type B is new A_Class.A with
         record
            B_Value : Integer;
         end record;

      pragma CPP_Class (Entity => B);
      pragma CPP_Vtable (Entity => B, Vtable_Ptr => Vptr, Entry_Count => 2);

      function Constructor return B'Class;
      pragma CPP_Constructor (Entity => Constructor);
      pragma Import (CPP, Constructor, "__1B");

      procedure Overridden (This : in B);
      pragma CPP_Virtual (Overridden, Vptr, 1);
      pragma Import (CPP, Overridden, "overridden__1B");

   end B_Class;

   package Ada_Extension is

      type C is new B_Class.B with
         record
            C_Value : Integer := 3030;
         end record;

      --  no more pragma CPP_Class, CPP_Vtable; or CPP_Virtual:
      --  this is a regular Ada tagged type

      procedure Overridden (This : in C);
   end Ada_Extension;
end Ex6_If;
