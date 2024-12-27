// calcule el tiempo de ejecucion 

program ej;
const 
  dimF=120; 
type
  cadena = string[45]; 
  rango = 0..100;
  
  estudiante = record 
    ape_nom:cadena;  
    promedio:real; 
    leg:integer;  
  end;
  
  vector = array[0..dimF] of ^estudiante; 
  
var
  v:vector;
  legajo:real;  
  i, j:rango; 

 
begin 

  for i:=0 to 100 do begin //(3n+2) + n*(cuerpo del for)
    new(v[i]); 
    read(legajo);
    
    v[i]^.leg := leg;// 1ut
    
    //(3*101+2) + 101*(1) = 303+2 + 101 = 305+101 = 406 ut
    
  end;
  
  j:=20;//1 ut 
  
    //   1ut   1ut     1ut  
  while(j > 0) and (v[j]^.leg <> 1234) do begin //c*(n+1)+n*(cuerpo del while)
    //cantidad de tiempo en evaluar la condicion = 3ut
    
    dispose(v[j]); 
    
    j:=j-2;// 20 - 18 - 16 - 14 - 12 - 10 - 8 - 6 - 4 - 2   por lo tanto se ejecuta 10 veces el while // 2UT
  
    
    // 3*(10+1) + 10*(2) = 3*11 + 20 = 33+20 = 53 ut
  
  end;
  
end.

// TEMPO DE EJECUCION 
//  406 ut + 1 ut + 53 ut = 460 ut