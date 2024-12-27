program ejercicio4;
const dimF=10;
type
  cadena20=string[20];// 21bytes
  notas=2..10;// 4 bytes
  
  alumno=record // 25bytes
    ape_nom:cadena20;// 21bytes
    nota:integer;// 4bytes 
  end;
  
  vector=array[1..10] of ^alumno;// 10*4= 40bytes

var 

  v:vector;// 40 bytes 
  i:integer;// 4 bytes 
  sum:integer;// 4 bytes 
  nota:notas;// 4 bytes
  apeNom:cadena20; // 21bytes 

begin 

  for i:=1 to 10 do begin
      //MEMORIA DINAMICA  
    new(v[i]);// 25*10= 250 bytes
    read(nota);
    read(apeNom);
    v[i]^.nota:=nota;
    v[i]^.ape_nom:=apeNom;
  end;

  sum:=0;
  
  while(sum<200) do begin
  
    read(nota);
    sum:=sum+nota;
    
  end;
end. 


// 40 + 4 + 4 + 4 + 21 = 73 BYTES DE MEMORIA ESTATICA  
// 250=BYTES DE MEMORIA DINAMICA 

