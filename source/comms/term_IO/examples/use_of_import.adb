procedure Use_Of_Import is
   procedure Imported_Function;
   pragma Import (C, Imported_Function, "imported_function");
begin
   Imported_Function;
end Use_Of_Import;
