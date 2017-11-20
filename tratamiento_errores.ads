package Tratamiento_Errores is

   --Declaramos las excepciones que pueden ocurrir durante la ejecucion del programa.
   Resolucion_Demasiado_Baja : exception;  

   --Este procedimiento controla el programa cuando la resoluci�n del monitor es inferior a 640X480, lo cual
   --har�a que los botones quedaran sobredimensionados.
   procedure Error_Resolucion; 
   
   --Este procedimiento visualiza un mensaje indicando que el nombre de fichero o es incorrecto o simplemente no existe.
   procedure Fichero_No_Valido; 


   pragma Inline (Error_Resolucion);


end Tratamiento_Errores;