// se dispone de la informacion de los productos de un supermercado. De cada producto se tiene codigo, nombre, rubro(1..20) y precio. Se pide implementar un programa que guarde en una estructura adecuada los productos de los rubros que tengan 10 productos

program final;
const 
  max = 20;
type

  productos = record  
    codigo:integer;
    nombre:string;
    rubro: 1..max;
    precio:real;
  end;
  
  nodo = ^nodo;
  
  lista = record 
    dato:productos;
    sig:lista;
  end;
  
  vector = array[1..max] of integer;
  
procedure inicializarVector(var v:vector);
var
  i:integer;
begin 
  
  for i:=1 to max do begin 
    v[i] := 0;
  end;

end;

procedure cargarDatos(var l:lista; p:productos);// se dispone 


procedure agregarAdelante(var l2:lista; p:productos);
var
  nue:lista;
begin 
  new(nue);
  nue^.dato:=p;
  nue^.sig:=l2;
  l2:=nue;
end;



procedure analizarDatos(l:lista; var l2:lista; var v:vector);
var 
  i:integer;
  aux:lista;
begin 
  aux:=l;
  while(aux<>nil) do begin
    v[aux^.dato.rubro]:=v[aux^.dato.rubro]+1;
  
    aux:=aux^.sig;
  end;
  
  aux:=l;// reinicio el puntero auxiliar para recorrer la lista nuevamente 
  
  for i:=1 to max do begin
    if(v[i] = 10) then begin 
      while(aux<>nil) do begin
        if(aux^.dato.rubro = i) then
          agregarAdelante(l2, aux^.dato);
        
      aux:=aux^.sig;
      end;
    end;
  end;
  
end;


var 
  l, l2:lista;
  v:vector;
  p:productos;
begin 
  l:=nil;
  l2:=nil;
  
  inicializarVector(v);
  cargarDatos(l, p);
  analizarDatos(l, l2, v);

end.














