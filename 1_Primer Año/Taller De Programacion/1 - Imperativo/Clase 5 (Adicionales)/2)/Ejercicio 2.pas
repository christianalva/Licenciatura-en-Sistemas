program Ejercicio2;
type
	informacion=record
		patente:integer;
		anioFabricacion:2010..2018;
		marca:string;
		modelo:integer;
	end;
	
	// arbol 1
	arbol1=^nodoArbol1;
	nodoArbol1=record
		dato:informacion;
		HI:arbol1;
		HD:arbol1;
	end;
	
	// arbol de lista
	lista=^nodoLista;
	nodoLista=record
		dato:informacion;
		sig:lista;
	end;	
	
	arbol2=^nodoArbol2;
	nodoArbol2=record
		marca:string;
		dato:lista;
		HI:arbol2;
		HD:arbol2;
	end;
	
	
procedure generarArbol(var a1:arbol1; var a2:arbol2);	
	procedure leerDatos(var i:informacion);
	var
		marca:array[1..4] of string = ('chevrolet', 'ford', 'bmw', 'MMM');	
		aux:integer;
	begin 
		i.patente:=100 + random(900);
		i.anioFabricacion:= 2010 + Random(9); // Corregido
		aux:= random(4)+1;
		i.marca:=marca[aux];
		if(i.marca <> 'MMM') then begin
			i.modelo:=random(20) + 1;
		end;
	end;
	
	procedure insertarArbol1(var a1:arbol1; i:informacion);
	begin 
		if(a1 = nil) then begin 
			new(a1);
			a1^.dato:=i;
			a1^.HI:=nil;
			a1^.HD:=nil;
		end
		else if(i.patente < a1^.dato.patente) then 
			insertarArbol1(a1^.HI, i)
		else
			insertarArbol1(a1^.HD, i);
	end;
	
	procedure agregarAdelante(var l:lista; i:informacion);
	var
		nue:lista;
	begin 
		new(nue);
		nue^.dato:=i;
		nue^.sig:=l;
		l:=nue;
	end;
	
	procedure insertarArbol2(var a2:arbol2; i:informacion);
	begin 
		if(a2 = nil) then begin 
			new(a2);
			a2^.marca:=i.marca;
			a2^.dato:=nil;
			agregarAdelante(a2^.dato, i);
			a2^.HI:=nil;
			a2^.HD:=nil;
		end
		else if(i.marca < a2^.marca) then 
			insertarArbol2(a2^.HI, i)
		else if(i.marca > a2^.marca) then 
			insertarArbol2(a2^.HD, i)
		else 
			agregarAdelante(a2^.dato, i);
	end;
	
var 
	i:informacion;
begin 
	a1:=nil;
	a2:=nil;
	leerDatos(i);
	while(i.marca<>'MMM') do begin 
		insertarArbol1(a1, i);
		insertarArbol2(a2, i);
		leerDatos(i);
	end;
end;

procedure imprimirArbol1(a1:arbol1);
begin 
	if(a1<>nil) then begin 
		imprimirArbol1(a1^.HI);
		writeln('Patente: ', a1^.dato.patente, ', Año de fabricacion: ', a1^.dato.anioFabricacion, ', marca: ', a1^.dato.marca, ', Modelo: ', a1^.dato.modelo);
		imprimirArbol1(a1^.HD);
	end;
end;

procedure imprimirArbol2(a2:arbol2);
var 
	aux:lista;
begin 
	if(a2<>nil) then begin 
		imprimirArbol2(a2^.HI);
		writeln('MARCA DE AUTO: ', a2^.marca);
		aux:=a2^.dato;
		while(aux<>nil) do begin
			writeln('Patente: ', aux^.dato.patente, ', Año de fabricacion: ', aux^.dato.anioFabricacion, ', Marca: ', aux^.dato.marca, 'Modelo: ', aux^.dato.modelo);
			aux:=aux^.sig;
		end;
		imprimirArbol2(a2^.HD);
	end;
end;
	
var 
	a1:arbol1;
	a2:arbol2;
begin 
	randomize;
	// A)
	generarArbol(a1, a2);
	imprimirArbol1(a1);
	writeln;
	writeln;
	imprimirArbol2(a2);
	// B)
	
end.
