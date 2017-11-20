With Ada.Sequential_Io,Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io;
Use Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io;
Package Body Formato_Datos Is

   Procedure Crear_Formato_Fcircuns (
         Fcircunscripcion : In Out Formato_Fcircuns ) Is 
   Begin
      Fcircunscripcion.Circunscripcion:="                    ";
      Put_Line("vamos a crear una circunscripcion");
      Put_Line("introducir el nombre de la circunscripcion");
      Get_Line(Fcircunscripcion.Circunscripcion,Max_Can);
      Put("     "&Fcircunscripcion.Circunscripcion);
      Put_Line("¿cuantos escanyos tiene   "&
         Fcircunscripcion.Circunscripcion&"?");
      Get(Fcircunscripcion.Escaños);
      Put_Line(Fcircunscripcion.Escaños'Img&"escanyos");
      Put_Line("De que anyo son la elecciones en "&
         Fcircunscripcion.Circunscripcion&"?");
      Get(Fcircunscripcion.Año);
      Put_Line(
         "introducir el numero de candidaturas que va ha tener la circunscripcion el anyo "&
         Fcircunscripcion.Año'Img);
      Put_Line("no pueden  haber mas de 20 candidaturas");
      Get(Fcircunscripcion.Numero_Candidaturas);
      New_Line;
      While Fcircunscripcion.Numero_Candidaturas<=0 Or
            Fcircunscripcion.Numero_Candidaturas>20 Loop
         Get(Fcircunscripcion.Numero_Candidaturas);
         New_Line;
         Put_Line("ese valor no me vale . vuelve a introducirlo");
      End Loop;
      Skip_Line;
      New_Line;
   End Crear_Formato_Fcircuns;

   Procedure Crear_Formato_Fcandidat (
         Fcandidatura     : In Out Formato_Fcandidat; 
         Fcircunscripcion : In Out Formato_Fcircuns   ) Is 
      Codigo,  
      Numero_Logo         : Integer;  
      Candidatura,  
      Nombre_Fichero_Logo : String (1 .. 20);  
      Fichero             : Ada.Text_Io.File_Type;  
      Icono               : T_Bitmap;  
   Begin

      Candidatura:=(Others=>' ');
      For I In 1..Fcircunscripcion.Numero_Candidaturas Loop
         Put_Line("introducir candidatura numero"&I'Img);
         Get_Line(Candidatura,Max_Can);
         New_Line;
         Fcandidatura.Candidatura(I):=Candidatura;
         Candidatura:=(Others=>' ');
         Put_Line("introducir codigo numero"&I'Img);
         Get(Codigo);
         New_Line;
         Fcandidatura.Codigo(I):=Codigo;
         Skip_Line;
         Put_Line(
            "introduce el nombre del fichero de texto de donde he de coger el logotipo");
         Get_Line(Nombre_Fichero_Logo,Max_Can);
         Open(Fichero,In_File,Nombre_Fichero_Logo(1..Max_Can));
         For J In Rango_Bitmap Loop
            For K In Rango_Bitmap Loop
               Get(Fichero,Numero_Logo);
               Icono(J,K):=Numero_Logo;
            End Loop;
         End Loop;
         Close(Fichero);
         Fcandidatura.Logotipo(I):=Icono;
      End Loop;
   End Crear_Formato_Fcandidat;

   Procedure Crear_Formato_Fvotos (
         Fvotos           : In Out Formato_Fvotos;    
         Fcandidatura     : In     Formato_Fcandidat; 
         Fcircunscripcion : In     Formato_Fcircuns   ) Is 
      Votos : Float;  
   Begin
      For I In 1..Fcircunscripcion.Numero_Candidaturas Loop
         Fvotos.Candidatura(I):=Fcandidatura.Candidatura(I);
         Fvotos.Codigo(I):=Fcandidatura.Codigo(I);
         Put("introducir el numero de votos de la candidatura  ");
         Put(Fcandidatura.Candidatura(I));
         New_Line;
         Get(Votos);
         Fvotos.Votos(I):=Votos;
      End Loop;
   End Crear_Formato_Fvotos;
 
   Procedure Leer_Ficheros (
         Fcircunscripcion : In Out Formato_Fcircuns;  
         Fcandidatura     : In Out Formato_Fcandidat; 
         Fvotos           : In Out Formato_Fvotos     ) Is 
      Icono : T_Bitmap;  
   Begin
      Put_Line("datos cicunscripcion");
      Put_Line("circunscripcion : " &Fcircunscripcion.Circunscripcion );
      Put_Line("escanyos : " &Fcircunscripcion.Escaños'Img);
      Put_Line("anyo : "&Fcircunscripcion.Año'Img);
      Put_Line("numero de candidaturas presentadas : "&
         Fcircunscripcion.Numero_Candidaturas'Img);
      Put_Line("datos candidaturas:");
      For I In 1..Fcircunscripcion.Numero_Candidaturas Loop
         Put_Line("candidatura: "&Fcandidatura.Candidatura(I)&
            "   codigo : "&Fcandidatura.Codigo(I)'Img);
         Put("numeros del logotipo :");
         Icono:=Fcandidatura.Logotipo(I);
         For J In Rango_Bitmap Loop
            New_Line;
            For K In Rango_Bitmap Loop
               Put(Icono(J,K)'Img);
            End Loop;
         End Loop;
      End Loop;
      New_Line;
      Put_Line("datos votos: ");
      For I In 1..Fcircunscripcion.Numero_Candidaturas Loop
         Put_Line("candidatura "&Fvotos.Candidatura(I)&"   votos : "&
            Fvotos.Votos(I)'Img);
      End Loop;
   End Leer_Ficheros;

End Formato_Datos;