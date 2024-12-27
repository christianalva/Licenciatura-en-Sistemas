program Ejercicio2;
type
//--------------- Arbol 1 --------------------------
	fechas = record 
		dia:1..31;
		mes:1..12;
	end;
	
	ventas = record 
		cod:integer;
		fecha:fechas;
		cant:1..20;
	end;
	
	arbol =  ^nodoArbol;
	
	nodoArbol = record 
		dato:ventas;
		HI:arbol;
		HD:arbol;
	end;

//--------------------- Arbol 2 -------------------------
	ventas2 = record 
		cod:integer;
		cantTotal:integer;
	end;
	
	arbol2 = ^nodoArbol2;
	
	nodoArbol2 = record
		dato:ventas2;
		HI:arbol2;
		HD:arbol2;
	end;

//------------------- Arbol 3 ---------------------------

	lista = ^nodo;
	
	nodo = record 
		dato:ventas;
		sig:lista;
	end;
	
	infoArbol = record
		cod:integer;
		listaVentas:lista;
	end;
	
	arbolLista = ^nodoArbolLista;
	
	nodoArbolLista = record 
		dato:infoArbol;
		HI:arbolLista;
		HD:arbolLista;
	end;


//===================== A) ==============================
procedure GenerarArbol(var a:arbol; var a2:arbol2; var a3:arbolLista);
	procedure cargarVentas(var v:ventas);
	begin 
		v.cod:= random(50);
		if(v.cod<>0) then begin 
			v.fecha.dia:=random(31)+1;
			v.fecha.mes:=random(12)+1;
			v.cant:=random(20)+1;
		end;
	end;
	
	// i
	
	procedure insertarElementos(var a:arbol; v:ventas);
	begin
		if(a = nil) then begin 
			new(a);
			a^.dato:=v;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(v.cod<a^.dato.cod) then 
			insertarElementos(a^.HI, v)
		else
			insertarElementos(a^.HD,v);	
	end;
	
	// ii
	procedure insertarElementosArbol2(var a2:arbol2; v:ventas);
	begin
		if(a2 = nil) then begin
			new(a2);
			a2^.dato.cod:=v.cod;
			a2^.dato.cantTotal:=v.cant;
			a2^.HI:=nil;
			a2^.HD:=nil;
		end
		else if(v.cod < a2^.dato.cod) then
			insertarElementosArbol2(a2^.HI, v)
		else if(v.cod > a2^.dato.cod) then 
			insertarElementosArbol2(a2^.HD, v)
		else 
			a2^.dato.cantTotal:= a2^.dato.cantTotal+v.cant;		
	end;
	
	//iii
	procedure insertarEnLista(var l:lista; v:ventas);
	var 
		nue:lista;
	begin
		new(nue);
		nue^.dato:=v;
		nue^.sig:=l;
		l:=nue;
	end;
	
	procedure insertarElementosArbolLista(var a3:arbolLista; v:ventas);
	begin 
		if(a3 = nil) then begin
			new(a3);
			a3^.dato.cod:=v.cod;
			a3^.dato.listaVentas:=nil;
			insertarEnLista(a3^.dato.listaVentas, v);
			a3^.HI:=nil;
			a3^.HD:=nil;
		end
		else if(v.cod < a3^.dato.cod ) then
			insertarElementosArbolLista(a3^.HI, v)
		else if(v.cod > a3^.dato.cod) then
			insertarElementosArbolLista(a3^.HD, v)
		else 
			insertarEnLista(a3^.dato.listaVentas, v);
	end;
	
var 
	v:ventas;
begin 
	writeln('Armado de Arbol. ');
	a:=nil;
	cargarVentas(v);
	while(v.cod<>0) do begin 
		//A) i
		insertarElementos(a,v);
		// A) ii
		insertarElementosArbol2(a2, v);
		// A) iii
		insertarElementosArbolLista(a3, v);
		cargarVentas(v);
	end;

end;



procedure mostrarArbol(a:arbol);
begin
	if(a<>nil) then begin 
		mostrarArbol(a^.HI);
		writeln('Codigo: ', a^.dato.cod, ', Fecha: ', (a^.dato.fecha.dia), '/', (a^.dato.fecha.mes) ,' Cantidad: ', a^.dato.cant);
		mostrarArbol(a^.HD);
	end;
end;

procedure mostrarArbol2(a2:arbol2);
begin 
	if(a2<>nil) then begin
		mostrarArbol2(a2^.HI);
		writeln('Codigo: ', a2^.dato.cod, ' tiene un total de: ', a2^.dato.cantTotal, ' productos vemdidos.');
		mostrarArbol2(a2^.HD);
	end;
