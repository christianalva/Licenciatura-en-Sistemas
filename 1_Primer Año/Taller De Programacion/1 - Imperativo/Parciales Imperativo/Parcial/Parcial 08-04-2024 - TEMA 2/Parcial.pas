{
Se desea procesar las pólizas de una compañía de seguros. De cada póliza se conoce: DNI del cliente, suma asegurada, valor cuota y fecha de vencimiento. Un cliente puede tener más de una póliza. Las pólizas se comenzaron a emitir a partir del 2000 y finalizaron de emitirse en 2023. Realice un programa que contenga:

a) Un módulo que lea pólizas, hasta leer una póliza con DNI -1, y las almacene en una estructura eficiente para la búsqueda por suma asegurada.

b) Un módulo que reciba la estructura generada en a) y devuelva otra estructura con las pólizas cuya suma asegurada sea menor a un valor recibido por parámetro. Esta estructura debe estar agrupada por año de vencimiento y ordenada por DNI de cliente. c) Un módulo que reciba la estructura generada en b) y devuelva la cantidad de pólizas de un cliente cuyo DNI se recibe por parámetro.
}
program Parcial;
type
	fecha = record
		dia:1..31;
		mes:1..12;
		anio:2000..2023;
	end;
	
	poliza = record
		dni:integer;
		sumaAsegurada:real;
		valor:real;
		fechaVencimiento:fecha;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record 
		dato:poliza;
		HI:arbol;
		HD:arbol;
	end;
	
	// punto b)
	lista = ^nodoLista;
	
	nodoLista = record 
		dato:poliza;
		sig:lista;
	end;
	
	vector = array[2000.. 2023] of lista;
	
procedure inicializarVector(var v:vector);
var 
	i:integer;
begin
	for i:=2000 to 2023 do begin 
		v[i]:=nil;
	end;
end;
	
procedure generarArbol(var a:arbol);
	procedure leerDatos(var p:poliza);
	begin 
		p.dni:=random(50) - 1;
		if(p.dni <> -1) then begin 
			p.sumaAsegurada:=random(1000);
			p.valor:=random(100);
			p.fechaVencimiento.dia:=random(31) + 1;
			p.fechaVencimiento.mes:=random(12) + 1;
			p.fechaVencimiento.anio:= random(23) + 2000;
		end;
	end;
	
	procedure insertarArbol(var a:arbol; p:poliza);
	begin 
		if(a=nil) then begin 
			new(a);
			a^.dato:=p;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(p.sumaAsegurada < a^.dato.sumaAsegurada) then 
			insertarArbol(a^.HI, p)
		else 
			insertarArbol(a^.HD, p);
	end;

var
	p:poliza;
begin	
	a:=nil;
	leerDatos(p);
	while(p.dni<>-1) do begin 
		insertarArbol(a, p);
		leerDatos(p);
	end;

end;
	
	
procedure imprimirArbol(a:arbol);
begin 
	if(a<>nil) then begin 
		imprimirArbol(a^.HI);
		writeln('DNI: ', a^.dato.dni, ', Suma asegurada: ', a^.dato.sumaAsegurada:5:2, ' valor: ', a^.dato.valor:5:2, ' fecha de vencimiento: ', a^.dato.fechaVencimiento.dia, '/', a^.dato.fechaVencimiento.mes, '/', a^.dato.fechaVencimiento.anio);
		imprimirArbol(a^.HD);
	end;
end;

//======================================================================

procedure insertarOrdenado(var l:lista; p:poliza);
var 
	nue,ant,act:lista;
begin 
	new(nue);
	nue^.dato:=p;
	act:=l;
	while(act<>nil) and (act^.dato.dni < p.dni) do begin 
		ant:=act;
		act:=act^.sig;
	end;
	if(act=l) then 
		l:=nue
	else 
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure puntoB(a:arbol; var v:vector; valor:integer);
begin 
	if(a<>nil) then begin 
		if(a^.dato.sumaAsegurada < valor) then begin
			insertarOrdenado(v[a^.dato.fechaVencimiento.anio], a^.dato);
			puntoB(a^.HI, v, valor);
			puntoB(a^.HD, v, valor);
		end
		else 
			puntoB(a^.HI, v, valor);
	end;
end;

procedure imprimirVector(v:vector);
var 
	aux:lista;
	i:integer;
begin 
	for i:= 2000 to 2023 do begin 
		writeln('Anio: ', i);
		aux:=v[i];
		while(aux<>nil) do begin 
			writeln('DNI: ', aux^.dato.dni, ', Suma asegurada: ', aux^.dato.sumaAsegurada:5:2, ' valor: ', aux^.dato.valor:5:2, ' fecha de vencimiento: ', aux^.dato.fechaVencimiento.dia, '/', aux^.dato.fechaVencimiento.mes, '/', aux^.dato.fechaVencimiento.anio);
			aux:=aux^.sig;
		end;
	end;
end;


//======================================================================
procedure puntoC(v:vector; dni:integer; var cant:integer);
var
	aux:lista;
	i:integer;
begin 
	for i:=2000 to 2023 do begin 
		aux:=v[i];
		while(aux<>nil) do begin 
			if(aux^.dato.dni = dni) then 
				cant:=cant+1;
			aux:=aux^.sig;
		end;
	end;
end;	
	
	
var
	a:arbol;
	v:vector;
	valor, dni, cantDni:integer;
begin 
	randomize;
	// A)
	generarArbol(a);
	imprimirArbol(a);
	// B)
	writeln;
	writeln;
	writeln('Ingrese un valor: ');
	read(valor);
	inicializarVector(v);
	puntoB(a, v, valor);
	writeln;
	imprimirVector(v);
	// C)
	writeln;
	writeln;
	writeln('Ingrese un DNI: ');
	read(dni);
	puntoC(v, dni, cantDni);
	writeln;
	writeln('La cantidad de polizas del cliente con dni: ', dni, ' es de: ', cantDni);
end.
