with Instr; use Instr;
with Instr.Child; use Instr.Child;
with Term_IO; use Term_IO;
with Term_IO.Integer_Text_IO; use Term_IO.Integer_Text_IO;
with Gen_List;
procedure Demo2 is

   pragma Linker_Options ("-mwindows");

   type Acc is access Instrument'Class;

   package Dash_Board is new Gen_List (Acc);
   use Dash_Board;

   procedure Print_Dash_Board (L : List) is
      L1 : List := L;
   begin

      while L1 /= Nil loop
         Display_Value (Element (L1).all);
         L1 := Tail (L1);
      end loop;
      New_Line;

   end Print_Dash_Board;

   DB : List := Nil;
   Inc, Sec : Integer;

begin
   DB := Append   (new Speedometer,            -- 1
           Append (new Gauge,                  -- 2
           Append (new Graphic_Gauge,          -- 3
           Append (new Graphic_Gauge,          -- 4
           Append (new Clock,                  -- 5
           Append (new Chronometer,            -- 6
           Append (new Accurate_Clock)))))));  -- 7

   Set_Name (Element (DB, 1).all, "Speed");
   Set_Name (Element (DB, 2).all, "Fuel");
   Set_Name (Element (DB, 3).all, "Water");
   Set_Name (Element (DB, 4).all, "Oil");
   Set_Name (Element (DB, 5).all, "Time in NY");
   Set_Name (Element (DB, 6).all, "Chrono");
   Set_Name (Element (DB, 7).all, "Time in Paris");

   Speedometer   (Element (DB, 1).all).Value := 45; --  mph
   Gauge         (Element (DB, 2).all).Value := 60; --  %
   Graphic_Gauge (Element (DB, 3).all).Value := 80; -- %
   Graphic_Gauge (Element (DB, 4).all).Value := 40; --  %

   Init (Clock          (Element (DB, 5).all), 12, 15,  0);
   Init (Chronometer    (Element (DB, 6).all),  0,  0,  0);
   Init (Accurate_Clock (Element (DB, 7).all),  6, 15,  0);

   loop
      Print_Dash_board (DB);

      if Graphic_Gauge (Element (DB, 3).all).Value < 60 then
         Put_Line ("There is a leak in the radiator.");
      end if;
      if Speedometer (Element (DB, 1).all).Value> 50 then
         Put_Line (" Speed limit is 50 ... ");
      end if;

      if Clock (Element (DB, 5).all).Seconds
           /= Accurate_Clock (Element (DB, 7).all).Seconds
      then
         Put_Line (" Your first clock is not very accurate ");
      end if;

      Put ("Give a time increment in milliseconds (0 to terminate) :");
      Get (Inc);
      exit when Inc <= 0;
      Sec := Inc / 1000;
      Increment (Clock          (Element (DB, 5).all), Sec);
      Increment (Chronometer    (Element (DB, 6).all), Sec);
      Increment (Accurate_Clock (Element (DB, 7).all), Inc);

      Gauge (Element (DB, 2).all).Value :=
        Integer (Float (Gauge (Element (DB, 2).all).Value)
                  * (1.0 - Float (Sec) / 3600.0));

      Graphic_Gauge (Element (DB, 3).all).Value :=
        Integer (Float (Graphic_Gauge (Element (DB, 3).all).Value)
                   * (1.0 - Float (Sec) / 600.0));

      Speedometer (Element (DB, 1).all).Value :=
        Speedometer (Element (DB, 1).all).Value + 2;
   end loop;
exception
   when Others => Put_Line ("I think that's enough for today... Bye");
end Demo2;

