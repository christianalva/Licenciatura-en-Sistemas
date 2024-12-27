{La ciudad de La Plata está organizando un festival de música. Para ello abrió la inscripción para que las bandas locales puedan participar del festival. De cada banda se desea conocer su nombre, estilo musical (un string) y cantidad de integrantes.

a) Implementar un módulo que permita la inscripción de las bandas. El ingreso de datos finaliza con la banda que tiene cero integrantes. Los datos deben estar almacenados en una estructura ordenada por nombre de banda y ser eficiente para la búsqueda por ese criterio.

b) Implementar un módulo que reciba la estructura generada en a) y devuelva una nueva estructura, ordenada por estilo musical, con todos los solistas (bandas con cantidad de integrantes igual a uno).

c) Implementar un módulo recursivo que reciba la estructura generada en a) y devuelva el nombre de la banda con más integrantes.
}
program Parcial;
type
	informacion=record
		nombre:string;
		estilo:string;
		cantIntegrantes:integer;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato:informacion;
		HI:arbol;
		HD:arbol;
	end;
	
	//lista para punto B
	lista = ^nodoLista;
	nodoLista = record
		dato:informacion;
		sig:lista;
	end;
	
procedure generarArbol(var a:arbol);
	procedure leerDatos(var i:informacion);
	var
		nombres:array[1..5] of string = ('la berisso', 'los piojos', 'airbag', 'la 25', 'duki');
		estilo : array[1..4] of string = ('rock', 'pop', 'clasica', 'electronica');
		auxNombre, auxEstilo:integer;
	begin 
		auxNombre:=random(5)+1;
		i.nombre:=nombres[auxNombre];
		auxEstilo:=random(4)+1;
		i.estilo:=estilo[auxEstilo];
		i.cantIntegrantes:=random(10);
	end;
	
	procedure insertarArbol(var a:arbol; i:informacion);
	begin 
		if(a=nil) then begin 
			new(a);
			a^.dato:=i;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(i.nombre < a^.dato.nombre) then 
			insertarArbol(a^.HI, i)
		else 
			insertarArbol(a^.HD, i);
	end;
	

var 
	i:informacion;
begin 
	a:=nil;
	leerDatos(i);
	while(i.cantIntegrantes <> 0) do begin 
		insertarArbol(a, i);
		leerDatos(i);
	end;

end;
	 

procedure imprimirArbol(a:arbol);
begin 
	if(a<>nil) then begin 
		imprimirArbol(a^.HI);
		writeln('Nombre de banda: ', a^.dato.nombre, ', Estilo musical: ', a^.dato.estilo, ', Cantidad de integrantes: ', a^.dato.cantIntegrantes);
		imprimirArbol(a^.HD);
	end;
end;

procedure insertarOrdenado(i:informacion; var l:lista);
var 
	ant, act, nue:lista;
begin 
	new(nue);
	nue^.dato:=i;
	act:=l;
	ant:=l;
	while(act<>nil) and (act^.dato.estilo < i.estilo) do begin 
		ant:=act;
		act:=act^.sig;
	end;
	if(ant=act) then 
		l:=nue
	else 
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure buscarSolistas(a:arbol; var l:lista);
begin 
	if(a<>nil) then begin 
		buscarSolistas(a^.HI, l);
		if(a^.dato.cantIntegrantes = 1) then 
			insertarOrdenado(a^.dato, l);
		buscarSolistas(a^.HD, l);
	end;
end;

procedure mostrarLista(l:lista);
begin
	while(l<>nil) do begin 
		writeln('Nombre de banda: ', l^.dato.nombre, ', Estilo musical: ', l^.dato.estilo, ', Cantidad de integrantes: ', l^.dato.cantIntegrantes);
		l:=l^.sig;
	end;
end;

procedure buscarBandaConMasIntegrantes(a:arbol; var max:integer; var nombreMax:string);
begin 
	if(a<>nil) then begin 
		buscarBandaConMasIntegrantes(a^.HI, max, nombreMax);
		if(a^.dato.cantIntegrantes > max) then begin 
			nombreMax:=a^.dato.nombre;
			max:=a^.dato.cantIntegrantes;
		end;
		buscarBandaConMasIntegrantes(a^.HD, max, nombreMax);
	end; 
end;

var
	a:arbol;
	l:lista;
	max:integer;
	nombreMax:string;
begin 
	randomize;
	max:=0;
	nombreMax:='';
	// A)
	generarArbol(a);
	imprimirArbol(a);
	//B)
	l:=nil;
	buscarSolistas(a, l);
	writeln;
	writeln;
	writeln('Artistas Solistas: ');
	if(l=nil) then 
		writeln('No hay ningun artista solista.')
	else 
		mostrarLista(l);
	// C)
	buscarBandaConMasIntegrantes(a, max, nombreMax);
	writeln;
	writeln;
	writeln('El nombre de la banda con mas integrantes es: ', nombreMax, ', con un total de: ', max, ' integrantes.');
end.
