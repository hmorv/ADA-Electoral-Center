with Adagraph;
use Adagraph;

package Botones is

   type Tboton is private; 

   --Esta variable determina si el bot�n ha sido pulsado correctamente. 
   Boton_Pulsado_Correctamente : Boolean := False;  


   --Este tipo tiene dos valores, Soltado y Pulsado, refiri�ndose al estado del bot�n del rat�n.
   type Estado_Boton is 
         (Soltado, 
          Pulsado); 

   --Definimos como constantes los colores que tendr�n por defecto los botones.
   Color_Pulsado_Defecto : constant Extended_Color_Type := Closest_Color (128, 128, 128);  
   Color_Soltado_Defecto : constant Extended_Color_Type := Closest_Color (192, 192, 192);  
   Color_Texto_Defecto   : constant Extended_Color_Type := Black;  

   --Este procedimiento crea un bot�n. Para ello le tenemos que suministrar unos par�metros m�nimos:
   --   Una variable del tipo Tboton.
   --   El texto que tenga en su interior.
   --   La posici�n donde ser� creado.
   --   Los colores, que por defecto ser�n las constantes anteriores.
   procedure Crear_Boton (
         Boton         :    out Tboton;                                       
         Texto         : in     String;                                       
         X,                                                                   
         Y             : in     Positive;                                     
         Color_Texto   : in     Extended_Color_Type := Color_Texto_Defecto;   
         Color_Soltado : in     Extended_Color_Type := Color_Soltado_Defecto; 
         Color_Pulsado : in     Extended_Color_Type := Color_Pulsado_Defecto  ); 

   --Este procedimiento dibuja un bot�n de dos formas distintas: pulsado o no pulsado.
   --Para ello empleamos el tipo Estado_Boton.
   procedure Pintar_Boton (
         Boton  : in     Tboton;                 
         Estado : in     Estado_Boton := Soltado ); 

   --Esta funci�n devuelve un valor booleano, indicando si el cursor del rat�n est� dentro de un bot�n.
   function Punto_En_Boton (
         Boton : in     Tboton; 
         X,                     
         Y     : in     Integer ) 
     return Boolean; 

   --Las funciones amplitud y altura devuelven los valores correspondientes de un bot�n determinado.
   function Amplitud (
         Boton : in     Tboton ) 
     return Natural; 
   function Altura (
         Boton : in     Tboton ) 
     return Natural; 

   --Este procedimiento, aunque parezca que poco tiene que ver con la especificaci�n del package,
   --es conveniente declaralo aqu�, ya que controla lo que el usuario hace mientras mantiene
   --el bot�n del rat�n pulsado.
   procedure Esperar; 


   --Este procedimiento controlar� que el bot�n sea pulsado de manera correctamente.
   procedure Tratamiento_Boton (
         Boton                       : in     Tboton;  
         X,                                            
         Y                           : in out Integer; 
         Boton_Pulsado_Correctamente :    out Boolean  ); 


private

   --Constante que determina la longitud m�xima que tendr� el texto de un bot�n.
   Max_Nombre : constant Integer := 100;  

   type Tboton is 
      record 
         X0,  
         Y0,  
         X1,  
         Y1              : Positive;  
         Nombre          : String (1 .. Max_Nombre);  
         Longitud_Nombre : Integer;  
         Color_Texto,  
         Color_Soltado,  
         Color_Pulsado   : Extended_Color_Type;  
      end record; 

   --Mandamos la directiva Inline al compilador para el procedimiento Esperar.
   --De este modo ahorramos el tiempo de llamada al procedimiento ya que �ste tiene un cuerpo muy peque�o.
   pragma Inline (Esperar);

end Botones;