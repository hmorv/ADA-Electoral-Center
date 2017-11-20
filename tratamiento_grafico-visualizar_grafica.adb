separate (Tratamiento_Grafico)
procedure Visualizar_Grafica (
      Xmax,                                     
      Ymax            : in     Integer;         
      Circunscripcion : in     Formato_Fcircuns ) is 

   --Este tipo nos servir� para crear una tabla donde almacenar:
   --   Los esca�os.
   --   Los �ngulos de la semicircunferencia.
   --   El c�digo de cada candidatura.
   type Tdatos is array (1 .. 3, 1 .. 100) of Float; 
   Datos : Tdatos;  

   --Variables para calcular las dimensiones de la gr�fica.
   Margen,  
   Altura,  
   Largo,  
   Radio,  
   Radiopeque�o : Float := 0.0;  
   Contador_3   : Integer := 0;  

   --Almacena los esca�os.
   Datototal,  

   --Almacena el �ngulo de la semicircunferencia.
   Angulo : Float := 0.0;  


   procedure Tablas (
         Xmax,                    
         Ymax   : in     Integer; 
         Margen,                  
         Radio  : in     Float    ) is 
   separate;

begin

   --Ponemos el t�tulo a la ventana concatenado con el nombre de la circunscripci�n y el a�o.
   Set_Window_Title("GRAFICA:   "&Circunscripcion.Circunscripcion&
      Circunscripcion.A�o'Img);

   --Pasamos el n�mero de esca�os a la tabla.
   for I in 1..Circunscripcion.Numero_Candidaturas loop
      Datos(1,I):=Float(Tesca�os(1,I));
      Datos(3,I):=Float(Tesca�os(2,I));

      --Almacenamos el total de votos que vamos leyendo en las posiciones indizadas por I.
      Datototal:=Datos(1,I)+Datototal;
   end loop;

   --Calculamos los �ngulos para cada candidatura.
   for I in 1..Circunscripcion.Numero_Candidaturas loop
      Datos(2,I):=Datos(1,I)*Ada.Numerics.Pi/Datototal;
   end loop;


   --inicializaciones:

   --Calculamos el margen de la gr�fica.
   Margen:=(5.0*Float(Xmax)/100.0);

   --Le damos valor al radio de la circunferencia.
   Radio:=(Float(Xmax)-40.0*Float(Xmax)/100.0 - 2.0 *Margen)/2.0;

   --Situamos la circunferencia a una altura determinada. En este caso, a dos veces el margen.
   Altura:=Margen/2.0;

   --Largo centra la gr�fica en la ventana.
   Largo:=((Float(Xmax)-16.0*Float(Xmax)/100.0)-2.0*Radio)/2.0+16.0*
      Float(Xmax)/100.0;

   --Dibujamos el arco de la gr�fica.
   Draw_Arc(Integer(Largo),Integer(Altura-Radio), Integer(2.0*Radio+
         Largo),Integer(Radio+Altura),Integer( 2.0*Radio+Largo),
      Integer(0.0+Altura),  Integer(Largo),Integer(Altura));

   --Dibujamos la base de la gr�fica.
   Draw_Line(Integer(Largo),Integer(Altura),Integer(Largo+Radio+Radio),
      Integer(Altura),Black);

   --Remarcamos la base con otra l�nea a un pixel de distancia (hacemos el "sombreado").
   Draw_Line(Integer(Largo),Integer(Altura)+1,Integer(Largo+Radio+
         Radio),Integer(Altura+1.0),Black);

   --Dividimos la semicircunferencia:
   Angulo:=0.0;

   --El recorrido es para todas las candidaturas excepto la �ltima.
   --Si se han introducido datos en la tabla Datos, dibujamos una l�nea que divida la semicircunferencia
   --con los datos introducidos, y as� podremos representar el porcentaje de los esca�os para cada candidatura.
   for I in 1..Circunscripcion.Numero_Candidaturas-1 loop
      Angulo:=Angulo+Datos(2,I);
      if Datos(1,I)/=0.0 then
         Draw_Line(Integer(Radio+Largo),Integer(Altura),
            Integer(Largo+Radio-Radio*(Cos(Angulo))),
            Integer(Altura + Radio*(Sin (Angulo))), Black);
      end if;
   end loop;

   --En este bucle rellenamos las divisiones que hemos hecho antes.
   for I in 1..Circunscripcion.Numero_Candidaturas loop
      Angulo:=0.0;
      for J in 1..I-1 loop
         Angulo:=Angulo+Datos(2,J);
      end loop;
      Angulo:=Angulo+Datos(2,I)/2.0;
      if Datos(1,I)/=0.0 then
         Flood_Fill(Integer(Largo+Radio-9.0*Radio/10.0*Cos(Angulo)),
            Integer(Altura+9.0*Radio/10.0*Sin(Angulo)),Closest_Color((
                  900*I) rem 255, (50000*I) rem 255 , (30*I) rem 255 ));
         Contador_3 := Contador_3+1;
      end if;
   end loop;


   --reescribimos los bordes.
   Draw_Line(Integer(Largo),Integer(Altura),Integer(Largo+Radio+Radio),
      Integer(Altura),Black);
   Draw_Line(Integer(Largo),Integer(Altura)+1,Integer(Largo+Radio+
         Radio),Integer(Altura+1.0),Black);

   --Creamos el di�metro interior
   Radiopeque�o := Radio*0.015;
   Draw_Circle(Integer(Largo+Radio),Integer(Altura),Integer(Radio/
         Radiopeque�o),White,True);
   Tablas (Xmax,Ymax,Margen,Radio);
end Visualizar_Grafica;