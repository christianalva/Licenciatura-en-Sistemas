{
Un comercio necesita el procesamiento de las compras realizadas por sus clientes durante el mes de julio de 2022. De cada compra se conoce código del cliente, día, cantidad de productos y monto pagado.

a) Implementar un módulo que lea compras, genere y retorne una estructura adecuada para la búsqueda por código del cliente, donde para cada código de cliente se almacenan juntas todas sus compras (día, cantidad de productos y monto) que realizó. La lectura finaliza con cantidad de productos 0. Se sugiere utilizar el módulo leerRegistro ().

b) Implementar un módulo que reciba la estructura generada en a) y un código de cliente y retorne todas las compras de dicho cliente.

c) Realizar un módulo recursivo que reciba la estructura que retorna el inciso b) y retorne el monto de la compra con mayor cantidad de productos.
}
program Parcial;
type
	compras = record 
		codCliente:integer;
		dia:1..31;
		cantProductos:integer;
		monto:real;
	end;
	
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
	
	
procedure generarArbol(var a:arbol);
	procedure leerDatos(var c:compras);
	begin 
		c.cantProductos:=random(30);
		if(c.cantProductos<>0) then begin 
			c.codCliente:= 1 + random(99);
			c.monto:= 150.80 + random(8000);
			c.dia:=random(31) + 1;
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
		else if(c.codCliente > a^.codCliente) then 
			insertarArbol(a^.HD, c)
		else 
			agregarAdelante(a^.dato, c);
	end;


var
	c:compras;
begin 
	a:=nil;
	leerDatos(c);
	while(c.cantProductos<>0) do begin 
		insertarArbol(a, c);
		leerDatos(c);
	end;
end;


procedure imprimirArbol(a:arbol);
var 
	aux:lista;
begin 
	if(a<>nil) then begin 
		imprimirArbol(a^.HI);
		writeln('Cod Cliente: ', a^.codCliente);
		aux:=a^.dato;
		while(aux<>nil) do begin
			writeln('Cant Productos: ', aux^.dato.cantProductos, ', Dia: ', aux^.dato.dia, ', Monto: ', aux^.dato.monto:5:2);
			aux:=aux^.sig;
		end;
		imprimirArbol(a^.HD);	
	end;
end; 

procedure agregarAdelante2(var l:lista; c:compras);
var
	nue:lista;
begin 
	new(nue);
	nue^.dato:=c;
	nue^.sig:=l;
	l:=nue;
end;

procedure puntoB(a:arbol; cod:integer; var l:lista);
var 
	aux:lista;
begin 
	if(a<>nil) then begin 
		if(a^.codCliente = cod) then begin 
			aux:=a^.dato;
			while(aux<>nil) do begin 
				agregarAdelante2(l, aux^.dato);
				aux:=aux^.sig;
			end;
		end
		else if(cod < a^.codCliente) then 
			puntoB(a^.HI, cod, l)
		else 
			puntoB(a^.HD, cod, l);
	end;
end;

procedure imprimirNuevaLista(l:lista);
begin 
	while(l<>nil) do begin 
		writeln('Cant Productos: ', l^.dato.cantProductos, ', Dia: ', l^.dato.dia, ', Monto: ', l^.dato.monto:5:2);
		l:=l^.sig;
	end;
end;

procedure puntoC(l:lista; var cant:integer; var monto:real);
begin 
	if(l<>nil) then begin 
		if(l^.dato.cantProductos > cant) then begin 
			cant:=l^.dato.cantProductos;
			monto:=l^.dato.monto;
		end;
	
		l:=l^.sig;
		puntoC(l, cant, monto);
	end;
end;

var
	a:arbol;
	cod, cantProductos:integer;
	l:lista;
	montoMax:real;
begin 
	randomize;
	cantProductos:=-1;
	montoMax:=0;
	//A
	generarArbol(a);
	imprimirArbol(a);
	//B
	l:=nil;
	writeln;
	writeln('Ingrese un Cod de cliente: ');
	read(cod);
	puntoB(a, cod, l);
	writeln;
	if(l=nil) then
		writeln('El cod de cliente ingresado no existe. ')
	else begin  
		writeln('Lista con Compras de Cliente con Cod: ', cod);
		imprimirNuevaLista(l);
	end;
	//C
	puntoC(l, cantProductos, montoMax);
	writeln;
	writeln('El monto de la compra con mayor cantiad de productos es de: ', montoMax:5:2);
end.
