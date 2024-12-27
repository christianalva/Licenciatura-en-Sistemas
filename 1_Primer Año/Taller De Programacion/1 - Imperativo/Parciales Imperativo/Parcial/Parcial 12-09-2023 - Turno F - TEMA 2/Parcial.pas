{
Una clínica necesita un sistema para el procesamiento de las atenciones realizadas a los pacientes.

a) Implementar un módulo que lea información de las atenciones. De cada atención se lee: DNI del paciente, número de mes, y código de diagnóstico (1 a 15). La lectura finaliza con el mes 0. Se sugiere utilizar el módulo leerAtencion (). El módulo debe retornar dos estructuras de datos:

1. Una estructura de datos eficiente para la búsqueda por DNI del paciente. Para cada DNI debe almacenarse la cantidad total de atenciones recibidas.

ii. Otra estructura de datos con la cantidad de atenciones realizadas para cada diagnóstico.

b) Implementar un módulo que reciba la estructura generada en a) I., dos números de DNI y un valor entero x. Este módulo debe retornar la cantidad de pacientes con más de x atenciones cuyos DNI están entre los 2 números de DNI recibidos.

c) Implementar un módulo recursivo que reciba la estructura generada en a) ii, y retorne la cantidad de diagnósticos para los cuales la cantidad de atenciones fue cero.


}

program Parcial;
type
	sub_diagnostico = 1..15;
	
	atenciones=record
		dni:integer;
		mes:0..12;
		codDianostico:sub_diagnostico;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dni:integer;
		cantTotal:integer;
		HI:arbol;
		HD:arbol;
	end;
	
	vector = array[sub_diagnostico] of  integer;
	
procedure inicializarVector(var v:vector);
var 
	i:integer;
begin 
	for i:=1 to 15 do begin 
		v[i]:=0;
	end;
end;

procedure generarArbolYVector(var a:arbol; var v:vector);
procedure leerDatos(var t:atenciones);
begin
	t.mes:=random(12);
	if(t.mes <> 0) then begin 
		t.dni:=random(1000);
		t.codDianostico:=random(15)+1;
	end;
end;

procedure insertarArbol(var a:arbol; t:atenciones);
begin 
	if(a=nil) then begin 
		new(a);
		a^.dni:=t.dni;
		a^.cantTotal:=1;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else if(t.dni < a^.dni) then
		insertarArbol(a^.HI, t)
	else if(t.dni > a^.dni) then
		insertarArbol(a^.HD, t)
	else
		a^.cantTotal:=a^.cantTotal+1;
end;

procedure sumarDiagnostico(var v:vector; t:atenciones);
begin 
	if(v[t.codDianostico] = 0) then 
		v[t.codDianostico]:=1
	else 
		v[t.codDianostico]:=v[t.codDianostico]+1;
end;

var 
	t:atenciones;
	
begin 
	a:=nil;
	leerDatos(t);
	while(t.mes <> 0) do begin
		insertarArbol(a, t);
		sumarDiagnostico(v, t);
		leerDatos(t);
	end;
end;

procedure imprimirArbol(a:arbol);
begin 
	if(a<>nil) then begin 
		imprimirArbol(a^.HI);
		writeln('Numero de DNI: ', a^.dni, ', cant total de atenciones recibidas: ', a^.cantTotal);
		imprimirArbol(a^.HD);
	end;
end;

procedure imprimirVector(v:vector);
var
	i:integer;
begin 
	for i:=1 to 15 do begin 
		writeln('El diagnostico: ', i, ' realizo un total de: ', v[i], ' atenciones.');
	end;
end;

//=====================================================================
procedure cantPacientesConMasAtenciones(a:arbol; dni1, dni2, x:integer;	var cant:integer);
begin
	if(a<>nil) then begin 
		if(dni1 < a^.dni) and (dni2 > a^.dni) and (a^.cantTotal > x) then begin
			cant:=cant+1;
			cantPacientesConMasAtenciones(a^.HI, dni1, dni2, x, cant);
			cantPacientesConMasAtenciones(a^.HD, dni1, dni2, x, cant);
		end
		else if(a^.dni<dni1) then
			cantPacientesConMasAtenciones(a^.HD, dni1, dni2, x, cant)
		else 
			cantPacientesConMasAtenciones(a^.HI, dni1, dni2, x, cant);
	end;
end;
//=====================================================================
procedure diagnosticoConAtencionCero(v:vector; var cant:integer; var i:integer);
begin
	if(i <= 15) then begin 
		if(v[i] = 0) then 
			cant:=cant+1;
		i:=i+1;
		diagnosticoConAtencionCero(v, cant, i);
	end;
end;

var
	a:arbol;
	v:vector;
	dni1, dni2, x, pacientesMax, diagCero, i:integer;
begin 
	randomize;
	pacientesMax:=0;
	diagCero:=0;
	i:=1;
	inicializarVector(v);
	// A) 
	generarArbolYVector(a, v);
	imprimirArbol(a);
	writeln;
	writeln;
	imprimirVector(v);
	// B)
	writeln;
	writeln;
	writeln('Ingrese un numero de dni: ');
	read(dni1);
	writeln('Ingrese un numero de dni (mayor al ant): ');
	readln(dni2);
	writeln('Ingrese un valor entero: ');
	readln(x);
	cantPacientesConMasAtenciones(a, dni1, dni2, x, pacientesMax);
	writeln('La cantidad de pacientes con mas de ', x, ' atemciones, entre: ', dni1, ' y ', dni2, ' es de: ', pacientesMax);
	// C)
	diagnosticoConAtencionCero(v, diagCero, i);
	writeln;
	writeln;
	writeln('La cantidad de diagnosticos para la cantidad de atenciones fue cero es de: ', diagCero);
end.
