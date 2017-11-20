Separate(Tratamiento_Grafico.Visualizar_Grafica)
Procedure Tablas (
      --Este programa crea la tabla con los colores, nombre y logotipos de los partidos.
      Xmax,                    
      Ymax   : In     Integer; 
      Margen,                  
      Radio  : In     Float    ) Is 

   --Estas variables determinan las dimensiones de la tabla donde serán expuestos los datos.
   Altura_Celdas,  
   Cuadrox0,  
   Cuadrox1,  
   Cuadroy0,  
   Cuadroy1,  
   Mitad_Cuadro  : Integer := 0;  

   --Dimesiones de los campos Color y Logo.
   Color : Constant Integer := 5;  
   Logo  : Constant Integer := 32 + 12;  

   --Estas constantes son los nombres que tendrán los tres campos de la tabla.
   Nombre_Color    : Constant String (1 .. 5)  := "COLOR";  
   Nombre_Partidos : Constant String (1 .. 10) := " PARTIDOS ";  
   Nombre_Logo     : Constant String (1 .. 4)  := "LOGO";  

   Procedure Pintar_Logo Is 
      X      : Integer;  
      Y,  
      C      : Integer;  
      Bitmap : T_Bitmap;  

   Begin

      For I In 1..Circunscripcion.Numero_Candidaturas Loop

         --Si la candidatura tiene representación:
         If I <= Contador_3 Then
            If I > 4 Then

               --Si el índice supera al número de celdas de la primera mitad de la tabla:
               For I In 1..4 Loop
                  For J In 1..Circunscripcion.Numero_Candidaturas Loop
                     If Candidaturas.Codigo(J)=Integer(Datos(3,I)) Then
                        Bitmap:=Candidaturas.Logotipo(J);
                     End If;
                  End Loop;
                  X:=Mitad_Cuadro-Logo+6;
                  Y:=Cuadroy1-Altura_Celdas*(I+1)+(Altura_Celdas-Logo)/2;
                  For Fila In 1..Bitmap'Last Loop
                     For Columna In 1..Bitmap'Last  Loop
                        C :=Bitmap (Fila, Columna);
                        Case C Is
                           When 1 =>
                              Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                 Black);
                           When 2 =>
                              Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                 Closest_Color(236,236,236));
                           When 3 =>
                              Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                 Closest_Color(218,218,218));
                           When 4 =>
                              Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                 Closest_Color(164,164,164));
                           When 5 =>
                              Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                 Closest_Color(131,131,131));
                           When 6 =>
                              Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                 Closest_Color(102,102,102)); --51
                           When 7 =>
                              Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                 Closest_Color(153,51,0));
                           When 9 =>
                              Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                 Closest_Color(51,51,51));
                           When 11 =>
                              Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                 Closest_Color(255,0,0));
                           When Others =>
                              Put_Pixel(X+Columna-1, Y+Bitmap'Last-Fila,
                                 White);
                        End Case;
                     End Loop;

                  End Loop;

                  For I In 5..Circunscripcion.Numero_Candidaturas Loop
                     If I <= Contador_3 Then

                        For J In 1..Circunscripcion.Numero_Candidaturas Loop
                           If Candidaturas.Codigo(J)=Integer(Datos(3,I)) Then
                              Bitmap:=Candidaturas.Logotipo(J);
                           End If;
                        End Loop;

                        X:=Cuadrox1-Logo+6;
                        Y:=Cuadroy1-Altura_Celdas*(I-4)+(Altura_Celdas-Logo)/2;
                        For Fila In 1..Bitmap'Last Loop
                           For Columna In 1..Bitmap'Last  Loop
                              C :=Bitmap (Fila, Columna);
                              --caso(c);
                              Case C Is
                                 When 1 =>
                                    Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                       Black);
                                 When 2 =>
                                    Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                       Closest_Color(236,236,236));
                                 When 3 =>
                                    Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                       Closest_Color(218,218,218));
                                 When 4 =>
                                    Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                       Closest_Color(164,164,164));
                                 When 5 =>
                                    Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                       Closest_Color(131,131,131));
                                 When 6 =>
                                    Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                       Closest_Color(102,102,102)); --51
                                 When 7 =>
                                    Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                       Closest_Color(153,51,0));
                                 When 9 =>
                                    Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                       Closest_Color(51,51,51));
                                 When 11 =>
                                    Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                                       Closest_Color(255,0,0));
                                 When Others =>
                                    Put_Pixel(X+Columna-1, Y+Bitmap'Last-Fila,
                                       White);
                              End Case;
                           End Loop;
                        End Loop;
                     End If;
                  End Loop;
               End Loop;
            Else

               --Si el índice no ha sobrepasado el número de celdas de la primera mitad:
               For J In 1..4 Loop
                  If Candidaturas.Codigo(J)=Integer(Datos(3,I)) Then
                     Bitmap:=Candidaturas.Logotipo(J);
                  End If;
               End Loop;
               X:=Mitad_Cuadro-Logo+6;
               Y:=Cuadroy1-Altura_Celdas*(I+1)+(Altura_Celdas-Logo)/2;
               For Fila In 1..Bitmap'Last Loop
                  For Columna In 1..Bitmap'Last  Loop
                     C :=Bitmap (Fila, Columna);
                     Case C Is
                        When 1 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Black);
                        When 2 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(236,236,236));
                        When 3 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(218,218,218));
                        When 4 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(164,164,164));
                        When 5 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(131,131,131));
                        When 6 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(102,102,102));
                        When 7 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(153,51,0));
                        When 9 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(51,51,51));
                        When 11 =>
                           Put_Pixel (X+Columna-1, Y+Bitmap'Last-Fila,
                              Closest_Color(255,0,0));
                        When Others =>
                           Put_Pixel(X+Columna-1, Y+Bitmap'Last-Fila,
                              White);
                     End Case;
                  End Loop;
               End Loop;
            End If;
         End If;
      End Loop;
   End Pintar_Logo;

