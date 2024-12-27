{

                            Online Pascal Compiler.
                Code, Compile, Run and Debug Pascal program online.
Write your code in this editor and press "Run" button to execute it.

}


program ej4_f;
const 
  dimL=100;
type
  vector=array[1..dimL] of integer;

procedure llenarVector(var v:vector);
var 
  i:integer;
begin 
  for i:=1 to dimL do begin 
    v[i]:=i;
  end;
end;

procedure promedio(var v:vector; var sumaTotal: integer; var prom:real);
var 
  i:integer;
begin 

  for i:=1 to dimL do begin 
    sumaTotal:= sumaTotal+v[i];
  end;
  
  prom:=(sumaTotal/dimL);


end;

procedure elementoMax(var v:vector; var elemMax, posElemMax:integer);
var 
  i:integer;
begin 

  for i:=1 to dimL do begin 
    if(v[i]>elemMax) then begin 
      elemMax:=v[i];
      posElemMax:=i;
    end;
  end;
end;

procedure elementoMin(var v:vector; var elemMin, posElemMin:integer);
var 
  i:integer;
begin 

  for i:=1 to dimL do begin 
    if(v[i]<elemMin) then begin 
      elemMin:=v[i];
      posElemMin:=i;
    end;
  end;
end;


var 
  v:vector;
  sumaTotal, elemMax, posElemMax, elemMin, posElemMin:integer;
  prom:real;
begin
  sumaTotal:=0;
  prom:=0;
  elemMax:=0;
  posElemMax:=0;
  elemMin:=9999;
  posElemMin:=0;
  
  llenarVector(v);
  promedio(v, sumaTotal, prom);
  elementoMax(v, elemMax, posElemMax);
  elementoMin(v, elemMin, posElemMin);
  Writeln('El promedio de todos los vectores es de: ', prom:2:2);
  writeln('El elemnto maximo del vecor es el: ', elemMax, ' y la posicion es la: [', posElemMax, ']');
  writeln('El elemnto minimo del vecor es el: ', elemMin, ' y la posicion es la: [', posElemMin, ']');
end.

end.