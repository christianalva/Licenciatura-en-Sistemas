{

La oficina de presupuesto nacional está analizando las partidas de dinero enviadas a las 24 provincias en los últimos

años.

1- Realice un módulo que lea la información de las partidas de dinero y las almacene en una estructura de datos eficiente para la búsqueda por año. De cada partida se lee el mes y año, código de provincia (entre 1 y 24) y monto enviado a dicha provincia en ese mes y año. La información, para cada año, debe quedar almacenada de manera ordenada ascendentemente por mes. La información se ingresa sin ningún orden. La lectura finaliza cuando se lee la partida enviada a la provincia 24 en el mes 12 y año 2022. Se sugiere utilizar el módulo leerAtencion ().

2.- Realice un módulo que reciba la estructura de datos generada en el inciso 1 y retorne una nueva estructura de datos que contenga, para cada provincia, la cantidad total de partidas recibidas y el monto total.

3.- Realice un módulo recursivo que reciba la estructura generada en el inciso 2 y retorne el código de la provincia con mayor cantidad de partidas recibidas.

4.- Realice un módulo que reciba la estructura de datos generada en 1, dos años y un mes, y retorne la cantidad total de partidas enviadas a las distintas provincias en el mes entre dichos años.
}
program Recuperatorio;
type 
	partidas=record 
		mes:1..12;
		anio:1999..2024;
		codProvincia:1..24;
		monto:real
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record 
		dato:partidas;
		sig:lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		anio:1999..2024;
		dato:lista;
		HI:arbol;
		HD:arbol;
	end;
	
	// punto 2
	provincias = record 
		cantPartidas:integer;
		montoTotal:real;
	end;
	vector = array[1..24] of provincias;
	
procedure inicializarVector(var v:vector);
var
	i:integer;
begin 
	for i:=1 to 24 do begin 
		v[i].cantPartidas:=0;
		v[i].montoTotal:=0;
	end;
end;
	
	
procedure generarArbol(var a:arbol);
	procedure leerDatos(var p:partidas);
	begin 
		p.codProvincia:=random(24)+1;
		p.mes:=random(12)+1;
		p.anio:= random(25) + 1999;
		if (p.codProvincia <> 24) and (p.mes <> 12) and (p.anio<>2022) then begin
			p.monto:=random(10000);
		end;
	end;
	
	procedure insertarOrdenado(var l:lista; p:partidas);
	var 
		nue,ant,act:lista;
	begin 
		new(nue);
		nue^.dato:=p;
		act:=l;
		while(act<>nil) and (act^.dato.mes < p.mes) do begin 
			ant:=act;
			act:=act^.sig;
		end;
		if(act=l) then 
			l:=nue
		else 
			ant^.sig:=nue;
		nue^.sig:=act;
	end;
	
	procedure insertarArbol(var a:arbol; p:partidas);
	begin 
		if(a=nil) then begin 
			new(a);
			a^.anio:=p.anio;
			a^.dato:=nil;
			insertarOrdenado(a^.dato, p);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(p.anio < a^.anio) then 
			insertarArbol(a^.HI, p)
		else if(p.anio > a^.anio) then 
			insertarArbol(a^.HD, p)
		else 
			insertarOrdenado(a^.dato, p);
	end;

var 
	p:partidas;
begin 
	a:=nil;
	leerDatos(p);
	while(p.codProvincia <> 24) and (p.mes <> 12) and (p.anio<>2022) do begin 
		insertarArbol(a, p);
		leerDatos(p);
	end;
end;
	
procedure imprimirArbol(a:arbol);
var 
	aux:lista;
begin 
	if(a<>nil) then begin
		imprimirArbol(a^.HI);
		writeln('Año: ', a^.anio);
		aux:=a^.dato;
		while(aux<>nil) do begin
			writeln('Cod Provincia: ', aux^.dato.codProvincia, ', Mes: ', aux^.dato.mes, ', Monto Mes: ', ', Monto: ', aux^.dato.monto:5:2);
			aux:=aux^.sig;
		end;
		imprimirArbol(a^.HD);
	end;
end;

//======================================================================
procedure punto2(a:arbol; var v:vector);
var 
	aux:lista;
begin 
	if(a<>nil) then begin 
		aux:=a^.dato;
		while(aux<>nil) do begin 
			v[aux^.dato.codProvincia].cantPartidas:=v[aux^.dato.codProvincia].cantPartidas+1;
			v[aux^.dato.codProvincia].montoTotal:=v[aux^.dato.codProvincia].montoTotal + (aux^.dato.monto);
			aux:=aux^.sig;
		end;
		punto2(a^.HI, v);
		punto2(a^.HD, v);
	end;
end;

procedure imprimirVector(v:vector);
var
	i:integer;
begin 
	for i:=1 to 24 do begin 
		writeln('Cod Provincia: ', i, ', cantidad de partidas recibidas: ', v[i].cantPartidas, ', Monto Total: ', v[i].montoTotal:5:2);
	end;
end;

//======================================================================
procedure punto3(v:vector; var codProvincia:integer; var cantPartidas:integer; i:integer);
begin
	if(i <= 24) then begin 
		if(v[i].cantPartidas > cantPartidas) then begin 
			cantPartidas:=v[i].cantPartidas;
			codProvincia:=i;
		end;
		i:=i+1;
		punto3(v, codProvincia, cantPartidas, i);
	end;
end;

//======================================================================
procedure punto4(a:arbol; min, max, mes:integer; var cant:integer);
var
	aux:lista;
begin 
	if(a<>nil) then begin
		if(a^.anio >= min) then 
			punto4(a^.HI, min, max, mes, cant);
		if(a^.anio >= min) and (a^.anio <= max) then begin 
			aux:=a^.dato;
			while(aux<>nil) do begin
				if(aux^.dato.mes = mes) then 
					cant:=cant+1;
				aux:=aux^.sig;
			end;
		end;
		if(a^.anio <= max) then 
			punto4(a^.HD, min, max, mes, cant);
	end;
end;

var 
	a:arbol;
	v:vector;
	codProvincia, i, cantPartidas, anio1, anio2, mes, cantPartidas2:integer;
begin 
	codProvincia:=0;
	cantPartidas:=-1;
	cantPartidas2:=0;
	i:=1;
	randomize;
	inicializarVector(v);
	// 1)
	generarArbol(a);
	imprimirArbol(a);
	// 2)
	punto2(a, v);
	writeln;
	writeln;
	imprimirVector(v);
	// 3)
	punto3(v, codProvincia, cantPartidas, i); 
	writeln;
	writeln;
	writeln('Cod de la provincia con mas partidas recibidas: ', codProvincia);
	//4
	writeln;
	writeln('Ingrese un año: ');
	read(anio1);
	writeln('Ingrese otro año (mayor al ant): ');
	read(anio2);
	writeln('Ingrese un mes: ');
	read(mes);
	punto4(a, anio1, anio2, mes, cantPartidas2);
	writeln;
	writeln('La cantidad total de partidas enviadas a las distintas provincias entre los años: ', anio1, ' y ', anio2, ' en el mes: ', mes, ', es de: ', cantPartidas2);
end.	
	
	
