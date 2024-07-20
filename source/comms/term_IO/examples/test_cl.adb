with Ada.Command_Line;
with Gnat_IO; use Gnat_IO;

procedure Test_CL is

   pragma Linker_Options ("-mwindows");
   
begin
   --  Writes out the command name (argv[0])
   Put ("      The command name : ");
   Put (Ada.Command_Line.Command_Name);
   New_Line;

   --  Writes out the number of arguments passed to the program (argc)
   Put ("The number of arguments: ");
   Put (Ada.Command_Line.Argument_Count);
   New_Line;

   --  Writes out all the arguments using the Argument function.
   --  (BE CAREFUL because if the number you pass to Argument is not
   --   in the range 1 .. Argument_Count you will get Constraint_Error!)
   for I in 1 .. Ada.Command_Line.Argument_Count loop
      Put ("             Argument ");
      Put (I);
      Put (": ");
      Put (Ada.Command_Line.Argument (I));
      New_Line;
   end loop;
end Test_CL;
