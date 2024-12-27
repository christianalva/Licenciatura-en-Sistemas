program ejercicio3;
type
  info = record 
    nombre:string;
    nota:integer;
    prom:real; 
    datos:^integer; 
  end;
  
  vector = array[1..80] of info; 

var 
  v:vector;
  i, cant:integer;
  e:info;

begin 

  for i:=1 to 80 do begin// se ejecuta 80 veces
    read(e.nota);
    read(e.nombre);
    read(e.prom);
    
    if(i mod 2 = 0) then// tiempo en evaluar la condicion 1 ut
      new(v[i.datos]); //0 ut
      
    else 
      v[i].datos:=nil;// 1 ut
      
    // if = 1ut + max(then, else) = 1 + 1 = 2ut
  
  end;
  
  // for (3n+2) + n(cuerpo del for)
  //  (3*80+2) + 80(2) = 242 + 160 = 402ut
    
  i:=0;// 1ut
    
  
  while(i<=80) and (e.nombre <>'zzz') do begin // tiempo en evaluar la condicion = 3ut // cantidad de veces que se ejecuta = 80
    cant:=1;// 1ut
      
    if(v[i].nota>5) then// tiempo en evaluar la condicion 1ut 
      cant:=cant+1;// 2ut
    // if = 1 + 2 = 3ut 
    
    
    i:=i+1; // 2ut
    
    //cuerpo del for =6ut
    
  end;
  
  //while = c*(n+1) + n(cuerpo del for) 
  // 3*(80+1) + 80(6) = 243 + 480 = 723ut
  
  
  // tiempo de ejecucion total = 402 + 1 + 723 = 1126 ut
  
end.