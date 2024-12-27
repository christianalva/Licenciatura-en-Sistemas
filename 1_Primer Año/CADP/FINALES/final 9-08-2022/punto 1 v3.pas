// se dispone de la informacion de los participantes inscriptos a una carrera (a lo sumo 5000). de cada participante se tiene dni, nombre y apellido, categoria(1..5) y fecha de incripcion se pide implementar un programa q guarde en una estructura adecuada los participantes de aquellas categorias que posean a lo sumo 50 inscriptos. se sabe que cada participante se puede anotar en una sola categoria

program final;
const 
  dimF = 500;
type
  
  participantes = record 
    dni:integer;
    nombre:string;
    apellido:string;
    categoria:1..5;
  end;
  
  lista = ^nodo;
  
  nodo = record 
    dato:participantes;
    sig:lista;
  end;

  vector = array[1..5] of integer;
  
procedure inicializarVector(var v:vector);
var
  i:integer;
begin 
  for i:=1 to 5 do begin
    v[i]:=0;
  end;
end;

procedure cargarDatos(var l:lista; p:participantes);// se dispone


procedure agregarAdelante(var l2:lista; p:participantes);
var
  nue:lista;
begin 
  new(nue);
  nue^.dato:=p;
  nue^.sig:=l2;
  l2:=nue;
end;

procedure agregarCategoria(var l2:lista; l:lista; cat:integer);
begin 
  
  while(l<>nil) do begin
    if(l^.dato.categoria = cat) then 
      agregarAdelante(l2, l^.dato)
  end;
end;


procedure sumarCategorias(l:lista; var v:vector; var l2:lista);
var 
  i:integer;
begin 
  while(l<>nil) do begin 
    v[l^.dato.categoria]:=v[l^.dato.categoria]+1;
    
    l:=l^.sig;
  end;  
  
  for i:=1 to 5 do begin
    if(v[i]>50) then
      agregarCategoria(l2, l, i);
  end;
end;


var
  v:vector;
  l, l2:lista;
  p:participantes;
begin
  
  inicializarVector(v);
  cargarDatos(l,p);
  sumarCategorias(l, v, l2)


end;










