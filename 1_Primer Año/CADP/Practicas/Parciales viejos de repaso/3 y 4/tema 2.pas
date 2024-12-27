// un tetro esta analizando la informacion de los tikects vendidos durante el anio 2022. para ello se dispone de una estructura de datos con la informacion de todos los tikects vendidos. de cada tikect se conoce el codigo del evento, dni del comprador. mes de la funcion entre 1 y 12, y ubicacion (1:palco, 2:pullman, 3:platea alta, 4:platea baja) La informacion se encuentra ordenada por codigo de evento
// ademas la empresa dispone de una estructrura de datos con informacion del costo del tikect por ubicacion

// realizar un programa que procese la informacion de los viajes y: 
// A- genere una lista que tenga por cada codigo de evento, la cantidad de tikects vendidos
// B- informe el mes con mayor monto recaudado 
// C- COMPLETO informe el promedio recaudado por cada evento entre todos sus tikects


program parcial;
type
  
  informacion = record 
    codEvento:integer;
    dniComprador:integer;
    mesFuncion:1..12;
    ubicacion:1..4;
  end;
  
  lista = ^nodo;
  
  nodo = record 
    dato:informacion;
    sig:lista;
  end;
  
  infoCod = record 
    codEvento:integer;
    cant:integer;
  end;
  
  listaCod = ^nodoCod;
  
  nodoCod = record 
    dato:infoCod;
    sig:listaCod;
  end;
  
  vectorMes = array[1..12] of integer;

procedure inicializarVector(var vm:vectorMes);
var
  i:integer;
begin
  
  for i:= 1 to 12 do begin 
    vm[i]:=0;
  end;
  
end;
   
procedure cargarDatos(var l:lista; i:informacion);// se dispone
  
procedure agregarCod(codigo:integer; cantidad:integer; var l2:listaCod);
var
  nue:lista;
begin 
  new(nue);
  nue^.dato.codEvento:=codigo;
  nue^.dato.cant:=cantidad;
  nue^.sig:=l2;
  l2:=nue;
  
end;

procedure analizarDatos(l:lista; var l2:listaCod; var v:vectorMes);
var
  nue:lista;
  cant, mesMax:integer;
  montoMax, monto:real;
begin 
  cant:=1;
  montoMax:=0;
  mesMax:=0;
  monto:=0;
  
  while(l<>nil) do begin
  
    //A
    nue:=l^.sig;
    if(l^.dato.codEvento = nue^.dato.codEvento) and (nue<>nil) then 
      cant:=cant+1
    else begin 
      agregarCod(l^.dato.codEvento, cant, l2);
      cant:=1;
    end;
    
    //B
    if(l^.dato.ubicacion = 1) then 
      monto:=10
    else if(l^.dato.ubicacion = 2) then 
      monto:=20
    else if(l^.dato.ubicacion = 3) then 
      monto:=30
    else if(l^.dato.ubicacion = 4) then 
      monto:=40
     
    v[l^.dato.mesFuncion]:=v[l^.dato.mesFuncion]+monto;
    
    
     
     
    l:=l^.sig;
  end;
  
  //B
  for i:=1 to 12 begin 
    if(v[i]>montoMax) then begin
      montoMax:=v[i];
      mesMax:=i;
    end;
  end;  
    
  writeln('El mes con mayor monto recaudado es el: ', mesMax);

end;









