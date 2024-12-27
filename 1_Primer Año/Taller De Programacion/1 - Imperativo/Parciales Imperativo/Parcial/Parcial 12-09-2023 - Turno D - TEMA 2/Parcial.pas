{
Aerolíneas Argentinas necesita procesar los pasajes vendidos durante 2023. De cada pasaje se conoce el código de vuelo, código del cliente, código ciudad destino y monto del pasaje.

a) Implementar un módulo que lea pasajes, genere y retorne una estructura adecuada para la búsqueda por código de ciudad destino, donde para cada código de ciudad destino se almacenan juntos todos los pasajes (código de vuelo, código de cliente y monto del pasaje). La lectura finaliza con el monto de pasaje 0. Se sugiere utilizar el módulo leerPasaje().

b) Implementar un módulo que reciba la estructura generada en a) y un código de ciudad destino y retorne todos los pasajes hacia esa ciudad destino.

c) Realizar un módulo que reciba la estructura generada en a) y retorne el código de ciudad de destino con mayor cantidad de pasajes vendidos.
}
program Parcial;
type
	pasaje = record
		codVuelo:integer;
		codCliente:integer;
		codCiudadDestino:integer;
		montoPasaje:real;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record 
		dato:pasaje;
		sig:lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		codCiudad:integer;
		dato:lista;
		HI:arbol;
		HD:arbol;
	end;
	
procedure generarArbol(var a:arbol);
	procedure leerDatos(var p:pasaje);
	begin 
		p.montoPasaje:=random(9999)/(random(10)+1);
		if(p.montoPasaje<>0) then begin 
			p.codVuelo:=random(100);
			p.codCliente:=random(100);
			p.codCiudadDestino:=random(500)+1;
		end;
	end;
	
	procedure agregarAdelante(var l:lista; p:pasaje);
	var
		nue:lista;
	begin 
		new(nue);
		nue^.dato:=p;
		nue^.sig:=l;
		l:=nue;
	end;
	
	procedure insertaArbol(var a:arbol; p:pasaje);
	begin 
		if(a=nil) then begin 
			new(a);
			a^.codCiudad:=p.codCiudadDestino;
			a^.dato:=nil;
			agregarAdelante(a^.dato, p);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(p.codCiudadDestino < a^.codCiudad) then 
			insertaArbol(a^.HI, p)
		else if(p.codCiudadDestino > a^.codCiudad) then 
			insertaArbol(a^.HD, p)
		else 
			agregarAdelante(a^.dato, p);
	end;	



var
	p:pasaje;
begin 
	a:=nil;
	leerDatos(p);
	while(p.montoPasaje <> 0) do begin 
		insertaArbol(a, p);
		leerDatos(p);
	end;
end;

procedure mostrarArbol(a:arbol);
var
	aux:lista;
begin 
	if(a<>nil) then begin 
		mostrarArbol(a^.HI);
		writeln('Cod Ciudad: ', a^.codCiudad);
		aux:=a^.dato;
		while(aux<>nil) do begin
			writeln('Cod de vuelo: ', aux^.dato.codVuelo, ', cod cliente: ', aux^.dato.codCliente, ', monto pasaje: ', aux^.dato.montoPasaje:5:2); 
			aux:=aux^.sig;
		end;
		mostrarArbol(a^.HD);
	end;
end;

//====================================================================
procedure agregarListaNueva(var l:lista; p:pasaje);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=p;
	nue^.sig:=l;
	l:=nue;
end;

procedure buscarCiudadDestino(a:arbol; ciudad:integer; var l:lista);
var 
	aux:lista;
begin 
	if(a<>nil) then begin 
		if(a^.codCiudad = ciudad) then begin 
			aux:=a^.dato;
			while(aux<>nil) do begin 
				agregarListaNueva(l, aux^.dato);
				aux:=aux^.sig;
			end;
		end
		else if(a^.codCiudad > ciudad) then 
			buscarCiudadDestino(a^.HI, ciudad, l)
		else 
			buscarCiudadDestino(a^.HD, ciudad, l);
	end;
end;

//===================================================================

procedure mayorCantPasajes(a:arbol; var ciudad:integer; var cantMax:integer);
var
	cant:integer;
	aux:lista;
begin 
	cant:=0;
	if(a<>nil) then begin
		aux:=a^.dato;
		while(aux<>nil) do begin
			cant:=cant+1;
			aux:=aux^.sig;
		end;
		if(cant > cantMax) then begin 
			cantMax:=cant;
			ciudad:=a^.codCiudad;
		end;
		mayorCantPasajes(a^.HI, ciudad, cantMax);
		mayorCantPasajes(a^.HD, ciudad, cantMax);
	end;
end;

var 
	a:arbol;
	ciudadDestino, codCiudadMax, cantPasajesVendidos:integer;
	l:lista;
begin 	
	randomize;
	codCiudadMax:=0;
	cantPasajesVendidos:=0;
	// A)
	generarArbol(a);
	mostrarArbol(a);
	// B)
	l:=nil;
	writeln;
	writeln;
	writeln('Ingrese un cod de ciudad: '); 
	read(ciudadDestino);
	buscarCiudadDestino(a, ciudadDestino, l);
	if(l=nil) then 
		writeln('La ciudad destino no existe o no tiene pasajes')
	else begin
		writeln('Ciudad destino: ', ciudaddestino);
		while(l<>nil) do begin 
			writeln('Cod de vuelo: ', l^.dato.codVuelo, ', cod cliente: ', l^.dato.codCliente, ', monto pasaje: ', l^.dato.montoPasaje:5:2); 
			l:=l^.sig;
		end;
	end;
	//c) 
	writeln;
	writeln;
	mayorCantPasajes(a, codCiudadMax, cantPasajesVendidos);
	writeln('El codigo de ciudad de destino con mayor cant de pasajes vendidos es: ', codCiudadMax, ', con un total de: ', cantPasajesVendidos, ' pasajes vendidos.');
end.
	
