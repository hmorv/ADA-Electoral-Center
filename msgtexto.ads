with Adagraph,Botones;
use Adagraph,Botones;

package Msgtexto is

   --Este tipo define un cuadro de diálogo.
   type Trectangulo is 
      record 
         X0,  
         Y0,  
         X1,  
         Y1 : Integer;  
      end record; 

   --Constante con el fondo del cuadro
   Fondo_Por_Defecto : constant Extended_Color_Type := Closest_Color (192, 192, 192);  

   --Los dos botones: Aceptar y Cancelar.
   Baceptar,  
   Bcancelar : Tboton;  

   --Este programa se encarga de visualizar el cuadro de diálogo con los dos botones.
   procedure Mostrar_Mensaje (
         Texto    : in out String;                                  
         Longitud : in out Natural;                                 
         Valido   :    out Boolean;                                 
         Titulo   : in     String;                                  
         Rect     : in     Trectangulo;                             
         Fondo    : in     Extended_Color_Type := Fondo_Por_Defecto ); 

end Msgtexto;