program ejercicio3;
const 
  dimF=200;
type
  cadena31=string[31];// 32bytes 
  
  alumno=record// 32+8= 40 bytes 
    ape_nom:cadena31;//32 bytes
    promedio:real;// 8bytes 
  end;
  
  vector=array[1..dimF] of ^alumno;// 200*4=800 bytes 
  
  lista=^nodo;
  
  nodo=record//44 bytes
    dato:alumno;// 40 bytes
    sig:lista;//4 bytes
  end;
  
var
  v:vector;//800 bytes 
  a:alumno;// 40 bytes
  nota, i, suma, cant:integer;// 4*4 bytes = 16 bytes 
  aux:lista;// 4 bytes 
begin 
  
  aux:=nil;
  for i:=1 to dimF do begin
    read(a.ape_nom);
    read(nota);
    cant:=0;
    suma:=0;
    while(nota<>-1) do begin 
      suma:=suma+nota;
      cant:=cant+1;
      
      read(nota);
      
    end;
    if(cant<>0) then 
      a.promedio:=suma/cant
    else 
      a.promedio:=0;
    
    new(v[i]);// 200*40= 8000 BYTES
    v[i]^:=a;
    
  end;

end.
//MEMORIA ESTATICA = 800+40+16+4 = 860 BYTES  
// MEMORIA DINAMICA = 8000 BYTES 