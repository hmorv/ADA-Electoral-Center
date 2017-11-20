separate(Formato_Ficheros.Leer_Ficheros)
procedure Aplicar_Hont (
      Fichero_Circuns      : in     Formato_Fcircuns_Io.File_Type;  
      Fichero_Candidaturas : in     Formato_Fcandidat_Io.File_Type; 
      Fichero_Votos        : in     Formato_Fvotos_Io.File_Type     ) is 

   type Tabla_Codigo_Votos is array (Integer range <>, Integer range <>) of Float; 
   Max_Cod_Vot : constant Integer := 800;  

   --En esta tabla almacenamos los datos (votos y codigos).
   Codigo_Votos      : Tabla_Codigo_Votos (1 .. 2, 1 .. Max_Cod_Vot);  
   Maximo_Posiciones : Integer                                       := 0;  

   procedure Rellenar_Tabla_Cocientes (
         Codigo_Votos      :    out Tabla_Codigo_Votos; 
         Maximo_Posiciones :    out Integer             ) is 

      --Variable que almacena el total de votos otorgados a las candidaturas.
      Total_Votos : Float := 0.0;  

      --Esta variable calculará el 3% del total de votos, para discriminar las candidaturas
      --minoritarias.
      Tres_Por_Ciento : Float := 0.0;  

      --Esta variable calcula el número de candidaturas sin contar las que no alcancen el 3%.
      Numero_Candidaturas_Validas : Integer := 0;  

   begin

      --Iniciamos los valores de la tabla Codigo_votos.
      for I in 1..Max_Cod_Vot loop
         Codigo_Votos(1,I):= 0.0;
         Codigo_Votos(2,I):=0.0;
      end loop;

      --Calculamos el total de votos.
      for I in 1..Circunscripcion.Numero_Candidaturas loop
         Total_Votos:=Votos.Votos(I)+Total_Votos;
      end loop;

      --calculamos el 3% del total de votos.
      Tres_Por_Ciento :=0.03*Total_Votos;

      --quitamos las candidaturas que no llegan al 3% del total de votos.
      for I in 1..Circunscripcion.Numero_Candidaturas loop
         if Tres_Por_Ciento <= Votos.Votos(I) then
            --Si la candidatura supera el 3% de los votos totales:
            Numero_Candidaturas_Validas := Numero_Candidaturas_Validas+1;
            Codigo_Votos(1,Numero_Candidaturas_Validas):=Votos.Votos(I);
            Codigo_Votos(2,Numero_Candidaturas_Validas):=Float(
               Votos.Codigo(I));
         end if;
      end loop;

      --Calculamos el máximo de posiciones que habrá que ordenar.
      Maximo_Posiciones := Circunscripcion.Escaños*
         Numero_Candidaturas_Validas;

      --Llenamos la tabla.
      for J in 2..Circunscripcion.Escaños loop
         for I in 1..Numero_Candidaturas_Validas loop
            Codigo_Votos(1,I+Numero_Candidaturas_Validas*(J-1)):=
               Codigo_Votos(1,I)/Float(J);
            Codigo_Votos(2,I+Numero_Candidaturas_Validas*(J-1)):=
               Float(Codigo_Votos(2,I));
         end loop;
      end loop;
   end Rellenar_Tabla_Cocientes;


   procedure Ordenar_Tabla (
         Maximo_Posiciones : in out Integer;           
         Tabla_Ordenada    : in out Tabla_Codigo_Votos ) is 

      Min,  
      Codigo_Min : Float   := 0.0;  
      Jmin       : Integer;  

   begin

      --Ordenamos los valores que hay en la tabla.
      --Cada vez que permutamos un valor de votos, hacemos lo mismo con el código correspondiente.
      for I in 1..Maximo_Posiciones loop
         Min := Tabla_Ordenada(1,I);
         Codigo_Min:=Tabla_Ordenada(2,I);
         Jmin := I;
         for J in  I..Maximo_Posiciones loop
            if Tabla_Ordenada(1,J) > Min then
               Min := Tabla_Ordenada(1,J);
               Codigo_Min:=Tabla_Ordenada(2,J);
               Jmin := J;
            end if;
         end loop;
         Tabla_Ordenada(1,Jmin) := Tabla_Ordenada(1,I);
         Tabla_Ordenada(1,I) := Min;
         Tabla_Ordenada(2,Jmin) := Tabla_Ordenada(2,I);
         Tabla_Ordenada(2,I) := Codigo_Min;
      end loop;
   end Ordenar_Tabla;


   procedure Finalizar (
         --Con este procedimiento escribimos los resultados en la tabla T_Escaños.
         Tabla_Ordenada : in     Tabla_Codigo_Votos; 
         T_Escaños      : in out Tabla_Escaños       ) is 
      
      Indice     :          Integer;  
      J          :          Integer;  
      Encontrado :          Boolean;  
      Centinela  : constant Integer := - 1;  

   begin

      -- Iniciamos los valores de la tabla a cero.
      for I in 1..Circunscripcion.Numero_Candidaturas + 1 loop
         T_Escaños(2,I):=0;
         T_Escaños(1,I):=0;
      end loop;
      T_Escaños(2,1):=Centinela;
      Indice:=1;

      for I in 1..Circunscripcion.Escaños loop

         J:=1;
         Encontrado:=False;
         while  T_Escaños(2,J)/=Centinela and not Encontrado loop
            if Integer(Tabla_Ordenada(2,I))=T_Escaños(2,J) then
               T_Escaños(1,J):=T_Escaños(1,J)+1;
               Encontrado:=True;
            end if;
            J:=J+1;
         end loop;
         
         if not Encontrado then
            T_Escaños(2,Indice):=Integer(Tabla_Ordenada(2,I));
            T_Escaños(1,Indice):=1;
            Indice:=Indice+1;
            T_Escaños(2,Indice):=Centinela;
         end if;
      end loop;
      
      for I in 1..Circunscripcion.Numero_Candidaturas loop
         J:=1;
         Encontrado:=False;
         while T_Escaños(2,J)/=Centinela and not Encontrado loop

            if T_Escaños(2,J)=Votos.Codigo(I) then
               Encontrado:=True;
            end if;
            J:=J+1;
         end loop;
         
         if not Encontrado then
            T_Escaños(2,J):=Votos.Codigo(I);
            Indice:=Indice+1;
            T_Escaños(2,Indice):=Centinela;
         end if;

      end loop;
   end Finalizar;

begin
   
   --Si hemos leído un fichero de resultados el tratamiento es el siguiente:
   if Fich_Res then
      Read(Fichero_Resultado, Tabla_Resultado);
      Rellenar_Tabla_Cocientes(Codigo_Votos, Maximo_Posiciones);
      Ordenar_Tabla(Maximo_Posiciones, Codigo_Votos);
      Finalizar(Codigo_Votos, T_Escaños);
      Opciones_Activadas := True;

   else
      --En caso contrario leemos los tres ficheros y almacenamos el contenido en las tres variables.
      Read(Fichero_Circuns, Circunscripcion);
      Read(Fichero_Votos, Votos);
      Read(Fichero_Candidaturas,Candidaturas);

      --Rellenamos la tabla de cocientes.
      Rellenar_Tabla_Cocientes(Codigo_Votos, Maximo_Posiciones);

      --Ordenamos la tabla.
      Ordenar_Tabla(Maximo_Posiciones, Codigo_Votos);

      --Buscamos los n valores más altos de la tabla (N = escaños):
      Finalizar(Codigo_Votos, T_Escaños);
     
      --Y si todo ha salido bien, activamos los botones Tabla y Grafica.
      Opciones_Activadas := True;
   end if;
end Aplicar_Hont;