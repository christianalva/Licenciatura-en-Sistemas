program Ejercicio3;
type
	productos = record 
		codProducto: 1..50;
		cantVendidos: integer;
		montoTotal:real;
	end;
	
	ventas = record 
		codVenta:integer;
		codProducto:1..50;
		cantUnidades:integer;
		precioUnitario:real;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record 
		dato:productos;
		HI:arbol;
		HD:arbol;
	end;
	
//============================= A) ==================================
procedure generarArbol(var a:arbol);
	procedure leerVentas(var v: ventas);
	begin 
		v.codVenta:=random(52) - 1;
		if(v.codVenta<>-1) then begin 
			v.codProducto:=random(50)+1;
			v.cantUnidades:=random(50)+1;
			v.precioUnitario:=random;
		end;
	end;
	
	procedure insertarVenta(var a:arbol; v:ventas);
	begin 
		if(a = nil) then begin 
			new(a);
			a^.dato.codProducto:=v.codProducto;
			a^.dato.cantVendidos:=v.cantUnidades;
			a^.dato.montoTotal:= v.cantUnidades * v.precioUnitario; //lo multiplico para saber el precio total de lo comprado
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(v.codProducto < a^.dato.codProducto) then 
			insertarVenta(a^.HI, v)
		else if(v.codProducto > a^.dato.codProducto) then
			insertarVenta(a^.HD, v)
		else begin 
			// si el producto ya se encuentra en el arbol sumo sus cantidades y precio total.
			a^.dato.cantVendidos:= a^.dato.cantVendidos + v.cantUnidades;
			a^.dato.montoTotal:= a^.dato.montoTotal + (v.cantUnidades * v.precioUnitario);
		end;
	end;
var
	v:ventas;
begin 
	a:=nil;
	leerVentas(v);
	while(v.codVenta<>-1) do begin 
		insertarVenta(a, v);
		leerVentas(v);
	end;

end;


//============================= B) =================================
procedure imprimirContenido(a:arbol);
begin
	if(a<>nil) then begin
		imprimirContenido(a^.HI);
		writeln('Codigo: ', a^.dato.codProducto, ', Cantidad de Ventas: ', a^.dato.cantVendidos, ', Monto Total: ', a^.dato.montoTotal:0:2);
		imprimirContenido(a^.HD);
	end;
end;

//=========================== C) =================================
procedure mayorCantidadVendidas(a:arbol; var maxCod:integer; var maxUnidades:integer);
begin
	if(a<>nil) then begin 
		mayorCantidadVendidas(a^.HI, maxCod, maxUnidades);
		if(maxUnidades < a^.dato.cantVendidos) then begin
			maxUnidades:=a^.dato.cantVendidos;
			maxCod:=a^.dato.codProducto;
		end;
		mayorCantidadVendidas(a^.HD, maxCod, maxUnidades);
	end;
end;

//========================= D) ================================
procedure codMenores(a:arbol; valor:integer; var cant:integer);
begin 
	if(a<>nil) then begin 
		codMenores(a^.HI, valor, cant);
		if(valor > a^.dato.codProducto) then
			cant:=cant+1;
		codMenores(a^.HD, valor, cant);
	end;
end;

//========================= E) ================================
procedure productosComprendidosEntreMinYMax(a:arbol; min, max:integer; var total:real);
begin
	if(a<>nil) then begin 
		productosComprendidosEntreMinYMax(a^.HI, min, max, total);
		if(a^.dato.codProducto > min) and (a^.dato.codProducto < max) then 
			total:= total + a^.dato.montoTotal;
		productosComprendidosEntreMinYMax(a^.HD, min, max, total);
	end;
end;

var
	a:arbol;
	maxCod, maxUnidades, valor, cantCod, min, max:integer;
	montoTotal:real;
begin 
	maxUnidades:=-1;
	maxCod:=0;
	cantCod:=0;
	montoTotal:=0;
	randomize;
	//A)
	generarArbol(a);
	//B)
	imprimirContenido(a);
	//C)
	mayorCantidadVendidas(a, maxCod, maxUnidades);
	writeln;
	writeln;
	writeln('El codigo de producto con mayor cantidad de ventas es: ', maxCod, ', con un total de: ', maxUnidades, ' vemtas.');
	//D)
	writeln;
	writeln;
	writeln('Ingrese un valor: ');
	read(valor);
	codMenores(a, valor, cantCod);
	writeln('La cantidad de codigos menores a: ', valor, ' es de: ', cantCod);
	//E)
	writeln;
	writeln;
	writeln('Ingrese el valor minimo: ');
	read(min);
	writeln('Ingrese el valor maximo: ');
	read(max);
	productosComprendidosEntreMinYMax(a, min, max, montoTotal); 
	writeln('El total de los codigos comprendidos entre: ', min, ' y: ', max, ' es de: ', montoTotal:0:2);

end.
