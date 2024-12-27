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
	infoAtenciones=record
		dni:integer;
		mes:0..12;
		codDiagnostico:1..15;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record 
		dni:integer;
		cantTotal:integer;
		HI:arbol;
		HD:arbol;
	end;
	
	vector = array[1..15] of integer;

procedure inicializarVector(var v:vector);
var 
	i:integer;
begin 
	for i:=1 to 15 do begin 
		v[i]:=0;
	end;
end;
	
procedure generarArbolYVector(var a:arbol; var v:vector);
	procedure leerDatos(var i:infoAtenciones);
	begin 
		i.mes:=random(12);
		if(i.mes<>0) then begin 
			i.dni:=random (1000) + 1;
			i.codDiagnostico:=random(15) + 1;
		end;
	end;

	procedure insertarArbol(var a:arbol; i:infoAtenciones);
	begin
		if(a=nil) then begin 
			new(a);
			a^.dni:=i.dni;
			a^.cantTotal:=1;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if(i.dni < a^.dni) then
			insertarArbol(a^.HI, i)
		else if(i.dni > a^.dni) then
			insertarArbol(a^.HD, i)
		else 
			a^.cantTotal:=a^.cantTotal+1;
	end;
	
	procedure insertarVector(var v:vector; i:infoAtenciones);
	begin 
		v[i.codDiagnostico]:=v[i.codDiagnostico] + 1;
	end;


var
	i:infoAtenciones;
begin 
	a:=nil;
	leerDatos(i);
	while(i.mes<>0) do begin 
		insertarArbol(a, i);
		insertarVector(v, i);
		leerDatos(i);
	end;

end;


procedure imprimirArbol(a:arbol);
begin 
	if(a<>nil) then begin 
		imprimirArbol(a^.HI);
		writeln('DNI: ', a^.dni, ', Cant de atenciones: ', a^.cantTotal);
		imprimirArbol(a^.HD);
	end;
end;

procedure imprimirVector(v:vector);
var 
	i:integer;
begin 
	for i:=1 to 15 do begin 
		writeln('Diagnostico: ', i, ', atenciones realizadas: ', v[i]);
	end;
end;

procedure puntoB(a:arbol; min, max, x:integer; var cant:integer);
begin 
	if(a<>nil) then begin 
		if(min < a^.dni) then 
			puntoB(a^.HI, min, max, x, cant);
		if(min < a^.dni) and (max > a^.dni) and (a^.cantTotal > x) then 
				cant:=cant+1;
		if(max > a^.dni) then
			puntoB(a^.HD, min, max, x, cant);
	end;
end;

procedure puntoC(v:vector; var cant:integer; i:integer);
begin 
	if(i>0) then begin
		if(v[i] = 0) then 
			cant:=cant+1;
		i:=i-1;
		puntoC(v, cant, i);
	end;
end;

var
	a:arbol;
	v:vector;
	dni1, dni2, x, cantPacientes, cantDiagnosticos, i:integer;
begin
	cantDiagnosticos:=0;
	cantPacientes:=0;
	i:=15;
	randomize;
	//A
	inicializarVector(v);
	generarArbolYVector(a, v);
	imprimirArbol(a);
	writeln();
	writeln('VECTOR: ');
	imprimirVector(v);
	//B
	writeln;
	writeln('Ingrese un numero de DNI: ');
	read(dni1);
	writeln('Ingrese otro numero de DNI (mayor al anterior): ');
	read(dni2);
	writeln('Ingrese un numero entero: ');
	read(x);
	puntoB(a, dni1, dni2, x, cantPacientes);
	writeln('La cantidad de pacientes con mas de ', x ,' atenciones entres los dni: ', dni1, ' y ', dni2, ' es de: ', cantPacientes);
	//C
	writeln;
	puntoC(v, cantDiagnosticos, i);
	writeln('La cantidad de diagnosticos para los cuales la cantidad de atenciones fue cero son: ', cantDiagnosticos);
end.