end;

procedure mostrarArbolLista(a3:arbolLista);
var
	aux:lista;
begin
	if(a3<>nil) then begin 
		mostrarArbolLista(a3^.HI);
		writeln('Codigo: ', a3^.dato.cod, ' lista de las ventas realizada:  ');
		
		aux:=a3^.dato.listaVentas;
		while (aux <> nil) do begin
			writeln('Codigo: ', aux^.dato.cod, ', Fecha: ', aux^.dato.fecha.dia, '/', aux^.dato.fecha.mes, ' Cantidad: ', aux^.dato.cant);
			aux := aux^.sig;  // Avanzamos al siguiente nodo en la lista
		end;
		
		mostrarArbolLista(a3^.HD);
	end;
end;

// =========================== B) ===================================
procedure recorrerArbol1(a:arbol; dia, mes: integer; var cantTotal:integer);
begin 
	if(a<>nil) then begin
		if(a^.dato.fecha.dia = dia) and (a^.dato.fecha.mes = mes) then 
			cantTotal:=cantTotal+1;
		recorrerArbol1(a^.HI, dia, mes, cantTotal);
		recorrerArbol1(a^.HD, dia, mes, cantTotal);
	end;
end;	
		
//========================== C) ==================================
procedure recorrerArbol2(a2:arbol2; var cantTotalV:integer; var codProduc:integer);
begin 
	if(a2<>nil) then begin 
		if(cantTotalV<a2^.dato.cantTotal) then begin 
			cantTotalv:=a2^.dato.cantTotal;
			codProduc:=a2^.dato.cod;
		end;
		recorrerArbol2(a2^.HI, cantTotalV, codProduc);
		recorrerArbol2(a2^.HD, cantTotalV, codProduc);
	end;
end;


//========================== D) ==============================
procedure recorrerArbol3(a3:arbolLista; var codProduc2:integer; var maxCantVentas:integer);
	procedure recorrerLista(a3:arbolLista; var cantVentas:integer);
	var 
		aux:lista;
		contador:integer;
	begin 
		aux:=a3^.dato.listaVentas;
		contador:=0;
		while(aux<>nil) do begin 
			contador:=contador+1;
			aux:=aux^.sig;
		end;
		cantVentas:=contador;
	end;


var 
	cantVentas:integer;
begin 
	cantVentas:=0;
	if(a3<>nil) then begin 
		recorrerLista(a3, cantVentas);
		if(cantVentas > maxCantVentas) then begin
			maxCantVentas:=cantVentas;
			codProduc2:=a3^.dato.cod;
		end;
		//recorrer el arbol lado izquierdo
		recorrerArbol3(a3^.HI, codProduc2, maxCantVentas);
		//recorrer el arbol lado derecho
		recorrerArbol3(a3^.HD, codProduc2, maxCantVentas);
	end;
end;

var 
	a:arbol;
	a2:arbol2;
	a3:arbolLista;
	dia, mes, cantTotalProd, cantTotalVendidas, codProduc, codProduc2, maxCantVentas: integer;
begin 
	cantTotalProd:=0;
	cantTotalVendidas:=0;
	codProduc:=0;
	codProduc2:=0;
	maxCantVentas:=0;
	randomize;
	//A) 
	GenerarArbol(a, a2, a3);
	mostrarArbol(a);
	writeln;
	writeln;
	writeln('======= Cantidad total por codigo de producto =======');
	mostrarArbol2(a2);
	writeln;
	writeln;
	writeln('======= Lista De Ventas Por Producto ===========');
	mostrarArbolLista(a3);
	
	//B)
	writeln;
	writeln;
	writeln('Buscar cantidad de productos vendidos en una fecha dada: ');
	writeln('Ingrese el dia: ');
	read(dia);
	writeln('Ingrese el mes: ');
	read(mes);
	recorrerArbol1(a, dia, mes, cantTotalProd);
	writeln('La cantidad de productos vendidios en el dia: ', dia, ' del mes de: ', mes, ' es de: ', cantTotalProd);
	
	//C)
	recorrerArbol2(a2, cantTotalVendidas, codProduc);
	writeln;
	writeln;
	writeln('El codigo con mayor unidades vendidas es el: ', codProduc, ' con un total de: ', cantTotalVendidas, ' unidades vendidas.');

	//D
	recorrerArbol3(a3, codProduc2, maxCantVentas);
	writeln;
	writeln;
	writeln('El codigo de producto con mayor cantidad de ventas es el: ', codProduc2, ' con un total de: ', maxCantVentas, ' ventas.');	
end.
