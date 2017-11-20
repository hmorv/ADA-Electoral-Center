separate (Formato_Ficheros)

procedure Leer_Ficheros (
      Votos              :    out Formato_Fvotos;    
      Circunscripcion    :    out Formato_Fcircuns;  
      Candidaturas       :    out Formato_Fcandidat; 
      T_Escaños          :    out Tabla_Escaños;     
      Str                : in     String;            
      Largo              : in out Integer;           
      Opciones_Activadas :    out Boolean            ) is 

   Extension_Candidatura : constant String := ".candidaturas";  
   Extension_Votos       : constant String := ".votos";  

   --Esta variable servirá de índice para buscar en el nombre del fichero un punto, lo cual nos ayuda a saber
   --si el fichero es del formato: fichero.res.
   I : Integer := 1;  

   --Esta booleana indicará al programa si ha de leer un fichero resultado o no.
   Fich_Res : Boolean := False;  

   --Este subprograma se encarga de aplicar la ley d'Hont con los ficheros. Recibe de entrada
   --Recibe de entrada todos los ficheros.
   procedure Aplicar_Hont (
         Fichero_Circuns      : in     Formato_Fcircuns_Io.File_Type;  
         Fichero_Candidaturas : in     Formato_Fcandidat_Io.File_Type; 
         Fichero_Votos        : in     Formato_Fvotos_Io.File_Type     ) is 
   separate;

begin

   --buscamos en el string si es un fichero resultado.
   while I < Largo and Str(I) /= '.' loop
      I := I + 1;
   end loop;

   if Str(I) = '.' then
      --tratamiento fichero resultado
      Fich_Res := True;

      --Abrimos el fichero resultado.
      Formato_Fresult_Io.Open(Fichero_Resultado, In_File,Str(1..Largo));
      Read(Fichero_Resultado, Tabla_Resultado);

      --Copiamos los registros en las variables.
      Circunscripcion := Tabla_Resultado.Circunscripcion;
      Tescaños := Tabla_Resultado.Escaños_Partido;
      Candidaturas := Tabla_Resultado.Candidatura;
      Formato_Fresult_Io.Close(Fichero_Resultado);

   else

      --Si el fichero no es de resultados:
      Fich_Res := False;

      --Abrimos los ficheros de datos.
      Formato_Fcircuns_Io.Open(Fichero_Circuns, In_File,Str(1..Largo));
      Formato_Fcandidat_Io.Open(Fichero_Candidat, In_File, Str(1..Largo)&
         Extension_Candidatura);
      Formato_Fvotos_Io.Open(Fichero_Votos, In_File, Str(1..Largo)&
         Extension_Candidatura&Extension_Votos);

      Aplicar_Hont(Fichero_Circuns, Fichero_Candidat, Fichero_Votos);
      
      Formato_Fcircuns_Io.Close(Fichero_Circuns);
      Close(Fichero_Candidat);
      Close(Fichero_Votos);
      Opciones_Activadas:=True;
   end if;

exception
   when others =>
      Fichero_No_Valido;
      Opciones_Activadas:=False;

end Leer_Ficheros;