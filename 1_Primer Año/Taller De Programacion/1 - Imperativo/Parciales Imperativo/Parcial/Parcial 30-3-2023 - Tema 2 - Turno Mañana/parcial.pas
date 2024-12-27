{Se desea analizar la información de documentos impresos en un laboratorio durante 2022. De cada documento impreso se conoce: código del usuario que imprimió, cantidad de páginas impresas, día y mes. Realice un programa que contenga e invoque a:

a. Un módulo que lea la información de documentos impresos y retorne una estructura con todos los registros leídos. La estructura debe ser eficiente para buscar por código de usuario. La lectura finaliza con código 0.

b. Un módulo que reciba la estructura generada en a) y dos valores X e Y, y retorne una lista con todos los documentos impresos cuyo código de usuario está entre X e Y.

C.Un módulo recursivo que reciba la lista generada en b) y retorne la suma total de páginas impresas de los documentos contenidos en la lista.
}
program parcial;
type
	documento=record
		codUsuario:integer;
		cantImpresas:integer;
		dia:1..31;
		mes:1..12;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol=record 
		dato:documento;
		HI:arbol;
		HD:arbol;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato:documento;
		sig:lista;
	end;

procedure generarArbol(var a:arbol);
	procedure leerDatos(var d:documento);
	begin 
		d.codUsuario:=random(50);
		if(d.codUsuario<>0) then begin 
			d.cantImpresas:=random(100);
			d.dia:=random(31)+1;
			d.mes:=random(12)+1;
		end;
	end;
	
	procedure insertarArbol(var a:arbol; d:documento);
	begin 
		if(a=nil) then begin 
			new(a);
			a^.dato:=d;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(d.codUsuario < a^.dato.codUsuario) then 
			insertarArbol(a^.HI, d)
		else 
			insertarArbol(a^.HD, d);
	end;

var
	d:documento;
begin 
	a:=nil;
	leerDatos(d);
	while(d.codUsuario<>0) do begin
		insertarArbol(a, d);
		leerDatos(d);
	end;
end;

procedure imprimirArbol(a:arbol);
begin 
	if(a<>nil) then begin 
		imprimirArbol(a^.HI);
		writeln('Codigo de usuario: ', a^.dato.codUsuario, ', cant de paginas: ', a^.dato.cantImpresas, ', dia: ', a^.dato.dia, ', mes: ', a^.dato.mes);
		imprimirArbol(a^.HD);
	end;
end;

procedure agregarAdelante(d:documento; var l: lista);
var
	nue:lista;
begin 
	new(nue);
	nue^.dato:=d;
	nue^.sig:=l;
	l:=nue;
end;

procedure buscarElementoEntreXeY(a:arbol; min, max:integer; var l:lista);
begin 
	if(a<>nil) then begin
		buscarElementoEntreXeY(a^.HI, min, max, l);
		if(a^.dato.codUsuario > min) and (a^.dato.codusuario < max) then 
			agregarAdelante(a^.dato, l);
		buscarElementoEntreXeY(a^.HD, min, max, l);
	end;
end;

procedure imprimirLista(l:lista);
begin 
	if(l<>nil) then begin 
		writeln('Codigo de usuario: ', l^.dato.codUsuario, ', cant de paginas: ', l^.dato.cantImpresas, ', dia: ', l^.dato.dia, ', mes: ', l^.dato.mes);
		l:=l^.sig;
		imprimirLista(l);
	end;
end;

procedure sumarTotalDePaginas(l:lista; var total:integer);
begin 
	if(l<>nil) then begin 
		total:=total+l^.dato.cantImpresas;
		l:=l^.sig;
		sumarTotalDePaginas(l, total);
	end;
end;

var 
	a:arbol;
	l:lista;
	min, max, sumaTotal:integer;
begin 
	randomize;
	sumaTotal:=0;
	// A)
	generarArbol(a); 
	imprimirArbol(a);
	// B)
	writeln;
	writeln;
	writeln('Ingrese el valor min (X): ');
	read(min);
	writeln('Ingrese el valor max (Y): ');
	read(max);
	buscarElementoEntreXeY(a, min, max, l);
	writeln;
	writeln('Documentos ente: ', min, ' , ', max, ': ');
	imprimirLista(l);
	// C)
	sumarTotalDePaginas(l, sumaTotal);
	writeln;
	writeln;
	writeln('El total de las paginas impresas es de: ', sumaTotal);
	
end.
