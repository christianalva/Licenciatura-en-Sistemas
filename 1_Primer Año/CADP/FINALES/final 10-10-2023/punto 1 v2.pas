// un comercio dispone de una estructura de datos con las facturas realizadas durante agosto de 2023. De cada factura se conoce el numero de factura, codigode cliente, codigo de sucursal (1..5) y monto total, Se pide implementar un programa que lea un codigo de sucursal e invoque a un modulo que reciva dicho codigo y elimine las facturas correspondientes al codigo de sucursal recibida, ademas debe retornar la cantidad de facturas eliminadas


program final;
type

  facturas = record 
    numFactura:integer;
    codCliente:integer;
    codSucursal:1..5;
    monto:real;
  end;
  
  lista = ^nodo;
  
  nodo = record 
    dato:facturas;
    sig:lista;
  end;
  
procedure cargarDatos(var l:lista; f:facturas);// se dispone

procedure analizarDatos(l:lista);
var
  cod, cant:integer;
  ant, act:lista;
begin 
  act:=l;
  ant:=l;
  cant:=0;
  write('Ingrese un codigo de sucursal a eliminar: ');
  readln(cod);
  
  while(act<>nil) do begin
    if(act^.dato.cod <> cod) then begin // mientras no encuentre el codigo se va a ejecutar el if
      ant:=act;
      act:=act^.sig;
    end
    else begin // si encuentra el codigo
      cant:=cant+1
      if(act = l) then begin// el elemento a eliminar es el primero
        l:=l^.sig;
        ant:=l;
      end
      else // el elemento es algun otro
        ant^.sig:=act^.sig;
      dispose(act);
      act:=ant;
    end;
  end;
  
  writeln('La cantidad de facturas eliminadas es de: ', cant);
  
end;

var
  f:facturas;
  l:lista;
begin 
  cargarDatos(l, f);
  analizarDatos(l)

end;






