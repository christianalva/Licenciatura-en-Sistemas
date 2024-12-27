program libreria;
const 
	dimF = 8;
	dimF2 = 30;
type
	
	productos = record 
		cod:integer;
		codRubro:1..dimF;
		precio:real;
	end;
	
	lista = ^nodo;
	
	nodo  = record 
		dato: productos;
		sig: lista;
	end;
	
	vector = array[1..dimF] of lista;
	
	vector2 = array[1..dimF2] of productos;
	
procedure inicializarvector(var v:vector);
var 
	i:integer;
begin 
	
	for i:=1 to dimF do begin 
		v[i]:= nil;
	end;

end;


procedure agregarOrdenado(var l:lista; p:productos);
var 
	act, ant, nue:lista;
begin 
	new(nue);
	nue^.dato:=p;
	act:=l;
	ant:=l;
	while(act<>nil) and (act^.dato.cod < p.cod) do begin 
		ant:=act;
		act:=act^.sig;
	end;
	
	if(ant=act) then 
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;


procedure leerDatos(var p:productos);
begin
	writeln;
	write('Ingrese el cod del producto: ');
	readln(p.cod);
	write('Ingrese el cod de rubro (1..8): ');
	readln(p.codRubro);
	write('Ingrese el precio del producto: ');
	readln(p.precio);
	
end;
	
	
procedure cargarDatos(var v:vector);
var 
	p:productos;
begin 
	inicializarVector(v);
	leerDatos(p);
	while(p.precio<>0) do begin 
		agregarOrdenado(v[p.codrubro], p);
		leerDatos(p);
	end;

end;


//B
procedure mostrar(v:vector);
var 
	act:lista;
	i:integer;
begin
	for i:=1 to dimF do begin 
		act:=v[i];
		writeln;
		write('Rubro: ', i );
		while(act<>nil) do begin 
			writeln;
			write('Codigo: ', act^.dato.cod);
			act:=act^.sig;
		end;
		
	end
end; 

//C
procedure generarNuevoVector(var v2:vector2; l:lista; var dimL2:integer);
var 
	act:lista; 
begin 
	act:= l;
	while (act<>nil) and (dimL2<=30)do begin
		v2[dimL2]:=act^.dato;		
		dimL2:=dimL2+1;
		act:= act^.sig;
	end;
	
end;


//D
procedure ordenarVector(var v2:vector2; dimL2:integer);
var 
	act:productos;
	i, j: integer;
begin 
	for i:=2 to dimL2 do begin 
		act:=v2[i];
		j:=i-1;
		
		while(j>0) and (v2[j].precio > act.precio) do begin 
			v2[j+1] := v2[j];
			j:=j-1;
		end;
		
		v2[j+1]:=act;
	end;

end;

//E y F
procedure mostrarPrecios(v2:vector2; dimL2:integer);
var
	i:integer;
	total, prom:real;
begin 
	total:=0;
	prom:=0;
	for i:=1 to dimL2 do begin 
		writeln;
		write('cod producto: ', v2[i].cod, ', precio: ', v2[i].precio:0:2);
		total:= total + v2[i].precio;
	end;
	prom:= total/dimL2;
	writeln;
	write('El promedio de los productos del tercer rubro es de: ', prom:0:2);
end;


var 
	v:vector;
	v2:vector2;
	dimL2:integer;
begin
	dimL2:=1;
	//A
	cargarDatos(v);
	//B
	mostrar(v);
	//C
	generarNuevoVector(v2, v[3], dimL2);
	//D
	ordenarVector(v2, dimL2);
	//E Y F
	mostrarPrecios(v2, dimL2);

end.
	
	
		



