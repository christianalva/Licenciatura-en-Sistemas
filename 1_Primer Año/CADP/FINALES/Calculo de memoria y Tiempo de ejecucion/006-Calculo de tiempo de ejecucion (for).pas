program uno;
var
  aux, temp, x: integer;
begin 
  aux:=8;// 1ut
  
  for i:=1 to 5 do begin// (3*n+2)+n*(cuerpo)
  
    x:=aux;// 1ut
    aux:=aux+5;// 2ut
    
    //(3*5+2)+5*(1+2) = 17+15 = 32ut es lo que tarda el total del for 
  
  end;
  
  aux:=aux+1;//2ut
  
end.

//TIEMPOTOTAL= 1ut + 32ut + 2ut = 35UT

