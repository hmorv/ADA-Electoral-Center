separate (Tratamiento_Grafico)
procedure Visualizar_Comparativa (
      Xmax,                 
      Ymax : in     Integer ) is 

   --Esta constante nos servirá para indicar en el título de la ventana donde se encuentra el usuario.
   Titulo_Ventana : constant String := "Comparativa De Resultados   ";  

   --Estas variables captarán el nombre de fichero que el usuario introduzca.
   Nombre_Fichero1,  
   Nombre_Fichero2,  
   Str             : String (1 .. 20) := (others => ' ');  

   --En estos registros almacenamos los datos de ambos ficheros.
   Cand1,  
   Cand2          : Formato_Fcandidat;  
   Circ1,  
   Circ2          : Formato_Fcircuns;  
   Margen_Lateral : Integer;  

   --Determina la longitud del nombre de fichero.
   Longitud_Nombre_Fichero1,  
   Longitud_Nombre_Fichero2 : Integer := 0;  
   Nombre_Correcto,  
   Opciones_Activadas       : Boolean;  

   --Variables para los logotipos.
   Bitmap : T_Bitmap;  
   C      : Integer;  
   X,  
   Y      : Integer;  

begin

   --Limpiamos la ventana para evitar sobreescribir datos.
   Limpiar_Ventana(Xmax,Ymax);

   Margen_Lateral := (5*Xmax)/100;

   --Captamos los dos nombres de fichero.
   Captar_Nombre_Fichero(Xmax, Ymax, Str, Longitud_Nombre_Fichero1,
      Nombre_Correcto);

   if Nombre_Correcto then
      Nombre_Fichero1 := Str;

      ---Si el nombre es correcto, leemos el siguiente nombre.
      Captar_Nombre_Fichero(Xmax, Ymax, Str, Longitud_Nombre_Fichero2,
         Nombre_Correcto);
      if Nombre_Correcto then
         Nombre_Fichero2 := Str;

         --Leemos el fichero para procesarlo.
         Leer_Ficheros(Votos, Circunscripcion, Candidaturas,
            Tescaños,Nombre_Fichero1,Longitud_Nombre_Fichero1,
            Opciones_Activadas);

         if Opciones_Activadas then
            for I in 1..Circunscripcion.Numero_Candidaturas loop

               --Si hemos leído un fichero correcto, realizamos un recorrido de todas las candidaturas.
               Draw_Box((20*Xmax)/100+Margen_Lateral*I,(15*Ymax)/100,(20*Xmax)/100+
                  Margen_Lateral*I+12,((15*Ymax)/100)+(9*Integer(Tescaños(1,I))),
                  Red,True);
               Display_Text((19*Xmax)/100+Margen_Lateral*I,((15*Ymax)/100)+(9*Integer(Tescaños(1,I))),Tescaños(1,I)'Img);
               Bitmap:=Candidaturas.Logotipo(I);
               X:=(90*Xmax)/100;
               Y:=(90*Ymax)/100-Margen_Lateral*I;
               Display_Text(X-20*(Xmax/100),Y,Candidaturas.Candidatura(I));

               --Ahora pintamos los logotipos del fichero en la parte derecha, para tener una leyenda con las candidaturas.
               for Fila in 1..Bitmap'Last loop
                  for Columna in 1..Bitmap'Last  loop
                     C :=Bitmap (Fila, Columna);
                     case C is
                        when 1 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Black);
                        when 2 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(236,236,236));
                        when 3 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(218,218,218));
                        when 4 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(164,164,164));
                        when 5 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(131,131,131));
                        when 6 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(102,102,102)); --51
                        when 7 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(153,51,0));
                        when 9 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(51,51,51));
                        when 11 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(255,0,0));
                        when others =>
                           Put_Pixel(X+Columna-1, Y+Bitmap'Last-Fila,
                              White);
                     end case;
                  end loop;
               end loop;
            end loop;

            --Pintamos los logotipos en la inferior de las gráficas, para identificar cada par de barras con un icono.
            for J in 1..Circunscripcion.Numero_Candidaturas loop
               Bitmap:=Candidaturas.Logotipo(J);
               X:=(19*Xmax)/100+Margen_Lateral*J;
               Y:=(7*Ymax)/100;
               for Fila in 1..Bitmap'Last loop
                  for Columna in 1..Bitmap'Last  loop
                     C :=Bitmap (Fila, Columna);
                     case C is
                        when 1 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Black);
                        when 2 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(236,236,236));
                        when 3 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(218,218,218));
                        when 4 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(164,164,164));
                        when 5 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(131,131,131));
                        when 6 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(102,102,102)); --51
                        when 7 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(153,51,0));
                        when 9 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(51,51,51));
                        when 11 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(255,0,0));
                        when others =>
                           Put_Pixel(X+Columna-1, Y+Bitmap'Last-Fila,
                              White);
                     end case;
                  end loop;
               end loop;
            end loop;

            --Almacenamos las candidaturas y la circunscripción.
            Cand1 :=Candidaturas;
            Circ1 := Circunscripcion;

            Opciones_Activadas := False;

            --Leemos el siguiente fichero:
            Leer_Ficheros(Votos, Circunscripcion, Candidaturas,
               Tescaños,Nombre_Fichero2,Longitud_Nombre_Fichero2,
               Opciones_Activadas);

            if Opciones_Activadas then
               Cand2 := Candidaturas;
               Circ2 := Circunscripcion;
               
               --Si todo va bien, leemos los valores e imprimimos las barras.
               for I in 1..Circ1.Numero_Candidaturas loop
                  for J in 1..Circunscripcion.Numero_Candidaturas loop
                     if Cand1.Codigo(I) = Cand2.Codigo(J) then

                        --recorrido de todas las candidaturas.
                        Draw_Box((20*Xmax)/100+Margen_Lateral*I+12,(15*Ymax)/100,(20*Xmax)/
                           100+Margen_Lateral*I+24,((15*Ymax)/100)+(9*Integer(Tescaños(1,J))),
                           Blue,True);
                        Display_Text((19*Xmax)/100+Margen_Lateral*I+12,((15*Ymax)/100)+(9*Integer(Tescaños(1,J))),Tescaños(1,J)'Img);

                        Set_Window_Title(Titulo_Ventana&Circ1.Circunscripcion&Circ1.Año'Img&"   y   "&Circ2.Circunscripcion&Circ2.Año'Img);
                        Draw_Box(20*Xmax/100+margen_lateral+12,95*Ymax/100,20*Xmax/100+25,95*Ymax/100+12,Red, True);
                        Draw_Box(20*Xmax/100+margen_lateral+12,95*Ymax/100-20,20*Xmax/100+25,95*Ymax/100+12-20,Blue, True);
                        Display_Text(20*Xmax/100+30+margen_lateral+12,95*Ymax/100,Circ1.Circunscripcion&Circ1.Año'Img);
                        Display_Text(20*Xmax/100+30+margen_lateral+12,95*Ymax/100-20,Circ2.Circunscripcion&Circ2.Año'Img);

                     end if;
                  end loop;
               end loop;
            else
               Limpiar_Ventana(Xmax, Ymax);
               Fichero_No_Valido;
            end if;
         end if;
      end if;
   else
      Limpiar_Ventana(Xmax,Ymax);
   end if;
   opciones_Activadas := false;
end Visualizar_Comparativa;