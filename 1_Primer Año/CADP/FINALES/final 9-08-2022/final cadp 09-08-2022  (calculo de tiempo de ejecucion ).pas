//CALCULO DE TIEMPO DE EJECUCION 
program ej;
type
  cadena30 = string[30]; 
  categorias = 1..5;
  
  participante=record  
    ape_nom:cadena30;
    categ:categorias;
    tiempo:real;
  end;
  
  vector=array[1..20] of ^participante;
  
var
  
  p:vector; 
  i:integer; 
  c:categorias;
  ayn:cadena30;
  
begin 
  
  for i:=1 to 10 do begin // (3*n+2)+n*(cuerpo del for)
    //n:la cantidad de veces que se ejecuta el for 
    //cuerpo del for = 3ut
    
    new(p[i]);
    read(c);
    read(ayn);
    p[i]^.categ:=c;// 1UT
    p[i]^.ape_nom:=ayn;// 1UT
    p[i]^.tiempo:=0;// 1UT
    
    //(3*10+2)+10*(3)=30+2+30= 32+30 = 62ut 
  end;
  
  for i:=10 downto 5 do begin 
    dispose(p[i]);
  end;

end.
  

//tiempo de ejecucion = 62ut
  