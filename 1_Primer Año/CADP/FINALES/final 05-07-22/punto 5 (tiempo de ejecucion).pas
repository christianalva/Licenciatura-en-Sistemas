//calcule la memoria estatica y tiempo de ejecucion
program ej;
type
  cadena20 = string[20];// 21 bytes 
  notas = 2..10;// 4 bytes
  
  alumno = record // 21 + 4 = 25 bytes 
    ape_nom:cadena20;// 21 bytes 
    nota:integer;// 4 bytes 
  end;
  
  vector = array[1..10] of ^alumno; // 10 * 4 = 40 bytes 

var
  v:vector; // 40 bytes 
  i, sum:integer;// 4 + 4 = 8 bytes 
  nota:notas;// 4 bytes 
  apeNom:cadena20;// 21 bytes 
  
begin 
  
  for i:=1 to 10 do begin
    new(v[i]);
    read(nota);
    read(apeNom);
    v[i]^.nota := nota; // 1 ut 
    v[i]^.ape_nom:=apeNom; // 1ut
  end;
  
  // (3n+2) + n*(cuerpo del for)
  //n :cantidad de veces que se ejecuta el for 
  //(3*10+2) + 10(2) = (30+2) + 20 = 32 + 20 = 52 ut
  
  sum:=0;// 1 ut
  
  while(sum < 200) do begin// 1 ut 
    read(nota);
    sum:=sum+nota;// 2ut
    
    //c*(n+1) + n*(cuerpo del while)
    // n representa la cantidad de veces que se ejecuta el while
    // c cantidad de tiempo en evaluar la condicion
    
    // 1*(100+1) + 100 * 2 = 101 + 200 = 301
    writeln(sum);
  end;


end.

/// 40 + 8 + 4 + 21 = 73 bytes de memoria estatica

// TIEMPO DE EJECUCION 
// 52 + 1 + 301 = 354 UT