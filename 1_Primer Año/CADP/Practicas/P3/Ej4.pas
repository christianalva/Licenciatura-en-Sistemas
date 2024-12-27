program ej4;
type
  clientes=record
    codCliente:integer;
    cantLineas:integer;
  end;
  lineas=record
    numTelefono:integer;
    minConsumidos:integer;
    mbconsumidosMes:integer;
  end;

procedure datosCliente(var cantTotalMb, cantTotalMin, minutosTotales,MBtotales:real);
begin   
  
  cantTotalMin:= (minutosTotales*3.40);
  cantTotalMb:= (MBtotales*1.35);

end;


procedure infoLinea(var lin:lineas; var client:clientes; var cantTotalMb, cantTotalMin:real);
var 
  i:integer;
  minutosTotales, MBtotales:real;
begin
 
  for i:=1 to client.cantLineas do begin 
    write('Ingresar numero de telefono ', i, ': ');
    readln(lin.numTelefono);
    write('Ingrese los minutos consumidos: ');
    readln(lin.minConsumidos);
    write('Ingrese los MB consumidos en el mes: ');
    readln(lin.mbconsumidosMes);
    
    minutosTotales:=minutosTotales+lin.minConsumidos;
    MBtotales:=MBtotales+lin.mbconsumidosMes;
    
    datosCliente(cantTotalMb, cantTotalMin, minutosTotales,MBtotales);
  end;

end;


var 
  cantTotalMin, cantTotalMb:real;
  i:integer;
  lin:lineas;
  cliente:clientes;
begin 
  cantTotalMin:=0;
  cantTotalMb:=0;
  
  for i:=1 to 9300 do begin 
    write('Ingrese codigo del cliente: ');
    read(cliente.codCliente);
    write('Ingrese cantidad de lineas a su nombre: ');
    readln(cliente.cantLineas);
    infoLinea(lin, cliente, cantTotalMb, cantTotalMin);
    writeln('La cantidad total de minutos a facturar es de: $', cantTotalMin:2:2);
    writeln('La cantidad total de MB a facturar del cliente es de: ', cantTotalMb:2:2);
  end;

end.