	//Constantes para identificar cada uno de los modelos de renderización considerados	
	var expl=0;  //El de el explorer
	var ns4=1;  //El de netscape 4
	var ns7=2; //El de netscape 7 y similares
	
	//Controlo cual es el navegador
	var navegador=((navigator.appName.toLowerCase().indexOf("netscape")==-1)?(navigator.userAgent.toLowerCase().indexOf("opera")==-1?expl:ns7):(navigator.appVersion.toLowerCase().indexOf("4")!=-1?ns4:ns7))


	//Constantes que indican el heigth y width para los distintos gráficos
	tartaybarrash=630;
	tartaybarrasw=500;

	tartash=750;
	tartasw=550;
	
	hemiciclosh=750;
	hemiciclosw=610;
	
	barrash=420;
	barrasw=500;
	
	mapah=570;
	mapaw=600;
	
	//Gestión de los gráficos
	    var grafwin=null;

					
	    function ver(url) {
		    if (navegador==ns4)
	            grafwin = window.open('','graficos','toolbar=no,menubar=no,location=no,scrollbars='+scrbs+',resizable=yes,height='+hei+',width='+wid+',screenX='+xwindow+',screenY='+ywindow);
	        else {
	            grafwin = window.open('','graficos','toolbar=no,menubar=no,scrollbars='+scrbs+',resizable=no,height='+hei+',width='+wid+',left='+xwindow+',top='+ywindow);
	 	       grafwin.focus();
	           grafwin.resizeTo(wid,hei);
				grafwin.moveTo(xwindow,ywindow);
	        }
	        grafwin.document.open();
	        grafwin.document.writeln('<html><head></head><body>Cargando gr&aacute;fico...</body><html>');
	        grafwin.document.close();
	        grafwin.focus();
	        if (navigator.appName == 'Netscape')
	            grafwin = window.open(url,'graficos','toolbar=no,menubar=no,location=no,scrollbars='+scrbs+',resizable=no,height='+hei+',width='+wid+',screenX='+xwindow+',screenY='+ywindow);
	        else {
	            grafwin = window.open(url,'graficos','toolbar=no,menubar=no,scrollbars='+scrbs+',resizable=no,height='+hei+',width='+wid+',left='+xwindow+',top='+ywindow);
	        }
	    }


	    function verGrafico(url) {
	        setTimeout('ver("' + url + '")', 500);
	    }
