program parcial;
type
  
  vector = array[0..27] of integer;// clasificacion en las 27 fechas 

  jugadores = record 
    codJugador:integer;
    apellido:string;
    nombre:string;
    codEquipo:1..28;
    anioNacimiento:integer;
    clasificacion:vector;
  end;
  
  
  lista = ^nodo;
  
  nodo = record 
    dato:jugadores;
    sig:lista;
  end;
  
  
  vectorEquipos = array[1..28] of integer;// vector con jugadores por equipo mayores de 35
  
procedure inicializarVector(var v:vectorEquipos);
var
  i:integer;
begin 
  for i:=1 to 28 do begin
    v[i]:=0;
  end;
end;

  
procedure cargarDatos(var l:lista; j:jugadores);// se dispone


procedure agregarNuevo(var l2:lista; j:jugadores);
var 
  nue, act, ant:lista;
begin 
  new(nue);
  nue^.dato:=j;
  act:=l2;
  ant:=l2;
  while(act<>nil) and (j.codJugador>act^.dato.codJugador) do begin 
    ant:=act;
    act:=act^.sig;
  end;
  
  if(act = ant) then 
    l2:=nue;
  else 
    ant^.sig:=nue;
  nue^.sig:=act;

end;


procedure analizarDatos(l:lista; var l2:lista; var ve:vectorEquipos);
var
  i, participo, clasificacionTotal, jugadorMc2, jugadorMc, mejorClasificacion, mejorClasificacion2, cod, cantImpar:integer;
  promedio:real;
begin 
  mejorClasificacion2:=0;
  mejorClasificacion:=0;
  jugadorMc:=0;
  jugadorMc2:=0
  
  
  while(l<>nil) do begin 
    //A
    if(l^.dato.anioNacimiento<1989) then 
      ve[l^.codEquipo]:=ve[l^.codEquipo]+1;
    
    //B
    participo:=0;
    clasificacionTotal:=0;
    for i:=0 to 27 do begin 
      if(l^.dato.clasificacion[i] <> 0) then  
        participo:=participo+1;
      clasificacionTotal:=clasificacionTotal+l^.dato.clasificacion[i];
      
    end;
    
    promedio:=0;
    if(participo>14) then 
      promedio:=clasificacionTotal/27;
      
    if(promedio>mejorClasificacion) then begin 
        mejorClasificacion2:=mejorClasificacion;
        jugadorMc2:=jugadorMc;
        mejorClasificacion:=promedio;
        jugadorMc:=l^.dato.codJugador;
    end
    else if(promedio>mejorClasificacion2) then begin
      mejorClasificacion2:=promedio;
      jugadorMc2:=l^.dato.codJugador;
    
    end;
    
    //C
    cod:=l^.dato.codJugador;
    cantImpar:=0;
    while(cod<>0) do begin 
      if(((cod mod 10) mod 2)<>0) then 
        cantImpar:=cantImpar+1;
      cod:=cod div 10;
    end;
    
    if(cantImpar = 3) and (l^.dato.anioNacimiento>1983) and (l^.dato.anioNacimiento<1990) then  
      agregarNuevo(l2, l^.dato);
    
    
    
      
    l:=l^.sig;
      
  end;
  
  

end;



var 
  ve:vectorEquipos;
  l, l2:lista;
  j:jugadores;
begin 
  l:=nil;
  l2:=nil;
  
  inicializarVector(v);
  cargarDatos(l, j);
  analizarDatos(l, l2, ve);
  
  
end;
  
  
  
  
  