Separate (Tratamiento_Grafico)
Procedure Visualizar_Tabla (
      --Este programa se encarga de crear una tabla con las candidaturas y los esca�os asignados.
      Xmax,                 
      Ymax : In     Integer ) Is 

   --Estas variables determinan las dimensiones de la tabla, las dos columnas y el tama�o de las celdas.
   X0,  
   X1,  
   Y0,  
   Y1,  
   Division_Tabla,  
   Tama�o_Celda   : Integer := 0;  

   --Etiquetas para cada una de las columnas de la tabla.
   Titulo_Candidatura : Constant String (1 .. 11) := "CANDIDATURA";  
   Titulo_Esca�os     : Constant String (1 .. 8)  := "ESCA�OS ";  

   --Esta variable la utilizaremos como �ndice para buscar c�digos de candidaturas.
   Buscador : Integer;  

Begin

   --Dibujamos la tabla.
   --Inicializamos los valores.
   X0 := (38*Xmax)/100;
   X1 := (78*Xmax)/100;
   Y0 := (20*Ymax)/100;
   Y1 := (80*Ymax)/100;
   Division_Tabla := (X1-(9*Get_Font_Width));
   Tama�o_Celda := ((Y1-Y0)/10);

   Set_Window_Title("TABLA DE RESULTADOS:      "&Circunscripcion.Circunscripcion&
      Circunscripcion.A�o'Img);

   --Dibujamos los bordes de la tabla.
   Draw_Box(X0,Y0,X1,Y1,Black);

   --Trazamos la divisi�n en la tabla.
   Draw_Line(Division_Tabla,Y1,Division_Tabla,Y0,Black);

   --Dividimos la tabla en 10 filas.
   For I In 1..9 Loop
      Draw_Line(X0,Y0+Tama�o_Celda*I,X1,Y0+Tama�o_Celda*I);
   End Loop;

   --Escribimos los nombres de los campos.
   Flood_Fill(X0+1, Y1-(Tama�o_Celda)+1,Yellow);
   Flood_Fill(X1-1, Y1-1,Yellow);

   Display_Text(X0+(Division_Tabla-X0)/2 - 5*Get_Font_Width,Y1-(Tama�o_Celda),Titulo_Candidatura);
   Display_Text(Division_Tabla+(X1-Division_Tabla)/2 - 4*Get_Font_Width,Y1-(Tama�o_Celda),Titulo_Esca�os);

   --Ahora tenemos que llenar la tabla con los valores. Primero los nombres de las candidaturas.
   For I In 1..Circunscripcion.Numero_Candidaturas Loop
      Buscador := 1;

      --Recorrido para buscar el c�digo.
      While Buscador < Circunscripcion.Numero_Candidaturas And Then Candidaturas.Codigo(Buscador) /= Tesca�os(2,I) Loop
         Buscador := Buscador +1;
      End Loop;
      Display_Text(X0+(Division_Tabla-X0)/2-10*Get_Font_Width,Y1-((I+1)*Tama�o_Celda),Candidaturas.Candidatura(Buscador));
      Display_Text((X0+(Division_Tabla-X0)/2)+1-10*Get_Font_Width,Y1-((I+1)*Tama�o_Celda),Candidaturas.Candidatura(Buscador));

      --Ahora los esca�os.
      If Tesca�os(1,I) = 0 Then
         Buscador := 1;
         Display_Text(Division_Tabla+(X1-Division_Tabla)/2-2*Get_Font_Width,Y1-((I+1)*Tama�o_Celda),Tesca�os(1,I)'Img,Light_Red);
         Display_Text((Division_Tabla+(X1-Division_Tabla)/2)+1-2*Get_Font_Width,Y1-((I+1)*Tama�o_Celda),Tesca�os(1,I)'Img, Light_Red);
      Else
         Display_Text(Division_Tabla+(X1-Division_Tabla)/2-2*Get_Font_Width,Y1-((I+1)*Tama�o_Celda),Tesca�os(1,I)'Img);
         Display_Text((Division_Tabla+(X1-Division_Tabla)/2)+1-2*Get_Font_Width,Y1-((I+1)*Tama�o_Celda),Tesca�os(1,I)'Img);
      End If;
   End Loop;
End Visualizar_Tabla;