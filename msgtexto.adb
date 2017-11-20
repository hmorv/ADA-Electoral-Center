with Botones;
use Botones;
package body Msgtexto is

   -- Constantes utilizadas.
   Color_Texto       : constant Extended_Color_Type := Black;  
   Color_Lineas      : constant Extended_Color_Type := Dark_Gray;  
   Color_Fondo_Texto : constant Extended_Color_Type := Light_Gray;  
   Color_Cursor      : constant Extended_Color_Type := Light_Red;  

   --Estas constantes hacen referencia a las tres teclas clave: esc, enter y backspace.
   Tecla_Esc   : constant Character := Character'Val (16#1B#);  
   Tecla_Intro : constant Character := Character'Val (16#0D#);  
   Tecla_Back  : constant Character := Character'Val (16#08#);  

   -- Márgenes.
   Margen : constant Integer := 5;  

   -- Margen entre el Texto y su rectángulo
   Margen_Texto : constant Integer := 2;  

   procedure Tratar_Teclado (
         Texto        : in out String;  
         Longitud     : in out Integer; 
         Valido       :    out Boolean; 
         X_Texto,                       
         Y_Texto,                       
         Amplio_Texto : in     Integer  ) is 

      --Variables que controlan el cursor del texto.
      X_Cursor,  
      Y_Cursor : Integer;  

      Letra,  
      Borrador : Character;  

      Acabar : Boolean := False;  

      Ratonx,  
      Ratony           : Integer;  
      Valido_Por_Mouse : Boolean := False;  
      --      ------------------
   begin
      if Key_Hit then
         Borrador:=Get_Key;
      end if;
      Y_Cursor := Y_Texto - 1;
      while not Acabar loop
         Display_Text(X_Texto, Y_Texto,
            Texto(Texto'First .. Texto'First + Longitud-1), Color_Texto);
         Draw_Box(X_Texto + Longitud * Get_Font_Width, Y_Texto,
            X_Texto + Amplio_Texto* Get_Font_Width, Y_Texto + Get_Font_Height,
            Color_Fondo_Texto, True);
         Draw_Line(X_Texto, Y_Cursor,
            X_Texto + Amplio_Texto * Get_Font_Width, Y_Cursor,
            Color_Fondo_Texto);
         if Longitud = 0 then
            X_Cursor := X_Texto;
         elsif Longitud < Amplio_Texto then
            X_Cursor := X_Texto+Longitud * Get_Font_Width;
         else
            X_Cursor := X_Texto+(Amplio_Texto-1) * Get_Font_Width;
         end if;

         Draw_Line(X_Cursor, Y_Cursor, X_Cursor + Get_Font_Width, Y_Cursor, Color_Cursor);


         if Mouse_Button_Pressed(Left_Button) then
            Get_Mouse_Location(Ratonx, Ratony);
            -- trratamiento botn aceptar

            if Punto_En_Boton(Baceptar, Ratonx, Ratony) then
               Tratamiento_Boton(Baceptar, Ratonx, Ratony,
                  Boton_Pulsado_Correctamente);
               if Boton_Pulsado_Correctamente then
                  Acabar:= True;
                  Valido_Por_Mouse :=True;
               end if;
               -- trratamiento botón cancelar
            elsif Punto_En_Boton(Bcancelar, Ratonx, Ratony) then
               Tratamiento_Boton(Bcancelar, Ratonx, Ratony,
                  Boton_Pulsado_Correctamente);
               if Boton_Pulsado_Correctamente then
                  Acabar:=True;
                  Valido:=False;
               end if;
            else
               Get_Mouse_Button(Left_Button,Ratonx,Ratony);
            end if;

         else
            null;
         end if;

         if Key_Hit then
            Letra := Get_Key;

            case Letra is
               when Tecla_Esc | Tecla_Intro =>
                  Acabar := True;
               when Tecla_Back =>
                  if Longitud > 0 then
                     Longitud := Longitud - 1;
                  end if;
               when others =>
                  if Longitud < Amplio_Texto then
                     Longitud := Longitud + 1;
                     Texto(Texto'First + Longitud - 1) := Letra;
                  end if;
            end case;
         end if;
      end loop;
      if Valido_Por_Mouse or Letra = Tecla_Intro then
         Valido:=True;
      end if;
   end Tratar_Teclado;


   procedure Mostrar_Mensaje (
         Texto    : in out String;                                  
         Longitud : in out Natural;                                 
         Valido   :    out Boolean;                                 
         Titulo   : in     String;                                  
         Rect     : in     Trectangulo;                             
         Fondo    : in     Extended_Color_Type := Fondo_Por_Defecto ) is 

      Amplio_Texto,  
      Amplio_Rect_Texto,  
      Alt_Rect_Texto,  
      Amplio_Titol      : Integer;  
      X_Rect_Texto,  
      Y_Rect_Texto,  
      X_Texto,  
      Y_Texto           : Integer;  
      Amplio_Str        : Integer;  

      --Los nombres de los dos botones.
      Nombre_Baceptar  : constant String := "Aceptar";  
      Nombre_Bcancelar : constant String := "Cancelar";  

      Bx,  
      By,  
      Distancia_Botones : Integer;  
      ------------------
   begin

      for I in Texto'First..Texto'Last loop
         Texto(I) := ' ';
      end loop;

      Amplio_Texto := (Rect.X1 - Rect.X0 - 2 * (Margen + Margen_Texto + 1)) / Get_Font_Width;
      Amplio_Str := Texto'Last - Texto'First +1;
      if Amplio_Texto > Amplio_Str then
         Amplio_Texto := Amplio_Str;
      end if;

      -- Corregir el valor de 'Longitud', por si cae fuera del límite.
      if Longitud > Amplio_Texto then
         Longitud := Amplio_Texto;
      end if;

      --Inicializaciones:
      Alt_Rect_Texto := Get_Font_Height + 2 * (Margen_Texto + 1) + 1;
      Amplio_Rect_Texto := Amplio_Texto * Get_Font_Width + 2 * (Margen_Texto + 1);
      Amplio_Titol  := (Rect.X1 - Rect.X0 - 2 * Margen) / Get_Font_Width;
      Amplio_Str := Titulo'Last - Titulo'First + 1;
      if Amplio_Titol > Amplio_Str then
         Amplio_Titol := Amplio_Str;
      end if;

      X_Rect_Texto := Rect.X0 +(Rect.X1-Rect.X0-20*Get_Font_Width)/2;
      Y_Rect_Texto := Rect.Y1 - 5*Margen-2*Get_Font_Height;
      X_Texto := X_Rect_Texto + Margen_Texto + 1;
      Y_Texto := Y_Rect_Texto + Margen_Texto + 1;

      Distancia_Botones:=(Rect.X1-Rect.X0-70-78)/3;
      Bx:=Rect.X0+Distancia_Botones;
      By:=Rect.Y0+4*Margen_Texto;
      Draw_Box(Rect.X0, Rect.Y0, Rect.X1, Rect.Y1, Fondo, True);--PROVOCA UN ERROR.
      Draw_Line(Rect.X0-2, Rect.Y0-1,Rect.X0-2, Rect.Y1+2, Closest_Color (85,85,85));
      Draw_Line(Rect.X0-1, Rect.Y0, Rect.X0-1, Rect.Y1+1, Closest_Color (236,236,236));
      Draw_Line(Rect.X0-1, Rect.Y1+2,Rect.X1+1, Rect.Y1+2,Closest_Color (85,85,85));
      Draw_Line(Rect.X0,Rect.Y1+1, Rect.X1, Rect.Y1+1,Closest_Color (236,236,236));
      Draw_Line(Rect.X1+1,Rect.Y0-1,Rect.X1+1,Rect.Y1+2,Dark_Gray);
      Draw_Line(Rect.X0-2,Rect.Y0-1,Rect.X1+1,Rect.Y0-1,Dark_Gray);
      Display_Text(Rect.X0, Rect.Y1-Margen-Get_Font_Height, Titulo, Color_Texto);

      Draw_Box(X_Rect_Texto, Y_Rect_Texto,
         X_Rect_Texto + Amplio_Rect_Texto, Y_Rect_Texto + Alt_Rect_Texto,
         Color_Fondo_Texto, True);
      Draw_Box(X_Rect_Texto, Y_Rect_Texto,
         X_Rect_Texto + Amplio_Rect_Texto, Y_Rect_Texto + Alt_Rect_Texto,
         Color_Lineas, False);
      Crear_Boton (Baceptar, Nombre_Baceptar, Bx,By, Black, Light_Gray,Closest_Color (130,130,130));
      Pintar_Boton(Baceptar);
      Crear_Boton (Bcancelar, Nombre_Bcancelar,Bx+Distancia_Botones+70,By, Black, Light_Gray,Closest_Color (130,130,130));
      Pintar_Boton(Bcancelar);
      Tratar_Teclado(Texto, Longitud, Valido, X_Texto, Y_Texto, Amplio_Texto);
      Draw_Box(Rect.X0-2, Rect.Y0-1, Rect.X1+1, Rect.Y1+2, White, True);
   end Mostrar_Mensaje;
end Msgtexto;