// una empresa dispone de una estructura de datos con las ventas de su comercio. De cada venta se conoce el numero de venta, cantida de productos y tipo de pago (efectivo o tarjeta). Se pide implementar un programa que genere una segunda estructura con las ventas cuya cantidad de productos tenga al menos dos digitos pares. En la estructura generada deben quedar almacenadas las ventas de tipo de pago tarjeta antes que las de tipode pago efectivo

program tema2;
type
  ventas =record
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



procedure cumple(var v:ventas; var l2:lista);
var
  act, ant, nue:lista;
begin 
  // Se crea un nuevo nodo de lista
  new(nue);
  // Se asigna la venta pasada como parámetro al dato del nuevo nodo
  nue^.dato:=v;
  // Se inicializan los punteros act y ant con el inicio de la lista l2
  act:=l2;
  ant:=l2;
  // Se itera sobre la lista l2 mientras no sea vacía y la venta en el nuevo nodo no sea de tipo 'tarjeta'
  while(l2<>nil) and (nue^.dato.tipoPago <> 'tarjeta') do begin // si nue^.dato.tipoPago es de tipo efectivo siempre lo va a agregar al final ya que va a recien salir del while cuando l2 sea igual a nil (no tenga nada)
    // Se actualiza el nodo anterior al actual
    ant:=act;
    // Se avanza al siguiente nodo
    act:=act^.sig;
  end;
  // Se verifica si se está insertando al principio de la lista
  if(act = ant) then // al principio
    l2:=nue
  else              // al medio o al final  
    // Se enlaza el nodo anterior con el nuevo nodo
    ant^.sig:=nue;
  // Se enlaza el nuevo nodo con el nodo actual
  nue^.sig:=act; 
end;



procedure analizar(var l, l2:lista);
var 
  cantPar, num:integer;
begin 
  
  while(l<>nil) do begin 
    cantPar:=0;
    num:=l^.dato.cantProductos;
    while(num<>0) do begin 
      if(((num mod 10) mod 2) = 0 ) then
        cantPar:=cantPar+1;
      num:=num div 10;
    end;
    if(cantPar >= 2) then 
      cumple(l^.dato, l2);
    
    l:=l^.sig;
  end;
end;



var 
  l, l2:lista;
  v:ventas;
begin
  l:=nil;
  l2:=nil;
  cargarDatos(l, v);
  analizar(l, l2);
  while(l2<>nil) do begin 
    writeln(l2^.dato.tipoPago);
    l2:=l2^.sig;
  end;
end.















