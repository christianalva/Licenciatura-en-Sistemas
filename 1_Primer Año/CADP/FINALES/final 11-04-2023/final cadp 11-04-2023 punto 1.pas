//un comercio dispone de una estructura de datos con las facturas (como maximo 2000 facturas) realizadas durante marzo de 2023. de cada factura se conoce el numero de factura, codigo de cliente, codigo de sucursal y monto total. las facturas se encuentran ordenadas por codigo de sucursal, se pide implementar un programa con un modulo que reciba la estructura que se dispone y devuelva el codigo de sucursal con mayor cantidad de facturas, el programa debe informar el valor retornado por el modulo

program ej;
const 
  dimF=2000;//2000
type 

  facturas=record 
    numFacturas:integer;
    codCliente:integer;
    codSucursal:integer;
    montoTotal:real;
  end;

  vector=array[1..dimF] of facturas;

procedure cargarDatos(var v:vector; var dimL: integer);//se dispone
var 
  i:integer;
begin 
  // Simulando la carga de datos para fines de ejemplo
  // En un escenario real, esta función debería leer los datos desde algún origen, como un archivo o una base de datos
  
  // Establecer dimL al número de facturas que se cargarán (por ejemplo, 10)
  dimL := 5;
  
  // Cargar datos de ejemplo en el vector v
  for i := 1 to dimL do begin
    v[i].numFacturas := i; // Número de factura
    v[i].codCliente := i * 100; // Código de cliente (por ejemplo, incrementando de 100)
    v[i].codSucursal := 2; // Código de sucursal (del 1 al 5)
    v[i].montoTotal := i * 10.5; // Monto total de la factura (por ejemplo, incrementando de 10.5)
  end;

end;

procedure ordenarPorSucursal(var v: vector; dimL: integer);//se dispone
var
  i, j: integer;
  temp: facturas;
begin
  // Algoritmo de ordenamiento de burbuja
  for i := 1 to dimL - 1 do begin
    for j := 1 to dimL - i do begin
      if v[j].codSucursal > v[j + 1].codSucursal then begin
        // Intercambiar las facturas si están en el orden incorrecto
        temp := v[j];
        v[j] := v[j + 1];
        v[j + 1] := temp;
      end;
    end;
  end;
end;


procedure modulo(var v:vector; var dimL:integer; var codMayor:integer);
var
 i, cantMax, cantAct, codNue:integer;
 
begin
  cantMax:=0;
  cantAct:=1;
  
  for i:=1 to dimL do begin
    codNue:=v[i+1].codSucursal;
    
    if(v[i].codSucursal=codNue) then 
      cantAct:=cantAct+1
    else begin
      if(cantAct>cantMax)then begin 
        cantMax:=cantAct;
        codMayor:=v[i].codSucursal;
      end;
      cantAct:=1;
    end;
  end;
end;



var 
 codMayor, dimL:integer;
 v:vector;
begin 
  codMayor:=0;
  cargarDatos(v, dimL);
  ordenarPorSucursal(v, dimL);
  modulo(v, dimL, codMayor);
  writeln('La sucursal con mas facturas es la: ', codMayor);
end.