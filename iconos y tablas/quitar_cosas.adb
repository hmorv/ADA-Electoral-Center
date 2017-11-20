with Ada.Text_Io;
use Ada.Text_Io;
procedure Quitar_Cosas is
   origen,Destino:File_Type;
   Forigen,Fdestino:String(1..10);
   Max:Integer;
   letra:character;
begin
   Put_Line("introducir el nombre del fichero a quitar cosas");
   Get_Line(Forigen,Max);
   open(origen,in_file,forigen(1..max));
   Put_Line("introduce el nombre del fichero destino");
   Get_Line(Fdestino,Max);
   Create(Destino,out_File,Fdestino(1..Max));
   Get(Origen,Letra);
   while not End_Of_File(Origen) loop
      case Letra is
         when '1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9'|'0' => Put(Destino,Letra);Put(Destino," "); --'1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9'|'0'
         when others =>null ;--Put(Destino,Letra);
      end case;      
--      if Character'Pos(Letra)>47 and Character'Pos(Letra)<58 then
--         Put(Destino,Letra);put(destino," ");
--      end if;
      if End_Of_Line(Origen) then New_Line(Destino);end if;
--      Put(Destino,Letra);
      get(origen,letra);
   end loop;
--   Put(Destino,Letra);
   Close(Origen);Close(Destino);
end Quitar_Cosas;

   
   