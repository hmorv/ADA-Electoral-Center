package body Botones is

   --Esta constante define el margen entre las letras y el borde del botón.
   Margen : constant Integer := 7;  

   --Constantes para definir los colores del relieve de los botones.
   Color_Claro  : constant Extended_Color_Type := Closest_Color (240, 240, 240);  
   Color_Oscuro : constant Extended_Color_Type := Closest_Color (64, 64, 64);  

   --Este procedimiento crea un botón.
   procedure Crear_Boton (
         Boton         :    out Tboton;                                       
         Texto         : in     String;                                       
         X,                                                                   
         Y             : in     Positive;                                     
         Color_Texto   : in     Extended_Color_Type := Color_Texto_Defecto;   
         Color_Soltado : in     Extended_Color_Type := Color_Soltado_Defecto; 
         Color_Pulsado : in     Extended_Color_Type := Color_Pulsado_Defecto  ) is 

      --Esta variable almacena la longitud del string que llevará el botón como nombre.
      Longitud : Positive := Texto'Last - Texto'First + 1;  

   begin

      --Comprobamos que la longitud del texto quepa en el botón. En caso contrario, lo recortamos.
      if Longitud > Boton.Nombre'Last then
         Longitud := Boton.Nombre'Last;
      end if;

      --Copiamos el string al nombre del botón.
      Boton.Longitud_Nombre := Longitud;
      Boton.Nombre(1..Longitud) := Texto(Texto'First..Texto'First+
         Longitud-1);

      --Creamos los bordes del botón
      Boton.X0 := X;
      Boton.Y0 := Y;
      Boton.X1 := Boton.X0 + 2 * Margen + Get_Font_Width * Longitud;
      Boton.Y1 := Boton.Y0 + 2 * Margen + Get_Font_Height;

      --Asignamos los colores
      Boton.Color_Texto := Color_Texto;
      Boton.Color_Soltado := Color_Soltado;
      Boton.Color_Pulsado := Color_Pulsado;
   end Crear_Boton;


   --Este procedimiento dibuja el botón en pantalla, dependiendo del estado (soltado o pulsado).
   procedure Pintar_Boton (
         Boton  : in     Tboton;                 
         Estado : in     Estado_Boton := Soltado ) is 

      --Estas variables son los colores del botón, dependiendo del estado.
      Sup,  
      Inf,  
      Fondo : Extended_Color_Type;  

      --Estas dos variables determinan la posición del botón.
      Xt,  
      Yt : Positive;  

   begin

      --Según el estado del boton, definimos los parámetros de un modo o de otro.
      if Estado = Soltado then
         Fondo := Boton.Color_Soltado;
         Sup := Color_Claro;
         Inf := Color_Oscuro;
         Xt := Boton.X0+Margen;
         Yt := Boton.Y0+Margen;
      else
         Fondo := Boton.Color_Pulsado;
         Sup := Color_Oscuro;
         Inf := Color_Claro;
         Xt := Boton.X0+Margen+1;
         Yt := Boton.Y0+Margen-1;
      end if;

      --Dibujamos el boton con los parámetros definidos en la condición anterior.
      Draw_Box(Boton.X0, Boton.Y0, Boton.X1, Boton.Y1, Fondo, True);

      Draw_Line(Boton.X0  , Boton.Y0  , Boton.X0  , Boton.Y1  , Sup);
      Draw_Line(Boton.X0+1, Boton.Y0+1, Boton.X0+1, Boton.Y1  , Sup);
      Draw_Line(Boton.X0+2, Boton.Y1  , Boton.X1  , Boton.Y1  , Sup);
      Draw_Line(Boton.X0+2, Boton.Y1-1, Boton.X1-1, Boton.Y1-1, Sup);

      Draw_Line(Boton.X0+1, Boton.Y0  , Boton.X1  , Boton.Y0  , Inf);
      Draw_Line(Boton.X0+2, Boton.Y0+1, Boton.X1  , Boton.Y0+1, Inf);
      Draw_Line(Boton.X1  , Boton.Y0+2, Boton.X1  , Boton.Y1-1, Inf);
      Draw_Line(Boton.X1-1, Boton.Y0+2, Boton.X1-1, Boton.Y1-2, Inf);

      Display_Text(Xt, Yt, Boton.Nombre(1..Boton.Longitud_Nombre),
         Boton.Color_Texto);

   end Pintar_Boton;


   --Esta función nos dirá si el cursor del ratón está en el botón o no.
   function Punto_En_Boton (
         Boton : in     Tboton; 
         X,                     
         Y     : in     Integer ) 
     return Boolean is 

   begin

      --Devolvemos el valor booleano verdadero si las coordenadas del ratón están dentro del área del botón.
      return Boton.X0 <= X and X <= Boton.X1 and
         Boton.Y0 <= Y and Y <= Boton.Y1;
   end Punto_En_Boton;


   --Esta función nos devuelve la amplitud del botón.
   function Amplitud (
         Boton : in     Tboton ) 
     return Natural is 

   begin

      return Boton.X1 - Boton.X0 + 1;
   end Amplitud;


   --Esta otra función nos devuelve la altura del botón.
   function Altura (
         Boton : in     Tboton ) 
     return Natural is 

   begin

      return Boton.Y1 - Boton.Y0 + 1;
   end Altura;


   --Este procedimiento controla si se pulsa el botón del ratón.
   procedure Esperar is 

   begin

      Wait_For_Mouse_Button(Left_Button);
   end Esperar;

   --Este procedimiento controla si se pulsa correctamente un botón.
   procedure Tratamiento_Boton (
         Boton                       : in     Tboton;  
         X,                                            
         Y                           : in out Integer; 
         Boton_Pulsado_Correctamente :    out Boolean  ) is 

   begin

      --En su estado inicial, el botón no está pulsado correctamente.
      Boton_Pulsado_Correctamente := False;
      Pintar_Boton(Boton, Pulsado);
      Esperar;
      Get_Mouse_Location (X, Y);

      --Si el puntero del ratón sigue dentro del área del botón cuando el usuario suelta el botón,
      --entonCes el botón ha sido pulsado correctamente.
      if Punto_En_Boton(Boton, X, Y) then
         Boton_Pulsado_Correctamente := True;
      end if;

      --Devolvemos el estado normal al botón.
      Pintar_Boton(Boton, Soltado);
   end Tratamiento_Boton;


end Botones;