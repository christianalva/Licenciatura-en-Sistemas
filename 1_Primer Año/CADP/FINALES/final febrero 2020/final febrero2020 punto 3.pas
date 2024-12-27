program prueba;
var
  c:integer;
  
procedure calcular(var b, a : integer);//a, b
begin 
  b:=10;
  while(b>0) do begin
    a:=a+b;//90, 98, 104, 108, 110
    b:=b-2;//8, 6, 4, 2, 0
    c:=c-b;//22, 16, 12, 10, 10 
  end;
  writeln('a= ', a, ', b= ', b, ', c= ', c);// 110, 0, 10
end;

var
  a, b: integer;
begin
  b:=80;
  c:=30;
  writeln('a= ', a, ', b= ', b, ', c= ', c);// basura(0), 80, 30
  calcular(a, b);// vuelve a=0, b=110
  writeln('a= ', a, ', b= ', b, ', c= ', c);// 0 , 110, 10
end.
  
  
  