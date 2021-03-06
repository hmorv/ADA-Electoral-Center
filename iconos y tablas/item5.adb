with Adagraph,ada.text_io,ada.integer_text_io;
use Adagraph,ada.text_io,ada.integer_text_io;
procedure Item5 is
   type T_bitmap is array (1 .. 32, 1 .. 32) of integer; 
   Bitmap :          T_bitmap    := (
      (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),--1
      (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4, 5, 6, 9, 6, 5, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),--2
      (0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 9, 1, 1, 1, 1, 1, 1, 1, 9, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),--3
      (0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 6, 3, 0, 0, 0, 0, 0, 0, 0, 0),--4
      (0, 0, 0, 0, 0, 0, 6, 2, 0, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0),--5
      (0, 0, 0, 0, 0, 6, 0, 0, 6, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 0, 0, 0, 0, 0, 0),--6
      (0, 0, 0, 0, 6, 0, 0, 0, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 0, 0, 0, 0, 0),--7
      (0, 0, 0, 5, 3, 0, 0, 3, 9, 1, 1, 1, 1, 2, 0, 0, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 0, 0, 0, 0),--8
      (0, 0, 2, 4, 0, 0, 0, 4, 9, 1, 1, 1, 1, 0, 0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 0, 0, 0, 0),--9
      (0, 2, 5, 0, 0, 0, 0, 4, 9, 1, 1, 1, 1, 0, 0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 6, 0, 0, 0),--10
      (0, 4, 3, 0, 0, 0, 0, 3, 9, 1, 1, 1, 1, 3, 0, 0, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 0, 0, 0),--11
      (0, 3, 2, 0, 0, 0, 0, 0, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 0, 0),--12
      (0, 4, 2, 0, 0, 0, 0, 0, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 0, 0),--13
      (0, 4, 0, 0, 0, 0, 0, 0, 0, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 0, 0),--14
      (2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 3, 0),--15
      (3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 2, 0),--16
      (3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 2, 0),--17
      (2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 3, 0),--18
      (0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 9, 1, 1, 1, 1, 1, 1, 1, 1, 9, 0, 0),--19
      (0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 1, 1, 1, 1, 1, 1, 1, 1, 5, 0, 0),--20
      (0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 9, 1, 1, 1, 1, 1, 1, 1, 4, 0, 0),--21
      (0, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4, 2, 0, 0, 0, 0, 0, 9, 1, 1, 1, 1, 1, 1, 9, 2, 0, 0),--22
      (0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 9, 1, 9, 0, 0, 0, 0, 0, 6, 1, 1, 1, 1, 1, 1, 9, 0, 0, 0),--23
      (0, 0, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 9, 1, 1, 1, 3, 0, 0, 0, 0, 5, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0),--24
      (0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 9, 1, 9, 0, 0, 0, 0, 0, 5, 1, 1, 1, 1, 1, 6, 0, 0, 0, 0),--25
      (0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 0, 0, 0, 0, 0, 0, 6, 1, 1, 1, 1, 9, 0, 0, 0, 0, 0),--26
      (0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 1, 1, 1, 9, 0, 0, 0, 0, 0, 0),--272
      (0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 9, 1, 1, 9, 0, 0, 0, 0, 0, 0, 0),--28
      (0, 0, 0, 0, 0, 0, 0, 5, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 9, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0),--29
      (0, 0, 0, 0, 0, 0, 0, 0, 3, 5, 4, 3, 0, 0, 0, 0, 0, 2, 9, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),--30
      (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 1, 1, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),--31
      (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));--32
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
end Item5;