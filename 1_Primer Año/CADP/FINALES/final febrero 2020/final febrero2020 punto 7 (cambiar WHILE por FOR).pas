program prueba;
var
  c:integer;
  
procedure calcular(var b, a : integer);
var
  i:integer;
begin 
  b:=10;
  
  for i:=1 to 5 do begin 
    a:=a+b;
    b:=b-2;
    c:=c-b;
    
  end;
  
  
  writeln('a= ', a, ', b= ', b, ', c= ', c);
end;

var
  a, b: integer;
begin
  b:=80;
  c:=30;
  writeln('a= ', a, ', b= ', b, ', c= ', c);
  calcular(a, b);
  writeln('a= ', a, ', b= ', b, ', c= ', c);
end.
  