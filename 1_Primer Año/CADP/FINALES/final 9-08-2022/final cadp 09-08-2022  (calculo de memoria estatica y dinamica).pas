program ej;
type
  cadena30 = string[30];//31 bytes 
  categorias = 1..5;// 4 bytes 
  
  participante=record // 31+4+8 = 43 bytes 
    ape_nom:cadena30;//31 bytes 
    categ:categorias;// 4 bytes 
    tiempo:real;// 8 bytes 
  end;
  
  vector=array[1..20] of ^participante;//4*20= 80 bytes 
  
var
  
  p:vector;//80 bytes 
  i:integer;//4 bytes 
  c:categorias;// 4 bytes 
  ayn:cadena30;// 31 bytes 
  
begin 
  
  for i:=1 to 10 do begin 
    new(p[i]);// 10*43= 430 bytes 
    read(c);
    read(ayn);
    p[i]^.categ:=c;
    p[i]^.ape_nom:=ayn;
    p[i]^.tiempo:=0;
  end;
  
  for i:=10 downto 5 do begin 
    dispose(p[i]);// 430 - (43*5) = 215 bytes 
  end;

end.
  
//MEMORIA ESTATICA
//80 + 4+ 4 + 31 = 119 bytes 
  
//MEMORIA DINAMICA = 215 bytes 
  
  
  
  
  
  