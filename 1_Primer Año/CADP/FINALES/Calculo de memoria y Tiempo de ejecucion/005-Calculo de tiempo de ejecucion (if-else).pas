program uno;
var
  aux, temp, x: integer;
begin 
  read(aux);// no se tiene en cuenta 0ut
  
  if(aux>45) then begin // 1ut 
    
    temp:=aux-5;// 2ut
    x:=temp;// 1ut
  
  end
  else 
    aux:= aux + 1 * (aux mod 2);// 4ut
  
  //ya que el if tiene else serian 1ut de evaluar la condicion mas el tiempo max entre el then y el else quedaria: 
  // 1ut + max(3ut, 4ut) = 1ut + 4ut + 5ut   
end.

//TIEMPOTOTAL= 5ut

