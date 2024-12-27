// calculo de tiempo de ejecucion

program eje;
const 
  fin = 20;
type
  info = record
    nombre:string; 
    nota:integer; 
    datos:^integer; 
  end;
  
  vector = array[5..fin] of ^info;  
  
  
var 
  v:vector;
  i,j:integer;  
  e:info; 

begin 
  
  for i:=5 to 15 do begin // se ejecuta 11 veces n = 11
    read(e.nombre); 
    read(e.nota); 
    new(v[i]); 
    
    if(e.nota mod 3 = 0 ) then begin // 1ut
      
      v[i]:=nil;// 1ut
      
    end
    else begin // 4ut
      
      v[i]^.nombre := e.nombre;// 1ut
      v[i]^.nota:=e.nota + (e.nota mod 5);// 3ut
    
    end;
    // 1+ max(then, else) = 1+4 = 5
    
  end;
  
  // (3*n+2) + n(cuepo del for)
  // (3*11+2) + 11(5) = 35 + 55 = 90 ut
  
  for j:=5 to 10 do dispose (v[j]); // se ejecuta 6 veces 
  // (3n+2) + n(cuerpo del for) 
  // (3*6+2) + ^(0) = 20ut
  
  end;
end.

// tiempo de ejecucion total = 110 ut