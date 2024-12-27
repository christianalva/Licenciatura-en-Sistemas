//un comercio dispone de una estructura de datos con las facturas (como maximo 2000 facturas) realizadas durante marzo de 2023. de cada factura se conoce el numero de factura, codigo de cliente, codigo de sucursal y monto total. las facturas se encuentran ordenadas por codigo de sucursal, se pide implementar un programa con un modulo que reciba la estructura que se dispone y devuelva el codigo de sucursal con mayor cantidad de facturas, el programa debe informar el valor retornado por el modulo

program final;
const 
  dimF = 2000;
type

  facturas = record 
    numFactura:integer;
    codCliente:integer;
    codSucursal:integer;
    monto:real;
  end;
  
  vector = array[1..dimF] of facturas;
  
procedure cargarDatos(var v:vector; f:facturas; var dimL:integer);// se dispone
  
procedure analizarDatos(v:vector; dimL:integer; var codMax:integer);
var 
  i, cantMax, cantFacturas:integer;
begin 
  cantMax:=0;
  i:=1;
  
  while(i<dimL) do begin
    cantFacturas:=1;
      
    while(v[i].codSucursal = v[i+1].codSucursal) and (i<dimL) do begin
      cantFacturas:=cantFacturas+1;  
      i:=i + 1;
    end;
    
    if(cantFacturas>cantMax) then begin
      cantMax:=cantFacturas;
      codMax:=v[i].codSucursal;
    end;

    if(v[i].codSucursal <> v[i+1].codSucursal) then 
      i:=i + 1;
      
    
  end;

end;


var 
  v:vector;
  f:facturas;
  dimL, codMax:integer;
begin 
  dimL:=0;
  codMax:=0;
  
  cargarDatos(v, f, dimL);
  analizarDatos(v, dimL, codMax);
  
  writeln('El codigo de sucursal con mayor cantidad de facturas es el: ', codMax);
end.
  

















