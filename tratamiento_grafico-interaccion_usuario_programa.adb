separate (Tratamiento_Grafico)

procedure Interaccion_Usuario_Programa (

      --Este procedimiento se encarga de controlar lo que el usuario hace:
      --   Si pulsa un botón, el programa determina si lo ha pulsado correctamente,
      --   y determina qué botón ha pulsado.
      --   Controla si hay cargado un fichero de datos, ya que si no hay ninguno,
      --   no tiene sentido que el programa principal haga nada cuando se pulse
      --   el botón de tablas o gráficas.
      --El programa recibe como parámetros las dimensiones de la ventana gráfica.
      Xmax,                 
      Ymax : in     Integer ) is 

   --Esta variable almacena la longitud del nombre de fichero.
   Longitud_Nombre_Fichero : Integer;  

   --Esta booleana nos indica si el usuario ha introducido correctamente un nombre de fichero.
   --Es decir, si no le ha dado al botón cancelar.
   Nombre_Correcto : Boolean;  

   --Esta variable recoge el nombre del fichero.
   Str : String (1 .. 20);  

   --Salir indica si el usuario ha pulsado el botón Salir. Si lo ha hecho, finalizará el bucle.
   Salir : Boolean := False;  

   --Esta constante servirá de mensaje para el usuario, aclárandole en caso de que pulse
   --el botón Tabla o Grafica, que no hay ningún fichero cargado.
   Mensaje : constant String := "NO HAY NINGUN FICHERO CARGADO.";  

   --Este tipo enumerado nos dirá qué botón ha sido pulsado.
   --En caso de que el usuario no haya pulsado ningún botón, el valor conveniente será "Nada_Pulsado".
   type Que_Boton is 
         (Boton_Leer_Fichero, 
          Boton_Grafica,      
          Boton_Tabla,        
          Boton_Comparar,     
          Boton_Guardar,      
          Boton_Salir,        
          Nada_Pulsado); 

   --Variable del tipo anterior.
   B_Pulsado : Que_Boton;  

   --Esta booleana sirve para que el programa sepa si hay un fichero de datos cargado. 
   Opciones_Activadas : Boolean := False;  

   procedure Determinar_Boton (
         --Este procedimiento se encarga de averiguar si se ha pulsado un botón, y asignar al parámetro
         --qué botón ha sido pulsado.
         B_Pulsado :    out Que_Boton ) is 
   separate;

   Fichero_Resultado : Formato_Fresult_Io.File_Type;  
   --   Tabla_Resultado   : Formato_Fresult;  
begin

   loop

      --Averiguamos si el usuario ha pulsado algún botón, y cuál ha sido.
      Determinar_Boton(B_Pulsado);
      case B_Pulsado is
         --Cuando el usuario pulse el botón Leer Fichero:
         when Boton_Leer_Fichero =>

            --Limpiamos la ventana de mensajes y datos anteriores.
            Limpiar_Ventana(Xmax,Ymax);

            --Captamos el nombre del fichero que escribe el usuario.
            Captar_Nombre_Fichero(Xmax, Ymax, Str, Longitud_Nombre_Fichero,
               Nombre_Correcto);

            --Abrimos los ficheros secuenciales con el nombre que el usuario ha introducido.
            if Nombre_Correcto then

               --Recogemos los datos necesarios de los ficheros y generamos los resultados.
               Leer_Ficheros(Votos, Circunscripcion, Candidaturas,
                  Tescaños,Str,Longitud_Nombre_Fichero,Opciones_Activadas);

               --Indicamos con esta booleana que los botones Grafica y Tabla pueden ser utilizados.
               if Opciones_Activadas then

                  --Mostramos un mensaje indicando que el fichero ha sido cargado con éxito.
                  Display_Text((58*Xmax)/100-13*Get_Font_Width, Ymax/2,
                     "FICHERO CARGADO CON ÉXITO");
                  Display_Text((58*Xmax)/100-13*Get_Font_Width+1, Ymax/2,
                     "FICHERO CARGADO CON ÉXITO.");
               else
                  Opciones_Activadas := False;
               end if;
            end if;

         --Limpiamos la ventana, ya que hemos escrito un cuadro de diálogo.
         when Boton_Grafica =>
            Limpiar_Ventana(Xmax,Ymax);

            --Limpiamos la ventana de mensajes y datos anteriores.
            if Opciones_Activadas then

               --Si las opciones están activadas (si se ha leído con éxito un fichero,
               --seguimos adelante.
               Visualizar_Grafica(Xmax, Ymax, Circunscripcion);
            else
               Display_Text(58*Xmax/100-(8*Get_Font_Width),Ymax/2,
                  Mensaje);
               Display_Text(58*Xmax/100-(8*Get_Font_Width)+1,Ymax/2,
                  Mensaje);

            end if;
         when Boton_Tabla =>
            Limpiar_Ventana(Xmax,Ymax);
            if Opciones_Activadas then
               Visualizar_Tabla(Xmax, Ymax);
            else
               Display_Text(58*Xmax/100-(8*Get_Font_Width),Ymax/2,
                  Mensaje);
               Display_Text(58*Xmax/100-(8*Get_Font_Width)+1,Ymax/2,
                  Mensaje);

            end if;
         when Boton_Comparar =>
            
            Visualizar_Comparativa(Xmax,Ymax);
            
         when Boton_Guardar =>
               
               Limpiar_Ventana(Xmax,Ymax);

            if Opciones_Activadas then
         
            
               --Si hay un fichero leído, copiamos en el registro de resultados las variables que hemos cargado de los ficheros.
               Formato_Fresult_Io.Create(Fichero_Resultado,
                  Formato_Fresult_Io.Out_File,Str(1..
                     Longitud_Nombre_Fichero)&".res");
               Tabla_Resultado.Circunscripcion := Circunscripcion;
               Tabla_Resultado.Candidatura:=Candidaturas;
               Tabla_Resultado.Votos:=Votos;
               Tabla_Resultado.Escaños_Partido:=Tescaños;

               --Escribimos el registro en el fichero.
               Formato_Fresult_Io.Write(Fichero_Resultado,Tabla_Resultado);
               Formato_Fresult_Io.Close(Fichero_Resultado);
            else
               Display_Text(58*Xmax/100-(8*Get_Font_Width),Ymax/2,
                  Mensaje,Black);
               Display_Text(58*Xmax/100-(8*Get_Font_Width)+1,Ymax/2,
                  Mensaje);

            end if;
         when Boton_Salir =>

            --Si el botón salir ha sido pulsado, salimos del programa.
            Salir := True;
         when Nada_Pulsado =>

            --Si el usuario no ha pulsado nada, no hacemos nada.
            null;
      end case;
      exit when Salir;
   end loop;
end Interaccion_Usuario_Programa;