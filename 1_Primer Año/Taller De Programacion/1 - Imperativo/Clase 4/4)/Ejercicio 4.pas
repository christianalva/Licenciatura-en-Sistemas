program Ejercicio4;
type

	informacionPrestamos = record 
		isbn:integer;
		numSocio:integer;
		dia:1..31;
		mes:1..12;
		cantDias:integer;
	end;
	
	//=========== arbol 1 ================ 
	arbol1 = ^nodoArbol1;
	
	nodoArbol1 = record 
		dato:informacionPrestamos;
		HI:arbol1;
		HD:arbol1;
	end;
	
	//=========== arbol 2 =================
	lista = ^nodo;
	
	nodo = record 
		dato:informacionPrestamos;
		sig:lista;
	end;

	arbol2 = ^nodoArbol2;
	
	nodoArbol2 = record 
		isbn:integer;
		dato:lista;
		HI:arbol2;
		HD:arbol2;
	end;
	
	//==== arbol para punto f ======
	cantTotalPrestamos = record 
		isbn:integer;
		cantTotal:integer;
	end;
	
	arbolContador = ^nodoArbolContador;
	
	nodoArbolContador = record 
		dato:cantTotalPrestamos;
		HI:arbolContador;
		HD:arbolContador;
	end;
	
	//==== arbol para punto g) ====
	cantTotalPrestamosG = record 
		isbn:integer;
		cantTotal:integer;
	end;
	
	arbolContadorG = ^nodoArbolContadorG;
	
	nodoArbolContadorG = record 
		dato:cantTotalPrestamosG;
		HI:arbolContadorG;
		HD:arbolContadorG;
	end;
	
	
	

procedure generarArbol(var a1: arbol1; var a2:arbol2);
	procedure leerInformacion(var i:informacionPrestamos);
	begin 
		i.isbn:=random(50);
		if(i.isbn<>0) then begin
			i.numSocio:=random(1000);
			i.dia:=random(31)+1;
			i.mes:=random(12)+1;
			i.cantDias:=random(100);
		end;
	end;
	
	//====================== A) i =======================
	procedure insertarArbol1(var a1:arbol1; i:informacionPrestamos);
	begin 
		if(a1 = nil) then begin 
			new(a1);
			a1^.dato:=i;
			a1^.HI:=nil;
			a1^.HD:=nil;
		end
		else if(i.isbn < a1^.dato.isbn) then 
			insertarArbol1(a1^.HI, i)
		else
			insertarArbol1(a1^.HD, i);
	end;
	
	//================== A) ii ========================
	procedure agregarAdelante(var l:lista; i:informacionPrestamos);
	var
		nue:lista;
	begin 
		new(nue);
		nue^.dato:=i;
		nue^.sig:=l;
		l:=nue;
	end;
	
	procedure insertarArbol2(var a2:arbol2; i:informacionPrestamos);
	begin 
		if(a2 = nil) then begin
			new(a2);
			a2^.isbn:=i.isbn;
			a2^.dato:=nil;
			agregarAdelante(a2^.dato, i);
			a2^.HI:=nil;
			a2^.HD:=nil;
		end
		else if(i.isbn < a2^.isbn) then 
			insertarArbol2(a2^.HI, i)
		else if(i.isbn > a2^.isbn) then
			insertarArbol2(a2^.HD, i)
		else
			agregarAdelante(a2^.dato, i);
	end;
	
var
	i:informacionPrestamos;
begin 
	a1:=nil;
	a2:=nil;
	leerInformacion(i);
	while(i.isbn<>0) do begin
		//a) i
		insertarArbol1(a1, i);
		//a) ii
		insertarArbol2(a2, i);
		leerInformacion(i)
	end;

end;

procedure imprimirArbol1(a1:arbol1);
begin 
	if(a1<>nil) then begin 
		imprimirArbol1(a1^.HI);
		writeln('ISBN: ', a1^.dato.isbn, ', numero de socio: ', a1^.dato.numSocio, ', dia: ', a1^.dato.dia, ', mes: ', a1^.dato.mes, ', dias de prestamos: ', a1^.dato.cantDias);
		imprimirArbol1(a1^.HD);
	end;
end;

procedure imprimirArbol2(a2:arbol2);
var 
	aux:lista;
begin 
	if(a2<>nil) then begin 
		imprimirArbol2(a2^.HI);
		aux:=a2^.dato;
		writeln('Prestamos realizados al ISBN: ', a2^.isbn);
		while(aux<>nil) do begin
			writeln('ISBN: ', aux^.dato.isbn, ', numero de socio: ', aux^.dato.numSocio, ', dia: ', aux^.dato.dia, ', mes: ', aux^.dato.mes, ', dias de prestamos: ', aux^.dato.cantDias);
			aux:=aux^.sig;
		end;
		imprimirArbol2(a2^.HD);
	end;
