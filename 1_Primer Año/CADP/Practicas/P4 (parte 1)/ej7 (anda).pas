program ej7;
const
	dimF= 9;
Type
	vDigitos= array [0..dimF] of integer;
procedure inicializarVec(var vec: vDigitos);
var 
	i:integer;
begin
	for i:= 0 to dimF do begin
		vec[i]:= 0;
	end;
end;

procedure descomponerNum (var vec: vDigitos; num: integer);
var
	aux: integer;
begin
	repeat
		aux:= num MOD 10;	// aux va a contener el digito de mas a la derecha del numero ingresado
		num:= num DIV 10;	// Achico el num 
		vec[aux]:= vec[aux] + 1;
	until (num = 0);
end;

procedure ingresarNum (var vec: vDigitos);
var
	num: integer;
begin
	write('Ingresar un valor: ');
	readln(num);
	while (num <> -1) do begin
		descomponerNum(vec, num);
		write('Ingresar otro valor: ');
		readln(num);
	end;
end;

procedure informe(vec: vDigitos);
var
	i, posMax: integer;
Begin
	posMax:= -1;
	for i:= 0 to 9 do begin
		if (vec[i] > posMax) then
			posMax:= i;
		writeln('Numero ', i,': ',vec[i],' veces');
	end;
	write('Los digitos que no tuvieron ocurrencias son: ');
	for i:= 0 to 9 do begin
		if (vec[i] = 0)then begin
			if (i= 9) then
				write('',i)
			else
				write('',i,', ');
			end;
	end;
end;
var
vector: vDigitos;
Begin
	inicializarVec(vector);
	ingresarNum(vector);
	informe(vector);
end.