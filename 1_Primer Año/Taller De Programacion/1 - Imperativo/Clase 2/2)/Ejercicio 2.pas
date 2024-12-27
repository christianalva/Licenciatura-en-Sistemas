Program ejer3;
type 
	lista = ^nodo;
	nodo = record 
		dato:integer;
		sig:lista;
	end;


procedure agregarAdelante(var l:lista; aux:integer);
var
	nue:lista;
begin 
	new(nue);
	nue^.dato:=aux;
	nue^.sig:= l;
	l:=nue;
end;

procedure cargarLista(var l:lista);
var
	aux:integer;
begin 
	aux:=random(101)+100;
	if(aux<>100) then begin  	
		agregarAdelante(l, aux);
		cargarLista(l^.sig);
	end;

end;


procedure imprimirRecursivo(l:lista);
begin
	if(l<>nil) then begin  
		writeln('Numero aleatorio: ', l^.dato);
		imprimirRecursivo(l^.sig);
	end;
end;	


procedure imprimirInverso(l:lista);
begin 
	
	if(l<>nil) then begin 
		imprimirInverso(l^.sig);
		writeln('Numero aleatorio: ', l^.dato);
	end;

end;

procedure valorMinimo(l:lista; var min:integer);
begin 
	if(l<>nil) then begin 
		if(l^.dato<min) then 
			min:=l^.dato;
		valorMinimo(l^.sig, min)
	end;
end;

procedure buscarValor(l:lista; valor:integer; var ok:boolean);
begin 
	if(l<>nil) then begin 
		if(l^.dato=valor) then
			ok:= true;
		buscarValor(l^.sig, valor, ok);
		
	end;
end;

var 
	l:lista;
	min, valor:integer;
	ok:boolean;
begin 
	min:=9999;
	ok:=false;
	randomize;
	l:=nil;
	//A
	cargarLista(l);
	//B
	imprimirRecursivo(l);
	//C
	writeln;
	writeln('Imprimir Inverso: ');
	imprimirInverso(l);
	//D
	valorMinimo(l, min);
	writeln;
	writeln('El valor minimo de la lista es: ', min);
	//E
	writeln;
	write('Ingrese un valor a buscar en la lista: ');
	readln(valor);
	buscarValor(l, valor, ok);
	if(ok) then 
		writeln('El valor ingresado se encuentra en la lista. ')
	else 
		writeln('El valor ingresado no se encuentra en la lista. ');
	
	
end.
