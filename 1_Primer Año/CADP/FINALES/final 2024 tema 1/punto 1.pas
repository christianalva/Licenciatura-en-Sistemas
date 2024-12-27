// una empresa dispone de una estructura de datos con las ventas de su comercio. de cada venta se conoce. numero de venta, cantidad de productos y tipo de pago (efectivo o tarjeta). Se pide implementar un programa que genere una segunda estructura con las ventas cuya cantidad de productos tenga mas cantidad de digitos pares que impares. En la estructura generada deben quedar almacenadas las ventas de tipo de pago en efectivo antes que las de tipo de pago con tarjerta 


program final2024;
type
  cadena = string[1..10];
  ventas = record 
    numeroVenta:integer;
    cantProductos:integer;
    tipoPago:cadena;
  end;

  lista = ^nodo;
  
  nodo = record
    dato:ventas;
    sig:lista;
  end;

procedure cargarDatos(var l:lista; v:ventas); // se dispone


procedure masPar(var l, l2:lista);
var
  cantPar, cantImpar, num: integer;
begin 
  
  while(l<>nil) do begin 
    cantImpar:=0;
    cantPar:=0;
    num:=l^.dato.cantProductos;
    
    while(num<>0) do begin 
      if(((num mod 10) mod 2) = 0) then 
        cantPar:= cantPar + 1
      else 
        cantImpar:=cantImpar+1;
      num:= num div 10;
    end;
    
    if(cantPar>cantImpar) then
      agregarVenta(l^.dato, l2);
    
    l:=l^.sig;
  end;

end;

procedure agregarVenta(var v:ventas; var l2:lista)
var
  nue, ant, act:lista;
begin 
  if(v.tipoPago = 'efectivo') or (v.tipoPago = 'EFECTIVO') then begin 
    //agregar adelante
    new(nue);
    nue^.dato:=v;
    nue^.sig:=l2;
    l2:=nue;
  end
  else if(v.tipoPago = 'tarjeta') or (v.tipoPago = 'TARJETA') then begin
    //agregar Atras
    new(nue);
    nue^.dato:=v;
    nue^.sig:=nil;
    
    if(l2=nil) then // si la lista esta vacia
      l2:=nue;
    else begin 
      act:=l2;
      ant:=l2;
      while(act<>nil) do begin 
        ant:=act;
        act:=act^.sig;
      end;
    ant^.sig:=nue;
    end;
  end; 
end;



var 
  l,l2:lista;
  v:ventas;
begin 

  cargarDatos(l, v);
  masPar(l, l2);
end;











