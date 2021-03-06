with Adagraph,ada.text_io,ada.integer_text_io;
use Adagraph,ada.text_io,ada.integer_text_io;
procedure Item is
   type T_bitmap is array (1 .. 32, 1 .. 32) of integer; 
   Bitmap :          T_bitmap    := (
      (2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 5),--1
      (2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 3, 3, 3, 0, 4, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 6, 5),--2
      (2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4, 4, 3, 4, 9, 9, 4, 0, 9, 9, 9, 9, 9, 9, 9, 9, 9, 6, 9, 5),--3
      (2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 3, 3, 3, 0, 0, 0, 9, 9, 9, 5, 4, 9, 9, 9, 9, 9, 9, 9, 6, 9, 9, 5),--4
      (2, 0, 0, 0, 4, 2, 2, 3, 2, 2, 4, 4, 3, 3, 2, 0, 9, 9, 5, 5, 5, 5, 6, 6, 6, 6, 6, 5, 9, 9, 9, 5),--5
      (2, 0, 0, 0, 2, 3, 0, 0, 0, 0, 0, 0, 3, 3, 2, 0, 9, 5, 5, 9, 9, 9, 9, 9, 9, 9, 6, 6, 9, 9, 9, 5),--6
      (2, 0, 0, 0, 2, 0, 3, 0, 0, 0, 0, 0, 0, 2, 4, 3, 5, 6, 9, 9, 9, 9, 9, 9, 9, 6, 9, 6, 9, 9, 9, 5),--7
      (2, 0, 0, 0, 2, 0, 0, 3, 0, 0, 0, 0, 0, 0, 3, 4, 5, 9, 9, 9, 9, 9, 9, 9, 6, 9, 9, 6, 9, 9, 9, 5),--8
      (2, 0, 0, 0, 2, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 4, 9, 9, 9, 9, 9, 9, 9, 6, 9, 9, 9, 6, 9, 9, 9, 5),--9
      (2, 0, 0, 0, 2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 4, 9, 9, 9, 9, 9, 9, 6, 9, 9, 9, 9, 6, 9, 9, 9, 5),--10
      (2, 0, 0, 3, 4, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 3, 5, 9, 9, 9, 9, 6, 9, 9, 9, 9, 9, 0, 9, 9, 9, 5),--11
      (2, 0, 3, 4, 4, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 4, 5, 9, 9, 9, 6, 9, 9, 9, 9, 9, 9, 5, 2, 9, 9, 5),--12
      (2, 2, 4, 4, 3, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 4, 4, 9, 9, 6, 9, 9, 9, 9, 9, 9, 5, 6, 5, 5, 9, 5),--13
      (2, 3, 4, 0, 4, 2, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 9, 3, 6, 9, 9, 9, 9, 9, 9, 6, 5, 9, 5, 5, 9, 5),--14
      (2, 3, 2, 0, 2, 3, 0, 0, 0, 0, 0, 0, 3, 4, 3, 3, 9, 5, 0, 5, 9, 9, 9, 9, 5, 5, 6, 9, 9, 5, 5, 5),--15
      (3, 4, 2, 2, 2, 2, 4, 3, 2, 3, 3, 4, 4, 4, 4, 3, 9, 9, 5, 3, 0, 3, 3, 4, 5, 6, 9, 9, 9, 6, 4, 5),--16
      (2, 3, 2, 0, 2, 2, 3, 4, 3, 3, 3, 4, 3, 3, 4, 3, 9, 6, 5, 6, 6, 6, 6, 5, 4, 3, 9, 9, 9, 5, 5, 5),--17
      (2, 3, 2, 0, 2, 3, 3, 0, 0, 0, 0, 0, 2, 4, 4, 3, 9, 5, 6, 9, 9, 9, 9, 9, 9, 2, 4, 9, 9, 5, 6, 5),--18
      (2, 3, 3, 2, 4, 3, 0, 0, 0, 0, 0, 0, 2, 2, 4, 3, 5, 6, 6, 9, 9, 9, 9, 9, 9, 9, 4, 6, 5, 5, 9, 5),--19
      (2, 0, 4, 3, 4, 0, 0, 0, 0, 0, 0, 3, 3, 0, 3, 4, 5, 9, 9, 6, 9, 9, 9, 9, 9, 9, 9, 4, 4, 4, 9, 5),--20
      (2, 0, 0, 4, 4, 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 4, 6, 9, 9, 9, 6, 9, 9, 9, 9, 9, 9, 5, 5, 9, 9, 5),--21
      (2, 0, 0, 0, 4, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 3, 6, 9, 9, 9, 9, 6, 9, 9, 9, 9, 9, 5, 9, 9, 9, 5),--22
      (2, 0, 0, 0, 2, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 3, 6, 9, 9, 9, 9, 9, 6, 9, 9, 9, 9, 6, 9, 9, 9, 5),--23
      (2, 0, 0, 0, 2, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 4, 5, 9, 9, 9, 9, 9, 9, 6, 9, 9, 9, 6, 9, 9, 9, 5),--24
      (2, 0, 0, 0, 2, 0, 3, 3, 0, 0, 0, 0, 0, 0, 3, 4, 5, 9, 9, 9, 9, 9, 9, 9, 6, 9, 9, 6, 9, 9, 9, 5),--25
      (2, 0, 0, 0, 2, 3, 3, 0, 0, 0, 0, 0, 0, 3, 3, 4, 9, 4, 9, 9, 9, 9, 9, 9, 9, 6, 9, 6, 9, 9, 9, 5),--26
      (2, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 3, 3, 2, 3, 9, 6, 3, 9, 9, 9, 9, 9, 9, 9, 6, 6, 9, 9, 9, 5),--272
      (2, 0, 0, 3, 4, 2, 2, 2, 2, 2, 4, 4, 4, 3, 2, 4, 9, 9, 9, 4, 4, 5, 6, 6, 6, 6, 6, 5, 9, 9, 9, 5),--28
      (2, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 4, 3, 0, 0, 3, 9, 9, 6, 5, 5, 9, 9, 9, 9, 9, 9, 9, 6, 9, 9, 5),--29
      (2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 3, 2, 2, 3, 4, 5, 5, 9, 9, 9, 9, 9, 9, 9, 9, 9, 6, 9, 5),--30
      (2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 4, 6, 6, 6, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 6, 5),--31
      (2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4));--32
   -- 1  2  3   4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32


   X      : constant Integer    := 1;  
   Y      : constant Integer    := 1; 
   c: integer;
   Fondo  :          Color_Type := White;  
   Dibujo :          Extended_Color_Type := Closest_Color  (0,130,130);
     -- procedure caso(c:in out integer) is separate; 
