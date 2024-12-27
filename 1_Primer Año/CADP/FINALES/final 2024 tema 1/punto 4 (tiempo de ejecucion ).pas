
//calcule el tiempo de ejecucion 


program ejercicio4;
type 
  info=record
    nombre:string;
    nota:integer;
    datos:^integer;
  end;
  
  vector = array[1..100] of info; 
  
var 
  v:vector; 
  i,j:integer;
  e:info;   
begin 

  read(e.nombre);
  
  i:=0;// 1ut

  while(i<100) and (e.nombre <> 'zzz') do begin // 3 ut 
    read(e.nota);
    
    
    e.datos:=nil;
    
    i:=i+1;// 2ut
    
    v[i]:=e;// 1ut
    
    read(e.nombre);
    
    // c(n+1) + n(cuerpo del while)
    // 3(100+1) + 100 (2+1) = 3*101 + 100*3 = 303 + 300 = 603ut
  end;
  
  for j:=1 to i do begin
  
    new(v[j].datos); 
  
    v[j].datos^:=v[j].nota mod 10; // 2ut
  // (3n + 2) + n(cuerpo del for) 
  // (3*100 + 2) + 100(2) = 300+2 + 200 = 302 + 200 = 502ut 
  end;
 
end.

//  TIEMPO DE EJECUCION 
// 603 + 502 = 1105 UT 
