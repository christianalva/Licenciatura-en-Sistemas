program uno;
var
  i, temp, x:integer;
  
var
  aux:=0;// 1ut
  
  while(aux<5) do begin// c*(n+1)+n*(cuerpo del while); c=1ut, n=5 veces
    // c=cantidad de tiempo en evaluar la condicion
    //n=cantidad de veces que se ejecuta el while
    
    x:=aux;// 1ut
    aux:=aux+1;// 2ut
  
  // 1*(5+1)+ 5*(3) = 6+15 = 21ut (esto es lo que tarda el while en ejecutar)   
  
  
  end;
  
  aux:=aux+1;// 2ut
  
end.

//total= 1 + 21 + 2 = 24ut