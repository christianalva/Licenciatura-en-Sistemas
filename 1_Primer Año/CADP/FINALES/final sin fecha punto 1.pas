// un comercio dispone de una estuctura de datos con las ventas (como maximo 500 ventas) realizadas durante el mes de enero. cada venta se conoce el numero de venta, monto total y una lista de los productos vendidos (de cada producto vendido se tiene codigo y cantidad).  se pide implementar un programa que elimine de la estructura de datos todas las ventas cuya lista de productos contengan exactamente 5 productos 



program final;
const 
  dimF = 500;
type
  
  productosVendidos = record 
    cod:integer;
    cantidad:integer;
  end;
  
  lista = ^nodo;
  
  nodo = record 
    dato:productosVendidos;
    sig:lista;
  end;
  
  ventas = record 
    numVenta:integer;
    montoTotal:real;
    productos:lista;
  end;
  
  vector = array[1..dimF] of ventas;



procedure cargarDatos(var l:lista; var v:vector; var dimL:integer; p:productosVendidos; ve:ventas);// se dispone

procedure eliminarDatos(var v:vector; posicion:integer; var dimL:integer);
var
  i:integer;
begin 
  for i:=posicion to dimL-1 do begin 
    v[posicion] := v[posicion+1];
  end;
  dimL:=dimL-1;

end;


procedure analizarDatos(v:vector; l:lista; dimL:integer);
var
  i, cantProduc:integer;
begin 
  
  for i:=1 to dimL do begin 
    cantProduc:=0;
    while(v[i].productos <> nil) do begin 
      cantProduc:=cantProduc+1;
      v[i].productos:=v[i].productos^.sig;
    end;
    if(cantProduc = 5) then 
      eliminarDatos(v, i, dimL);
  end;

end;

var
  v:vector;
  l:lista;
  ve:ventas;
  p:productosVendidos;
  dimL:integer;
begin 
  dimL:=0;
  l:=nil;
  
  cargarDatos(l , v , dimL , p , ve);
  analizarDatos(v, l , dimL);

end.






