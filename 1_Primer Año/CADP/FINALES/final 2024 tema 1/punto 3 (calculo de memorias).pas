//calcule e indique la cantidad de memoria estatica y dinamica que utiliza el siguiente programa


program ejercicio3;
type 
  info=record// 256+6+4 = 266 bytes 
    nombre:string;// 256 bytes 
    nota:integer;// 6 bytes 
    datos:^integer;// 4 bytes
  end;
  
  vector = array[1..100] of info; // 100 * 266 = 26600
  
var 
  v:vector;// 26600 bytes 
  i,j:integer;// 12 bytes 
  e:info;// 266 bytes   
begin 

  read(e.nombre);
  i:=0;
  while(i<100) and (e.nombre <> 'zzz') do begin 
    read(e.nota);
    e.datos:=nil;
    i:=i+1;
    v[i]:=e;
    read(e.nombre);
  end;
  
  for j:=1 to i do begin
    new(v[j].datos);// 100 * 6 = 600 bytes 
    v[j].datos^:=v[j].nota mod 10; 
  end;
 
end.

// memoria estatica = 26600 + 12 + 266 = 26878 bytes
// memoria dinamica = 600 bytes 