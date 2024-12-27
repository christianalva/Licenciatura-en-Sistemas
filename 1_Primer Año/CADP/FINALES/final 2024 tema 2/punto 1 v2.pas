// una empresa dispone de una estructura de datos con las ventas de su comercio. De cada venta se conoce el numero de venta, cantida de productos y tipo de pago (efectivo o tarjeta). Se pide implementar un programa que genere una segunda estructura con las ventas cuya cantidad de productos tenga al menos dos digitos pares. En la estructura generada deben quedar almacenadas las ventas de tipo de pago tarjeta antes que las de tipode pago efectivo
program final;
type
  
  ventas = record 
    numVenta:integer;
    cantProductos:integer;
    tipoPago:string;
  end;
  
  lista = ^nodo;
  
  nodo = record 
    dato:ventas;
    sig:lista;
  end;
  
procedure leer(var v : ventas);
	begin
	writeln('lea el numero de venta');
	readln(v.numVenta);
	if (v.numVenta <> 0) then
		begin
		writeln('lea cantidad de productos');
		readln(v.cantProductos);
		writeln('lea un medio de pago');
		readln(v.tipoPago);
		end;
	end;


procedure agregarAdelante(var l : lista; v : ventas);
	var
		nue : lista;
	begin
	new(nue);
	nue^.dato := v;
	nue^.sig := l;
	l := nue;
	end;


procedure cargarDatos(var l : lista; v:ventas);
	begin
	leer(v);
	while (v.numVenta <> 0) do
		begin
		agregarAdelante(l, v);
		leer(v);
		end;
	end;


procedure agregar(var l2:lista; v:ventas);
var
  nue, act, ant:lista;
begin 
  if(v.tipoPago = 'tarjeta') then begin 
    //agregar adelante 
    new(nue);
    nue^.dato:=v;
    nue^.sig:=l2;
    l2:=nue;
  end
  else if(v.tipoPago = 'efectivo') then begin
  //agregar atras
    new(nue);
    nue^.dato:=v;
    nue^.sig:=nil;
    
    if(l2=nil) then
      l2:=nue
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

procedure analizarDatos(l:lista; var l2:lista);
var 
  cantPar, num:integer;
begin 
  
  while(l<>nil) do begin 
    cantPar:=0;
    num:=l^.dato.cantProductos;
      while(num<>0) do begin
        if(((num mod 10) mod 2) = 0) then   
          cantPar:=cantPar+1;
        num:=num div 10;
      end;
      
      if(cantPar >= 2) then 
        agregar(l2, l^.dato);
      
      l:=l^.sig;
  end;

end;


var 
  v:ventas;
  l,l2:lista;
begin 
  l:=nil;
  l2:=nil;
  
  cargarDatos(l, v);
  analizarDatos(l, l2);
  
  while(l2<>nil) do begin 
    writeln(l2^.dato.tipoPago);
    l2:=l2^.sig;
  end;

end.