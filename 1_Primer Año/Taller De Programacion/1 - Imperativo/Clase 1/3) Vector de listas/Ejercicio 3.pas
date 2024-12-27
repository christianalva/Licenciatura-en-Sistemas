program netflix;
type
	rango_genero= 1..8;
	
	pelicula = record
		cod:integer;
		genero:rango_genero;
		puntaje:real;
	end;
	
	lista = ^nodo;
	
	nodo = record 
		dato: pelicula;
		sig:lista;
	end;
	
	vector = array[rango_genero] of lista; // vector de lista
	
	mayorPunt = record
		codMax:integer;
		puntMax:real;
	end;
	
	vectorMax = array[rango_genero] of mayorPunt;

	
procedure inicializar(var v:vector);
var 
	i:integer;
begin 
	for i:=1 to 8 do begin 
		v[i]:=nil; // inicializo cada lista en el vector a nil
	end

end;

procedure inicializarMax(var vm:vectorMax);
var 
	i:integer;
begin 
	for i:= 1 to 8 do begin 
		vm[i].codMax:=0;
		vm[i].puntMax:=-1;
	end;
end;


procedure agregarAtras(var l:lista; p:pelicula);
var 
	nue, act, ant: lista;
begin 
	new(nue); 
	nue^.sig:=nil;
	nue^.dato:=p;
	
	if(l = nil) then 
		l:= nue
	else begin 
		act:=l;
		ant:=l;
		while(act<>nil) do begin 
			ant:=act;
			act:=act^.sig;
		end;
	ant^.sig:=nue;
	end;
end;


procedure leerPelicula(var p:pelicula);
begin 
	writeln;
	write('Ingrese el cod de la pelicula: ');
	readln(p.cod);
	if(p.cod<>-1) then begin 
		write('Ingrese el genero de la pelicula (1..8): ');
		readln(p.genero);
		write('Ingrese el puntaje de la pelicula: ');
		readln(p.puntaje)
	end;
end;
	

procedure cargarDatos(var v:vector);
var 
	p: pelicula;
begin 
	inicializar(v);
	leerPelicula(p);
	
	while(p.cod<>-1) do begin 
		agregarAtras(v[p.genero], p); //le paso la lista que esta en la posicion del genero que acabo de leer y la pelicula
		leerPelicula(p);
	end;
end;	
	
//B
procedure mayorPuntaje(var vm:vectorMax; v:vector);
var 
	i:integer;
	act:lista;
begin 
	
	for i:=1 to 8 do begin 
		act:=v[i];
		
		while (act<>nil) do begin 
			if(vm[i].puntMax < act^.dato.puntaje) then begin 
				vm[i].puntMax:=act^.dato.puntaje;
				vm[i].codMax:=act^.dato.cod;
			end;
			act:=act^.sig;	
		end;
	
	end;
	
end;

//C
procedure ordenarVector(var vm:vectorMax);
var 
	act:mayorPunt;
	i, j: integer;
begin 
	
	for i:=2 to 8 do begin 
		act:=vm[i];
		j:=i-1;
		
		while(j>0) and (vm[j].puntMax > act.puntMax) do begin 
				vm[j+1]:= vm[j];
				j:=j-1;
		end;
		vm[j+1]:=act;
	end;
	
end;

procedure mostrar(vm:vectorMax);
begin
	writeln;
	writeln('El codigo de pelicula con MAYOR puntaje es: ', vm[8].codMax, ' con un puntaje de: ', vm[8].puntMax);
	writeln('El codigo de pelicula con MENOR puntaje es: ', vm[1].codMax, ' con un puntaje de: ', vm[1].puntMax);

end;
	
var 
	v:vector;
	vm:vectorMax;
begin 
	//A
	cargarDatos(v);
	//B
	inicializarMax(vm);
	mayorPuntaje(vm, v);
	//C
	ordenarVector(vm);
	//D
	mostrar(vm)
	
end.
	
