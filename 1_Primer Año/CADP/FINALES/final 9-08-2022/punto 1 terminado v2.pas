//se dispone de la informacion de los participantes inscriptos a una carrera (a lo sumo 5000),  de cada participante se tiene dni, nombre y apellido, categoria (1..5) y fecha de inscripcion, se pide implementar un programa que guarde en una estructura adecuada los participantes  de aquellas categorias que posean a lo sumo 50 inscriptos. Se sabe que cada participante se puede anotar en una sola categoria


program ej2;
const 
  dimF= 5000;
type
  
  participantes = record 
    dni:integer;
    nombre:string;
    apellido:string;
    cateoria:1..5;
    dia:1..31;
    mes:1..12;
  end;
  
  lista = ^nodo;
  
  nodo = record
    dato:participantes;
    sig:lista;
  end;
  
  vector= array[1..5] of integer;

procedure inicializarVector(var v:vector);
var
  i:integer;
begin 
  for i:=1 to 5 do begin 
    v[i]:=0;
  end;
end;

procedure cargarDatos(var l:lista; p:participantes); // se dispone


procedure agregarAdenlante(p:participantes; var l2:lista);
var
  nue:lista;
begin 
  new(nue);
  nue^.dato:=p;
  nue^.sig:=l2;
  l2:=nue;
end;


procedure agregarCategoria(cat:integer; var l, l2:lista);

begin 
  while(l<>nil) do begin
    if(l^.dato.cateoria = cat) then 
      agregarAdenlante(l^.dato, l2);
    l:=l^.sig;
  end;
end;


procedure cargarVector(var l, l2:lista; var v:vector);
var 
  i:integer;
begin 
  
  while(l<>nil) do begin
    
    v[l^.dato.cateoria]:=v[l^.dato.cateoria]+1;
    
    l:=l^.sig;
  end;
  
  for i:=1 to 5 do begin 
    if(v[i]>=50) then 
      agregarCategoria(i, l, l2);
  end;
end;

var 
  l,l2:lista;
  p:participantes;
  v:vector;
begin 
  l:=nil;
  l2:=nil;
  inicializarVector(v);
  cargarDatos(l, p);
  cargarVector(l, l2, v);
end.

















