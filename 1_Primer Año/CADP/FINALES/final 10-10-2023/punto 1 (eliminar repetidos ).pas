// un comercio dispone de una estructura de datos con las facturas realizadas durante agosto de 2023. De cada factura se conoce el numero de factura, codigode cliente, codigo de sucursal (1..5) y monto total, Se pide implementar un programa que lea un codigo de sucursal e invoque a un modulo que reciva dicho codigo y elimine las facturas correspondientes al codigo de sucursal recibida, ademas debe retornar la cantidad de facturas eliminadas

program ej;
type
  
  facturas=record
    numFactura:integer;
    codCliente:integer;
    codSucursal:1..5;
    montoTotal:real;
  end;
  
  lista = ^nodo;
  
  nodo = record 
    dato:facturas;
    sig:lista;
  end;


procedure cargarDatos(var l:lista; var f:facturas)// se dispone 

procedure eliminar(var l:lista);
var
  cant, cod:integer;
  act, ant:lista;
begin 
  cant:=0;
  act:=l;
  ant:=l;
 
  read(cod); // le paso el codigo de sucursal a eliminar 
  
  //ELIMINAR REPETIDOS
  
  while(act <> nil) do begin 
  
    if(act^.dato.codSucursal <> cod) then begin // mietras no encuentre el cod se va a ejecutar este if 
      ant:=act;
      act:=act^.sig;
    end;
    else begin // si encuentra el cod 
      // Si el nodo actual es el primero de la lista
      if(act=l) then 
        l:=l^.sig;// Actualizar el inicio de la lista para que apunte al siguiente nodo
      else
        ant^.sig:=act^.sig;// Conectar el nodo anterior al nodo siguiente
      dispose(act); // Liberar la memoria ocupada por el nodo actual
      act:=ant; // Retroceder el puntero actual al nodo anterior
      cant:=cant+1;
    end;
  end;
  
  whriteln('la cantidad de facturas eliminadas es de: ', cant);
end;




var
  l:lista;
  f:facturas;
begin 

  cargarDatos(l, f);
  eliminar(l); 

end.















