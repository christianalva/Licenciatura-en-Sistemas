//calcule el tiempo de ejecucion del siguiente programa 
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

  for i:=1 to 80 do begin// (3n+2) + n(cuerpo del for)
    read(e.nota);
    read(e.nombre);
    read(e.prom);
    
    if(i mod 2 = 0) then // 2ut tiempo en evaluar condicion + max(then, else), en este caso el max es el else ya que posee 1ut y el then 0
      new(v[i.datos]);// 0 ut
    else 
      v[i].datos:=nil;// 1ut 
    
    //2+1 = 3
      
    // (3*80 + 2) + 80(3) = 242 + 240 = 482 
    end;
    
      
    
    i:=0;// 1 ut 
    
    while(i<=80) and (e.nombre <>'zzz') do begin //3 ut 
      cant:=0;//1ut
      
      if(v[i].nota>5) then//1ut 
        cant:=cant+1;//2ut
       
        //1+2 = 3ut(tiempo del if)
        
      i:=i+1// 2ut
      
      
      //c(n+1)+n(cuerpo del while)
      //3(80+1) + 80*6 = 723ut
      
      
    end;
    
end.

//el tiempo de ejecucion es de 1205ut 
 
