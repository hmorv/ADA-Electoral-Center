with Ada.Sequential_Io;
package Formato_Ficheros is

   --Constante que determina el máximo de candidaturas.

   Max_Candidaturas : constant Integer := 9;  
   Max_Can          :          Integer := 10;  

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

   type Tabla_Escaños is array (Integer range <>, Integer range <>) of Integer; 

   --Variables globales.
   Tescaños        : Tabla_Escaños (1 .. 2, 1 .. 80);  
   Circunscripcion : Formato_Fcircuns;  
   Candidaturas    : Formato_Fcandidat;  
   Votos           : Formato_Fvotos;  

   --Este registro define el formato que tendrán los datos de los ficheros de resultados:
   --   El campo Escaños_Partido es una tabla de con los escaños de cada candidatura.
   --   El campo Candidatura es exactamente igual a los anteriores.
   --   El campo Votos es exactamente igual al del registro Formato_Fvotos.
   type Formato_Fresult is 
      record 
         Escaños_Partido : Tabla_Escaños (1 .. 2, 1 .. 80);  
         Circunscripcion : Formato_Fcircuns;  
         Candidatura     : Formato_Fcandidat;  
         Votos           : Formato_Fvotos;  
      end record; 

   Tabla_Resultado : Formato_Fresult;  

   --Creamos los genéricos para leer cada tipo de fichero.
   package Formato_Fcircuns_Io is new Ada.Sequential_Io(
      Formato_Fcircuns);
   package Formato_Fcandidat_Io is new Ada.Sequential_Io(
      Formato_Fcandidat);
   package Formato_Fvotos_Io is new Ada.Sequential_Io(Formato_Fvotos);
   package Formato_Fresult_Io is new Ada.Sequential_Io(
      Formato_Fresult);

   --Damos la orden de implementar los genéricos.
   use   Formato_Fcircuns_Io,  
   Formato_Fcandidat_Io,  
   Formato_Fvotos_Io,  
   Formato_Fresult_Io;  

   --Definimos los tipos de ficheros a partir de los paquetes definidos antes.
   Fichero_Circuns   : Formato_Fcircuns_Io.File_Type;  
   Fichero_Candidat  : Formato_Fcandidat_Io.File_Type;  
   Fichero_Votos     : Formato_Fvotos_Io.File_Type;  
   Fichero_Resultado : Formato_Fresult_Io.File_Type;  

   --Este programa se encarga de leer los ficheros de datos. Los parámetros son:
   --   Votos, Circunscripcion, Candidaturas serán los ficheros.
   --   T_Escaños es la tabla donde quedan las candidaturas ordenadas según los escaños que tengan.
   --   Str es un string que servirá de nombre para los ficheros.
   --   Largo almacena la longitud del string con el nombre introducido.
   procedure Leer_Ficheros (
         Votos              :    out Formato_Fvotos;    
         Circunscripcion    :    out Formato_Fcircuns;  
         Candidaturas       :    out Formato_Fcandidat; 
         T_Escaños          :    out Tabla_Escaños;     
         Str                : in     String;            
         Largo              : in out Integer;           
         Opciones_Activadas :    out Boolean            ); 
end Formato_Ficheros;