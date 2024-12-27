{
El Correo Argentino necesita procesar los envíos entregados durante el mes de Agosto de 2023. De cada envio se conoce el código del cliente, dia, código postal y peso del paquete.)

a) Implementar un módulo que lea envíos, genere y retorne una estructura adecuada para la búsqueda por código postal, donde para cada código postal se almacenen juntos todos los envíos (código de cliente, día y peso del paquete). La lectura finaliza con peso de paquete 0. Se sugiere utilizar el módulo leerEnvio ().

b) Implementar un módulo que reciba la estructura generada en a) y un código postal, y retorne todos los envíos de dicho código postal.

c) Realizar un módulo recursivo que reciba la estructura que retorna el inciso b) y retorne los dos códigos de cliente correspondientes al envío con mayor y menor peso.
}
program Parcial;
type
	envio=record
		codCliente:integer;
		dia:1..31;
		codPostal:integer;
		pesoPaquete:real;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record 
		dato:envio;
		sig:lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record 
		codPostal:integer;
		dato:lista;
		HI:arbol;
		HD:arbol;
	end;
	
procedure generarArbol(var a:arbol);
	procedure leerDatos(var e:envio);
	begin 
		e.pesoPaquete:= random(2000)/(random(10)+1);
		if(e.pesoPaquete<>0) then begin 
			e.codCliente:=random(100) + 1;
			e.dia:=random(31)+1;
			e.codPostal:=random(7500) + 1;
		end;
	end;
	
	procedure agregarAdelante(var l:lista; e:envio);
	var
		nue:lista;
	begin 
		new(nue);
		nue^.dato:=e;
		nue^.sig:=l;
		l:=nue;
	end;
	
	procedure insertaArbol(var a:arbol; e:envio);
	begin 
		if(a = nil) then begin 
			new(a);
			a^.codPostal:=e.codPostal;
			a^.dato:=nil;
			agregarAdelante(a^.dato, e);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(e.codPostal < a^.codPostal) then 
			insertaArbol(a^.HI, e)
		else if(e.codPostal > a^.codPostal) then 
			insertaArbol(a^.HD, e)
		else 
			agregarAdelante(a^.dato, e);
	end;

var
	e:envio;
begin 
	a:=nil;
	leerDatos(e);
	while(e.pesoPaquete<>0) do begin 
		insertaArbol(a, e);
		leerDatos(e);
	end;
end;

procedure imprimirArbol(a:arbol);
var 
	aux:lista;
begin 
	if(a<>nil) then begin 
		imprimirArbol(a^.HI);
		writeln('Cod Postal: ', a^.codPostal);
		aux:=a^.dato;
		while (aux<>nil) do begin 
			writeln('Cod Cliente: ', aux^.dato.codCliente, ', Dia: ', aux^.dato.dia, ', Peso del paquete: ', aux^.dato.pesoPaquete:5:2);
			aux:=aux^.sig;
		end;
		imprimirArbol(a^.HD);
	end;
end;

procedure retornarEnvios(a:arbol; codPostal:integer; var l:lista);
begin 
	if(a<>nil) then begin 
		retornarEnvios(a^.HI, codPostal, l);
		if(a^.codPostal = codPostal) then 
			l:=a^.dato;
		retornarEnvios(a^.HD, codPostal, l);
	end;
end;

procedure informarEnvios(l:lista; codPostal:integer);
begin
	if(l=nil) then 
		writeln('El cod Postal no existe.')
	else begin 
		writeln('Envios de cod postal ', codPostal, ': ');
		while(l<>nil) do begin 
			writeln('Cod Cliente: ', l^.dato.codCliente, ', Dia: ', l^.dato.dia, ', Peso del paquete: ', l^.dato.pesoPaquete:5:2);
			l:=l^.sig
		end;
	end;
end;

procedure buscarMayoryMenor(l:lista; min, max:real; var codMin:integer; var codMax:integer);
begin 
	if(l<>nil) then begin 
		if(l^.dato.pesoPaquete < min) then begin 
			min:=l^.dato.pesoPaquete;
			codMin:=l^.dato.codCliente;
		end; 
		if(l^.dato.pesoPaquete > max) then begin 
			max:=l^.dato.pesoPaquete;
			codMax:=l^.dato.codCliente;
		end;
		l:=l^.sig;
		buscarMayoryMenor(l, min, max,codMin, codMax);
	end;
end;
	

var
	a:arbol;
	codPostal, codClienteMin, CodClienteMax:integer;
	pesoMax, pesoMin:real;
	l:lista;
begin 
	randomize;
	pesoMin:=9999;
	pesoMax:=-1;
	codClientemin:=0;
	codClienteMax:=0;
	// A)
	generarArbol(a);
	imprimirArbol(a);
	// B)
	writeln;
	writeln;
	l:=nil;
	writeln('Ingrese un cod Postal a buscar: '); 
	read(codPostal);	
	retornarEnvios(a, codPostal, l);
	informarEnvios(l, codPostal);
	// C)
	buscarMayoryMenor(l, pesoMin, pesoMax, codClienteMin, codClienteMax);
	writeln('Código de cliente con mayor peso: ', codClienteMax);
    writeln('Código de cliente con menor peso: ', codClienteMin);
end.
