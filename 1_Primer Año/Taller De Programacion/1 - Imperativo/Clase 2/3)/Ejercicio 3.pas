program Ejercicio3;
const 
	dimF=20;
type 
	indice = 1..dimF;
	vector = array[1..dimF] of integer;
	
procedure cargarVector(var v:vector; var dimL:integer);
var
	aux:integer;
begin 
	aux:= random(1251)+300;
	if(dimL<=dimF) then begin 	
		dimL:=dimL+1;
		v[dimL]:=aux; 
		cargarVector(v, dimL);
	end;
end;


procedure ordenarVectorInsercion(var v:vector; dimL:integer);
var 
	i, j, actual:integer;
begin 
	for i:=2 to dimL do begin 
		actual:=v[i];
		j:=i-1;
		
		while(j>0) and (v[j]>actual) do begin 
			v[j+1]:= v[j];
			j:=j-1;
		end;
		
		v[j+1]:=actual;
	end;	
end;

procedure imprimir(v:vector);
var 
	i:integer;
begin 
	for i:=1 to dimF do begin 
		writeln(i, '- Numero Random: ', v[i]);
	end;
end;

procedure busquedaDicotomica(v:vector; ini,fin:indice; dato:integer; var pos:integer);
var 
	medio:integer;
begin 
	if(ini>fin) then 
		pos := -1 //el dato no se encuentra en el vector
	else begin 
		medio:=(ini+fin) div 2;
		
		if(v[medio] = dato) then 
			pos:=medio  // se encontro el dato en la posicion medio 
		else if (dato < v[medio]) then
			busquedaDicotomica(v, ini, medio-1,dato,pos) //busca en la mitad izquierda
		else 
			busquedaDicotomica(v, medio+1, fin, dato,pos); // busca en la mitad derecha
	end;	
end;


var 
	dimL, pos, dato:integer;
	v:vector;
begin 
	randomize;
	dimL:=0;
	//A
	cargarVector(v, dimL);
	//B
	ordenarVectorInsercion(v, dimL);
	imprimir(v);
	//C
	writeln;
	write('Ingrese el vaor a buscar: ');
	readln(dato);
	busquedaDicotomica(v, 1, dimF, dato, pos);
	
	if (pos = -1) then 
		writeln('El valor ', dato, ' NO se encuentra en el vector.')
	else 
		writeln('El valor ', dato, ' se encuentra en el vecto. ');
	
end.