Begin

   --Inicializamos los valores de la tabla.
   Cuadrox0:=Integer(0.16*Float(Xmax)+2.0*Margen);
   Cuadroy0:=Integer(Margen+Radio);
   Cuadrox1:=Integer(Float(Xmax)-2.0*Margen);
   Cuadroy1:=Integer(Float(Ymax)-Margen/2.0);
   Mitad_Cuadro:=Integer((Float(Xmax)-0.16*Float(Xmax))/2.0+0.16*
      Float(Xmax));
   Altura_Celdas:=Integer(Float(Cuadroy1-Cuadroy0-5)/5.0);

   --Dibujamos el cuadro.
   Draw_Box(Cuadrox0,Cuadroy0,Cuadrox1,Cuadroy1,Black);
   Altura_Celdas:=Integer(Float(Cuadroy1-Cuadroy0-5)/5.0);

   --Ponemos las filas.
   For I In 1..4 Loop
      Draw_Line(Cuadrox0,Cuadroy0+I*Altura_Celdas+I,Cuadrox1,
         Cuadroy0+I*Altura_Celdas+I,Black);
   End Loop;

   --Dividimos la tabla en dos mitades.       
   Draw_Line(Mitad_Cuadro,Cuadroy0,Mitad_Cuadro,Cuadroy1,Black);

   --Trazamos las columnas, que dividirán la tabla en 3 campos:
   --   Color.
   --   Candidatura.
   --   Logotipo.
   Draw_Line(Cuadrox0+Color*Get_Font_Width+10,Cuadroy0,Cuadrox0+
      Color*Get_Font_Width+10,Cuadroy1,Black);
   Draw_Line(Mitad_Cuadro-Logo,Cuadroy0,Mitad_Cuadro-Logo,Cuadroy1,
      Black);
   Draw_Line(Mitad_Cuadro+Color*Get_Font_Width+10,Cuadroy0,
      Mitad_Cuadro+Color*Get_Font_Width+10,Cuadroy1,Black);
   Draw_Line(Cuadrox1-Logo,Cuadroy0,Cuadrox1-Logo,Cuadroy1,Black);

   --Ahora le ponemos nombre a las celdas.
   Display_Text(Cuadrox0+5,(Altura_Celdas-Get_Font_Height)/2+
      Cuadroy1-Altura_Celdas ,Nombre_Color);
   Display_Text((Mitad_Cuadro-Logo-(Cuadrox0+Color*Get_Font_Width+
            10)-10*Get_Font_Width)/2+Cuadrox0+Color*Get_Font_Width+
      10,(Altura_Celdas-Get_Font_Height)/2+Cuadroy1-Altura_Celdas  ,
      Nombre_Partidos);
   Display_Text((Logo-4*Get_Font_Width)/2+Mitad_Cuadro-Logo,(
         Altura_Celdas-Get_Font_Height)/2+Cuadroy1-Altura_Celdas  ,
      Nombre_Logo);

   --Rellenamos la tabla con los valores.
   For I In 1..Circunscripcion.Numero_Candidaturas Loop
      If I <= Contador_3 Then
         If I > 4 Then

            --Si el índice es mayor que 4 (las posiciones de la primera mitad), 
            --colocamos los datos en la segunda mitad de la tabla.
            Flood_Fill((Color*Get_Font_Width+10)/2+Mitad_Cuadro,
               Cuadroy1-Altura_Celdas*(I-5)-(Altura_Celdas)/2,
               Closest_Color((900*(I)) rem 255, (50000*(I)) rem 255 , (
                     30*(I)) rem 255 ));
            For J In 1..Circunscripcion.Numero_Candidaturas Loop
               If Candidaturas.Codigo(J)=Integer(Datos(3,I)) Then
                  Display_Text((Mitad_Cuadro-Logo-(Cuadrox0+Color*
                           Get_Font_Width+10)-18*Get_Font_Width)/2+
                     Color*Get_Font_Width+10+Mitad_Cuadro,
                     (Altura_Celdas-Get_Font_Height)/2+Cuadroy1-
                     Altura_Celdas*(I-4),
                     Candidaturas.Candidatura(J));
                  Display_Text(((Mitad_Cuadro-Logo-(Cuadrox0+Color*
                              Get_Font_Width+10)-18*Get_Font_Width)/2+
                        Color*Get_Font_Width+10+Mitad_Cuadro)+1,
                     (Altura_Celdas-Get_Font_Height)/2+Cuadroy1-
                     Altura_Celdas*(I-4),
                     Candidaturas.Candidatura(J));
               End If;
            End Loop;
         Else

            --En caso contrario, escribimos los datos en la primera mitad de la tabla.
            Flood_Fill((Color*Get_Font_Width+10)/2+Cuadrox0, Cuadroy1-
               Altura_Celdas*I-(Altura_Celdas)/2,Closest_Color((900*I) rem
                  255, (50000*I) rem 255 , (30*I) rem 255 ));
            For J In 1..Circunscripcion.Numero_Candidaturas Loop
               If Candidaturas.Codigo(J)=Integer(Datos(3,I)) Then
                  Display_Text((Mitad_Cuadro-Logo-(Cuadrox0+Color*
                           Get_Font_Width+10)-18*Get_Font_Width)/2+
                     Cuadrox0+Color*Get_Font_Width+10,
                     (Altura_Celdas-Get_Font_Height)/2+Cuadroy1-
                     Altura_Celdas*(I+1)  ,
                     Candidaturas.Candidatura(J));
                  Display_Text(((Mitad_Cuadro-Logo-(Cuadrox0+Color*
                              Get_Font_Width+10)-18*Get_Font_Width)/2+
                        Cuadrox0+Color*Get_Font_Width+10)+1,
                     (Altura_Celdas-Get_Font_Height)/2+Cuadroy1-
                     Altura_Celdas*(I+1)  ,
                     Candidaturas.Candidatura(J));
               End If;
            End Loop;
         End If;
      End If;
   End Loop;
   Pintar_Logo;
End Tablas;