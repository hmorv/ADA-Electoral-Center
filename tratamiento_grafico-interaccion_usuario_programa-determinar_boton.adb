Separate (Tratamiento_Grafico.Interaccion_Usuario_Programa)

Procedure Determinar_Boton (
      --Este procedimiento se encarga de averiguar si se ha pulsado un botón, y asignar al parámetro
      --qué botón ha sido pulsado.
      B_Pulsado :    Out Que_Boton ) Is 

   --Variables para controlar las coordenadas del ratón.
   Ratonx,  
   Ratony : Integer := 0;  

Begin

   --La condición principal es saber si se ha pulsado el botón izquierdo del ratón.
   If Mouse_Button_Pressed(Left_Button) Then

      --Averiguar las coordenadas está el cursor.
      Get_Mouse_Location(Ratonx, Ratony);

      --Si el botón pulsado es el Leer Fichero:
      If Punto_En_Boton(Bleer_Fichero, Ratonx, Ratony) Then

         --Nos aseguramos que el botón ha sido pulsado correctamente.
         Tratamiento_Boton(Bleer_Fichero, Ratonx, Ratony, Boton_Pulsado_Correctamente);
         If Boton_Pulsado_Correctamente Then
            --Si el botón ha sido pulsado correctamente, asignamos el valor correspondiente a B_Pulsado.
            B_Pulsado := Boton_Leer_Fichero;
         End If;
         --Tratamiento para el caso de tener el cursor sobre el botón Grafica.
      Elsif Punto_En_Boton(Bgrafica, Ratonx, Ratony) Then
         Tratamiento_Boton(Bgrafica, Ratonx, Ratony,
            Boton_Pulsado_Correctamente);
         If Boton_Pulsado_Correctamente Then
            B_Pulsado := Boton_Grafica;
         End If;
         --Tratamiento para el caso de tener el cursor sobre el botón Tabla.
      Elsif Punto_En_Boton(Btablas, Ratonx, Ratony)  Then
         Tratamiento_Boton(Btablas, Ratonx, Ratony,
            Boton_Pulsado_Correctamente);
         If Boton_Pulsado_Correctamente Then
            B_Pulsado := Boton_Tabla;
         End If;
         --Tratamiento para el caso de tener el cursor sobre el botón Comparar.
      Elsif Punto_En_Boton(Bcomparar, Ratonx, Ratony)  Then
         Tratamiento_Boton(Bcomparar, Ratonx, Ratony,
            Boton_Pulsado_Correctamente);
         If Boton_Pulsado_Correctamente Then
            B_Pulsado := Boton_Comparar;
         End If;
         --Tratamiento para el caso de tener el cursor sobre el botón Guardar.
      Elsif Punto_En_Boton(Bguardar, Ratonx, Ratony) Then
         Tratamiento_Boton(Bguardar, Ratonx, Ratony,
            Boton_Pulsado_Correctamente);
         If Boton_Pulsado_Correctamente Then
            B_Pulsado := Boton_Guardar;
         End If;
         --Tratamiento para el caso de tener el cursor sobre el botón Salir.
      Elsif Punto_En_Boton(Bsalir, Ratonx, Ratony) Then
         Tratamiento_Boton(Bsalir, Ratonx, Ratony,
            Boton_Pulsado_Correctamente);
         If Boton_Pulsado_Correctamente Then
            B_Pulsado := Boton_Salir;
         End If;
         --Si nada es pulsado, para seguir con el bucle le damos el valor Nada_Pulsado.
      Else
         B_Pulsado := Nada_Pulsado;
         Esperar;
      End If;
      --Si no se pulsa el botón también asignamos el valor Nada_Pulsado.
   Else
      B_Pulsado := Nada_Pulsado;
   End If;
End Determinar_Boton;