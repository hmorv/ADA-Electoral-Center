with Ada.Text_Io, Adagraph, tratamiento_Grafico;
use Ada.Text_Io, Adagraph, tratamiento_grafico;
package body Tratamiento_Errores is

   procedure Error_Resolucion is 
   begin
      Put_Line("ERROR. RESOLUCION DEMASIADO BAJA!.");
      Put_Line(
         "La resolucion no puede ser inferior a 640x480");
   end Error_Resolucion;

   procedure Fichero_No_Valido  is 

      Mensaje_Fichero_No_Valido : constant String := "NOMBRE DE FICHERO NO VALIDO.";  

   begin
      Display_Text((58*Xmax)/100-14*Get_Font_Width,Ymax/2,Mensaje_Fichero_No_Valido, light_red);     
      Display_Text((58*xmax)/100-14*get_font_width+1,ymax/2,mensaje_fichero_no_valido, light_Red);
   end Fichero_No_Valido;

end Tratamiento_Errores;