program ejercicio;
  function auxiliar(val:integer):integer;
  begin 
    val:=val*val;
    auxiliar:=val;
  end;
  
  procedure calculo(c:integer; var b:integer);
  begin
    b:=b+c div 4;
  end;
var
  a,b:integer;
begin 
  a:=16;
  b:=6;
  calculo(auxiliar(a), b);
end.

//es valido ya que pasa la funcion por valor en  procedure calculo(c:integer; var b:integer);