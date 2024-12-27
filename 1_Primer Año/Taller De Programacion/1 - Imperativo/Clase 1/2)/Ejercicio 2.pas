{
2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.

b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.

c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}

program ejercicio2;
const 
	dimF = 300;
type
	oficinas = record
		codIdentificacion: integer;
		DNIPropietario: integer;
		valor: real;
	end;
	
	vector = array[1..dimF] of oficinas;
	
//A)
procedure cargarDatos(var v:vector; var dimL:integer);
var 
	cod: integer;
begin 
	cod:=0;
	while (dimL<=dimF) and (cod<>-1) do begin 
		writeln('Oficina: ', dimL);
		writeln('Ingrese el codigo de identificacion: ');
		readln(cod);
		if(cod<>-1) then begin 
			v[dimL].codIdentificacion:=cod;
			writeln('Ingrese el DNI del propietario: ');
			readln(v[dimL].DNIPropietario);
			write('Ingrese el valor de la expensa: ');
			readln(v[dimL].valor);
		end;
		
		dimL:=dimL+1;	
	end;
	

end;


//B)
//metodo de insercion por cod de identificacion
procedure ordenarVector(var v: vector; dimL: integer);
var 
	actual: oficinas;
	i, j: integer;
begin 
	// Recorre el vector desde el segundo elemento hasta el último
	for i := 2 to dimL do begin 
		// Guarda el valor actual del vector en la variable 'actual'
		actual := v[i];  
		// 'j' es el índice del elemento anterior
		j := i - 1;  
		
		// Desplaza los elementos mayores hacia adelante hasta encontrar la posición correcta para 'actual'
		while (j > 0) and (v[j].codIdentificacion > actual.codIdentificacion) do begin  
			// Mueve el elemento en 'v[j]' una posición hacia adelante
			v[j + 1] := v[j];  
			// Decrementa 'j' para seguir comparando con el elemento anterior
			j := j - 1;  
		end;
		// Inserta 'actual' en su posición correcta
		v[j + 1] := actual;  
	end;
end;

//C
//metodo de seleccion por cod de identificacion
procedure ordenarInseccion(var v:vector; dimL:integer);
var 
	i, j, pos: integer;
	item: oficinas;
begin 
	for i:=1 to (dimL-1) do begin //busca el maximo y guarda en pos la posicion 
		pos := i;
		
		for j:= i+1 to dimL do
			if v[j].codIdentificacion < v[pos].codIdentificacion then 
				pos := j;
				
		//intercambia v[i] y v[p]
		item := v[pos];
		v[pos] := v[i];
		v[i] := item;
	end;
end;



var
	v:vector;
	dimL:integer;
begin 
	dimL:=1;
	cargarDatos(v, dimL);
	ordenarVector(v, dimL);
	ordenarInseccion(v, dimL);
	
end.
