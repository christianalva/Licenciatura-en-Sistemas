// calcule la cantidad de memoria estatica y dinamica que utiliza el siguiente programa

program ej;
const 
  dimF=120;// 6 bytes 
type
  cadena = string[45]; // 46 bytes
  rango = 0..100;// 6 bytes
  
  estudiante = record // 46+8+6 = 60 bytes 
    ape_nom:cadena; //46 bytes 
    promedio:real; // 8 bytes 
    leg:integer; // 6 bytes 
  end;
  
  vector = array[0..dimF] of ^estudiante;// 121 * 4 = 484 bytes 
  
var
  v:vector; // 484 bytes
  legajo:real;  // 8 bytes 
  i, j:rango; // 6 + 6 = 12 bytes 

  // EN TOTAL HAY 484 + 8 + 12 + 6 = 510 BYTES DE MEMORIA ESTATICA 
begin 

  for i:=0 to 100 do begin 
    new(v[i]); // 101 * 60 = 6060 bytes 
    read(legajo);
    
    v[i]^.leg := leg;
    
     
    
  end;
  
  j:=20;
  
  
  while(j > 0) and (v[j]^.leg <> 1234) do begin 
   
    
    dispose(v[j]); // 9 * 60 = 540 bytes 
    
    j:=j-2;// 20 - 18 - 16 - 14 - 12 - 10 - 8 - 6 - 4 - 2   
  

  end;
  //6060 - 600 = 5460 bytes de memoria dinamica
end.



