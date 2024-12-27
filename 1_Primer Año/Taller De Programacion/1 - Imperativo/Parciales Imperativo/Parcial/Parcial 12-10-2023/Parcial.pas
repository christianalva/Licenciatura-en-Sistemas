{
El teatro Musicalísimo ofrece sus instalaciones para que bandas de música puedan dar sus recitales. De cada recital se conoce: el nombre de la banda, la fecha del recital, la cantidad de canciones tocadas y el monto recaudado por la venta de entradas.

a. Implemente un módulo que lea registros de recitales de manera sucesiva hasta que se ingrese "ZZZ" como nombre de banda. Los recitales se pueden leer en cualquier orden. Todos los recitales leídos deben almacenarse en una estructura que permita el recorrido óptimo por monto recaudado.

b. Implemente un módulo que reciba la estructura cargada y dos valores (ej: 200 y 500) y devuelva una lista con todos los recitales cuyo monto recaudado se encuentra entre esos dos valores leídos (ambos inclusive). La lista resultante debe estar ordenada por monto de mayor a menor.

c. Implemente un módulo recursivo que reciba la lista creada en b) y devuelva la cantidad de recitales que tocaron más de 12 canciones.
}

program Parcial;
type
	fechas = record 
		dia:1..31;
		mes:1..12;
		anio:1999..2024;
	end;
	
	recitales = record 
		nombreBanda:string;
		fecha:fechas;
		cancionesTocadas:1..15;
		monto:real;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record 
		dato:recitales;
		HI:arbol;
		HD:arbol;
	end;
	
	// lista punto B
	lista = ^nodoLista;
	
	nodoLista = record 
		dato:recitales;
		sig:lista;
	end;

procedure generarArbol(var a:arbol);
procedure leerDatos(var r:recitales);
var
	nombres: array[1..5] of string = ('babasonicos', 'la renga', 'los piojos', 'airbag', 'ZZZ');
	aux:integer;
begin 
	aux:=random(5)+1;
	r.nombreBanda:=nombres[aux];
	if(r.nombreBanda<>'ZZZ') then begin 
		r.fecha.dia:=random(31)+1;
		r.fecha.mes:=random(12)+1;
		r.fecha.anio:=1999 + random(2024 - 1999  +1);
		r.cancionesTocadas:=random(15)+1;
		r.monto:=random(1000);
	end;
end;

procedure insertarArbol(var a:arbol; r:recitales);
begin 
	if(a=nil) then begin 
		new(a);
		a^.dato:=r;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else if(r.monto < a^.dato.monto) then 
		insertarArbol(a^.HI, r)
	else
		insertarArbol(a^.HD, r);
end;

var 
	r:recitales;
begin 
	a:=nil;
	leerDatos(r);
	while(r.nombreBanda<>'ZZZ') do begin 
		insertarArbol(a, r);
		leerDatos(r);
	end;
end;

procedure mostrarArbol(a:arbol);
begin 
	if(a<>nil) then begin 
		mostrarArbol(a^.HI);
		writeln('Nombre: ', a^.dato.nombreBanda, ', fecha: ', a^.dato.fecha.dia, '/', a^.dato.fecha.mes, '/', a^.dato.fecha.anio, ', cant canciones: ', a^.dato.cancionesTocadas, ', monto: ', a^.dato.monto:5:2);
		mostrarArbol(a^.HD);
	end;
end;

//======================================================================
procedure agregarOrdenado(var l:lista; r:recitales);
var
	nue, ant, act:lista;
begin 
	new(nue);
	nue^.dato:=r;
	act:=l;
	while(act<>nil) and (act^.dato.monto < r.monto) do begin 
		ant:=act;
		act:=act^.sig;
	end;
	if(act = l) then 
		l:=nue
	else 
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure puntoB(var l:lista; min, max:real; a:arbol);
begin
	if(a<>nil) then begin 
		if(a^.dato.monto >= min) then 
			puntoB(l, min, max, a^.HI);
		if(a^.dato.monto >= min) and (a^.dato.monto <= max) then 
			agregarOrdenado(l, a^.dato);
		if(a^.dato.monto <= max) then 
			puntoB(l, min, max, a^.HD);
	end;
end;

procedure mostrarLista(l:lista);
begin  
	while (l<>nil) do begin 
		writeln('Nombre: ', l^.dato.nombreBanda, ', fecha: ', l^.dato.fecha.dia, '/', l^.dato.fecha.mes, '/', l^.dato.fecha.anio, ', cant canciones: ', l^.dato.cancionesTocadas, ', monto: ', l^.dato.monto:5:2);
		l:=l^.sig;
	end;
end;

//=====================================================================
procedure puntoC(l:lista; var cant:integer);
begin 
	if(l<>nil) then begin 
		if(l^.dato.cancionesTocadas > 12) then 
			cant:=cant+1;
		puntoC(l^.sig, cant);
	end;
end;


var 
	a:arbol;
	monto1, monto2:real;
	cantRecitales:integer;
	l:lista;
begin 
	randomize;
	l:=nil;
	cantRecitales:=0;
	// A)
	generarArbol(a);
	mostrarArbol(a);
	// B)
	writeln;
	writeln;
	writeln('Ingrese un valor min: ');
	read(monto1);
	writeln('Ingrese otro valor (mayor al ant):');
	read(monto2);
	puntoB(l, monto1, monto2, a);
	writeln('Lista con monto de recitales ente: ', monto1:5:2, ' y ', monto2:5:2);
	mostrarLista(l);
	//C
	puntoC(l, cantRecitales);
	writeln;
	writeln;
	writeln('La cantidad de recitales en la que tocaron mas de 12 canciones es de: ', cantRecitales);
end.
