{
PlayStation Store requiere procesar las compras realizadas por sus clientes durante el año 2022.

a) Implementar un módulo que lea compras de videojuegos. De cada compra se lee código del videojuego, código de cliente, día y mes. La lectura finaliza con el código de cliente 0. Se sugiere utilizar el módulo leerCompra(). Se deben retornar 2 estructuras de datos:

i. Una estructura eficiente para la búsqueda por código de cliente.

ii. Otra estructura que almacena la cantidad de compras realizadas en cada mes.

b) Implementar un módulo que reciba la estructura generada en a) i, un código de cliente, retorne todas las compras que realizó dicho cliente.

c) Implementar un módulo que reciba la estructura generada en a) ii y retorne la misma estructura ordenada por cantidad de mayor a menor.
}
program Parcial;
const
	dimF = 12;
type
	compras = record 	
		codVideojuego:integer;
		codCliente:integer;
		dia:1..31;
		mes:1..12;
	end;
	
	// i
	lista = ^nodoLista;
	
	nodoLista = record 
		dato:compras;
		sig:lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record 
		codCliente:integer;
		dato:lista;
		HI:arbol;
		HD:arbol;
	end;
	
	// ii
	vector = array [1..dimF] of integer;
	
procedure inicializarVector(var v:vector);
var 
	i:integer;
begin 
	for i:=1 to dimF do begin 
		v[i]:=0;
	end;
end;

procedure generarArbolYVector(var a:arbol; var v:vector);
	procedure leerDatos(var c:compras);
	begin 
		c.codCliente:=random(100);
		if(c.codCliente<> 0) then begin 
			c.dia:=random(31) + 1;
			c.mes:= random(12)+1;
			c.codVideojuego:=random(2000) + 1;
		end;
	end;
	
	procedure agregarAdelante(var l:lista; c:compras);
	var 
		nue:lista;
	begin 
		new(nue);
		nue^.dato:=c;
		nue^.sig:=l;
		l:=nue;
	end;

	procedure insertarArbol(var a:arbol; c:compras);
	begin
		if(a=nil) then begin 
			new(a);
			a^.codCliente:=c.codCliente;
			a^.dato:=nil;
			agregarAdelante(a^.dato, c);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(c.codCliente < a^.codCliente) then 
			insertarArbol(a^.HI, c)
		else if(c.codCliente > a^.codcliente) then
			insertarArbol(a^.HD, c)
		else 
			agregarAdelante(a^.dato, c);
	
	end;
	
	procedure insertarVector(var v:vector; c:compras);
	begin 
		v[c.mes]:=v[c.mes]+1;
	end;


var 
	c:compras;
begin
	a:=nil;
	leerDatos(c);
	while(c.codCliente<>0) do begin 
		insertarArbol(a, c);
		insertarVector(v, c);
		leerDatos(c);
	end;
end;


procedure imprimirArbol(a:arbol);
var 
	aux:lista;
begin 
	if(a<>nil) then begin 
		imprimirArbol(a^.HI);
		writeln('Cod cliente: ', a^.codCliente);
		aux:=a^.dato;
		while(aux <> nil) do begin
			writeln('Dia: ', aux^.dato.dia, ', Mes: ', aux^.dato.mes, ', Cod Juego: ', aux^.dato.codVideojuego);
			aux:=aux^.sig;
		end;
		imprimirArbol(a^.HD);
	end;
end;

procedure puntoB(a:arbol; cod:integer; var cant:integer);
var
	aux:lista;
begin 
	if(a<>nil) then begin 
		if(a^.codCliente = cod) then begin 
			aux:=a^.dato;
			while(aux<>nil) do begin 
				cant:=cant+1;
				aux:=aux^.sig;
			end;
		end
		else if(cod < a^.codCliente) then 
			puntoB(a^.HI, cod, cant)
		else 
			puntoB(a^.HD, cod, cant);
			
	end;
end;

procedure puntoC(var v:vector);
var
	i, j, pos:integer;
	item:integer;
begin 
	for i:=1 to dimF-1 do begin 
		pos:=i;
		for j:=i+1 to dimF do 
			if(v[j]>v[pos]) then 
				pos:=j;
		item:=v[pos];
		v[pos]:=v[i];
		v[i]:=item;
	end;
end;

procedure imprimirVector(v:vector);
var
	i:integer;
begin 
	for i:=1 to dimF do begin 
		writeln('Mes: ', i, ', cant Compras: ', v[i]);
	end;
end;

var
	v:vector;
	a:arbol;
	cod, cantCompras:integer;
begin 
	randomize;
	cantCompras:=0;
	inicializarVector(v);
	generarArbolYVector(a, v);
	imprimirArbol(a);
	// B)
	writeln;
	writeln('Ingrese un cod de cliente: '); 
	read(cod);
	puntoB(a, cod, cantCompras);
	writeln('La cantidad de compras del cliente con DNI: ', cod, ', es de: ', cantCompras, ' compras.');
	// C)
	writeln;
	puntoC(v);
	writeln('Compras ordenadas por cantidad de mayor a menor: ');
	imprimirVector(v);
end.
