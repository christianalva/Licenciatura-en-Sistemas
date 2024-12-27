// una empresa dispone de una estructura de datos con las ventas de su comercio. de cada venta se conoce. numero de venta, cantidad de productos y tipo de pago (efectivo o tarjeta). Se pide implementar un programa que genere una segunda estructura con las ventas cuya cantidad de productos tenga mas cantidad de digitos pares que impares. En la estructura generada deben quedar almacenadas las ventas de tipo de pago en efectivo antes que las de tipo de pago con tarjerta 

program finalv2;
type
  
  ventas = record 
    numeroVent:integer;
    cantProductos:integer;
    tipoPago:striing;
  end;
  
  lista = ^nodo;
  
  nodo = record 
    dato:ventas;
    sig:lista;
  end;
  
  
procedure cargarDatos(var l:lista; v:ventas); // se dispone


procedure agregarVenta(v:ventas; var l2:lista);
var
  nue, act, ant : lista;
begin 
  //agregar adelante
    if(v.tipoPago:= 'efectivo') then begin
      new(nue);
      nue^.dato:=v;
      nue^.sig:=l2;
      l2:=nue;
    end
    //agregar atras
    else if(v.tipoPago:= 'tarjeta') then begin
      new(nue);
      nue^.dato:=v;
      nue^.sig:=nil;
      if(l2=nil) then 
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


procedure buscarMasPar(var l:lista; var l2:lista);
var
  cantPar, cantImpar, cantProductos:integer;
begin 
  
  while(l<>nil) do begin
    cantPar:=0;
    cantImpar:=0;
    cantProductos:=l^.dato.cantProductos;
    
    while(cantProductos<>0) do begin 
      if(((cantProductos mod 10) mod 2) = 0) then 
        cantPar:=cantPar+1
      else
        cantImpar:=cantImpar+1;
      
      cantProductos:=cantProductos div 10;
    end;
    
    if(cantPar>cantImpar) then
      agregarVenta(l^.dato, l2);
  
    l:=l^.sig;
  end;

end;


var 
  l, l2:lista;
  v:ventas;
begin 
  cargarDatos(l, v);
  buscarMasPar(l,l2);
end.



















