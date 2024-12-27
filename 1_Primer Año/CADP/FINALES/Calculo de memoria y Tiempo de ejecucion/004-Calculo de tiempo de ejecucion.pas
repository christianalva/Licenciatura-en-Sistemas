program uno;
var
  aux, temp, x: integer;
begin 
  aux:=58;// 1ut 
  aux:=aux*5;// 2ut (multiplicacion + asignacion)
  
  if(aux > 45) and (aux < 300) then begin // 1ut + 1ut + 1ut(CONECTOR (AND))
    
    temp:=aux-5;  // 2ut
    x:=temp+aux+2;// 3ut
  
  end;
  //el if tiene un tiempo total de 8ut
  x:=x*10;// 2ut
end.

//TIEMPOTOTAL= (1ut+2ut) + (1ut+1ut+1ut) + (2ut+3ut) + (2ut) = 13ut