begin
   Open_Graph_Window(32,32,true);
   --Draw_bitmap(x,y,bitmap,dibujo,fondo);
   for Fila in Bitmap'range(1) loop
      for Columna in Bitmap'range(2) loop
         C :=Bitmap (Fila, Columna);
         --caso(c);
         case C is
            when 1 => Put_Pixel (X+Columna-1, Y+Bitmap'Last(1)-Fila,Black);
            when 2 => Put_Pixel (X+Columna-1, Y+Bitmap'Last(1)-Fila,closest_color(236,236,236));
            when 3 => Put_Pixel (X+Columna-1, Y+Bitmap'Last(1)-Fila,closest_color(218,218,218));
            when 4 => Put_Pixel (X+Columna-1, Y+Bitmap'Last(1)-Fila,closest_color(164,164,164));
            when 5 => Put_Pixel (X+Columna-1, Y+Bitmap'Last(1)-Fila,closest_color(131,131,131));
            when 6 => Put_Pixel (X+Columna-1, Y+Bitmap'Last(1)-Fila,Closest_Color(102,102,102)); --51
            when 9 => Put_Pixel (X+Columna-1, Y+Bitmap'Last(1)-Fila,Closest_Color(51,51,51));
            when others =>Put_Pixel(X+Columna-1, Y+Bitmap'Last(1)-Fila, Fondo);
            
            
         end case;
         


--         if Bitmap (Fila, Columna)=0 then
--            Put_Pixel(X+Columna-1, Y+Bitmap'Last(1)-Fila, Fondo);
--         else
--            Put_Pixel (X+Columna-1, Y+Bitmap'Last(1)-Fila,red);
--         end if;
      end loop;
   end loop;
   Wait_For_Key;
   Close_Graph_Window;
end Item;