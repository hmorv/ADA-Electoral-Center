with Ada.Sequential_Io,Ada.Text_Io,
   Formato_Datos;
use Ada.Text_Io,Formato_Datos;

procedure Crear_Archivos_Secuenciales is 
   package Formato_Fcircuns_Io is new Ada.Sequential_Io(Formato_Fcircuns);
   package Formato_Fcandidat_Io is new Ada.Sequential_Io(
      Formato_Fcandidat);
   package Formato_Fvotos_Io is new Ada.Sequential_Io(Formato_Fvotos);
   use   Formato_Fcircuns_Io,  
   Formato_Fcandidat_Io,  
   Formato_Fvotos_Io;  

   Fichero_Circuns      : Formato_Fcircuns_Io.File_Type;  
   Fichero_Candidaturas : Formato_Fcandidat_Io.File_Type;  
   Fichero_Votos        : Formato_Fvotos_Io.File_Type;  

   Maximo          : Integer           := 20;  
   Nombre_Circuns  : String (1 .. 20);  
   Circunscripcion : Formato_Fcircuns;  
   Candidatura     : Formato_Fcandidat;  
   Votos           : Formato_Fvotos;  


begin

   Nombre_Circuns:=(others=>' ');
   Put_Line("introduce el nombre del fichero de circunscripcion");
   Get_Line(Nombre_Circuns,Maximo);
   Put_Line("el nombre que has cogido es  "&Nombre_Circuns(1..Maximo)&
      "   y longitud "&Maximo'Img);
   New_Line;
   Create(Fichero_Circuns,Out_File,Nombre_Circuns(1..Maximo));
   Crear_Formato_Fcircuns (Circunscripcion);
   Write(Fichero_Circuns,Circunscripcion);
   -------------------------------------------
   Create(Fichero_Candidaturas,Out_File,Nombre_Circuns(1..Maximo)&
      ".candidaturas");
   Crear_Formato_Fcandidat (Candidatura,Circunscripcion);
   Write(Fichero_Candidaturas,Candidatura);
   --------------------------------------------
   Create(Fichero_Votos,Out_File,Nombre_Circuns(1..Maximo)&
      ".candidaturas.votos");
   Crear_Formato_Fvotos(Votos ,Candidatura,Circunscripcion) ;
   Write(Fichero_Votos,Votos);
   Reset(Fichero_Circuns,In_File);
   Reset(Fichero_Candidaturas,In_File);
   Reset(Fichero_Votos,In_File);
   while not End_Of_File(Fichero_Circuns) loop
      Read(Fichero_Circuns,Circunscripcion);
      Read(Fichero_Candidaturas,Candidatura);
      Read(Fichero_Votos,Votos);
      Leer_Ficheros (Circunscripcion,Candidatura,Votos);
   end loop;
   
exception
   when others => put_line("DATO INCORRECTO!");
end Crear_Archivos_Secuenciales;
 