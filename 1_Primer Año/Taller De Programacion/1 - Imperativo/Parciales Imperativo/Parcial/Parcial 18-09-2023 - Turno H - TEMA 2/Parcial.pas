{
Una empresa de alquiler de autos desea procesar la información de sus alquileres. Implementar un programa que:

a) Implementar un módulo que lea información de los alquileres y retorne una estructura de datos eficiente para la búsqueda por patente. Para cada patente deben quedar almacenados juntos todos sus alquileres.
De cada alquiler se lee: dni del cliente, patente, mes y año. La lectura finaliza con la patente 0.

b) Implementar un módulo que reciba la estructura generada en a) y un dni D. Este módulo debe retornar la cantidad de alquileres realizados por el dni D.

c) Implementar un módulo que reciba la estructura generada en a), un año X y dos patentes A y B. Este módulo debe retornar la cantidad de alquileres realizados para las patentes entre A y B (incluidas) durante el año X

}
program Parcial;
type
	alquileres = record
		dni:integer;
		patente:integer;
		mes:1..12;
		anio:2000..2024;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record 
		dato: alquileres;
		sig:lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record 
		patente:integer;
		dato:lista;
		HI:arbol;
		HD:arbol;
	end;
	
procedure generarArbol(var a:arbol);
	procedure leerDatos(var al:alquileres);
	begin 
		al.patente:=random(50);
		if(al.patente <> 0) then begin 
			al.dni:=random(5000) + 1;
			al.mes:=random(12) + 1;
			al.anio:=random(24) + 2000;
		end;
	end;
	
	procedure insertarAdelante(var l:lista; al:alquileres);
	var 
		nue:lista;
	begin 
		new(nue);
		nue^.dato:=al;
		nue^.sig:=l;
		l:=nue;
	end;
	
	procedure insertarArbol(var a:arbol; al:alquileres);
	begin 
		if(a=nil) then begin 
			new(a);
			a^.patente:=al.patente;
			a^.dato:=nil;
			insertarAdelante(a^.dato, al);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(al.patente < a^.patente) then 
			insertarArbol(a^.HI, al)
		else if(al.patente > a^.patente) then 
			insertarArbol(a^.HD, al)
		else 
			insertarAdelante(a^.dato, al);
	end;


var
	al:alquileres;
begin 
	a:=nil;
	leerDatos(al);
	while(al.patente<>0) do begin 
		insertarArbol(a, al);
		leerDatos(al);
	end;
end;

procedure imprimirArbol(a:arbol);
var
	aux:lista;
begin
	if(a<>nil) then begin 
		imprimirArbol(a^.HI);
		writeln('Patente: ', a^.patente);
		aux:=a^.dato;
		while(aux <> nil) do begin 
			writeln('DNI: ', aux^.dato.dni, ', Mes: ', aux^.dato.mes, ', año: ', aux^.dato.anio);
			aux:=aux^.sig;
		end;
		imprimirArbol(a^.HD);
	end;
end;

//======================================================================
procedure puntoB(a:arbol; var cant:integer; d:integer);
var
	aux:lista;
begin 
	if(a<>nil) then begin 
		aux:=a^.dato;
		while(aux<>nil) do begin 
			if(aux^.dato.dni = d) then 	
				cant:=cant+1;
			aux:=aux^.sig;
		end;
		puntoB(a^.HI, cant, d);
		puntoB(a^.HD, cant, d);
	end;
end;	

//======================================================================
procedure puntoC(a:arbol; min, max, anio:integer; var cant:integer);
var 
	aux:lista;
begin 
	if(a<>nil) then begin 
		if(a^.patente >= min) then 
			puntoC(a^.HI, min, max, anio, cant);
		if(a^.patente >= min) and (a^.patente <=max) then begin
			aux:=a^.dato;
			while(aux<>nil) do begin 
				if(aux^.dato.anio = anio) then 
					cant:=cant+1;
				aux:=aux^.sig;
			end;
		end;
		if(a^.patente <= max) then 
			puntoC(a^.HD, min, max, anio, cant);
	end;
end;


var
	a:arbol;
	cantAlquileres, d, patenteA, patenteB, anio, cantAlquileres2:integer;
begin 
	randomize;
	cantAlquileres:=0;
	cantAlquileres2:=0;
	// A)
	generarArbol(a);
	imprimirArbol(a);
	// B)
	writeln;
	writeln;
	writeln('Ingrese un numero de DNI: ');
	read(d);
	puntoB(a, cantAlquileres, d);
	writeln('La cantidad de alquileres realizados por el DNI: ', d, ' es de: ', cantAlquileres, ' alquileres.');
	// C)
	writeln;
	writeln;
	writeln('Ingrese un año: ');
	read(anio);
	writeln('Ingrese una patente: ');
	read(patenteA);
	writeln('Ingrese otra patente (mayor a la anterior): ');
	read(patenteB);
	puntoC(a, patenteA, patenteB, anio, cantAlquileres2);
	writeln;
	writeln('Cantidad de alquileres entre patentes ', patenteA, ' y ', patenteB, ' en el año ', anio, ': ', cantAlquileres2);
	
end.
