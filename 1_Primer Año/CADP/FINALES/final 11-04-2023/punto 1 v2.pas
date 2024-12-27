//un comercio dispone de una estructura de datos con las facturas (como maximo 2000 facturas) realizadas durante marzo de 2023. de cada factura se conoce el numero de factura, codigo de cliente, codigo de sucursal y monto total. las facturas se encuentran ordenadas por codigo de sucursal, se pide implementar un programa con un modulo que reciba la estructura que se dispone y devuelva el codigo de sucursal con mayor cantidad de facturas, el programa debe informar el valor retornado por el modulo

program ej2;
const 
  dimF=2000;
type
  facturas = record 
    numFactura:integer;
    codCliente:integer;
    codSucursal:integer;
    montoTotal:integer;
  end;
  
  
  vector = array[1..dimF] of facturas;

  
procedure cargarDatos(var v:vector; var dimL:integer); // se dispone

procedure analizarVector(var v:vector; var codMax:integer ; dimL:integer);
var
  i, sucursalActual, cantActual, cantMax, codMax:integer;
begin 
  cantMax:=0;
  cantActual:=1;
  codMax:=0;
  for i:=1 to dimL-1 do begin 
    sucursalActual:=v[i].codSucursal;
    if(sucursalActual = v[i+1].codSucursal) then 
      cantActual:=cantActual+1;
    else begin
      if(cantMax < cantActual) then begin 
        cantMax:=cantActual;
        codMax:=sucursalActual;
      cantActual:=1;
    
    end;
  end;
  if(cantMax < cantActual) then begin
    cantMax:=cantActual;
    codMax:=sucursalActual;
  end;
end;



var 
  v:vector;
  dimL, codMax:integer;
begin 
  dimL:=0; 
  codMax:=0;
  
  cargarDatos(v, dimL);
  analizarVector(v, codMax, dimL);
  
  writeln('El codigo con con mayor cantidad de facturas es el: ', codMax);
end.







