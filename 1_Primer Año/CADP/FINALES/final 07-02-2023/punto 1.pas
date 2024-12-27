// un comercio dispone de la informacion de sus clientes. de cada cliente se conoce su dni, fecha y monto de la compra. La informacion esta ordenada por el dni del cliente, se pide implementar un programa que genere una estructura de datos que contenga dni del cliente, la cantidad de compras que realizo y el monto total de las compras. Solo con los clientes que realizaron mas de 5 compras

program final2023;
type
  
  informacionC=record 
    dni:integer;
    dia:1..31;
    mes:1..12;
    monto:real;
  end;
  
  lista = ^nodo;
  
  nodo = record 
    dato:informacionC;
    sig:lista;
  end;

  infoNueva = record
    dni:integer;
    cantCompras:integer;
    montoTotal:real;
  end;
  
  lista2 = ^nodo;
  
  nodo2 = record 
    dato2:infoNueva;
    sig2:lista2;
  end;
  
  
procedure cargarDatos(var l:lista, i:informacionC); //se dispone



procedure agregarAdelante(dni, compras:integer; monto:real; var l2:lista2);
var
  nue:lista2;
begin 
  new(nue);
  nue^.dato2.dni:=dni;
  nue^.dato2.cantCompras:=compras;
  nue^.dato2.montoTotal:=monto;
  nue^.sig2:=l2;
  l2:=nue;

end

procedure procesarInfo(var l:lista; var l2:lista2);
var 
  compras:integer;
  monto: real;
  dniAct:lista;
begin

  while(l<>nil) do begin
    compras:=0;
    monto:=0;
    dniAct:=l;
    while(l^.dato.dni = dniAct^.dato.dni) and (l<>nil) do begin
      compras:=compras+1;
      monto:=monto + l^.dato.monto; 
    
      l:=l^.sig;
    end;
    
    if(compras > 5 ) then begin
      agregarAdelante(dniAct^.dato.dni, compras, monto, l2);  
    end;
    
    if(l<>nil) then 
      l:=l^.sig;
    
  end;

end;


var 
  l:=lista;
  l2:=lista2;
  i:informacionC;
begin 
  l:=nil;
  l2:=nil;
  cargarDatos(l, i);
  procesarInfo(l, l2);
end.









