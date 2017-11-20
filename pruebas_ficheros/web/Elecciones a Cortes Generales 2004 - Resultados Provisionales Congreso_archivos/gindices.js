function ld(i1,i2)
{
	//alert('empiezo ld');
	
	if (i1!=-1)
		{
			top.frames[1].location=i1;
		}
	if (i2!=-1)
		{
			top.frames[2].location=i2;
		}
}

//Carga Municipios de una Provincia (indice+datos)
function M(numcom,numprov,codcirc)
{
	if (numprov<10)
		numprove='0'+numprov;
	else 
		numprove=numprov;

	if (numcom<10)
		numcome='0'+numcom;
	else 
		numcome=numcom;
		
	//alert('IM'+top.tipoelec+numprove+((!EsCircunsc(codcirc))?"":codcirc)+".htm"+"-------"+"D"+top.tipoelec+numcome+numprove+((EsCircunsc(codcirc))?codcirc:9)+"9.htm");
	ld('IM'+top.tipoelec+numprove+((!EsCircunsc(codcirc))?"":codcirc)+".htm","D"+top.tipoelec+numcome+numprove+((EsCircunsc(codcirc))?codcirc:9)+"9.htm");
}

function EsCircunsc(codcirc)
{
	return ((codcirc==0) || (codcirc==1)|| (codcirc==2)|| (codcirc==3)|| (codcirc==4)|| (codcirc==5)|| (codcirc==6) || (codcirc==7)|| (codcirc==8)|| (codcirc==9));
}


//Carga Islas de una Provincia (indice + datos)
function I(numcom,numprov)
{
	if (numprov<10)
		numprove='0'+numprov;
	else
		numprove=numprov;

	if (top.tipoelec=='SN')
	{
		numprove='0'+numprov;
		terminacion='9';
	}
	else
		terminacion='99';

		
	if (numcom<10)
		numcome='0'+numcom;
	else 
		numcome=numcom;

 //alert('II'+top.tipoelec+numprove+".htm"+"------"+"D"+top.tipoelec+numcome+numprove+terminacion+".htm");

	ld('II'+top.tipoelec+numprove+".htm",		  "D"+top.tipoelec+numcome+numprove+terminacion+".htm");
}