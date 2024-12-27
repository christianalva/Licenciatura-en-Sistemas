program Ejercicio3;
type
	
	fechas = record 
		dia:1..31;
		mes:1..12;
		anio:2000..2024;
	end;
	
	infoAlumno = record
		codMateria:integer;
		fecha:fechas;
		nota:1..10;
	end;
	
	//========== LISTA ============
	lista = ^nodo;
	nodo = record 
		dato:infoalumno;
		sig:lista;
	end;
		
	//=========== ARBOL ===========
	alumnos = record
		legajo:integer;
		info:lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record 
		dato: alumnos;
		HI:arbol;
		HD:arbol;
	end;

//==================== A) ===================================
procedure generarArbol(var a:arbol);
	
	procedure cargarAlumno(var alum:alumnos; var info:infoAlumno);
	begin 
		alum.legajo:=random(20);
		if(alum.legajo<>0) then begin 
			info.codMateria:= random(32)+1;
			info.fecha.dia:= random(31)+1;
			info.fecha.mes:= random(12)+1;
			info.fecha.anio:= random(2024 - 2000 + 1) + 2000;
			info.nota:=random(10)+1;
		end;
	end;
	
	procedure agregarLista(var l:lista; i:infoAlumno);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato:=i;
		nue^.sig:=l;
		l:=nue;
	end;
	
	procedure insertarAlumno(var a:arbol; alum:alumnos; i:infoAlumno);
	begin 
		if(a = nil) then begin 
			new(a);
			a^.dato.legajo:=alum.legajo;
			a^.dato.info:= nil;
			agregarLista(a^.dato.info, i);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(alum.legajo < a^.dato.legajo) then 
			insertarAlumno(a^.HI, alum, i)
		else if(alum.legajo > a^.dato.legajo) then
			insertarAlumno(a^.HD, alum, i)
		else
			agregarLista(a^.dato.info, i); // Si el legajo ya existe, agregar a la lista de finales.
	end;

var
	alum:alumnos;
	info:infoAlumno;
begin
	a:=nil;
	writeln('Armado de arbol');
	cargarAlumno(alum, info);
	while(alum.legajo<>0) do begin 
		insertarAlumno(a, alum, info);
		cargarAlumno(alum, info)
	end;
end;

procedure mostrarArbol(a:arbol);
var 
	aux:lista;
	i:integer;
begin 
	
	if(a<>nil) then begin
		
		mostrarArbol(a^.HI);
		i:=1;
		writeln('Legajo: ', a^.dato.legajo, ' finales rendidos: ');
		aux:=a^.dato.info;
		while (aux<>nil) do begin 
			writeln(i , '- Final: Codigo de materia: ', aux^.dato.codMateria, ' Fecha: ', aux^.dato.fecha.dia, '/', aux^.dato.fecha.mes, '/', aux^.dato.fecha.anio, ' Nota: ', aux^.dato.nota);
			i:=i+1;
			aux:=aux^.sig;
		end;
		
		mostrarArbol(a^.HD);
	
	end;
	
end;

//============================ B) =============================
procedure  buscarLegajosImpar(a:arbol; var cantImpar:integer);
var 
	aux:integer;
begin 
	if(a<>nil) then begin 
		buscarLegajosImpar(a^.HI, cantImpar);
		aux:=a^.dato.legajo;
		if((aux mod 2) <> 0) then 
			cantImpar:=cantImpar+1;
		buscarLegajosImpar(a^.HD, cantImpar);
	end;
end;


//============================ C) ==============================
procedure finalesAprobadosPorAlumno(a:arbol);
var 
	aux:lista;
	cant:integer;
begin 
	if(a<>nil) then begin 
		finalesAprobadosPorAlumno(a^.HI);
		cant:=0;
		write('El alumno con legajo: ', a^.dato.legajo);
		aux:=a^.dato.info;
		while(aux<>nil) do begin 
			if(aux^.dato.nota >= 4) then 
				cant:=cant + 1;
			aux:=aux^.sig;
		end;
		write(', Posee: ', cant, ' FINALES aprobados');
		writeln;
		finalesAprobadosPorAlumno(a^.HD);
	end;
end;


//============================== D) ================================
procedure buscarPromedios(a:arbol; valor:real);
var 
	aux:lista;
	cantFinales, notaTotal:integer;
	promedio:real;
begin 
	if(a<>nil) then begin
		buscarPromedios(a^.HI, valor);
		cantFinales:=0;
		promedio:=0;
		notaTotal:=0;
		aux:=a^.dato.info;
		while(aux<>nil) do begin 
			cantFinales:=cantFinales+1;
			notaTotal:=notaTotal+aux^.dato.nota;
			aux:=aux^.sig;
		end;
		promedio := notaTotal/cantFinales;
		if(valor<promedio) then 
			writeln('Legajo: ', a^.dato.legajo, ' con un promedio de: ', promedio:0:2);
			
		buscarPromedios(a^.HD, valor);
	end;

end;


var 
	a:arbol;
	cantImpar:integer;
	valor:real;
begin
	cantImpar:=0;
	randomize;
	//A)
	generarArbol(a);
	mostrarArbol(a);
	//B)
	buscarLegajosImpar(a, cantImpar);
	writeln;
	writeln('La cantidad de alumnos con legajo impar es de: ', cantImpar);
	//C)
	writeln;
	writeln;
	finalesAprobadosPorAlumno(a);
	//D)
	writeln;
	writeln;
	write('Ingrese un valor: ');
	readln(valor);
	writeln('Alumnos con preomedio mayor que: ', valor:0:2, ': ' );
	buscarPromedios(a, valor);
	
end.
