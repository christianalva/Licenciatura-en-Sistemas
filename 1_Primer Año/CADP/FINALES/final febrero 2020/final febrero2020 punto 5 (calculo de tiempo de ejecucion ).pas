//CALCULO DE TIEMPO DE EJECUCION 
//calcule el tiempo de ejecucion para el procedure calcular
program prueba;
var
  c:integer;
  
procedure calcular(var b, a : integer);
begin 
  b:=10;
  while(b>0) do begin // n = 5 veces se va a ejecutar este while  // c=1ut
    //c= cantidad de tiempo en evaluar la condicion 
    //n= cantidad de veces q se ejecuta el while
    
    a:=a+b;//2ut
    b:=b-2;//2ut
    c:=c-b;//2ut
  end;
  writeln('a= ', a, ', b= ', b, ', c= ', c);
end;

// c*(n+1)+n*(cuerpo del while)
//1*(5+1)+5*(6) = 1*6+30  = 36ut

//el tiempo de ejecucion del procedure calcular es de 36 ut 





var
  a, b: integer;
begin
  b:=80;
  c:=30;
  writeln('a= ', a, ', b= ', b, ', c= ', c);
  calcular(a, b);
  writeln('a= ', a, ', b= ', b, ', c= ', c);
end.
  
  
  