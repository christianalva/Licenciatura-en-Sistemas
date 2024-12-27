{
Se lee información de las compras realizadas por los clientes a un supermercado en el año 2022. De cada compra se lee el código de cliente, número de mes y monto gastado. La lectura finaliza cuando se lee el cliente con código 0.

a) Realizar un módulo que lea la información de las compras y retorne una estructura de datos eficiente para la búsqueda por código de cliente. Para cada cliente, esta estructura debe acumular el monto total gastado para cada mes del año 2022. Se sugiere utilizar el módulo leerCompra().

b) Realizar un módulo que reciba la estructura generada en a) y un cliente, y retorne el mes con mayor gasto de dicho cliente,

c) Realizar un módulo que reciba la estructura generada en a) y un número de mes, y retorne la cantidad de clientes que no gastaron nada en dicho mes.
}

program parcial;
type
	vector = array[1..12] of real;
	compras = record
		codCliente:integer;
		mes:1..12;
		montoGastado:vector;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol=record 
		dato:compras;
		HI:arbol;
		HD:arbol;
	end;

procedure generarArbol(var a:arbol);
	procedure leerCompras(var c:compras);
	begin 
		c.codCliente:=random(50);
		if(c.codCliente<>0) then begin 
			c.mes:=random(12)+1;
			c.montoGastado[c.mes]:=random(1000)/(random(10)+1);
		end;
	end;
	
	procedure inicializarVector(var v:vector);
	var 
		i:integer;
	begin 
		for i:=1 to 12 do begin 
			v[i]:=0;
		end;
	end;
	
	procedure insertaArbol(var a:arbol; c:compras);
	begin 
		if(a=nil) then begin 
			new(a);
			a^.dato.codCliente:=c.codCliente;
			a^.dato.mes:=c.mes;
			inicializarVector(a^.dato.montoGastado);
			a^.dato.montoGastado[c.mes]:=c.montoGastado[c.mes];
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(c.codCliente < a^.dato.codCliente) then 
			insertaArbol(a^.HI, c)
		else if(c.codCliente > a^.dato.codCliente) then 
			insertaArbol(a^.HD, c)
		else 
			a^.dato.montoGastado[c.mes]:=a^.dato.montoGastado[c.mes]+c.montoGastado[c.mes];
	end;

var 
	c:compras;
begin
	a:=nil;
	leerCompras(c);
	while(c.codCliente<>0) do begin
		insertaArbol(a, c);
		leerCompras(c);
	end;

end;


procedure imprimirArbol(a:arbol);
var 
	i:integer;
begin 
	if(a<>nil) then begin 
		imprimirArbol(a^.HI);
		writeln('Cod de cliente: ', a^.dato.codCliente); 
		for i:=1 to 12 do begin 
			writeln('Mes: ', i , ' Monto total Gastado: ', a^.dato.montoGastado[i]:5:2);
		end;
		imprimirArbol(a^.HD);
	end;
end;

procedure buscarMesDeMayorGasto(a:arbol; cliente:integer; var mes:integer; var max:real);
var
	i:integer;
	aux:vector;
begin 
	if(a<>nil) then begin
		buscarMesDeMayorGasto(a^.HI, cliente, mes, max);
		if(a^.dato.codCliente = cliente) then begin 
			aux:=a^.dato.montoGastado;
			for i:=1 to 12 do begin 
				if(max < aux[i]) then begin 
					max:=aux[i];
					mes:=i;
				end;
			end;
		end;
		buscarMesDeMayorGasto(a^.HD, cliente, mes, max);
	end;
end;

procedure cantClientes(a:arbol; mes:integer; var cant:integer);
begin 
	if(a<>nil) then begin 
		cantClientes(a^.HI, mes, cant);
		if(a^.dato.montoGastado[mes] = 0) then 
			cant:=cant+1;
		cantClientes(a^.HD, mes, cant);
	end;
end;


var
	a:arbol;
	cliente, mesMax, numMes, noGastaron:integer;
	max:real;
begin 
	max:=-1;
	mesMax:=0;
	noGastaron:=0;
	randomize;
	// A)
	generarArbol(a);
	imprimirArbol(a);
	// B)
	writeln;
	writeln;
	writeln('Introduzca un numero de cliente: ');
	read(cliente);
	buscarMesDeMayorGasto(a, cliente, mesMax, max);
	writeln('El mes de mayor gasto del cliente: ', cliente, ', es  el mes: ', mesMax);
	// B)
	writeln;
	writeln;
	writeln('Ingrese un numero de mes: ');
	read(numMes);
	cantClientes(a, numMes, noGastaron);
	writeln('La cantidad de clientes que no gastaron nada en el mes: ', numMes, ' es de: ', noGastaron);

end.
