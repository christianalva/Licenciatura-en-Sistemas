
program ej1;
const
  dimF=500; 
type
  vector=array[1..dimF] of integer;

procedure llenarVector(var v:vector);
var 
  i, num:integer;
begin 
  num:=1;
  for i:=1 to dimF do begin 
    v[i]:=num;
    num:= num+1;
  end;

end;


procedure encontrarValor(var v:vector);
var 
  i, buscar:integer;
  encontrado:boolean;
begin

  encontrado:=true;
  write('Ingrese el valor a buscar en el vector: ');
  readln(buscar);
  
  for i:=1 to dimF do begin 
    if(v[i]=buscar) then begin
      encontrado:=false;
      writeln('El numero: ', buscar, 'se encuentra en el vector, en la posicion: ', i);
      break;
    end;
  end;
  if(encontrado) then 
    writeln('El numero: ', buscar, ' no se encuentra en el vector');
end;


var
  v:vector;
begin 
  
  llenarVector(v);
  encontrarValor(v);
end.

