with Ada.Sequential_Io;
package Formato_Datos is

   --Constante que determina el máximo de candidaturas.
   Max_Candidaturas : constant Integer := 9;
   max_can : integer := 9;  

   --Este subtipo define el rango que tendrán los strings.  
   subtype Rango_String is Integer range 1..20;

   --Este subtipo define el rango que tendrán los bimaps.  
   subtype Rango_Bitmap is Integer range 1 .. 32;

   --Definición básica de los tipos:
   type T_Bitmap is array (Rango_Bitmap'range, Rango_Bitmap'range) of Natural; 
   type T_Candidatura is array (Integer range <>) of String (Rango_String'range); 
   type T_Logotipo is array (Integer range <>) of T_Bitmap; 
   type T_Codigo is array (Integer range <>) of Integer; 
   type T_Votos is array (Integer range <>) of Float; 
   type T_Escaños is array (Integer range <>) of Integer; 

   --Este registro define el formato que tendrán los datos de los ficheros de circunscripciones:
   --   El campo Circunscripción, será un string de rango Rango_String.
   --   Las variables Escaños, Numero_Candidaturas y Año son del tipo Positive, y proporcionan datos numéricos acerca de la
   --   circunscripción.
   type Formato_Fcircuns is 
      record 
         Circunscripcion     : String (Rango_String'range);  
         Escaños,  
         Numero_Candidaturas,  
         Año                 : Positive;  
      end record; 

   --Este registro define el formato que tendrán los datos de los ficheros de candidaturas:
   --   El campo Candidatura proporciona una tabla con las candidaturas que habrá disponibles.
   --   El campo Codigo proporciona los códigos numéricos que servirán de identificador para las candidaturas.
   --   El campo Logotipo es una tabla con el tipo T_Bitmap, es decir, con los iconos de cada candidatura.
   --Nótese que los campos están ordenados entre sí, es decir, para un mismo índice I, Candidatura(I) representa una
   --candidatura; Codigo(I), representa el código para Candidatura(I); y por último Logotipo(I) hace referencia tanto a
   --Candidatura(I) como a Codigo(I): 
   type Formato_Fcandidat is 
      record 
         Candidatura : T_Candidatura (1 .. Max_Candidaturas);  
         Codigo      : T_Codigo (1 .. Max_Candidaturas);  
         Logotipo    : T_Logotipo (1 .. Max_Candidaturas);  
      end record; 

   --Este registro define el formato que tendrán los datos de los ficheros de votos:
   --   El campo Candidatura es exactamente igual al del anterior registro.
   --   El campo Codigo es exactamente igual al del anterior registro.
   --   El campo Votos es una tabla con el número de votos que tiene cada candidatura. Los valores de la tabla son números reales.
   type Formato_Fvotos is 
      record 
         Candidatura : T_Candidatura (1 .. Max_Candidaturas);  
         Codigo      : T_Codigo (1 .. Max_Candidaturas);  
         Votos       : T_Votos (1 .. Max_Candidaturas);  
      end record; 

   --Este registro define el formato que tendrán los datos de los ficheros de resultados:
   --   El campo Escaños_Partido es una tabla de con los escaños de cada candidatura.
   --   El campo Candidatura es exactamente igual a los anteriores.
   --   El campo Votos es exactamente igual al del registro Formato_Fvotos.
   type Formato_Fresult is 
      record 
         Escaños_Partido : T_Escaños (1 .. Max_Candidaturas);  
         Candidatura     : T_Candidatura (1 .. Max_Candidaturas);  
         Votos           : T_Votos (1 .. Max_Candidaturas);  
      end record; 
   package Formato_Fresult_Io is new Ada.Sequential_Io(Formato_Fresult);
   package Formato_Fvotos_Io is new Ada.Sequential_Io(Formato_Fresult);
   package Formato_Fcandidat_Io is new Ada.Sequential_Io(Formato_Fresult);
   package Formato_Fcircuns_Io is new Ada.Sequential_Io(Formato_Fresult);

   procedure Crear_Formato_Fcircuns (
         Fcircunscripcion : in out Formato_Fcircuns ); 
   procedure Crear_Formato_Fcandidat (
         Fcandidatura     : in out Formato_Fcandidat; 
         Fcircunscripcion : in out Formato_Fcircuns   ); 
   procedure Crear_Formato_Fvotos (
         Fvotos           : in out Formato_Fvotos;    
         Fcandidatura     : in     Formato_Fcandidat; 
         Fcircunscripcion : in     Formato_Fcircuns   ); 
   procedure Leer_Ficheros (
         Fcircunscripcion : in out Formato_Fcircuns;  
         Fcandidatura     : in out Formato_Fcandidat; 
         Fvotos           : in out Formato_Fvotos     ); 


end Formato_Datos;