Separate (Tratamiento_Grafico.Interaccion_Usuario_Programa)

Procedure Determinar_Boton (
      --Este procedimiento se encarga de averiguar si se ha pulsado un bot�n, y asignar al par�metro
      --qu� bot�n ha sido pulsado.
      B_Pulsado :    Out Que_Boton ) Is 

   --Variables para controlar las coordenadas del rat�n.
   Ratonx,  
   Ratony : Integer := 0;  

Begin

   --La condici�n principal es saber si se ha pulsado el bot�n izquierdo del rat�n.
   If Mouse_Button_Pressed(Left_Button) Then

      --Averiguar las coordenadas est� el cursor.
      Get_Mouse_Location(Ratonx, Ratony);

      --Si el bot�n pulsado es el Leer Fichero:
      If Punto_En_Boton(Bleer_Fichero, Ratonx, Ratony) Then

         --Nos aseguramos que el bot�n ha sido pulsado correctamente.
         Tratamiento_Boton(Bleer_Fichero, Ratonx, Ratony, Boton_Pulsado_Correctamente);
         If Boton_Pulsado_Correctamente Then
            --Si el bot�n ha sido pulsado correctamente, asignamos el valor correspondiente a B_Pulsado.
            B_Pulsado := Boton_Leer_Fichero;
         End If;
         --Tratamiento para el caso de tener el cursor sobre el bot�n Grafica.
      Elsif Punto_En_Boton(Bgrafica, Ratonx, Ratony) Then
         Tratamiento_Boton(Bgrafica, Ratonx, Ratony,
            Boton_Pulsado_Correctamente);
         If Boton_Pulsado_Correctamente Then
            B_Pulsado := Boton_Grafica;
         End If;
         --Tratamiento para el caso de tener el cursor sobre el bot�n Tabla.
      Elsif Punto_En_Boton(Btablas, Ratonx, Ratony)  Then
         Tratamiento_Boton(Btablas, Ratonx, Ratony,
            Boton_Pulsado_Correctamente);
         If Boton_Pulsado_Correctamente Then
            B_Pulsado := Boton_Tabla;
         End If;
         --Tratamiento para el caso de tener el cursor sobre el bot�n Comparar.
      Elsif Punto_En_Boton(Bcomparar, Ratonx, Ratony)  Then
         Tratamiento_Boton(Bcomparar, Ratonx, Ratony,
            Boton_Pulsado_Correctamente);
         If Boton_Pulsado_Correctamente Then
            B_Pulsado := Boton_Comparar;
         End If;
         --Tratamiento para el caso de tener el cursor sobre el bot�n Guardar.
      Elsif Punto_En_Boton(Bguardar, Ratonx, Ratony) Then
         Tratamiento_Boton(Bguardar, Ratonx, Ratony,
            Boton_Pulsado_Correctamente);
         If Boton_Pulsado_Correctamente Then
            B_Pulsado := Boton_Guardar;
         End If;
         --Tratamiento para el caso de tener el cursor sobre el bot�n Salir.
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
      --Si no se pulsa el bot�n tambi�n asignamos el valor Nada_Pulsado.
   Else
      B_Pulsado := Nada_Pulsado;
   End If;
End Determinar_Boton;