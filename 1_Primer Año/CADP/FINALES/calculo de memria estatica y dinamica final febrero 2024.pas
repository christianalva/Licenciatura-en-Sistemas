program ejercicio4;
const 
  fin = 30;// 8 bytes
type 
  info=record// 268 bytes 
    nombre:string;// 256 bytes 
    nota:integer;// 8 bytes 
    datos:^integer;// 4 bytes 
  end;
  
  vector = array[1..fin] of ^info;//  30*4 = 120 bytes 
  
var 
  v:vector; // 120 bytes 
  i,j:integer;// 16 bytes 
  e:info;   // 268 bytes 
  
  // memoria estatica = 404 bytes
begin 

 for i:=3 to 20 do begin // este for se ejecuta 18 veces
  read(e.nombre); 
  read(e.cant);
  
  new(v[i]);// 18 * 268 = 4824 bytes 
  
  if(e.cant mod 5 = 0) then 
    v[i]:=nil;
  else begin 
    v[i]^.nombre :=e.nombre;
    v[i]^.cant:= e.cant + (e.cant div 2);
  end;
 end;
 
 for j:=6 to 15 do  // este for se ejecuta 10 veces 
  dispose(v[j]);// 10 * 268 = 2680 bytes  
 
end.

// memoria dinamica = 4824 - 2680 = 2144 bytes de memoria dinamica 