end;

//======================= B) ========================
procedure buscarIsbnMasGrande(a1:arbol1; var isbn:integer);
begin
  if(a1<>nil) then begin
    buscarIsbnMasGrande(a1^.HI, isbn);
    if(isbn < a1^.dato.isbn) then 
      isbn:=a1^.dato.isbn;
    buscarIsbnMasGrande(a1^.HD, isbn);
  end;
end;

//======================== C) ========================
// revisarlo y hacerlo directamente por el HI ya que hay estaria el mas chico  
procedure buscarUsbnMasPequenio(a2:arbol2; var isbn:integer);
begin 
  if(a2<>nil) then begin 
    if(isbn > a2^.isbn) then 
      isbn:=a2^.isbn;
    buscarUsbnMasPequenio(a2^.HI, isbn);
  end;
end;

//======================= D) ==========================
procedure buscarCantidadDePrestamos(a1:arbol1; socio:integer; var prestamos:integer);
begin 
  if(a1<>nil) then begin 
    buscarCantidadDePrestamos(a1^.HI, socio, prestamos);
    if(socio = a1^.dato.numSocio) then  
      prestamos:=prestamos+1;
    buscarCantidadDePrestamos(a1^.HD, socio, prestamos);
  end;
end;

//======================= E) ==========================
procedure buscarCantidadDePrestamos2(a2:arbol2; socio:integer; var prestamos2:integer);
var 
	aux:lista;
begin 
	if(a2<>nil) then begin
		buscarCantidadDePrestamos2(a2^.HI, socio, prestamos2);
		aux:=a2^.dato;
		while(aux<>nil) do begin
			if(aux^.dato.numSocio = socio) then 
				prestamos2:=prestamos2+1;
			aux:=aux^.sig;
		end;
		buscarCantidadDePrestamos2(a2^.HD, socio, prestamos2);
	end;
end;

//========================= F) ==========================
procedure agregarArbolcontador(var ac:arbolContador; info:informacionPrestamos);
begin 
	if(ac = nil) then begin 
		new(ac);
		ac^.dato.isbn:=info.isbn;
		ac^.dato.cantTotal:= 1;
		ac^.HI:=nil;
		ac^.HD:=nil;
	end
	else if(info.isbn < ac^.dato.isbn) then 
		agregarArbolcontador(ac^.HI, info)
	else if(info.isbn > ac^.dato.isbn) then 
		agregarArbolcontador(ac^.HD, info)
	else 
		ac^.dato.cantTotal:= ac^.dato.cantTotal+1;
end;
procedure ordenarPorIsbn(a1:arbol1; var ac:arbolContador);
begin 
	if(a1<>nil) then begin
		ordenarPorIsbn(a1^.HI, ac);                                              
		agregarArbolcontador(ac, a1^.dato);
		ordenarPorIsbn(a1^.HD, ac);
	end;
end;

procedure imprimirPuntoF(ac:arbolContador);
begin 
	if(ac<>nil) then begin 
		imprimirPuntoF(ac^.HI);
		writeln('ISBN: ', ac^.dato.isbn, ' cantidad total de veces que se presto: ', ac^.dato.cantTotal);
		imprimirPuntoF(ac^.HD);
	end;
end;

//=========================== G) =================================
procedure agregarArbolcontadorG(var ag:arbolContadorG; info:informacionPrestamos);
begin 
	if(ag = nil) then begin
		new(ag);
		ag^.dato.isbn:=info.isbn;
		ag^.dato.cantTotal:=1;
		ag^.HI:=nil;
		ag^.HD:=nil;
	end
	else if(info.isbn < ag^.dato.isbn) then 
		agregarArbolcontadorG(ag^.HI, info)
	else if(info.isbn > ag^.dato.isbn) then 
		agregarArbolcontadorG(ag^.HD, info)
	else 
		ag^.dato.cantTotal:=ag^.dato.cantTotal+1;
	
end;

procedure ordenarPorIsbnG(a2:arbol2; var ag:arbolContadorG);
var
	aux:lista;
begin 
	if(a2<>nil) then begin
		ordenarPorIsbnG(a2^.HI, ag);
		aux:=a2^.dato;
		while(aux<>nil) do begin 
			agregarArbolcontadorG(ag, aux^.dato);
			aux:=aux^.sig;
		end;
		ordenarPorIsbnG(a2^.HD, ag);
	end;
end;

//======================= H) =============================

