{
La biblioteca Sarmiento necesita un sistema para obtener estadísticas sobre los libros prestados. De cada préstamo se conoce: el número de préstamo, ISBN del libro y código de socio. La lectura finaliza con código de socio 0 y todos los préstamos realizados a un mismo socio se leen consecutivamente.

a) Implementar un módulo que lea información de los préstamos y genere:

i. Una estructura de datos eficiente para la búsqueda por ISBN del libro.

ii. Una estructura donde se almacenen códigos de socios junto a su cantidad de préstamos.

b) Implementar un módulo que reciba la estructura generada en a) y un ISBN y retorne la cantidad de préstamos de

ese ISBN

c) Realizar un módulo recursivo que reciba la estructura generada en a) ii y un valor X y retorne la cantidad de socios con cantidad de préstamos superior al valor X.

}
program Parcial; 
type
	prestamo = record 
		numPrestamo:integer;
		isbn:integer;
		codSocio:integer;
	end;
	
	//i
	lista = ^nodoLista;
	
	nodoLista = record 
		dato:prestamo;
		sig:lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		isbn:integer;
		dato:lista;
		HI:arbol;
		HD:arbol;
	end;
	
	// ii
	arbolPrestamos = ^nodoArbolPrestamos;
	
	nodoArbolPrestamos = record
		codSocios:integer;
		cantPrestamos:integer;
		HI:arbolPrestamos;
		HD:arbolPrestamos;
	end;
	
	
procedure generarArbolYLista(var a:arbol; var ap: arbolPrestamos);
	procedure leerDatos(var p:prestamo);
	begin 
		p.codSocio:=random(50);
		if(p.codSocio<>0) then begin
			p.numPrestamo:=random(30)+1;
			p.isbn:=random(20)+1;
		end;
	end;
	
	procedure agregarAdelante(var l:lista; p:prestamo);
	var
		nue:lista;
	begin 
		new(nue);
		nue^.dato:=p;
		nue^.sig:=l;
		l:=nue;
	end;
	
	procedure insertarArbol(var a:arbol; p:prestamo);
	begin 
		if(a=nil) then begin 
			new(a);
			a^.isbn:=p.isbn;
			a^.dato:=nil;
			agregarAdelante(a^.dato, p);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(p.isbn < a^.isbn) then 
			insertarArbol(a^.HI, p)
		else if(p.isbn > a^.isbn) then
			insertarArbol(a^.HD, p)
		else 
			agregarAdelante(a^.dato, p);	
	end;
	
	procedure insertarArbolPrestamos(var ap:arbolPrestamos; p:prestamo);
	begin 
		if(ap=nil) then begin 
			new(ap);
			ap^.codSocios:=p.codSocio;
			ap^.cantPrestamos:=1;
			ap^.HI:=nil;
			ap^.HD:=nil;
		end
		else if(p.codSocio < ap^.codSocios) then
			insertarArbolPrestamos(ap^.HI, p)
		else if(p.codSocio > ap^.codSocios) then 
			insertarArbolPrestamos(ap^.HD, p)
		else 
			ap^.cantPrestamos:=ap^.cantPrestamos+1;
	end;

var
	p:prestamo;
begin 
	a:=nil;
	ap:=nil;
	leerDatos(p);
	while(p.codSocio<>0) do begin
		insertarArbol(a, p);
		insertarArbolPrestamos(ap, p);
		leerDatos(p);
	end;

end;

procedure imprimirArbol(a:arbol);
var 
	aux:lista;
begin 
	if(a<>nil) then begin 
		imprimirArbol(a^.HI);
		writeln('ISBN: ', a^.isbn);
		aux:=a^.dato;
		while(aux<>nil) do begin 
			writeln('Numero de prestamo: ', aux^.dato.numPrestamo, ', Cod socio:', aux^.dato.codSocio);
			aux:=aux^.sig;
		end;
		imprimirArbol(a^.HD);
	end;
end;
	
procedure imprimirArbolPrestamos(ap:arbolPrestamos);
begin 
	if(ap<>nil) then begin 
		imprimirArbolPrestamos(ap^.HI);
		writeln('Cod socios: ', ap^.codSocios, ', cant Prestamos: ', ap^.cantPrestamos);
		imprimirArbolPrestamos(ap^.HD);
	end;
end;

//=================================================================
procedure cantDePrestamosISBN(a:arbol; isbn:integer; var cant:integer);
var 
	aux:lista;
begin 
	if(a<>nil) then begin 
		if(a^.isbn = isbn) then begin 
			aux:=a^.dato;
			while(aux<>nil) do begin 
				cant:=cant+1;
				aux:=aux^.sig;
			end;
		end
		else if(a^.isbn > isbn) then 
			cantDePrestamosISBN(a^.HI, isbn, cant)
		else
			cantDePrestamosISBN(a^.HD, isbn, cant);
	end;
end;

//===================================================================
procedure cantDeSociosSupAX(a:arbolPrestamos; x:integer; var cant:integer);
begin 
	if(a<>nil) then begin
		cantDeSociosSupAX(a^.HI, x, cant);
		if(a^.cantPrestamos > x) then
			cant:=cant+1;
		cantDeSociosSupAX(a^.HD, x, cant);
			
	end;
end;

var 
	a:arbol;
	ap:arbolPrestamos;
	isbn, cantPrestamos, x, cantSocios:integer;
begin 
	randomize;
	cantPrestamos:=0;
	cantSocios:=0;
	// A)
	generarArbolYLista(a, ap);
	imprimirArbol(a);
	writeln;
	writeln;
	imprimirArbolPrestamos(ap);
	// B)
	writeln;
	writeln;
	writeln('Ingrese un isbn a buscar');
	read(isbn);
	cantDePrestamosISBN(a, isbn, cantPrestamos);
	writeln('La cantidad de prestamos del ISBN: ', isbn, ' es de: ', cantPrestamos);
	// C)
	writeln;
	writeln;
	writeln('Ingrese un valor: ');
	read(x);
	cantDeSociosSupAX(ap, x, cantSocios);
	writeln('La cantidad de socios con cantidad de prestamos superior a: ', x, ', es de: ', cantSocios);
end.
