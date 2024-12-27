program ejercicio3;
const 
  dimF=200;//4 bytes 
type

  cadena31=string[31];// 32 bytes 
  
  alumno=record // 32+8; 40 bytes 
    ape_nom:cadena31; // 32 bytes 
    promedio:real;  // 8 bytes 
  end;
  
  vector=array[1..dimF] of ^alumno;// 200*4 = 800 bytes 
  
  lista = ^nodo;// 4 bytes 
  
  nodo = record //44 bytes 
    dato:alumno; // 40 bytes 
    sig:lista;  // 4 bytes
  end;
  
var 
  v:vector;// 800 bytes 
  a:alumno;// 40 bytes 
  nota, i, suma, cant:integer;// 16 bytes 
  aux:lista;// 4 bytes
  
  // de memoria estatica posee (800 + 40 + 16 + 4) = 860 bytes 
  
begin
  
  aux:=nil;
  for i:=1 to dimF do begin 
    read(ape_nom);
    read(nota);
    cant:=0;
    suma:=0;
    
    while(nota<>-1) do begin 
      suma:=suma+nota;
      cant:=cant+1;
      read(nota);
    end;
    if(cant<>0) then 
      a.promedio:=suma/cant;
    else
      a.promedio:=0;
      
    new(v[i]);// 200*40 = 8000 bytes 
    v[i]^:=a;
    
  end;
end.

// de memoria dinamica posee 8000 bytes 