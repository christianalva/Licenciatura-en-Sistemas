{

                            Online Pascal Compiler.
                Code, Compile, Run and Debug Pascal program online.
Write your code in this editor and press "Run" button to execute it.

}


program ej4_c;
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

  for i:=1 to 100 do begin 
    sumaTotal:= sumaTotal+v[i];
  end;
  
  prom:=(sumaTotal/dimL);


end;


var 
  v:vector;
  sumaTotal:integer;
  prom:real;
begin
  sumaTotal:=0;
  prom:=0;
  llenarVector(v);
  promedio(v, sumaTotal, prom);
  Writeln('El promedio de todos los vectores es de: ', prom:2:2);
end.