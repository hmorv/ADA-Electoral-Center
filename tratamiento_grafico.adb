with Botones, Formato_Ficheros, Adagraph, Msgtexto, Tratamiento_Errores, Ada.Numerics.Elementary_Functions;
use Botones, Formato_Ficheros, Adagraph, Msgtexto, Tratamiento_Errores, Ada.Numerics.Elementary_Functions;

package body Tratamiento_Grafico is


   procedure Inicializar_Ventana (
         Xmax,                 
         Ymax : in     Integer ) is 
   separate;


   procedure Interaccion_Usuario_Programa (
         Xmax,                 
         Ymax : in     Integer ) is 
   separate;


   procedure Captar_Nombre_Fichero (
         Xmax,                    
         Ymax   : in     Integer; 
         Str    :    out String;  
         Largo  :    out Integer; 
         Valido :    out Boolean  ) is 
   separate;


   procedure Visualizar_Grafica (
         Xmax,                                     
         Ymax            : in     Integer;         
         Circunscripcion : in     Formato_Fcircuns ) is 
   separate;

   procedure Comprobar_Resolucion (
         Xmax : in     Integer ) is 
   begin
      if Xmax <= 640 then
         raise Resolucion_Demasiado_Baja;
      end if;
   end Comprobar_Resolucion;


   procedure Visualizar_Tabla (
         Xmax,                 
         Ymax : in     Integer ) is 
   separate;

   procedure Visualizar_Comparativa (
         Xmax,                 
         Ymax : in     Integer ) is 
   separate;

   procedure Limpiar_Ventana (
         Xmax,                 
         Ymax : in     Integer ) is 
   begin
      Draw_Box(16*Xmax/100+5,5,Xmax-5,Ymax-5,White,True);
   end Limpiar_Ventana;
end Tratamiento_Grafico;