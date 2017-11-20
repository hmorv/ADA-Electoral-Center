With Adagraph, Tratamiento_Grafico, Tratamiento_Errores;
Use Adagraph, Tratamiento_Grafico;

Procedure Centro_Control Is 
   --Este es el programa principal.
   --Gracias a los paquetes de datos no tenemos ninguna variable declarada en esta parte del c�digo.
   
Begin

   --Lo primero es averiguar qu� resoluci�n utiliza el usuario.
   Get_Max_Size(Xmax, Ymax);

   --Aseguramos que la resoluci�n no es demasiado baja.
   Comprobar_Resolucion(Xmax);

   --Abrimos la ventana de gr�ficos.
   Open_Graph_Window(Xmax, Ymax);

   --Inicializamos la pantalla gr�fica.
   Inicializar_Ventana(Xmax, Ymax);

   --Iniciamos el programa que se encarga de gestionar la interacci�n con el usuario.
   Interaccion_Usuario_Programa (Xmax, Ymax);

   --Cerramos la ventana.
   Close_Graph_Window;
 
Exception

   --Esta excepci�n est� definida en el paquete Tratamiento_Errores.
   --En este caso, controlamos la resoluci�n del monitor, mediante el programa Comprobar_Resoluci�n.
   When Tratamiento_Errores.Resolucion_Demasiado_Baja =>
      Tratamiento_Errores.Error_Resolucion;
End Centro_Control;