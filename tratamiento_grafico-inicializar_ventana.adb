Separate (Tratamiento_Grafico)
Procedure Inicializar_Ventana (
      Xmax,                 
      Ymax : In     Integer ) Is 

   --Variable para determinar la zona de interacción y la de visualización de gráficas.
   Margen_Interaccion : Integer;  

   --Estas constantes determinan los valores mínimos de la ventana. 
   Inicio_X,  
   Inicio_Y : Constant Integer := 0;  


   --Constante con el nombre de la barra superior de la ventana. 
   Titulo_Por_Defecto : String := "Centro de Control Electoral   =======>>>>v1.0<<<<=======";  

   --constantes con el nombre de los botones.
   Nombre_Bleer_Fichero : Constant String := "Leer Fichero";  
   Nombre_Bgrafica      : Constant String := "Grafica";  
   Nombre_Btablas       : Constant String := "Tabla";  
   Nombre_Bcomparar     : Constant String := "Comparar";  
   Nombre_Bsalir        : Constant String := "Salir";  
   Nombre_Bguardar      : Constant String := "Guardar";  

Begin

   --Inicializaciones:
   --Ponemos título a la ventana.
   Set_Window_Title(Titulo_Por_Defecto);

   --Para mantener las proporciones, hacemos que el margen de interacción valga 
   --el 16% de lo que valga xmax.
   Margen_Interaccion := (Xmax*16)/100;

   --Pintamos un cuadro con el color que deseemos para el margen de interacción.
   Draw_Box(Inicio_X,Inicio_Y,Margen_Interaccion+1,Ymax, Light_Gray,
      True);

   --Estas dos líneas delimitan la sección de botones con la de datos.
   Draw_Line(Margen_Interaccion+1,Inicio_X,Margen_Interaccion+1,Ymax,
      Black);
   Draw_Line(Margen_Interaccion+2,Inicio_X,Margen_Interaccion+2,Ymax,
      Black);

   --Pintamos un cuadro que abarque el área de datos.
   Draw_Box(Margen_Interaccion+3,Inicio_Y, Xmax, Ymax-5,
      White, True);

   --Creamos los botones, centrándolos en el área de interacción.
   Crear_Boton (Bleer_Fichero, Nombre_Bleer_Fichero,
      (Margen_Interaccion-110)/2, (7*Ymax/8)-Get_Font_Height,
      White, Dark_Gray,Black);
   Pintar_Boton(Bleer_Fichero);

   Crear_Boton (Bgrafica, Nombre_Bgrafica, (Margen_Interaccion-70)/2, (
         3*Ymax/4)-Get_Font_Height,White, Dark_Gray,Black);
   Pintar_Boton(Bgrafica);

   Crear_Boton (Btablas, Nombre_Btablas, (Margen_Interaccion-54)/2,
      (5*Ymax/8)-Get_Font_Height,White, Dark_Gray,Black);
   Pintar_Boton(Btablas);

   Crear_Boton (Bcomparar, Nombre_Bcomparar, (Margen_Interaccion-78)/2,
      (3*Ymax/8)-Get_Font_Height,White, Dark_Gray,Black);
   Pintar_Boton(Bcomparar);

   Crear_Boton (Bguardar, Nombre_Bguardar,(Margen_Interaccion-70)/2, (
         Ymax/4)-Get_Font_Height, White, Dark_Gray,Black);
   Pintar_Boton(Bguardar);

   Crear_Boton (Bsalir, Nombre_Bsalir,(Margen_Interaccion-54)/2, (Ymax/
         8)-Get_Font_Height, White, Dark_Gray, Black);
   Pintar_Boton(Bsalir);

End Inicializar_Ventana;