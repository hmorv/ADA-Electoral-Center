With Adagraph, Tratamiento_Grafico, Tratamiento_Errores;
Use Adagraph, Tratamiento_Grafico;

Procedure Centro_Control Is 
   --Este es el programa principal.
   --Gracias a los paquetes de datos no tenemos ninguna variable declarada en esta parte del código.
   
Begin

   --Lo primero es averiguar qué resolución utiliza el usuario.
   Get_Max_Size(Xmax, Ymax);

   --Aseguramos que la resolución no es demasiado baja.
   Comprobar_Resolucion(Xmax);

   --Abrimos la ventana de gráficos.
   Open_Graph_Window(Xmax, Ymax);

   --Inicializamos la pantalla gráfica.
   Inicializar_Ventana(Xmax, Ymax);

   --Iniciamos el programa que se encarga de gestionar la interacción con el usuario.
   Interaccion_Usuario_Programa (Xmax, Ymax);

   --Cerramos la ventana.
   Close_Graph_Window;
 
Exception

   --Esta excepción está definida en el paquete Tratamiento_Errores.
   --En este caso, controlamos la resolución del monitor, mediante el programa Comprobar_Resolución.
   When Tratamiento_Errores.Resolucion_Demasiado_Baja =>
      Tratamiento_Errores.Error_Resolucion;
End Centro_Control;