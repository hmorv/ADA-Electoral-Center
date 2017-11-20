with Botones, Formato_Ficheros;
use Botones, Formato_Ficheros;


package Tratamiento_Grafico is

   --Variables para determinar la resolución de la pantalla.
   Xmax,  
   Ymax : Integer;  

   --Botones con las distintas opciones que podrá utilizar el usuario.
   Bleer_Fichero,  
   Bleer_Fichero_Resultado,  
   Bcomparar,  
   Bguardar,  
   Bsalir,  
   Bgrafica,  
   Btablas                 : Tboton;  

   --Este procedimiento inicializa toda la ventana.
   procedure Inicializar_Ventana (
         Xmax,                 
         Ymax : in     Integer ); 


   --Este procedimiento se encarga de leer del teclado el nombre de un fichero. 
   procedure Captar_Nombre_Fichero (
         Xmax,                    
         Ymax   : in     Integer; 
         Str    :    out String;  
         Largo  :    out Integer; 
         Valido :    out Boolean  ); 


   --Este procedimiento se encarga de gestionar la interacción del usuario con el programa.
   --Averigua si se pulsa un botón, y llama al programa adecuado.
   procedure Interaccion_Usuario_Programa (
         Xmax,                 
         Ymax : in     Integer ); 


   --Este programa se encarga de mostrar la gráfica con el porcentaje de escaños asignados a cada candidatura.
   procedure Visualizar_Grafica (
         Xmax,                                     
         Ymax            : in     Integer;         
         Circunscripcion : in     Formato_Fcircuns ); 

   --Este programa se encarga de comprobar que la resolución de la pantalla no sea demasiado baja.
   procedure Comprobar_Resolucion (
         Xmax : in     Integer ); 


   --Este programa se encarga de mostrar una tabla con las candidaturas y los escaños asignados.
   procedure Visualizar_Tabla (
         Xmax,                 
         Ymax : in     Integer ); 


   --Este procedimiento se encarga de mostrar una gráfica comparativa de dos ficheros distintos.
   procedure Visualizar_Comparativa (
         Xmax,                 
         Ymax : in     Integer ); 


   --Con este programa limpiamos el área de datos de la pantalla.
   procedure Limpiar_Ventana (
         Xmax,                 
         Ymax : in     Integer ); 

   pragma Inline (Comprobar_Resolucion, Limpiar_Ventana);

end Tratamiento_Grafico;