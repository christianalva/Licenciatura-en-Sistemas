program Vectores;

const
  cant_datos = 150;
type
  vdatos = array[1..cant_datos] of real;

procedure cargarVector(var v:vdatos; var dimL : integer);
var
  num:real;
begin
  
  write('Ingresar un numero: ');
  readln(num);
 
  while(num<>0) and (dimL<cant_datos) do begin
    readln(num);
    v[dimL] := num;
    dimL:=dimL+1;
    write('Ingresar otro numero: ');
  end
end;



procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
  i:integer;
begin 
  for i:=1 to dimL do begin 
    v[i]:=v[i]+n;
    suma:=suma+v[i];
  end;
end;



{ programa principal }
var
  datos : vdatos;
  i, dim : integer;
  num, suma : real;

begin
  dim := 0;
  cargarVector(datos,dim); 
  writeln('Ingrese un valor a sumar');
  readln(num);
  modificarVectorySumar(datos, dim, num, suma);{completar}
  writeln('La suma de los valores es: ', suma:2:2);
  writeln('Se procesaron: ',dim, ' números');
end.