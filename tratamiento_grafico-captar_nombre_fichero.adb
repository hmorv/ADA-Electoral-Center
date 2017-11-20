separate (Tratamiento_Grafico)
procedure Captar_Nombre_Fichero (
      Xmax,                    
      Ymax   : in     Integer; 
      Str    :    out String;  
      Largo  :    out Integer; 
      Valido :    out Boolean  ) is 
   Texto       :          String (1 .. 20);  
   Longitud    :          Integer          := 0;  
   Mensaje     :          String           := "Introduce el nombre del fichero";  
   Posicion_X0 : constant Integer          := ((16 * Xmax) / 100) + (Xmax - (16 * Xmax) / 100 - 32 * Get_Font_Width) / 2;  
   Posicion_Y0 : constant Integer          := (Ymax - 103) / 2;  
   Posicion_X1 : constant Integer          := ((16 * Xmax) / 100) + (Xmax - (16 * Xmax) / 100 - 32 * Get_Font_Width) / 2 + (32 * Get_Font_Width);  
   Posicion_Y1 : constant Integer          := (Ymax - 103) / 2 + 103;  
   Rectangulo  :          Trectangulo      := (Posicion_X0, Posicion_Y0, Posicion_X1, Posicion_Y1);  
begin

   --Mostramos el cuadro de diálogo donde le pedimos al usuario que introduzca el nombre de fichero.
   Mostrar_Mensaje(Texto, Longitud, Valido, Mensaje, Rectangulo);

   --Almacenamos el nombre de fichero y su longitud.
   Largo:=Longitud;
   Str := Texto;
end Captar_Nombre_Fichero;