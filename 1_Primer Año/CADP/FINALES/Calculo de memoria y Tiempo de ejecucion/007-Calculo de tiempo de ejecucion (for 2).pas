program uno;
var
  aux, temp, x: integer;
begin 
  aux:=8;// 1ut
  
  for i:=4 to 9 do begin// (3*n+2)+n*(cuerpo)
    //n representa la cantidad de veces que se ejecuta el bucle for  
    //n=6
    
    x:=aux;// 1ut
    aux:=aux+5;// 2ut
    
    //(3*6+2)+6*(1+2) = 20+18 = 38ut es lo que tarda el total del for 
  
  end;
  
  aux:=aux+1;//2ut
  
end.

//TIEMPOTOTAL= 1ut + 38ut + 2ut = 41UT

