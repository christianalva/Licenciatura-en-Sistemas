// se dispone de la informacion de los productos de un supermercado. De cada producto se tiene codigo, nombre, rubro(1..20) y precio. Se pide implementar un programa que guarde en una estructura adecuada los productos de los rubros que tengan 10 productos

program ej;
const 
  max=20;
type

  informacion = record 
    codigo:integer;
    nombre:string;
    rubro:1..max;
    precio:real;
  end;
  
  lista = ^nodo;
  
  nodo = record
    dato:informacion;
    sig:lista;
  end;
  
  vector = array[1..max] of integer;


procedure cargarDatos(var l:lista; var i:informacion);// se dispone

procedure inicializarVector(var v:vector);
var
  i:integer
begin 
  for i:=1 to max do begin 
    v[i]:=0;
  end;
  
end;


procedure procesarProductos(var l, l2:lista; var v:vector);
begin 
  
  while(l<>nil) do begin 
    v[l^.dato.rubro] := v[l^.dato.rubro]+1; 
    l:=l^.sig;
  end;
  
end;

procedure guardarProductos(var l,l2:lista; var i:informacion);
var
  z:integer;
begin 
  for z:=1 to max do begin 
    if(v[z] = 10 ) then begin
      while(l<>nil) do begin 
        if(l^.dato.rubro = v[z]) then 
          agregarAdelante(l^.dato, l2);
        l:=l^.sig;
      end;
    end;
  end;
end;

procedure agregarAdelante(var i:informacion; var l2:lista);// creo la nueva lista con los rubros que tengan 10 productos
var
  nue:lista;
begin 
  new(nue);
  nue^.dato:=i;
  nue^.sig:=l2;
  l2:=nue;
end;

var
  l, l2:lista;
  v:vector;
  i:informacion;
begin 
  l:=nil;
  l2:=nil;
  inicializarVector(v);
  cargarDatos(l, i);
  procesarProductos(l, l2, v);
  guardarProductos(l2, i);

end.













