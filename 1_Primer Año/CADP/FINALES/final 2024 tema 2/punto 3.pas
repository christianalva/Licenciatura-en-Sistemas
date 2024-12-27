//calcule la cantidad de memoria estatica y dinamica que utiliza el siguiente programa
program ejercicio3;
type
  info = record // 256 + 4 + 8 + 4  = 272 bytes 
    nombre:string;//256 bytes
    nota:integer;//4 bytes
    prom:real;// 8 bytes 
    datos:^integer;// 4 bhytes 
  end;
  
  vector = array[1..80] of info;// 80*272 = 21760 bytes 

var 
  v:vector;// 21760 bytes 
  i, cant:integer;// 4 + 4 = 8 bytes 
  e:info;// 272 bytes 

begin 

  for i:=1 to 80 do begin
    read(e.nota);
    read(e.nombre);
    read(e.prom);
    if(i mod 2 = 0) then // cada ves i sea divisible por dos se va a ejecutar este if asi que se ejecutaria cuando i sea igual a 2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40, etc que serian un total de 40 veces 
      new(v[i.datos]);// 40 * 4 (4 es lo que tiene datos que es de tipo integer dsps del puntero) = 160 bytes 
    else 
      v[i].datos:=nil;
    end;
      
    i:=0;
    
    while(i<=80) and (e.nombre <>'zzz') do begin 
      cant:=0;
      if(v[i].nota>5) then 
        cant:=cant+1;
      i:=i+1
    end;
    
end.

//memroia estatica es de: 21760 + 8 + 272 = 22040 bytes 
//memoria dinamica = 160 bytes 






