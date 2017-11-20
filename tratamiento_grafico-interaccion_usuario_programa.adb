separate (Tratamiento_Grafico)

procedure Interaccion_Usuario_Programa (

      --Este procedimiento se encarga de controlar lo que el usuario hace:
      --   Si pulsa un bot�n, el programa determina si lo ha pulsado correctamente,
      --   y determina qu� bot�n ha pulsado.
      --   Controla si hay cargado un fichero de datos, ya que si no hay ninguno,
      --   no tiene sentido que el programa principal haga nada cuando se pulse
      --   el bot�n de tablas o gr�ficas.
      --El programa recibe como par�metros las dimensiones de la ventana gr�fica.
      Xmax,                 
      Ymax : in     Integer ) is 

   --Esta variable almacena la longitud del nombre de fichero.
   Longitud_Nombre_Fichero : Integer;  

   --Esta booleana nos indica si el usuario ha introducido correctamente un nombre de fichero.
   --Es decir, si no le ha dado al bot�n cancelar.
   Nombre_Correcto : Boolean;  

   --Esta variable recoge el nombre del fichero.
   Str : String (1 .. 20);  

   --Salir indica si el usuario ha pulsado el bot�n Salir. Si lo ha hecho, finalizar� el bucle.
   Salir : Boolean := False;  

   --Esta constante servir� de mensaje para el usuario, acl�randole en caso de que pulse
   --el bot�n Tabla o Grafica, que no hay ning�n fichero cargado.
   Mensaje : constant String := "NO HAY NINGUN FICHERO CARGADO.";  

   --Este tipo enumerado nos dir� qu� bot�n ha sido pulsado.
   --En caso de que el usuario no haya pulsado ning�n bot�n, el valor conveniente ser� "Nada_Pulsado".
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
         --Este procedimiento se encarga de averiguar si se ha pulsado un bot�n, y asignar al par�metro
         --qu� bot�n ha sido pulsado.
         B_Pulsado :    out Que_Boton ) is 
   separate;

   Fichero_Resultado : Formato_Fresult_Io.File_Type;  
   --   Tabla_Resultado   : Formato_Fresult;  
begin

   loop

      --Averiguamos si el usuario ha pulsado alg�n bot�n, y cu�l ha sido.
      Determinar_Boton(B_Pulsado);
      case B_Pulsado is
         --Cuando el usuario pulse el bot�n Leer Fichero:
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
                  Tesca�os,Str,Longitud_Nombre_Fichero,Opciones_Activadas);

               --Indicamos con esta booleana que los botones Grafica y Tabla pueden ser utilizados.
               if Opciones_Activadas then

                  --Mostramos un mensaje indicando que el fichero ha sido cargado con �xito.
                  Display_Text((58*Xmax)/100-13*Get_Font_Width, Ymax/2,
                     "FICHERO CARGADO CON �XITO");
                  Display_Text((58*Xmax)/100-13*Get_Font_Width+1, Ymax/2,
                     "FICHERO CARGADO CON �XITO.");
               else
                  Opciones_Activadas := False;
               end if;
            end if;

         --Limpiamos la ventana, ya que hemos escrito un cuadro de di�logo.
         when Boton_Grafica =>
            Limpiar_Ventana(Xmax,Ymax);

            --Limpiamos la ventana de mensajes y datos anteriores.
            if Opciones_Activadas then

               --Si las opciones est�n activadas (si se ha le�do con �xito un fichero,
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
         
            
               --Si hay un fichero le�do, copiamos en el registro de resultados las variables que hemos cargado de los ficheros.
               Formato_Fresult_Io.Create(Fichero_Resultado,
                  Formato_Fresult_Io.Out_File,Str(1..
                     Longitud_Nombre_Fichero)&".res");
               Tabla_Resultado.Circunscripcion := Circunscripcion;
               Tabla_Resultado.Candidatura:=Candidaturas;
               Tabla_Resultado.Votos:=Votos;
               Tabla_Resultado.Esca�os_Partido:=Tesca�os;

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

            --Si el bot�n salir ha sido pulsado, salimos del programa.
            Salir := True;
         when Nada_Pulsado =>

            --Si el usuario no ha pulsado nada, no hacemos nada.
            null;
      end case;
      exit when Salir;
   end loop;
end Interaccion_Usuario_Programa;