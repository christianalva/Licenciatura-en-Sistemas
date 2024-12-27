program ej5;
const 
  dimF=100;
type
  vector=array[1..dimF] of integer;

procedure llenarVector(var v:vector; var dimL:integer);
var 
  i, num:integer;
begin 
  i:=1;
  write('Ingrese un numero: ');
  readln(num);
  while(num<>0) and (i<=dimF) do begin 
    v[i] := num ;
    dimL:=dimL+1;
    
    i:=i+1;
    
    write('Ingrese otro numero: ');
    readln(num);
  end;
end;


procedure encontarMinYMax(var v:vector; var dimL, elemMax, elemMin, posElemMax, posElemMin:integer);
var 
  i:integer;

begin 
    for i:=1 to dimL do begin 
        if(v[i]>elemMax) then begin 
            elemMax:=v[i];
            posElemMax:=i;
        end;
        if(v[i]<elemMin) then begin 
            elemMin:=v[i];
            posElemMin:=i;
        end;
    end;

end;


procedure intercambiar(var v:vector; var elemMax, elemMin, posElemMax, posElemMin:integer);
var 
    aux:integer;
begin 
    aux:=v[posElemMax];
    v[posElemMax]:=v[posElemMin];
    v[posElemMin]:=aux;
end;

var 
  v:vector;
  i, elemMax, elemMin, posElemMax, posElemMin, dimL:integer;
 
begin
  elemMax:=0;
  elemMin:=9999;
  dimL:=0;
  posElemMin:=0;
  posElemMax:=0;
  
  llenarVector(v, dimL);
  encontarMinYMax(v, dimL, elemMax, elemMin, posElemMax, posElemMin);
  intercambiar(v, elemMax, elemMin, posElemMax, posElemMin);

  writeln('El elemento maximo ', elemMax, ' que se en contraba en la posición: ', posElemMax, ' fue intercambiado por el elemento minimo: ', elemMin, ' que estaba en la posicion: ', posElemMin);
  writeln();
  writeln('El vector quedaria de la siguiente manera: ');
  
  for i:=1 to dimL do begin
    writeln(v[i], ' posicion [', i, ']');
  end;
end.