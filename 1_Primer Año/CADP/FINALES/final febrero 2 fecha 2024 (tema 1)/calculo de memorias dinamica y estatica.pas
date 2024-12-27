

char 1 bytes
integer 6 bytes 
real 10 bytes 
boolean 1 bytes
string longitud+1bytes 
puntero 4 bytes 

program eje;
const 
  fin = 20;// 6 bytes 
type
  info = record// 266 bytes 
    nombre:string;// 256 bytes 
    nota:integer; // 6 bytes 
    datos:^integer;// 4 bytes 
  end;
  
  vector = array[5..fin] of ^info; //16*4 = 64 bytes 
  
  
var 
  v:vector;// 60 bytes
  i,j:integer;  // 12 bytes 
  e:info;// 266 bytes 
  
  
  //memoria estatica = 6 + 64 + 12 + 266 = 348 bytes  
  
begin 
  
  for i:=5 to 15 do begin
    read(e.nombre);
    read(e.nota); 
    new(v[i]);// 11 * 266 = 2926 bytes 
    
    if(e.nota mod 3 = 0 ) then begin 
      v[i]:=nil;
    end
    else begin 
      v[i]^.nombre := e.nombre;
      v[i]^.nota:=e.nota + (e.nota mod 5); 
    end;
    
  end;
  
  for j:=5 to 10 do dispose (v[j]);// 6 * 266 = 1596
  end;
end.

// memoria dinamica = 2926 - 1596 = 1330