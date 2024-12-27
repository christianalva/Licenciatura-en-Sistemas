program Ejercicio1;
const 
	dimF=300;
type
	oficinas = record 
		codIdentificacion:integer;
		dni:integer;
		valor:real;
	end;
	
	vector = array[1..dimF] of oficinas;


procedure leerDatos(var o:oficinas);
begin 
	o.codIdentificacion:=random(50);
	if(o.codIdentificacion<>0) then begin 
		o.dni:=random(1000);
		o.valor:=random(100);
	end;
end;

procedure agregarAlVector(var v:vector; o:oficinas; dimL:integer);
begin  
	v[dimL].codIdentificacion:=o.codIdentificacion;
	v[dimL].dni:=o.dni;
	v[dimL].valor:=o.valor;
end;
	
procedure cargarVector(var v:vector; var dimL:integer);
var 
	o:oficinas;
begin 
	leerDatos(o);
	while(o.codIdentificacion <> 0) and (dimL <= dimF) do begin 
		agregarAlVector(v, o, dimL);
		leerDatos(o);
		if(o.codIdentificacion<>0) then 
			dimL:=dimL+1;
	end;	
end;

procedure imprimirVector(v:vector; dimL:integer);
var 
	i:integer;
begin 
	for i:=1 to dimL do begin 
		writeln('Cod Identificacion: ', v[i].codIdentificacion, ', DNI: ', v[i].dni, ', valor de la expensa: ', v[i].valor:3:2);
	end;
end;

procedure ordenarVector(var v:vector; dimL:integer);
var 
	actual:oficinas;
	i, j:integer;
begin 
	for i:=2 to dimL do begin 
		actual:=v[i];
		j:=i-1;
		while(j>0) and (v[j].codIdentificacion > actual.codIdentificacion) do begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;


procedure busquedaDicotomica(v:vector; ini,fin:integer; dato:integer; var pos:integer);
var
	medio:integer;
begin 
	if(ini>fin) then 
		pos:=0
	else begin 
		medio:=(ini+fin) div 2;
		if(v[medio].codIdentificacion = dato) then 
			pos:=medio
		else if(dato < v[medio].codIdentificacion) then
			busquedaDicotomica(v, ini, medio-1,dato,pos)
		else 
			busquedaDicotomica(v, medio+1, fin, dato, pos);
	end;
end;


procedure montoTotalExpensas(v:vector; var total:real; dimL:integer);
begin 
	if(dimL > 0) then begin
		total:=total + v[dimL].valor;
		dimL:=dimL-1;
		montoTotalExpensas(v, total, dimL);
	end;
end;

var 
	dimL, codigo, pos:integer;
	montoTotal:real;
	v:vector;
begin 
	randomize;
	dimL:=1;
	montoTotal:=0;
	//=========== a) ============
	cargarVector(v, dimL);
	imprimirVector(v, dimL);
	//============ b) =========== 
	ordenarVector(v, dimL);
	writeln;
	writeln;
	writeln('VECTOR ORDENADO');
	imprimirVector(v, dimL);
	//============ c) ==========
	writeln;
	writeln;
	writeln('Ingrese un cod de identificacion a buscar: '); 
	read(codigo);
	busquedaDicotomica(v, 1, dimL, codigo, pos);
	if(pos = 0) then 
		writeln('No se ha encontrado nada.')
	else 
		writeln('El dni del propietario es el: ', v[pos].dni);
	//========== d) =========
	montoTotalExpensas(v, montoTotal, dimL);
	writeln;
	writeln;
	writeln('El monto total de las expensas es de: ', montoTotal:3:2);
end.