procedure imprimirPuntoG(ag:arbolContadorG);
begin 
	if(ag<>nil) then begin 
		imprimirPuntoG(ag^.HI);
		writeln('ISBN: ', ag^.dato.isbn, ' cantidad total de veces que se presto: ', ag^.dato.cantTotal);
		imprimirPuntoG(ag^.HD);
	end;
end;

//======================== I) =============================
procedure buscarValoresComprendidosIsbn(a1:arbol1; min, max:integer; var cant:integer);
begin 
	if(a1<>nil) then begin
		buscarValoresComprendidosIsbn(a1^.HI, min, max, cant);
		if(a1^.dato.isbn >= min) and (a1^.dato.isbn <= max) then 
			cant:=cant+1;
		buscarValoresComprendidosIsbn(a1^.HD, min, max, cant);
	end;
end;


//=========================== j) ============================
procedure buscarValoresComprendidosIsbn2(a2:arbol2; min, max:integer; var cant2:integer);
var
	aux:lista;
begin
	if(a2<>nil) then begin
		buscarValoresComprendidosIsbn2(a2^.HI, min, max, cant2);
		aux:=a2^.dato;
		while(aux<>nil) do begin
			if(aux^.dato.isbn >= min) and (aux^.dato.isbn <= max) then
				cant2:=cant2+1;
			aux:=aux^.sig;
		end;
		buscarValoresComprendidosIsbn2(a2^.HD, min, max, cant2);
	end;
end;


//PROGRAMA PRINCIPAL

var 
	a1:arbol1;
	a2:arbol2;
	ac:arbolContador;
	ag:arbolContadorG;
	isbnMax, isbnMin, numSocio, cantPrestamos, cantPrestamos2, isbn1, isbn2, cantPrestamos3, cantPrestamos4:integer;
begin 
  isbnMax:=-1;
  isbnMin:=9999;
  cantPrestamos:=0;
  cantPrestamos2:=0;
  numSocio:=-1;
  cantPrestamos3:=0;
  cantPrestamos4:=0;
	randomize;
  //===================== A) =========================
	generarArbol(a1, a2);
	writeln('================ ARBOL 1 =================');
	imprimirArbol1(a1);
	writeln;
	writeln;
	writeln('================ ARBOL 2 ==================');
	imprimirArbol2(a2);
  //===================== B) =========================
  writeln;
	writeln;
  buscarIsbnMasGrande(a1, isbnMax);
  if(isbnMax = -1) then 
    writeln('El Arbol se encuentra vacio.')
  else 
    writeln('El ISBN mas grande es el: ', isbnMax);
  //===================== C) =========================
  buscarUsbnMasPequenio(a2, isbnMin);
  if(isbnMin = 9999) then 
    writeln('El Arbol se encuentra vacio.')
  else 
    writeln('El ISBN mas chico es el: ', isbnMin);
  //===================== D) =========================
  writeln;
	writeln;
  writeln('Ingrese un numero de socio: ');
  read(numSocio);
  buscarCantidadDePrestamos(a1, numSocio, cantPrestamos);
  if(numSocio = -1) then
    writeln('El numero de socio no existe.')
  else 
    writeln('La cantidad de prestamos realizados por el socio: ', numSocio, ' es de: ', cantPrestamos);
  //==================== E) ========================
  buscarCantidadDePrestamos2(a2, numSocio, cantPrestamos2);
  if(numSocio = -1) then
    writeln('El numero de socio no existe.')
  else 
    writeln('La cantidad de prestamos realizados por el socio: ', numSocio, ' es de: ', cantPrestamos2);
  //====================== F) ========================
  ac:=nil;
  ordenarPorIsbn(a1, ac);
  writeln;
  writeln;
  imprimirPuntoF(ac);
  //====================== G) ========================
  ag:=nil;
  ordenarPorIsbnG(a2, ag);
  writeln;
  writeln;
  //====================== H) ========================
  imprimirPuntoG(ag);
  //====================== I) ========================
  writeln;
  writeln;
  writeln('Ingrese un valor: ');
  read(isbn1);
  writeln('Ingrese otro valor (mayor al anterior): ');
  read(isbn2);
  buscarValoresComprendidosIsbn(a1, isbn1, isbn2, cantPrestamos3);
  writeln('La cantidad total de prestamos comprendidos entre: ', isbn1, ' y ', isbn2, ' es de: ', cantPrestamos3);
  //====================== J) =========================
  writeln;
  writeln;
  buscarValoresComprendidosIsbn2(a2, isbn1, isbn2, cantPrestamos4);
  writeln('La cantidad total de prestamos comprendidos entre: ', isbn1, ' y ', isbn2, ' es de: ', cantPrestamos4);
end.
