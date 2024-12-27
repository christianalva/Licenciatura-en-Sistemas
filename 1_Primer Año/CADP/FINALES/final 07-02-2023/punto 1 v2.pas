// un comercio dispone de la informacion de sus clientes. de cada cliente se conoce su dni, fecha y monto de la compra. La informacion esta ordenada por el dni del cliente, se pide implementar un programa que genere una estructura de datos que contenga el dni del cliente, la cantidad de compras que realizo y el monto total de compras, solo con los clientes que realizaron mas de 5 compras 


program final;
type

  clientes = record 
    dni:integer;
    fecha:integer;
    monto:real;
  end;
  
  lista = ^nodo;
  
  nodo = record 
    dato:clientes;
    sig:lista;
  end;
  
  clientesNue = record 
    dni:integer;
    cantCompras:integer;
    montoTotal:real;
  end;
  
  listaNue = ^nodoNue;
  
  nodoNue = record 
    dato:clientesNue;
    sig:listaNue;
  end;

procedure cargarDatos(var L:lista; c:clientes);// se dispone


procedure analizarDatos(l:lista; var l2:listaNue);
var
  act, montoTotal, cantCompras, dniAct:integer;
begin 
  
  while(l<>nil) do begin 
    act:=l;
    l:=l^.sig;
    montoTotal:=act^.dato.monto;
    cantCompras:=1;
    dniAct:=act^.dato.dni;
    while (act^.dato.dni = l^.dato.dni) and (l<>nil) do begin
      montoTotal:=montoTotal+l^.dato.monto;
      cantCompras:=cantCompras+1;
      
      act:=l;
      l:=l^.sig;
    end;
    
    if(cantCompras>5) then 
      agregarAdelante(l2, dniAct, cantCompras, montoTotal);
  end;

end;


procedure agregarAdelante(var l2:listaNue; dniAct, cantCompras:integer; montoTotal:real);
var
  act:listaNue;
begin 
  new(act);
  act^.dato.dni:=dniAct;
  act^.dato.cantCompras:=cantCompras;
  act^.dato.montoTotal:=montoTotal;
  act^.sig:=l2;
  l2:=act;
end

var 
  l:lista;
  c:clientes;
  l2:listaNue;
  c2:clientesNue;

begin 

  cargarDatos(l, c);
  analizarDatos(l, l2);
end;







